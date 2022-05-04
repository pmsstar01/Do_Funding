package admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import order.cart.ShoppingInfo;
import orderdetail.model.CompositeDao;

@Controller
public class AdminOrderDetailController {
	private final String command = "/admin_ord_detail.ad";
	private final String getPage = "admin_ord_detail";

	@Autowired
	private CompositeDao CompositeDao;
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	public ModelAndView doAction(
			@RequestParam("o_num") int o_num,
			@RequestParam(value="pageNumber", required=false) String pageNumber
			) { 
		ModelAndView mav = new ModelAndView();
		List<ShoppingInfo> detailList = CompositeDao.detailList(o_num);
		System.out.println("detailList:"+detailList.size());
		mav.addObject("detailList", detailList);
		mav.addObject("o_num", o_num);
		mav.addObject("pageNumber", pageNumber);
		mav.setViewName(getPage);
		return mav;
	}

}
