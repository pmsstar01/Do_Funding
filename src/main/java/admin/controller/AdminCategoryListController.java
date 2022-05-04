package admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import category.model.CategoryBean;
import category.model.CategoryDao;
import utility.Paging;

@Controller
public class AdminCategoryListController {

	private final String command = "/admin_cate_list.ad";
	private String getPage = "admin_cate_list"; 

	@Autowired
	private CategoryDao cdao;

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

		int totalCount=cdao.totalCount(map);
		System.out.println("totalCount:"+totalCount);

		String url=request.getContextPath()+command;
		Paging pageInfo=new Paging(pageNumber, "5", totalCount, url, whatColumn, keyword);

		List<CategoryBean> cateList = cdao.categoryAll(pageInfo, map);

		ModelAndView mav=new ModelAndView();
		mav.addObject("cateList",cateList);
		mav.addObject("totalCount",totalCount);
		mav.addObject("pageInfo",pageInfo);

		mav.setViewName(getPage);
		return mav;		
	}
}
