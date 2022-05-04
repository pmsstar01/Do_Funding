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
import org.springframework.web.bind.annotation.RequestParam;

import board.model.BoardDao;
import board.model.FaqBean;

@Controller
public class AdminFaqUpdateController {

	private final String command="/admin_faq_update.ad";
	private String getPage="admin_faq_updateForm";
	private String gotoPage="redirect:/admin_faq_content.ad";
	
	@Autowired
	private BoardDao boardDao;

	
	@RequestMapping(value=command,method = RequestMethod.GET)
	public String doAction(
			@RequestParam(value="pageNumber")String pageNumber,
			FaqBean faqBean,
			HttpServletRequest request
			) {	
		FaqBean fBean=boardDao.faqOneSelect(faqBean);
		request.setAttribute("fBean", fBean);
		request.setAttribute("pageNumber", pageNumber);
		return getPage;
	}	


	@RequestMapping(value=command,method = RequestMethod.POST)
	public String doAction(
			@RequestParam(value="pageNumber") String pageNumber,
			FaqBean faqBean,
			HttpServletRequest request,
			HttpServletResponse response,
			HttpSession session
			) {	
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter pw =null;	
		int cnt=boardDao.UpdateFaq(faqBean);
		if(cnt>0){	
			return gotoPage+"?pageNumber="+pageNumber+"&faq_num="+faqBean.getFaq_num();
		}
		else
		{
			try {
				pw=response.getWriter();
			} catch (IOException e) {
				e.printStackTrace();
			}

			pw.println("<script> alert('FAQ글 수정에 실패했습니다.');</script>");
			pw.flush();
	
			request.setAttribute("fBean", faqBean);
			request.setAttribute("pageNumber", pageNumber);
			return getPage;
		}
			

	}	
		
}
