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
import board.model.NoticeBean;

@Controller
public class AdminNoticeDeleteController {

	private final String command="/admin_notice_delete.ad";
	private String getPage="admin_notice_content";
	private String gotoPage="redirect:/admin_notice_list.ad";

	@Autowired
	private BoardDao boardDao;

	@RequestMapping(value=command)
	public String doAction(
			@RequestParam(value="pageNumber") String pageNumber,
			NoticeBean noticeBean,
			HttpServletRequest request,
			HttpServletResponse response
			) {	
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter pw =null;	

		int cnt=boardDao.deleteNotice(noticeBean);			
		try {
			pw=response.getWriter();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		if(cnt>0) {		//
			return gotoPage;
		}	
		else {
			pw.println("<script> alert('공지글 삭제에 실패했습니다.');</script>");
			pw.flush();
			request.setAttribute("noticeBean", noticeBean);
			request.setAttribute("pageNumber", pageNumber);
			return getPage;
		}	


	}	



}
