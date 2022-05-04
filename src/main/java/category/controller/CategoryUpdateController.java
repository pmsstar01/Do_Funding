package category.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import category.model.CategoryBean;
import category.model.CategoryDao;

@Controller
public class CategoryUpdateController {

	private final String command="update.cat";
	private final String getPage="category_update";
	private final String gotoPage="redirect:/list.cat";


	@Autowired
	private CategoryDao cdao;

	@RequestMapping(value=command,method=RequestMethod.GET)
	public String doAction(
			@RequestParam(value="cnum",required=true) int cnum,
			@RequestParam(value="pageNumber",required=true) int pageNumber,
			Model model) {

		CategoryBean bean = cdao.getCategory(cnum);

		model.addAttribute("bean", bean);
		model.addAttribute("pageNumber", pageNumber);

		return getPage;

	}
	
	@RequestMapping(value=command,method=RequestMethod.POST)
	public ModelAndView doAction(
			@RequestParam(value="pageNumber",required=true) int pageNumber,
			@ModelAttribute("category") @Valid CategoryBean category, BindingResult result) {

		ModelAndView mav = new ModelAndView();

		if(result.hasErrors()) {
			mav.addObject("pageNumber",pageNumber);
			mav.setViewName(getPage);
			return mav; 
		}
		
		int cnt = cdao.updateCategory(category);    
		if(cnt > 0) {
			mav.addObject("pageNumber",pageNumber);
			mav.setViewName(gotoPage);
		}
		else {
			mav.addObject("pageNumber",pageNumber);
			mav.setViewName(getPage);

		}
		return mav;

	

	}
}
