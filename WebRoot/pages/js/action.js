(function(){

var Actions = tern.namespace('Actions');
var Action = tern.Action;

Actions.classdef('MoveAction',tern.MouseAction,{
  MoveAction: function(){
    tern.MouseAction.call(this);
    this.initialX = 0;
    this.initialY = 0;
    this.lastX = 0;
    this.lastY = 0;
    this.fromX = 0;
    this.fromY = 0;
    
    this.pointDrager = null;
    this.findedCT = null;     
  },
  
  _beginDragConnector: function(ct){
      this.initialX = this.lastX = ct.x;
      this.initialY = this.lastY = ct.y;
        
      this.pointDrager = ct.beginDrag();
      if (this.pointDrager == null){
          if (!ct.draggable) return;
      }else if (!this.pointDrager.movable()){
          this.pointDrager.cancel();
          this.pointDrager = null;
          return false;
      }
        
      var children = ct.parent.connectors;
      var index = children.indexOf(ct);
      if(0 == index) index = 1;
      else index--;
       
      if (index >= 0 && index < children.length){
          this.fromX = children[index].x;
          this.fromY = children[index].y;
      }else{
          this.fromX = this.initialX;
          this.fromY = this.initialY;
      }
      
      return true;
  },

  mousedown: function(e){
    if(this.state != Action.States.Unactive) return;
    
    var sels = this.diagram.getSelectedItems();
    if(sels!=null && sels.length > 0){
        this.initialX = this.lastX = e.mouseX;
        this.initialY = this.lastY = e.mouseY;
        this.activate();        
    }else if(this.diagram._getSelectedConnector() != null){
        var ct = this.diagram._getSelectedConnector();                        
        
        if(!(ct.parent instanceof tern.Connection)){
            if(ct.attachedConnectors.length <= 0) {
                this.initialX = e.mouseX;
                this.initialY = e.mouseY;
                this.activate();
            }
            return;
        }                 
        
        if(!this._beginDragConnector(ct) ) return;        
        this.activate();        
    }
  },

  mousemove: function(e){
    if(this.state != Action.States.Active) {
        if(this.diagram._ToolDrager.isActive()){
            this.activate();
            this.diagram._ToolDrager.move(e.mouseX,e.mouseY,true);
            this.lastX = e.mouseX;
            this.lastY = e.mouseY;
        }
        return;
    }
    
    var offsetX = e.mouseX - this.lastX;
    var offsetY = e.mouseY - this.lastY;
    if(this.diagram._ToolDrager.isActive()){
        this.diagram._ToolDrager.move(offsetX,offsetY,true);
        this.lastX = e.mouseX;
        this.lastY = e.mouseY;
        return;
    }
    
    var selct = this.diagram._getSelectedConnector();
    if(selct == null){
        var sels = this.diagram.getSelectedItems();
        for(var i=0;i<sels.length;i++){
            sels[i].move(offsetX,offsetY);
        }
    }else{
        if(selct instanceof tern.ShapeConnector){
            //create new connection
            var line = new tern.Connection( [new tern.Point(this.initialX,this.initialY), new tern.Point(e.mouseX,e.mouseY)],
                               tern.LineType.Straight);
            line._createConnectors();
            
            var addCmd = new tern.Commands.AddRemoveCommand(this.diagram,[line],true);
            var bindCmd = new tern.Commands.BindConnectorCommand(line.connectors[0],selct, selct, true);            
            
            var packageCmd = new tern.Commands.CompoundCommand();
            packageCmd.addCommand(addCmd);
            packageCmd.addCommand(bindCmd);  
            packageCmd.redo();
            
            this.diagram.undoManager.addCommand(packageCmd);
            
            var ct = line.connectors[1];
            this.diagram._setSelectedConnector(ct);
                  
            this._beginDragConnector(ct);
            
            return;
        }
    
        var oldFinded = this.findedCT;
        this.findedCT = null;
        
        if(selct.type == tern.ConnectorType.Endpoint){
            var ct = this.diagram.findConnectorAt(e.mouseX,e.mouseY,this.fromX,this.fromY);
            if(ct != null && ct.attachable){
                this.findedCT = ct;
                if (ct == oldFinded){
                    oldFinded = null;
                }else{
                    this.findedCT.stress(true);
                    this.findedCT.parent.stress(true);
                }
            }
        }
        
        if (oldFinded != null){
            oldFinded.stress(false);
            if (this.findedCT == null || this.findedCT.parent != oldFinded.parent){
                oldFinded.parent.stress(false);
            }
        }
        
        if (this.pointDrager != null){
            this.pointDrager.move(offsetX,offsetY);
        }else{
            selct.move(offsetX,offsetY);
        }
    }
    
    this.lastX = e.mouseX;
    this.lastY = e.mouseY;
  },

  mouseup: function(e){
    if(this.state != Action.States.Active) return;
    
    this.deActivate();
    if(this.diagram._ToolDrager.isActive()){
        this.diagram._ToolDrager.deactive(true);
        return;
    }
    
    if(this.initialX == this.lastX && this.initialY == this.lastY){
        if (this.pointDrager != null){
            this.pointDrager.cancel();
            this.pointDrager = null;
        }
        return;
    }
    
    var cmd = null;
    var selct = this.diagram._getSelectedConnector();
    if(selct == null){
        cmd = new tern.Commands.MoveCommand(this.diagram.getSelectedItems(), this.lastX - this.initialX, this.lastY - this.initialY);
    }else{
        if(selct instanceof tern.ShapeConnector) return;
        
        if (this.findedCT == null && selct.type == tern.ConnectorType.Endpoint){
            this.findedCT = this.diagram.findConnectorAt(this.lastX,this.lastY,this.fromX,this.fromY);
        }
        
        var bindCmd = null;
        if (this.findedCT != null && this.findedCT.attachable){
            var findedPoint = this.findedCT.parent.pointToGlobal(this.findedCT.x,this.findedCT.y); //findedCT comes from shape.  MUST?
            var offsetX = findedPoint.x - this.lastX;
            var offsetY = findedPoint.y - this.lastY;
            if (this.pointDrager != null){
                this.pointDrager.move(offsetX,offsetY);
            }else{
                selct.move(offsetX,offsetY);
            }
            
            this.lastX = findedPoint.x;
            this.lastY = findedPoint.y;
            
            bindCmd = new tern.Commands.BindConnectorCommand(selct, this.findedCT, true);     //attached!!
            this.findedCT.stress(false);
            this.findedCT.parent.stress(false);
        }else{
            if(selct.attachTo!=null){
                bindCmd = new tern.Commands.BindConnectorCommand(selct, selct.attachTo, false);
            }
        }
        
        if (this.pointDrager != null){
            this.pointDrager.commit();
            this.pointDrager = null;
        }
        
        cmd = new tern.Commands.ConnectorMoveCommand(selct, this.lastX - this.initialX, this.lastY - this.initialY);
        if (bindCmd != null){
            var packageCmd = new tern.Commands.CompoundCommand();
            packageCmd.addCommand(cmd);

            bindCmd.redo();
            packageCmd.addCommand(bindCmd);

            cmd = packageCmd;
        }
    }
    
    if(cmd != null){
        this.diagram.undoManager.addCommand(cmd);
    }
  },
});

Actions.classdef('SectionAction',tern.MouseAction,{ 
  SectionAction: function(){
    tern.MouseAction.call(this);
    this.initialX = this.initialY = -1;
    this.ghost = null;
  },

  mousedown: function(e){
    if(this.state == Action.States.Unactive){
        if(tern.Text.current) return;
        
        this.initialX = e.mouseX;
        this.initialY = e.mouseY;   

        if(null == this.ghost){
            this.ghost = this.diagram.__ghost;
        }
        
        this.ghost.x = e.mouseX;
        this.ghost.y = e.mouseY;
        this.ghost.width = 0;
        this.ghost.height = 0;
        this.ghost.visible = true;        
        this.activate();
    }
  },

  mouseup: function(e){
    if(this.state == Action.States.Active){
        this.deActivate();
        if(this.initialX!=e.mouseX && this.initialY!=e.mouseY){
            this.diagram._setSelectedConnector( null );
            var rect = new tern.Rect(this.initialX,this.initialY,e.mouseX,e.mouseY);
            sels = this.diagram.findElementsIn(rect.x,rect.y,rect.width,rect.height);
            this.diagram.setSelectedItems( sels );
        }
        this.ghost.visible = false;
    }
  },
  
  mousemove: function(e){
    if(this.state == Action.States.Active){
        var context = this.diagram.context;
        var rect = new tern.Rect(this.initialX,this.initialY,e.mouseX,e.mouseY);
        this.ghost.x = rect.x;
        this.ghost.y = rect.y;
        this.ghost.width = rect.width;
        this.ghost.height = rect.height;
    }
  },
});

Actions.classdef('HitAction',tern.MouseAction, {
  HitAction: function(){
    tern.MouseAction.call(this);
  },

  mouseup: function(e){
    if(this.state == Action.States.Active){
        this.deActivate();
    }
  },
  
  mousedown: function(e){
    if(this.state == Action.States.Suspend) return;
    var item = this.diagram.findAt(e.mouseX,e.mouseY);
    if(item != null){
        if(item instanceof tern.DiagramItem){
            var sels = this.diagram.getSelectedItems();
            if(sels!=null && sels.indexOf(item)>=0 ) return;

            this.diagram._setSelectedConnector( null );
            this.diagram.setSelectedItems( item );
        }else{
            this.diagram.setSelectedItems( null );
            if(item instanceof tern.Connector){
                this.diagram._setSelectedConnector( item );
            }else{
                this.diagram._setSelectedConnector( null );
                if( item instanceof tern.Text ){
                    tern.Text.onclick(item);                    
                }
            }
        }
    }else{
        this.diagram.setSelectedItems( null );
        this.diagram._setSelectedConnector( null );
    }       
  },
});

Actions.classdef('HoverAction',tern.MouseAction,{
  HoverAction: function(){
    tern.MouseAction.call(this);
    this.current = null;
  },

  mousemove: function(e){
    if (this.state == Action.States.Suspend
        || this.state == Action.States.Disable){
        return;
    }
    
    var item = this.diagram.findAt(e.mouseX,e.mouseY);
    if(item!=this.current){                
        if(this.current!=null) this.current.onHovered(false);
        
        if(item==null || !('onHovered' in item)){
            this.current = null;
            return;
        }
        
        this.current = item;
        if(this.current!=null) this.current.onHovered(true);
    }
  },
});

})();





