package admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import board.model.BoardBean;
import board.model.BoardDao;

@Controller
public class AdminBoardContentController {

	private final String command="/admin_bd_content.ad";
	private String getPage="admin_bd_content";

	@Autowired
	private BoardDao boardDao;

	
	@RequestMapping(value=command,method = RequestMethod.GET)
	public ModelAndView doAction(
			@RequestParam(value="pageNumber")String pageNumber,
			BoardBean boardBean
			) {
		BoardBean bdBean =boardDao.oneSelect(boardBean);
		System.out.println("B_writer"+bdBean.getB_writer());
		ModelAndView mav=new ModelAndView();
		mav.addObject("bdBean", bdBean);
		mav.addObject("pageNumber", pageNumber);
		mav.setViewName(getPage);
		return mav;
	}
		
	
	
}
