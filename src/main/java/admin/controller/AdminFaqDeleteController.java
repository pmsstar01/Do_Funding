package admin.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import board.model.BoardDao;
import board.model.FaqBean;

@Controller
public class AdminFaqDeleteController {

	private final String command="/admin_faq_delete.ad";
	private String getPage="admin_faq_content";
	private String gotoPage="redirect:/admin_faq_list.ad";

	@Autowired
	private BoardDao boardDao;

	@RequestMapping(value=command)
	public String doAction(
			@RequestParam(value="pageNumber") String pageNumber,
			FaqBean faqBean,
			HttpServletRequest request,
			HttpServletResponse response
			) {	
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter pw =null;	

		int cnt=boardDao.deleteFaq(faqBean);			
		try {
			pw=response.getWriter();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		if(cnt>0) {		//
			return gotoPage;
		}	
		else {
			pw.println("<script> alert('FAQ 삭제에 실패했습니다.');</script>");
			pw.flush();
			request.setAttribute("faqBean", faqBean);
			request.setAttribute("pageNumber", pageNumber);
			return getPage;
		}	


	}	



}
