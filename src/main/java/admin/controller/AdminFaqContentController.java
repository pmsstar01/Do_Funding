package admin.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import board.model.BoardDao;
import board.model.FaqBean;

@Controller
public class AdminFaqContentController {

	private final String command="/admin_faq_content.ad";
	private String getPage="admin_faq_content";

	@Autowired
	private BoardDao boardDao;

	
	@RequestMapping(value=command,method = RequestMethod.GET)
	public ModelAndView doAction(
			@RequestParam(value="pageNumber")String pageNumber,
			FaqBean faqBean,
			HttpServletRequest request
			) {
		FaqBean detail =boardDao.getFaq(faqBean);
		ModelAndView mav=new ModelAndView();
		mav.addObject("faqBean", detail);
		mav.addObject("pageNumber", pageNumber);
		mav.setViewName(getPage);
		return mav;
	}
		
	
	
}
