package member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import member.model.MemberDao;

@Controller
public class MemberDeleteController {
	private final String command = "/delete.mem";
	private final String gotoPage = "redirect:/logout.jsp";
	
	@Autowired
	MemberDao mdao;
	
	@RequestMapping(value = command , method = RequestMethod.GET)
	public String doAction(@RequestParam(value="no", required=false) String no,HttpSession session,HttpServletRequest request) {
		System.out.println(request.getContextPath());
		int cnt = mdao.deleteMember(no);
		if(cnt < 0) {
			System.out.println("삭제실패");
			return gotoPage;
		}
		else {
			return gotoPage;
		}
		
	}
}
