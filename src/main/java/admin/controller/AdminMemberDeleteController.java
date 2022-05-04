package admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import member.model.MemberDao;

@Controller
public class AdminMemberDeleteController {
	private final String command = "/delete.ad";
	private final String gotoPage = "redirect:/admin_mem_list.ad";
	
	@Autowired
	MemberDao mdao;
	
	@RequestMapping(value = command , method = RequestMethod.GET)
	public String doAction(@RequestParam(value="no", required=false) String no) {
		int cnt = mdao.deleteMember(no);
		if(cnt < 0) {
			System.out.println("삭제실패");
			return gotoPage;
		}
		else {
			System.out.println("삭제성공");
			return gotoPage;
		}
		
	}
}
