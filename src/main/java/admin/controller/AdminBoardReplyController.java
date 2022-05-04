package admin.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import board.model.BoardBean;
import board.model.BoardDao;

@Controller
public class AdminBoardReplyController {

	private final String command="/admin_bd_reply.ad";
	private String getPage="admin_bd_replyForm";
	private String gotoPage="redirect:/admin_bd_list.ad";

	@Autowired
	private BoardDao boardDao;

	private PrintWriter pw =null;

	@RequestMapping(value=command,method = RequestMethod.GET)
	public String doAction(
			@RequestParam(value="pageNumber")String pageNumber,
			BoardBean bdBean,
			HttpServletRequest request,
			HttpSession session) {

			request.setAttribute("bdBean", bdBean);
			request.setAttribute("pageNumber", pageNumber);
			return getPage;

	}

	@RequestMapping(value=command,method = RequestMethod.POST)
	public String doAction(
			@RequestParam(value="pageNumber")String pageNumber,
			BoardBean bdBean,
			HttpServletRequest request,
			HttpServletResponse response) {	
		//writer/subject/email/content/password/Reg_date/Ip
		//ref/re_step/re_level
		response.setContentType("text/html; charset=UTF-8");
		bdBean.setB_reg_date(new Timestamp(System.currentTimeMillis()));
		int cnt=boardDao.replyArticle(bdBean);
		
		if(cnt>0){
			return gotoPage+"?pageNumber="+pageNumber;	
		}
		else{	
			try {
				pw=response.getWriter();
			} catch (IOException e) {
				e.printStackTrace();
			}
			pw.println("<script> alert('답글 쓰기가 실패하였습니다.');</script>");
			pw.flush();
			request.setAttribute("bdBean", bdBean);
			request.setAttribute("pageNumber", pageNumber);			
			return getPage;
		}

	}


}
