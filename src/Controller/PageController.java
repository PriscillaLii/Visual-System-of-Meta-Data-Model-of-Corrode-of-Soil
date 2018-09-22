package Controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
@RequestMapping("page")
public class PageController {
	
	@RequestMapping(value="openHome")
	public ModelAndView openHome(HttpServletRequest request, HttpServletResponse response, 
			String name, String input, String output){
		return new ModelAndView("home1");
	}

	@RequestMapping(value="openInsert")
	public ModelAndView openInsert(HttpServletRequest request, HttpServletResponse response, 
			String name, String input, String output){
		return new ModelAndView("insert2");
	}
}
