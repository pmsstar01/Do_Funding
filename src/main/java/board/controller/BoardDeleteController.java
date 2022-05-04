package board.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import board.model.BoardBean;
import board.model.BoardDao;

@Controller
public class BoardDeleteController {
	
	private final String command="/delete.bd";
	private String getPage="board_deleteForm";
	private String gotoPage="redirect:/list.bd";
	
	@Autowired
	private BoardDao boardDao;

	
	@RequestMapping(value=command,method = RequestMethod.GET)
	public String doAction(
			@RequestParam(value="pageNumber")String pageNumber,
			BoardBean bdBean,
			HttpServletRequest request
			) {	
		request.setAttribute("bdBean", bdBean);
		request.setAttribute("pageNumber", pageNumber);
		return getPage;
	}	

	@RequestMapping(value=command,method = RequestMethod.POST)
	public String doAction(
			@RequestParam(value="pageNumber") String pageNumber,
			BoardBean bdBean,
			HttpServletRequest request,
			HttpServletResponse response
			) {	
		String passwd=bdBean.getB_passwd();
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter pw =null;	
		
		if(passwd.equals("")){	
			try {
				pw=response.getWriter();
			} catch (IOException e) {
				e.printStackTrace();
			}
			pw.println("<script> alert('비밀번호를 입력하세요.');</script>");
			pw.flush();
			request.setAttribute("bdBean", bdBean);
			request.setAttribute("pageNumber", pageNumber);
			return getPage;
		}
		else
		{
			int cnt=boardDao.deleteArticle(bdBean);			
			try {
				pw=response.getWriter();
			} catch (IOException e) {
				e.printStackTrace();
			}
			if(cnt>0) {		
				return gotoPage+"?pageNumber="+pageNumber;
			}
			
			if(cnt == -2) {	
				pw.println("<script> alert('비밀번호가 일치하지 않습니다.');</script>");
				pw.flush();
			}
			else {
				pw.println("<script> alert('게시글 삭제에 성공했습니다.');</script>");
				pw.flush();
			}	
			request.setAttribute("bdBean", bdBean);
			request.setAttribute("pageNumber", pageNumber);
			return getPage;
		}
			

	}	
	
	
}
