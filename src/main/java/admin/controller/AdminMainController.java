package admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AdminMainController {

	private final String command = "/main.ad";
	private String getPage = "admin_main";
		
	@RequestMapping(value=command,method = RequestMethod.GET)
	public String doAction() {		
		return getPage;
	}
		
}
