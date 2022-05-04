package order.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import member.model.MemberBean;
import orderdetail.model.DonationBean;
import orderdetail.model.OrderDetailDao;
import utility.Paging;

@Controller
public class OrderDonaListController {
	
	private final String command = "/dona.ord";
	private final String getPage = "order_donaList";
	private final String gotoPage="redirect:list.prd";
	
	@Autowired
	private OrderDetailDao orderDetailDao; 
	

	@RequestMapping(value = command)
	public  String doAction(
			@RequestParam(value="whatColumn", required=false) String whatColumn,
			@RequestParam(value="whatColumn1", required=false) String whatColumn1,
			@RequestParam(value="keyword", required=false) String keyword,
			@RequestParam(value="pageNumber", required=false) String pageNumber,
			HttpSession session,HttpServletRequest request,HttpServletResponse response) {
		MemberBean loginInfo = (MemberBean)session.getAttribute("loginInfo");
	
		if(loginInfo == null) {
			request.setAttribute("msg", "로그인 후 이용가능 합니다.");
			request.setAttribute("whatColumn",whatColumn);
			request.setAttribute("whatColumn",whatColumn1);
			request.setAttribute("pageNumber",pageNumber);
			request.setAttribute("keyword", keyword);
			return  gotoPage;
		}//if
		
		
		int totalCount=orderDetailDao.donaTotalCount(loginInfo.getNo());
		System.out.println("totalCount:"+totalCount);
		String url=request.getContextPath()+command;
		Paging pageInfo=new Paging(pageNumber, null, totalCount, url, whatColumn, keyword);
			
		List<DonationBean> donaList = orderDetailDao.getDonaList(pageInfo,loginInfo.getNo());
	
		request.setAttribute("donaList",donaList);
		request.setAttribute("totalCount",totalCount);
		request.setAttribute("pageInfo",pageInfo);
	
		return getPage;
	}	
}
