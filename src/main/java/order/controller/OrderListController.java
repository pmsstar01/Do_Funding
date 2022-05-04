package order.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import member.model.MemberBean;

import order.model.OrderBean;
import order.model.OrderDao;
import orderdetail.model.DonationBean;
import utility.Paging;

@Controller
public class OrderListController {

	private final String command = "/order.ord";
	private String getPage = "order_list";

	@Autowired
	private OrderDao orderDao;
	
	@RequestMapping(value=command)
	public String doAction(
			@RequestParam(value="whatColumn", required=false) String whatColumn,
			@RequestParam(value="whatColumn1", required=false) String whatColumn1,
			@RequestParam(value="keyword", required=false) String keyword,
			@RequestParam(value="pageNumber", required=false) String pageNumber,
			@RequestParam(value="msg",required = false)String msg,
			HttpSession session, HttpServletRequest request, Model model) {
		
		MemberBean loginInfo = (MemberBean)session.getAttribute("loginInfo");
		//초기화
		session.removeAttribute("destination");
		if(loginInfo==null) { // 
			session.setAttribute("destination", "redirect:/order.ord");
			return "redirect:/login.mem"; // MemberLoginController
		}
		else if(loginInfo.getAccountbank()==null) { // 
			session.setAttribute("destination", "redirect:/order.ord");
			return "redirect:/memberInfo.mem"; // MemberLoginController
		}
		else { 
			Map<String, String> map=new HashMap<String, String>();
			map.put("whatColumn", whatColumn);
			map.put("whatColumn1", whatColumn1);
			map.put("keyword", "%"+keyword+"%");
			map.put("no", Integer.toString(loginInfo.getNo()));
			
			int totalCount=orderDao.getorderTotalCount(map);
			System.out.println("totalCount:"+totalCount);
			
			String url=request.getContextPath()+command;
			Paging pageInfo=new Paging(pageNumber, "5", totalCount, url, whatColumn,whatColumn1, keyword);
					
			List<OrderBean> orderList=orderDao.getorderList(pageInfo,loginInfo);
			
			model.addAttribute("totalCount",totalCount);
			model.addAttribute("pageInfo",pageInfo);
			model.addAttribute("orderList", orderList);
			if(msg !=null) {
				model.addAttribute("msg",msg);
			}
			return getPage;
		}
	}


}
