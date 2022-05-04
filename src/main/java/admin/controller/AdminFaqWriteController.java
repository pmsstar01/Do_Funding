package admin.controller;

import java.io.IOException;
import java.io.PrintWriter;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import board.model.BoardDao;
import board.model.FaqBean;

@Controller
public class AdminFaqWriteController {

	private final String command="/admin_faq_insert.ad";
	private String getPage="admin_faq_writeForm";
	private String gotoPage="redirect:/admin_faq_list.ad";

	@Autowired
	private BoardDao boardDao;

	@RequestMapping(value=command,method = RequestMethod.GET)
	public String doAction(HttpSession session) {	
			return getPage;// writeForm.jsp
		
	}

	@RequestMapping(value=command,method = RequestMethod.POST)
	public String doAction(
			FaqBean faqBean,
			HttpServletRequest request,
			HttpServletResponse response) {
		response.setContentType("text/html; charset=UTF-8");			
	
		int cnt=boardDao.insertFaq(faqBean);
		PrintWriter pw =null;
		if(cnt>0){
			return gotoPage;	
		}
		else{	
			try {
				pw=response.getWriter();
			} catch (IOException e) {
				e.printStackTrace();
			}
			pw.println("<script> alert('FAQ작성에 실패했습니다.');</script>");
			pw.flush();
			return getPage;
		}

	}




}
