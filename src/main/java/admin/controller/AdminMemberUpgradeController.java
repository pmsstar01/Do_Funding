package admin.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import member.model.MemberDao;

@Controller
public class AdminMemberUpgradeController {
	private final String command = "upgrade.ad";
	private final String getPage = "redirect:admin_mem_list.ad";
	
	@Autowired
	MemberDao mdao;
	
	@RequestMapping(value = command , method = RequestMethod.GET)
	public String doAction(HttpServletRequest request) {
		int no = Integer.parseInt(request.getParameter("no"));
		System.out.println("no"+no);
		mdao.upgrade(no);
		
		return getPage;
	}
	
}
