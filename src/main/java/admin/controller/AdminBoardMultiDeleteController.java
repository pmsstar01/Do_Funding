package admin.controller;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import board.model.BoardDao;




@Controller
public class AdminBoardMultiDeleteController {

	private final String command = "admin_bd_multidelete.ad";
	private String gotoPage = "redirect:/admin_bd_list.ad";
	
	@Autowired
	private BoardDao boardDao;
	
	@RequestMapping(command)
	public String doAction(
			@RequestParam(value="pageNumber",required = true) int pageNumber,
			HttpServletRequest request) {
		String[] rowcheck=request.getParameterValues("rowcheck");
		
		boardDao.multiDeleteBoard(rowcheck);   

		return gotoPage + "?pageNumber="+pageNumber;

}
}
