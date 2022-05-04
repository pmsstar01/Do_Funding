package admin.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminBotMapController {
	private final String command="/map.ad";
	private String getPage="admin_map";
		
	@RequestMapping(command)
	public ModelAndView doAction(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName(getPage);
		return mav;
		
	}
}
