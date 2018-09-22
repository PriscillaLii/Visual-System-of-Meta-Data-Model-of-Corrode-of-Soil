package ServiceImpl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import net.sf.json.JSONObject;

import org.springframework.stereotype.Service;

import Dao.ProcessDAO;
import Model.Process;
import Service.ProcessService;

@Service
public class ProcessServiceImpl implements ProcessService {
	@Resource
	private ProcessDAO pd;
	
	
	@Override
	public ArrayList<Process> listAllProcess() {
		// TODO Auto-generated method stub
		return (ArrayList<Process>) pd.findAll();
	}


	@Override
	public ArrayList<Process> AdvancedSearch(String name, String input,
			String output) {
		// TODO Auto-generated method stub
		ArrayList<Process> pList = (ArrayList<Process>)pd.findByNameInputOutput(name, input, output);
		return pList;
	}


	@Override
	public void delete(String name) {
		// TODO Auto-generated method stub
		pd.deleteByName(name);
	}


	@Override
	public void save(Process p) {
		// TODO Auto-generated method stub
		String name = p.getName();
		Process p1 = pd.findByName(name);
		if(p1!=null){
			pd.deleteByName(p.getName());
			pd.save(p);
		}
		else {pd.save(p);}
	}


	@Override
	public Process find(String name) {
		// TODO Auto-generated method stub
		return pd.findByName(name);
	}
	@Override
	public Process toProcess(JSONObject JsonP){
		Process p = new Process();
		return p;
	}
	@Override
	public JSONObject ObjectToJson(Process p){
		JSONObject jsonP = JSONObject.fromObject(p);
		return jsonP;
	}

}
