package admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import product.model.ProductBean;
import product.model.ProductDao;
import utility.Paging;

@Controller
public class AdminProductListController {

	private final String command = "/admin_prd_list.ad";
	private String getPage = "admin_prd_list"; // /WEB-INF/product/productList.jsp
	
	@Autowired
	@Qualifier("myProductDao")
	private ProductDao productDao;
	
	@Autowired
	ServletContext servletContext;	
	
	@RequestMapping(command)
	public ModelAndView doAction(
			@RequestParam(value="whatColumn", required=false) String whatColumn,
			@RequestParam(value="keyword", required=false) String keyword,
			@RequestParam(value="pageNumber", required=false) String pageNumber,
			HttpServletRequest request
			) {
		Map<String, String> map=new HashMap<String, String>();
		map.put("whatColumn", whatColumn);
		map.put("keyword", "%"+keyword+"%");
		
		int totalCount=productDao.totalCount(map);
		System.out.println("totalCount:"+totalCount);
		
		String url=request.getContextPath()+command;
		Paging pageInfo=new Paging(pageNumber, null, totalCount, url, whatColumn, keyword);
	
		  
		List<ProductBean> prdList = productDao.productList(pageInfo, map);
		ModelAndView mav=new ModelAndView();
		mav.addObject("prdList",prdList);
		mav.addObject("totalCount",totalCount);
		mav.addObject("pageInfo",pageInfo);

		mav.setViewName(getPage);
		return mav;		
	}
	


	
	
	
}
