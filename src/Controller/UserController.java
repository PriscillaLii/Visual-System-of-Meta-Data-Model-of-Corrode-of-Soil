package Controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import Model.User;
import Service.UserService;

@Controller
@RequestMapping("user")
public class UserController {
	
	@Resource
	private UserService us;
	
	@RequestMapping("/login")
	public ModelAndView login(HttpServletRequest request, HttpServletResponse response, String username,String pwd){
		User u = us.login(username);
		HttpSession session = request.getSession();
		session.setAttribute("user", u);
		if(u!=null)
			//return new ModelAndView("home1");
			return new ModelAndView("insert2");
		else
			return new ModelAndView("login");
	}
	@RequestMapping("/buildSession")
	public ModelAndView buildSession(HttpServletRequest request, HttpServletResponse response){
		User u = new User();
		u.setName("dxd");
		u.setPassword("beibei0108");
		HttpSession session = request.getSession();
		session.setAttribute("user1", u);
		return new ModelAndView("insert2");
	}
}
