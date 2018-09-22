package Controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import Service.ProcessService;
import Model.Process;
import util.Read;
import util.Write;

@Controller
@RequestMapping("process")
public class ProcessController {
	@Resource
	private ProcessService ps;
	
	@RequestMapping(value="listAll")
	public ModelAndView ListAll(HttpServletRequest request, HttpServletResponse response){
		HttpSession session = request.getSession();
		ArrayList<Process> pList = ps.listAllProcess();
		session.setAttribute("processlist", pList);
		return new ModelAndView("browse1");
	}
	
	@RequestMapping(value="advancedSearch")
	public ModelAndView AdvancedSearch(HttpServletRequest request, HttpServletResponse response, 
			String name, String input, String output){
		ArrayList<Process> p = ps.AdvancedSearch(name, input, output);
		HttpSession session = request.getSession();
		session.setAttribute("result", p);
		return new ModelAndView("query2");
	}
	
	//还要改：加读取Algorithm等
	
	
	@RequestMapping(value="delete/{name}")
	public ModelAndView delete(HttpServletRequest request, HttpServletResponse response, 
			@PathVariable("name")String name){
		ps.delete(name);
		return new ModelAndView("query2");
	}
	
	@RequestMapping(value="detail/{name}")
	public ModelAndView detail(HttpServletRequest request, HttpServletResponse response, 
			@PathVariable("name")String name){
		Read r = new Read();
		Process p = ps.find(name);
		JSONObject jsonP = r.ObjectToJson(p);
		String process = jsonP.toString();
		HttpSession session = request.getSession();
		session.setAttribute("result", process);
		return new ModelAndView("databaseDetail");
	}
	
	/*@RequestMapping(value="javaToJs")
	public ModelAndView javaToJs(HttpServletRequest request, HttpServletResponse response){
		Read r = new Read();
		JSONObject jsonP = r.readTxt("/Users/Meta/Desktop/01.txt");
		HttpSession session = request.getSession();
		session.setAttribute("jsonP", jsonP);
		return new ModelAndView("JavaToJs");
	}*/
	
	@RequestMapping(value="read")
	public ModelAndView read(HttpServletRequest request, HttpServletResponse response,
			@RequestParam("file") CommonsMultipartFile file){
		Read r = new Read();
		Process p = r.readToProcess(file);
		System.out.println(p.getName());
		ps.save(p);
		JSONObject jsonP = r.ObjectToJson(p);
		String process = jsonP.toString();
		HttpSession session = request.getSession();
		session.setAttribute("processString", process);
		return new ModelAndView("databaseDetail");
	}
	
	/*@RequestMapping(value="write",method=RequestMethod.GET)
	public Map<String, String> write(HttpServletRequest request, HttpServletResponse response){
		Write w = new Write();
		Map<String, String> map = new HashMap<String, String>();  
	    map.put("1", "1");  
		w.write("/Users/Meta/Desktop/03.txt");
		return map; 
	}*/
	
	public ModelAndView write(HttpServletRequest request, HttpServletResponse response,
			@RequestParam("file") CommonsMultipartFile file){
		return new ModelAndView("databaseDetail");
	}
	

}
