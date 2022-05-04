package like.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import like.model.LikeDao;
import member.model.MemberBean;
import product.model.ProductBean;
import utility.Paging;

@Controller
public class LikeListcontroller {
	
	private final String command="/list.like";
	private String getPage="like_list";
	
	@Autowired
	private LikeDao likeDao;
	
	
	@RequestMapping(command)
	public ModelAndView doAction(
			@RequestParam(value="whatColumn", required=false) String whatColumn,
			@RequestParam(value="keyword", required=false) String keyword,
			@RequestParam(value="pageNumber", required=false) String pageNumber,
			HttpServletRequest request,
			HttpSession session) {
		MemberBean loginInfo=(MemberBean)session.getAttribute("loginInfo");
		Map<String, String> map=new HashMap<String, String>();
		map.put("whatColumn", whatColumn);
		map.put("keyword", "%"+keyword+"%");
		
		int totalCount=likeDao.totalCount(map);
		System.out.println("totalCount:"+totalCount);
		
		String url=request.getContextPath()+command;
		Paging pageInfo=new Paging(pageNumber, "10", totalCount, url, whatColumn, keyword);
	
		map.put("no", Integer.toString(loginInfo.getNo()));
		List<ProductBean> prdlist=likeDao.getLikeList(pageInfo,map);
				
		ModelAndView mav = new ModelAndView();
		mav.addObject("prdlist",prdlist);
		mav.addObject("totalCount",totalCount);
		mav.addObject("pageInfo",pageInfo);
		mav.setViewName(getPage);
		
		return mav;
	}

}
