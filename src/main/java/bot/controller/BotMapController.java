package bot.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BotMapController {
	private final String command="/map.bot";
	private String getPage="map";
	
	
	@RequestMapping(command)
	public ModelAndView doAction(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName(getPage);
		return mav;
		
	}
}
