package admin.controller;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import category.model.CategoryDao;



@Controller
public class AdminCategoryMultiDeleteController {

	private final String command = "admin_cate_multidelete.ad";
	private String gotoPage = "redirect:/admin_cate_list.ad";
	
	@Autowired
	private CategoryDao categoryDao;
	
	@RequestMapping(command)
	public String doAction(
			@RequestParam(value="pageNumber",required = true) int pageNumber,
			HttpServletRequest request) {
		//System.out.println(productBean.getRowcheck());
		String[] rowcheck=request.getParameterValues("rowcheck");
		
		System.out.println("1111");

		categoryDao.multiDeleteCategory(rowcheck);   
		System.out.println("3333");

		return gotoPage + "?pageNumber="+pageNumber;

}
}
