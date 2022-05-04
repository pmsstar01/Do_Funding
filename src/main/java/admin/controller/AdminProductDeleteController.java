package admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import product.model.ProductDao;

@Controller
public class AdminProductDeleteController {

	private final String command = "admin_prd_delete.ad";
	private String gotoPage = "redirect:/admin_prd_list.ad";
	
	@Autowired
	private ProductDao productDao;
	
	@RequestMapping(command)
	public String doAction(
			@RequestParam(value="p_num",required = true) int p_num,
			@RequestParam(value="pageNumber",required = true) int pageNumber) {
		
		productDao.productDelete(p_num);   

		return gotoPage + "?pageNumber="+pageNumber;

	}
}