/*
**************************************command**************************************
*/

(function(){

	var Commands = tern.namespace('Commands');

	var Command = tern.classdef('Command',{
	  Command: function(){
	    this.text = null;
	  },

	  toString: function(){return this.text;},
	  undo: function(){},
	  redo: function(){},
	});

	Commands.classdef('MoveCommand',Command,{
	  MoveCommand: function(items,offsetX,offsetY){
	    Command.call(this);
	    this.list = []
	    for(var i=0;i<items.length;i++) this.list[i] = items[i];
	    this.offsetX = offsetX;
	    this.offsetY = offsetY;
	    this.text = "Elements Move";
	  },

	  undo: function(){
	    if(this.list.length <= 0 || this.list[0].parent == null ) return;
	    
	    this.list[0].parent.setSelectedItems(this.list);
	    for(var i=0;i<this.list.length;i++){
	        this.list[i].move(-this.offsetX,-this.offsetY);
	    }
	  },

	  redo: function(){
	    if(this.list.length <= 0 || this.list[0].parent == null ) return;
	    
	    this.list[0].parent.setSelectedItems(this.list);
	    for(var i=0;i<this.list.length;i++){
	        this.list[i].move(this.offsetX,this.offsetY);
	    }
	  },
	});

	Commands.classdef('CompoundCommand',Command,{
	  CompoundCommand: function(){
	    Command.call(this);
	    this.commands = [];
	  },

	  addCommand: function(cmd){
	    this.commands[this.commands.length] = cmd;
	  },

	  undo: function(){
	    for(var i=0;i<this.commands.length;i++) this.commands[i].undo();
	  },

	  redo: function(){
	    for(var i=0;i<this.commands.length;i++) this.commands[i].redo();
	  },
	});

	Commands.classdef('BindConnectorCommand',Command,{
	  BindConnectorCommand: function(child,parent,toAttach){
	    Command.call(this);
	    this.child = child;
	    this.parent = parent;
	    this.toAttach = toAttach;
	    if (toAttach) this.text = 'Attache to ' + parent.parent;
	    else this.text = 'Detache from ' + parent.parent;
	  },

	  _execute: function(flag){
	    if (this.parent == null || this.child == null || !this.parent.attachable) return;
	    if(flag) this.parent.addAttached(this.child);
	    else this.parent.removeAttached(this.child);
	  },

	  undo: function(){
	    this._execute(!this.toAttach);
	  },

	  redo: function(){
	    this._execute(this.toAttach);
	  },
	});

	Commands.classdef('ConnectorMoveCommand',Command,{
	  ConnectorMoveCommand: function(ct,offsetX,offsetY){
	    Command.call(this);
	    
	    this.ct = ct;
	    this.offsetX = offsetX;
	    this.offsetY = offsetY;
	  },

	  _execute: function(flag){
	    if(this.ct == null) return;
	    this.ct.parent.parent._setSelectedConnector(this.ct);
	    
	    var pointDrager = this.ct.beginDrag();
	    if (pointDrager == null){
	        if (!ct.draggable()) return;
	        else if (!pointDrager.movable()){
	            pointDrager.cancel();
	            pointDrager = null;
	        }
	    }
	    
	    if(pointDrager != null){
	        if(flag) pointDrager.move(this.offsetX,this.offsetY);
	        else pointDrager.move(-this.offsetX,-this.offsetY);
	    }else{
	        if(flag) this.ct.move(this.offsetX,this.offsetY);
	        else this.ct.move(-this.offsetX,-this.offsetY);
	    }
	  },

	  undo: function(){
	    this._execute(false);
	  },

	  redo: function(){
	    this._execute(true);
	  },
	});

	Commands.classdef('AddRemoveCommand',Command,{
	    AddRemoveCommand: function(ctrl,list,isAdded){
	        this.ctrl = ctrl;
	        this.isAdded = isAdded;
	        
	        this.items = [];        
	        if(list != null && list.length > 0){
	            if (!isAdded) this.child = new Commands.CompoundCommand();
	            for(var j=0;j<list.length;j++){
	                var i =  list[j];
	                this.items.push(i);
	                
	                if (!isAdded && i.connectors.length > 0){
	                    for(var m=0;m<i.connectors.length;m++){
	                        var ct = i.connectors[m];
	                        if(ct.attachedConnectors && ct.attachedConnectors.length>0){
	                            for(var n=0;n<ct.attachedConnectors.length;n++){
	                                var ct2 = ct.attachedConnectors[n];
	                                if(list.indexOf(ct2.parent) < 0){
	                                    this.child.addCommand(new Commands.BindConnectorCommand(ct2, ct, false));
	                                }
	                            }
	                        }else if(ct.attachTo != null){
	                            var parent = ct.attachTo.parent;
	                            if(list.indexOf(parent) < 0) {
	                                this.child.addCommand(new Commands.BindConnectorCommand(ct,ct.attachTo, false));
	                            }
	                        }
	                    }
	                }
	            }
	        }
	    },
	    
	    _execute: function(flag){
	        if(this.ctrl==null || this.items.length<=0) return;
	        if(flag){
	            //add items to diagram
	            for(var i=0;i<this.items.length;i++){
	                this.ctrl.addChild( this.items[i] );
	            }
	            
	            if (this.childs){
	                this.childs.undo();
	            }
	            
	            this.ctrl.setSelectedItems(this.items);
	        }else{
	            if (this.childs){
	                this.childs.redo();
	            }
	            
	            //remove
	            for(var i=0;i<this.items.length;i++){
	                this.ctrl.removeChild( this.items[i] );
	            }
	            
	            this.ctrl.setSelectedItems(null);
	        }
	    },
	    
	    undo: function(){this._execute(!this.isAdded);},
	    redo: function(){this._execute(this.isAdded);},
	});

	})();