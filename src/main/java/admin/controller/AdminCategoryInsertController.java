package admin.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import category.model.CategoryBean;
import category.model.CategoryDao;

@Controller
public class AdminCategoryInsertController {

	    
	private final String command = "/admin_cate_insert.ad";
	private String getPage = "admin_cate_insertForm";
	private String gotoPage = "redirect:/admin_cate_list.ad";
	
	@Autowired
	private CategoryDao cdao;
		

	@RequestMapping(value=command, method = RequestMethod.GET)
	public String doAction() {			
	     return getPage; 
	}

	@RequestMapping(value=command, method = RequestMethod.POST)
	public ModelAndView doAction(@ModelAttribute("cateBean") @Valid CategoryBean bean,BindingResult result){
		
	ModelAndView mav = new ModelAndView();	
		
	if(result.hasErrors()) {
	  mav.setViewName(getPage);
	  return mav; 
	}	   		
	   int cnt = cdao.insertCategory(bean);
	   System.out.println(cnt);
	   mav.setViewName(gotoPage);
	   return mav; 
	}
}



