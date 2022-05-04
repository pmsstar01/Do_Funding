package admin.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import category.model.CategoryBean;
import category.model.CategoryDao;
import product.model.ProductBean;
import product.model.ProductDao;

@Controller
public class AdminProductInsertController {

	private final String command = "/admin_prd_insert.ad";
	private String getPage = "admin_prd_InsertForm";
	private String gotoPage="redirect:/admin_prd_list.ad";

	
	@Autowired
	private ProductDao productDao;
	
	@Autowired
	private CategoryDao categoryDao;
	
	@Autowired
	ServletContext servletContext;
	
	@RequestMapping(value=command, method = RequestMethod.GET)
	public ModelAndView doAction() {
		List<CategoryBean> cateList = categoryDao.categoryAllByProduct();
		ModelAndView mav = new ModelAndView();
		mav.addObject("cateList", cateList);
		mav.setViewName(getPage); 
		return mav;
	}
	
	@RequestMapping(value=command, method=RequestMethod.POST) 
	 public ModelAndView doAction(
			 @ModelAttribute("prdBean") ProductBean prdBean
			) {	 
		 ModelAndView mav = new ModelAndView();
		 
		 prdBean.setP_point(Math.round(prdBean.getP_origin_price()/1000)*10);
		 int cnt = productDao.insertProduct(prdBean); 

		 if(cnt > 0) {
			
			 int item_no=productDao.getP_num();
			 System.out.println("item_no:"+item_no);
			 prdBean.setOption_item_no(item_no);
			 for (int i = 0; i < prdBean.getItem_option().length; i++) {
				 String itemOptionContent = prdBean.getItem_option()[i];	
				 System.out.println("itemOptionContent:"+itemOptionContent);
				 Map<String, Object> map = new HashMap<String, Object>();
				 map.put("item_option", itemOptionContent);
				 map.put("option_item_no", prdBean.getOption_item_no());
				 productDao.itemOptionInsert(map);
				} 
			 
			
			 String uploadPath = servletContext.getRealPath("/resources/images");
			 MultipartFile multi = prdBean.getUpload();
			 File f = new File(uploadPath+"\\" + prdBean.getP_image());
			 
			 try {
				multi.transferTo(f);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			 
			 mav.setViewName(gotoPage);
		 }
		 else {
			 mav.setViewName(getPage);
		 }
				
		 return mav; 
	 }

}
