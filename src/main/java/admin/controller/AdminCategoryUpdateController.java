package admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import category.model.CategoryBean;
import category.model.CategoryDao;

@Controller
public class AdminCategoryUpdateController {

	    
	private final String command = "/admin_cate_update.ad";
	private String getPage = "admin_cate_updateForm";
	private String gotoPage = "redirect:/admin_cate_list.ad";
	
	@Autowired
	private CategoryDao cdao;
		
	@RequestMapping(value=command, method = RequestMethod.GET)
	public ModelAndView doAction(
			@RequestParam("cnum") String cnum,
			@RequestParam(value="pageNumber", required = false) String pageNumber
			) {	
			System.out.println("22222");
		 CategoryBean cateBean = cdao.getCategory(Integer.parseInt(cnum)); 
		 ModelAndView mav = new ModelAndView();
		 mav.addObject("cateBean", cateBean);
		 mav.addObject("pageNumber", pageNumber);
		 mav.setViewName(getPage);
	     return mav;
	}

	@RequestMapping(value=command, method = RequestMethod.POST)
	public ModelAndView doAction(
			@RequestParam(value="pageNumber", required = false) int pageNumber,			
			CategoryBean bean){
		System.out.println("11111");
		ModelAndView mav = new ModelAndView();	
			
				
	   int cnt = cdao.updateCategory(bean);
	   System.out.println("update cnt:"+cnt);
	   
	   mav.addObject("pageNumber", pageNumber);
	   mav.setViewName(gotoPage);
	   return mav; 
		}
	}



