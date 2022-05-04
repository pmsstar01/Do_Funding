package board.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import board.model.BoardDao;
import board.model.NoticeBean;

@Controller
public class Notice_ContentController {

	private final String command="/notice_content.bd";
	private String getPage="notice_content";

	@Autowired
	private BoardDao boardDao;

	
	@RequestMapping(value=command,method = RequestMethod.GET)
	public ModelAndView doAction(
			@RequestParam(value="pageNumber")String pageNumber,
			NoticeBean noticeBean,
			HttpServletRequest request
			) {
		NoticeBean detail =boardDao.getNotice(noticeBean);
		ModelAndView mav=new ModelAndView();
		mav.addObject("noticeBean", detail);
		mav.addObject("pageNumber", pageNumber);
		mav.setViewName(getPage);
		return mav;
	}
		
	
	
}
