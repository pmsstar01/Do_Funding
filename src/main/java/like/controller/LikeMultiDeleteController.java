package like.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import like.model.LikeDao;
import member.model.MemberBean;


@Controller
public class LikeMultiDeleteController {
	
	private final String command = "like_multidelete.like";
	private String gotoPage = "redirect:/list.like";
	
	@Autowired
	private LikeDao likeDao;
	
	@RequestMapping(command)
	public String doAction(
			@RequestParam(value="pageNumber",required = true) int pageNumber,
			HttpServletRequest request,
			HttpSession session) {
		MemberBean loginInfo=(MemberBean)session.getAttribute("loginInfo");
		//System.out.println(productBean.getRowcheck());
		String[] rowcheck=request.getParameterValues("rowcheck");
		
		likeDao.multiDeleteProduct(rowcheck,loginInfo);   

		return gotoPage + "?pageNumber="+pageNumber;

}
}
