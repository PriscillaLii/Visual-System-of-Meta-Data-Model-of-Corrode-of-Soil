package Service;

import java.util.ArrayList;

import net.sf.json.JSONObject;
import Model.Process;

public interface ProcessService {
	public ArrayList<Process> listAllProcess();
	
	public ArrayList<Process> AdvancedSearch(String name, String input, String output);
	
	public void delete(String name);
	
	public void save(Process p);
	
	public Process find(String name);
	
	public Process toProcess(JSONObject JsonP);
	
	public JSONObject ObjectToJson(Process p);

}
