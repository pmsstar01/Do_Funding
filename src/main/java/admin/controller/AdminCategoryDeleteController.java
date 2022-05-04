package admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import category.model.CategoryDao;

@Controller
public class AdminCategoryDeleteController {

	private final String command = "admin_cate_delete.ad";
	private String gotoPage = "redirect:/admin_cate_list.ad";
	
	@Autowired
	private CategoryDao cdao;
	
	@RequestMapping(command)
	public String doAction(
			@RequestParam(value="cnum",required = true) int cnum,
			@RequestParam(value="pageNumber",required = true) int pageNumber) {
		
		cdao.categoryDelete(cnum);   

		return gotoPage + "?pageNumber="+pageNumber;

	}
}
