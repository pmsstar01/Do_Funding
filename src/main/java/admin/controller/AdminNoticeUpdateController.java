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
import board.model.NoticeBean;

@Controller
public class AdminNoticeUpdateController {

	private final String command="/admin_notice_update.ad";
	private String getPage="admin_notice_updateForm";
	private String gotoPage="redirect:/admin_notice_content.ad";
	
	@Autowired
	private BoardDao boardDao;


	@RequestMapping(value=command,method = RequestMethod.GET)
	public String doAction(
			@RequestParam(value="pageNumber")String pageNumber,
			NoticeBean ncBean,
			HttpServletRequest request
			) {	
		NoticeBean noticeBean=boardDao.noticeOneSelect(ncBean);
		System.out.println("check:"+noticeBean.getNo_content());
		request.setAttribute("nBean", noticeBean);
		request.setAttribute("pageNumber", pageNumber);
		return getPage;
	}	


	@RequestMapping(value=command,method = RequestMethod.POST)
	public String doAction(
			@RequestParam(value="pageNumber") String pageNumber,
			NoticeBean noticeBean,
			HttpServletRequest request,
			HttpServletResponse response,
			HttpSession session
			) {	
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter pw =null;	
		int cnt=boardDao.UpdateNotice(noticeBean);
		if(cnt>0){	
			return gotoPage+"?pageNumber="+pageNumber+"&no_num="+noticeBean.getNo_num();
		}
		else
		{
			try {
				pw=response.getWriter();
			} catch (IOException e) {
				e.printStackTrace();
			}
				
			pw.println("<script> alert('공지글 수정에 실패했습니다.');</script>");
			pw.flush();
		
			request.setAttribute("nBean", noticeBean);
			request.setAttribute("pageNumber", pageNumber);
			return getPage;
		}
			

	}	
		
}
