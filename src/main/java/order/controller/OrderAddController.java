package order.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import member.model.MemberBean;
import order.cart.MyCartList;
import product.model.ProductBean;

@Controller
public class OrderAddController {

	private final String command="/add.ord"; 
	private final String gotoPage="redirect:/cart_list.ord"; 

	// productDetailView.jsp에서 주문하기 클릭 post
	@RequestMapping(value=command)
	public String doAction(
			ProductBean bean,
			@RequestParam(value = "pageNumber",required = false) String pageNumber,
			HttpSession session) {
		MemberBean loginInfo = (MemberBean)session.getAttribute("loginInfo");

		//초기화
		if(loginInfo==null) { // 
			session.setAttribute("destination", "redirect:/detail.prd?pageNumber="+pageNumber+"&p_num="+bean.getP_num());
			return "redirect:/login.mem"; // MemberLoginController
		}
		else if(loginInfo.getAccountbank()==null) { // 
			session.setAttribute("destination", "redirect:/detail.prd?pageNumber="+pageNumber+"&p_num="+bean.getP_num());
			return "redirect:/memberInfo.mem"; // MemberLoginController
		}
		else {  // 로그인 했으면
			MyCartList mycart = (MyCartList)session.getAttribute("mycart");
			if(mycart == null) {
				mycart = new MyCartList();
			}
			
			mycart.addOrder(bean.getP_num(),bean.getOrderqty(),bean.getOption_no());
			//장바구니
			session.setAttribute("mycart", mycart);
			return gotoPage;
		}
	}
}