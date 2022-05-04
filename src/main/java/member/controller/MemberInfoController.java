package member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import member.model.MemberBean;
import member.model.MemberDao;

@Controller
public class MemberInfoController {
	private final String command = "/memberInfo.mem";
	private final String getPage = "member_detailView";
	
	@Autowired
	MemberDao mdao;
	
	@RequestMapping(value = command,method = RequestMethod.GET)
	public String doAction(
			HttpSession session) {
		MemberBean mb=(MemberBean)session.getAttribute("loginInfo");
		mb=mdao.getLoginInfo(mb);	//기존 세션에 구매관련이나 추가변경정보들 최신화해서 다시 전달
		session.setAttribute("loginInfo", mb);
		return getPage;
	}
	
	
}
