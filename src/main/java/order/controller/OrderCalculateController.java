package order.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import member.model.MemberBean;
import member.model.MemberDao;

import order.cart.MyCartList;

import order.model.OrderDao;
import orderdetail.model.DonationBean;
import orderdetail.model.OrderDetailBean;
import orderdetail.model.OrderDetailDao;
import product.model.ProductBean;
import product.model.ProductDao;

@Controller
public class OrderCalculateController {
	private final String command = "/calculate.ord";
	
	private String getPage = "redirect:/cart_list.ord";
	private String gotoPage = "redirect:/order.ord";
	
	@Autowired
	private ProductDao productDao;
	
	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	@Qualifier("myOrderDao")
	private OrderDao orderDao;
	
	@Autowired
	private OrderDetailDao orderDetailDao; 

	//mallList.jsp(주문 내역보기) 결제하기 클릭
	@RequestMapping(command)
	public String doAction(
			MemberBean memBean,	//연락처 hp1,hp2,hp3, 배송지 주소 address1,address2
			@RequestParam(value="del_request",required = false) String del_request,
			@RequestParam(value="order_request",required = false) String order_request,
			@RequestParam(value="amount",required = false) String amount,
			HttpSession session) {	
		MemberBean loginInfo = (MemberBean)session.getAttribute("loginInfo");
		MyCartList mycart = (MyCartList)session.getAttribute("mycart");
		if(mycart==null) {
			return getPage;
		}
		List<int[]> orderlists = mycart.getAllOrderLists();
		// key(상품번호), value(주문수량) , 옵션 번호
			
		//회원번호,주문일자,상품이름?
		orderDao.insertOrder(loginInfo.getNo());	//order번호 생성용
		
		//orders 테이블에서 가장 큰 oid값 가져와서 
		//orderdetails의 oid에 넣기	주문 뭉태기를 찾기 위해서
		int maxOnum = orderDao.getMaxO_num(); 
		//System.out.println("maxOnum:" + maxOnum);
				
		double point=0;//후원금
		for(int[] info : orderlists) {
			int p_num = info[0];	//상품번호
			int o_qty = info[1];	//상품수량
			int option_no = info[2];	//선택된 옵션번호

			ProductBean pb = productDao.getProduct(p_num);
			//상품 진행상황 금액 추가
			pb.setP_total_price(o_qty*pb.getP_origin_price());
			productDao.updateTotal_price(pb);
			
			//주문상세 작성
			OrderDetailBean odBean=new OrderDetailBean();
			odBean.setOd_o_num(maxOnum);	//주문뭉태기요 번호
			odBean.setOd_p_num(p_num);		//상품번호
			odBean.setOd_option_no(option_no);//선택된 상품옵션번호
			odBean.setOd_qty(o_qty);		//주문수량
			orderDetailDao.insertOrderDetail(odBean);
			
			//30% 후원금 누적
			point += o_qty*pb.getP_origin_price()*0.3;
			DonationBean doBean=new DonationBean();
			doBean.setDona_o_num(maxOnum);
			doBean.setDona_no(loginInfo.getNo());
			doBean.setDona_money((int)Math.round(o_qty*pb.getP_origin_price()*0.3));
			doBean.setdona_buyprice(o_qty*pb.getP_origin_price());
			orderDetailDao.insertDonation(doBean);
		}
		int mpoint= (int) Math.round(point);
		// 회원 mpoint 후원금 총액 누적
		memberDao.mpointUpdate(loginInfo.getNo(),mpoint);
		session.removeAttribute("mycart");
		session.removeAttribute("shopLists");
		session.removeAttribute("totalAmount");
		String msg="결제가 완료되었습니다.";
		try {
			msg = URLEncoder.encode(msg, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String msgGotoPage=gotoPage+"?msg="+msg;
		return msgGotoPage;
	}
	
}