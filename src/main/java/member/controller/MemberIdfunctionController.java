package member.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import member.model.MemberBean;
import member.model.MemberDao;

@Controller
public class MemberIdfunctionController {
	private final String command = "/idfunction.mem";
	private final String getPage = "member_insertForm";
	@Autowired
	MemberDao mdao;
	
	@ResponseBody
	@RequestMapping(value = command,method = RequestMethod.GET)
	public String doAction(
			MemberBean mb ,
			HttpServletRequest request, HttpServletResponse response) {
		response.setContentType("text/html; charset=UTF-8");
		System.out.println("mb:"+mb.getId());
		MemberBean membean = mdao.getLoginInfo(mb);
		System.out.println("membean:"+membean);
		String data;
		if(membean == null) {
			data = "false";
			request.setAttribute("data", data);
			System.out.println("data"+data);
			return data;
		}//if
		else {
			data = "true";
			request.setAttribute("data", data);
			System.out.println("data"+data);
			return data;
		}
	}
	
}
