package category.controller;

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
public class CategoryInsertController {
	private final String command = "/insert.cat";
	private String getPage = "cart_input";
	private String gotoPage = "redirect:/list.cat";

	@Autowired
	private CategoryDao cdao;

	@RequestMapping(value=command, method = RequestMethod.GET)
	public String doAction() {

		return getPage; 
	}

	@RequestMapping(value=command, method = RequestMethod.POST)
	public ModelAndView doAction(@ModelAttribute("category") @Valid CategoryBean bean,BindingResult result){

		ModelAndView mav = new ModelAndView();	

		if(result.hasErrors()) {
			mav.setViewName(getPage);
			return mav; 
		}

		cdao.insertCategory(bean);   

		mav.setViewName(gotoPage);
		return mav;
	}


}



