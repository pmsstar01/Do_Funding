package member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import member.model.MemberBean;
import member.model.MemberDao;

@Controller
public class MemberFindPasswordController {
	private final String command = "findpw.mem";
	private final String getPage = "member_findPassword";
	private String gotoPage = "redirect:resetpw.mem";
	@Autowired
	MemberDao mdao;
	
	@RequestMapping(value = command,method = RequestMethod.GET)
	public String doAction(MemberBean membean ,HttpServletRequest request) {
		request.setAttribute("id", request.getParameter("id"));
		request.setAttribute("name", request.getParameter("name"));
		request.setAttribute("birthday", request.getParameter("birthday"));
		return getPage;
	}

	@RequestMapping(value = command,method = RequestMethod.POST)
	public String doAction(MemberBean membean ,HttpServletRequest request,HttpServletResponse response) {
		response.setContentType("text/html; charset=UTF-8");
		MemberBean loginInfo = mdao.getLoginInfo(membean);
		PrintWriter pw=null;
		if(loginInfo == null) {
			try {
				pw = response.getWriter();
			} catch (IOException e) {
				e.printStackTrace();
			}
			pw.println("<script> alert('찾으시는 회원정보가 없습니다');</script>");
			pw.flush();
			return getPage;
		}//if
		return gotoPage+"?id="+loginInfo.getId();
	}
	
	
	
	
	
}
