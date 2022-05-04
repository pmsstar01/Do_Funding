package member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import member.model.MemberBean;
import member.model.MemberDao;

@Controller
public class MemberLoginController {
	private final String command = "/login.mem";
	private final String getPage = "member_loginForm";
	private String gotoPage = "redirect:/list.prd";
	@Autowired
	MemberDao mdao;
	
	
	@RequestMapping(value = command,method = RequestMethod.GET)
	public ModelAndView doAction(@RequestParam(value="cnt", required=false) String cnt) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("cnt", cnt);
		mav.setViewName(getPage);
		return mav;
	}
	
	@RequestMapping(value = command,method = RequestMethod.POST)
	public String doAction(MemberBean membean,HttpSession session,HttpServletResponse response) {
		response.setContentType("text/html; charset=UTF-8");
		MemberBean loginInfo = mdao.getLoginInfo(membean);
		
		PrintWriter pw=null;
		if(loginInfo == null) {

			try {
				pw = response.getWriter();
			} catch (IOException e) {
				e.printStackTrace();
			}
			pw.println("<script> alert('로그인 실패 아이디와 비밀번호를 확인해주세요');</script>");
			pw.flush();
			return getPage;
		}//if
		
		else {

			if(loginInfo.getPassword().equals(membean.getPassword())) {
				
				session.setAttribute("loginInfo", loginInfo);
					
				String destination = (String)session.getAttribute("destination");
				if(destination ==null) {
					return gotoPage;
				}
				else {
					return destination;					
				}
			}
			else {
				try {
					pw=response.getWriter();
				} catch (IOException e) {
					e.printStackTrace();
				}
				pw.println("<script> alert('로그인 실패 패스워드를 확인하세요');</script>");
				pw.flush();
				return getPage;
			}
		}
	}
}
