package admin.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import javax.servlet.http.HttpServletRequest;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import category.model.CategoryBean;
import category.model.CategoryDao;
import product.model.OptionBean;
import product.model.ProductBean;
import product.model.ProductDao;

@Controller
public class AdminProductUpdateController {

	private final String command ="/admin_prd_update.ad";
	private String getPage ="admin_prd_updateForm";
	private String gotoPage="redirect:/admin_prd_list.ad";

	
	@Autowired
	private ProductDao productDao;
	
	@Autowired
	private CategoryDao categoryDao;
	
	@Autowired
	ServletContext servletContext;
	
	@RequestMapping(value=command, method = RequestMethod.GET)
	public ModelAndView doAction(
			@RequestParam(value="p_num", required = true) String num,
			@RequestParam(value="pageNumber", required = false) String pageNumber
			) {
		//pageNumber
		int p_num=Integer.parseInt(num);
		List<CategoryBean> cateList = categoryDao.categoryAllByProduct();
		List<OptionBean> opList = productDao.optionAllByProduct(p_num);
		ProductBean prdBean = productDao.getupdateProduct(p_num);
		ModelAndView mav = new ModelAndView();
		mav.addObject("cateList", cateList);
		mav.addObject("opList", opList);
		mav.addObject("prdBean", prdBean);	
		mav.addObject("pageNumber", pageNumber);
		mav.setViewName(getPage); 

		return mav;
	}
	
	@RequestMapping(value=command, method=RequestMethod.POST) 
	 public ModelAndView doAction(
			 @RequestParam(value="pageNunber", required = false) String pageNumber,
			 @RequestParam(value="p_image1", required = true) String p_image1,
			 @ModelAttribute("prdBean") ProductBean prdBean,
			 HttpServletRequest request
			 ) {	 
		 ModelAndView mav = new ModelAndView();
		 mav.addObject("pageNumber", pageNumber);
		 List<CategoryBean> cateList = categoryDao.categoryAllByProduct();
		 List<OptionBean> opList = productDao.optionAllByProduct(prdBean.getP_num());
		 prdBean.setP_point(Math.round(prdBean.getP_origin_price()/1000)*10);
		
		 MultipartFile multi = prdBean.getUpload();
		 String fileName = multi.getOriginalFilename();
		 System.out.println("비었나:" + fileName.isEmpty());
		 
		 String uploadPath = servletContext.getRealPath("/resources/images");
		 
		 if(!fileName.isEmpty()) {	//업로드된게 있다면
				uploadPath = servletContext.getRealPath("/resources/images");
				File dir = new File(uploadPath+"\\" + prdBean.getP_image());
				System.out.println("존재하는가" + dir.exists());
				//동일한 이름의 이미지 삭제
				if (dir.exists()) {
					dir.delete();
					System.out.println("삭제했는가 : " + !dir.exists());
				}

				//기존 이미지 삭제
				File beforedir = new File(uploadPath+"\\" + p_image1);
				if (beforedir.exists()) {
					beforedir.delete();
					System.out.println("삭제했는가 : " + !beforedir.exists());
				}
				
				//새로이 받은 이미지 파일 추가하기
				 File f = new File(uploadPath+"\\" + prdBean.getP_image());
				 
				 try {
					multi.transferTo(f);
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}	
		 }else {	//바꾼게 없다면
			 prdBean.setP_image(p_image1);
		 }
		 
		 	 
		 int cnt = productDao.updateProduct(prdBean); 
		 if(cnt > 0) {
			 int item_no=productDao.getP_num();
			 prdBean.setOption_item_no(item_no);
			 
			 productDao.itemOptionDelete(prdBean.getOption_item_no());
			 
			 for (int i = 0; i < prdBean.getItem_option().length; i++) {
				 String itemOptionContent = prdBean.getItem_option()[i];	
				 System.out.println("itemOptionContent:"+itemOptionContent);
				 Map<String, Object> map = new HashMap<String, Object>();
				 map.put("item_option", itemOptionContent);
				 map.put("option_item_no", prdBean.getOption_item_no());
				 productDao.itemOptionInsert(map);
				} 
			 		 	 
			 mav.setViewName(gotoPage);
		 }
		 else {
			 mav.addObject("cateList", cateList);
			 mav.addObject("opList", opList);
			 mav.setViewName(getPage);
		 }
				
		 return mav; 
	 }

}
