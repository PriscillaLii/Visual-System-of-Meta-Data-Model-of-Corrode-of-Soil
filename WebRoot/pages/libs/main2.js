
function addNode(parentId, nodeId, nodeLable, position) {
  var panel = d3.select("#" + parentId);
  panel.append('div').style('width','70px').style('height','40px')
    .style('position','absolute')
    .style('top',position.y).style('left',position.x)
    .style('border','2px solid #68A521').attr('align','center')
    .attr('id',nodeId).classed('node',true)
    .style('background','#EDEDED')
    .style('text-align','center')
    .style('box-shadow','2px 2px 19px #aaa')
    .style('border-radius','0.5em')
    .style('background-color','#eeeeef')
    .style('-moz-box-shadow','2px 2px 19px #aaa')
    .style('-moz-border-radius','0.5em')
    .style('text-align','center')
    .text(nodeLable);

  return jsPlumb.getSelector('#' + nodeId)[0];
}

function addPorts(instance, node, ports, type) {
  //Assume horizental layout
  var number_of_ports = ports.length;
  var i = 0;
  var height = $(node).height();  //Note, jquery does not include border for height
  var y_offset = 1 / ( number_of_ports + 1);
  var y = 0;

  for ( ; i < number_of_ports; i++ ) {
    var anchor = [0,0,0,0];
    var paintStyle = { radius:5, fillStyle:'#68A521' };
    var isSource = false, isTarget = false;
    if ( type === 'output' ) {
      anchor[0] = 1;
      paintStyle.fillStyle = '#90CD49';
      isSource = true;
    } else {
      isTarget =true;
    }

    anchor[1] = y + y_offset;
    y = anchor[1];

    instance.addEndpoint(node, {
      uuid:node.getAttribute("id") + "-" + ports[i],
      paintStyle: paintStyle,
      anchor:anchor,
      maxConnections:-1,
      isSource:isSource,
      isTarget:isTarget
    });
  }
}

function connectPorts(instance, node1, port1, node2 , port2) {
  // declare some common values:
  var color = "gray";
  var arrowCommon = { foldback:0.8, fillStyle:color, width:5 },
  // use three-arg spec to create two different arrows with the common values:
  overlays = [
    [ "Arrow", { location:0.8 }, arrowCommon ],
    [ "Arrow", { location:0.2, direction:-1 }, arrowCommon ]
  ];

  var uuid_source = node1.getAttribute("id") + "-" + port1;
  var uuid_target = node2.getAttribute("id") + "-" + port2;

  instance.connect({uuids:[uuid_source, uuid_target]});
}

function getTreeData() {
  var tree = [
    {
      text: "算法",
      nodes: [
        {
          text: "01",
        },
        {
          text: "02"
        },
        {
            text: "03"
        },
        {
            text: "04"
        },
        {
            text: "05"
        },
        {
            text: "06"
          }
      ]
    }
  ]; 

  return tree;
}

jsPlumb.ready(function() {
    console.log("jsPlumb is ready to use");

    //Initialize JsPlumb
    var color = "#53A7C3";
    var instance = jsPlumb.getInstance({
      // notice the 'curviness' argument to this Bezier curve.  the curves on this page are far smoother
      // than the curves on the first demo, which use the default curviness value.      
      Connector : [ "Bezier", { curviness:50 } ],
      DragOptions : { cursor: "pointer", zIndex:2000 },
      PaintStyle : { strokeStyle:color, lineWidth:2 },
      EndpointStyle : { radius:5, fillStyle:color },
      HoverPaintStyle : {strokeStyle:"#1B5164" },
      EndpointHoverStyle : {fillStyle:"#1B5164" },
      Container:"flow-panel"
    });

    //Initialize Control Tree View
    $('#control-panel').treeview({data: getTreeData()});
    
    //Handle drag and drop
    $('.list-group-item').attr('draggable','true').on('dragstart', function(ev){
      //ev.dataTransfer.setData("text", ev.target.id);
      ev.originalEvent.dataTransfer.setData('text',ev.target.textContent);
      console.log('drag start');
    });

    $('#flow-panel').on('drop', function(ev){
      
      //avoid event conlict for jsPlumb
      if (ev.target.className.indexOf('_jsPlumb') >= 0 ) {
        return;
      }

      ev.preventDefault();
      var mx = '' + ev.originalEvent.offsetX + 'px';
      var my = '' + ev.originalEvent.offsetY + 'px';

      console.log('on drop : ' + ev.originalEvent.dataTransfer.getData('text'));
      var text1 = ev.originalEvent.dataTransfer.getData('text');
      var uid = new Date().getTime();
      var node = addNode('flow-panel','node' + uid, text1, {x:mx,y:my});
      addPorts(instance, node, ['out'],'output');
      addPorts(instance, node, ['in1','in2'],'input');
      instance.draggable($(node));
    }).on('dragover', function(ev){
      ev.preventDefault();
      console.log('on drag over');
    });
  
    instance.doWhileSuspended(function() {

      // declare some common values:
      var arrowCommon = { foldback:0.8, fillStyle:color, width:5 },
      // use three-arg spec to create two different arrows with the common values:
      overlays = [
        [ "Arrow", { location:0.8 }, arrowCommon ],
        [ "Arrow", { location:0.2, direction:-1 }, arrowCommon ]
      ];

      var node1 = addNode('flow-panel','node1', '01', {x:'20px',y:'20px'});
      var node2 = addNode('flow-panel','node2', '02', {x:'20px',y:'80px'});
      var node3 = addNode('flow-panel','node3', '03', {x:'140px',y:'50px'});
      var node4 = addNode('flow-panel','node4', '04', {x:'140px',y:'110px'});
      var node5 = addNode('flow-panel','node5', '05', {x:'260px',y:'80px'});

      addPorts(instance, node1, ['out'],'output');
      addPorts(instance, node1, ['in','in1'],'input');
      
      addPorts(instance, node2, ['out'],'output');
      addPorts(instance, node2, ['in','in1'],'input');
      
      addPorts(instance, node3, ['out'],'output');
      addPorts(instance, node3, ['in','in1'],'input');
      
      addPorts(instance, node4, ['out'],'output');
      addPorts(instance, node4, ['in','in1'],'input');
      
      addPorts(instance, node5, ['out'],'output');
      addPorts(instance, node5, ['in','in1'],'input');

      connectPorts(instance, node1, 'out', node3, 'in');
      connectPorts(instance, node2, 'out', node3, 'in1');

      connectPorts(instance, node3, 'out', node5, 'in');
      connectPorts(instance, node4, 'out', node5, 'in1');

      instance.draggable($('.node'));
  
    });

    jsPlumb.fire("jsFlowLoaded", instance);
    
});