package product.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import like.model.LikeBean;
import like.model.LikeDao;
import member.model.MemberBean;
import product.model.OptionBean;
import product.model.ProductBean;
import product.model.ProductDao;

@Controller
public class productDetailController {

	private final String command = "/detail.prd";
	private String getPage = "product_detailView"; 
	
	@Autowired
	@Qualifier("myProductDao")
	private ProductDao productDao;	
		
	@Autowired	
	@Qualifier("myLikeDao")
	private LikeDao likeDao; 

	@RequestMapping(value = command ,method = RequestMethod.GET)
	public String doAction(
			@RequestParam(value = "p_num",required = true) int p_num,
			@RequestParam(value = "pageNumber",required = false) String pageNumber,
			@RequestParam(value = "whatColumn",required = false) String whatColumn,
			@RequestParam(value="keyword", required=false) String keyword,
			@RequestParam(value = "whatColumn1",required = false) String whatColumn1,
			Model model,HttpSession session) {
			MemberBean loginInfo=(MemberBean)session.getAttribute("loginInfo");
			int like_check = 0; //찜하기 용
			
			if(loginInfo != null) { //로그인한 상태라면
				LikeBean likeBean = new LikeBean();
				likeBean.setM_no(loginInfo.getNo());
				likeBean.setLp_num(p_num);
			
				like_check = likeDao.checkLike(likeBean);
			
				if(like_check == -1) {
					like_check = 0;
				}
			}
		
		ProductBean p_product = productDao.getProduct(p_num);	
		List<OptionBean> o_list = productDao.optionAllByProduct(p_num);
		
		model.addAttribute("optionList", o_list);
		model.addAttribute("productBean", p_product);
		model.addAttribute("pageNumber", pageNumber);
		model.addAttribute("whatColumn", whatColumn);
		model.addAttribute("whatColumn1", whatColumn1);
		model.addAttribute("keyword", keyword);
		model.addAttribute("like_check", like_check);
		return getPage;
	}
	
	//좋아요 용
	@RequestMapping(value = command ,method = RequestMethod.POST)
	public String doAction(
			@RequestParam(value = "p_num",required = true) int p_num,
			@RequestParam(value = "pageNumber",required = false) String pageNumber,
			@RequestParam(value = "whatColumn",required = false) String whatColumn,
			@RequestParam(value = "whatColumn1",required = false) String whatColumn1,
			@RequestParam(value="keyword", required=false) String keyword,
			@RequestParam(value = "like_check",required = false) String like_check,
			Model model,HttpSession session) {
		MemberBean loginInfo=(MemberBean)session.getAttribute("loginInfo");

		int check = 0;
		LikeBean likeBean = new LikeBean();
		likeBean.setM_no(loginInfo.getNo());
		likeBean.setLp_num(p_num);
		//int cnt = 0;

		check = likeDao.checkLike(likeBean);	
		if(check == -1) {//만약 좋아요가 처음이라면 좋아요 테이블에 만들어주기
			likeDao.insertLike(likeBean); //1
			check=1;
		}
		else {//상품에 대한 불특정 회원의 좋아요 데이터가 있다면 불러와라
			likeBean.setL_check(Integer.parseInt(like_check));
			check = likeDao.updateLike(likeBean);
		}
		//조회수 증가x
		ProductBean p_product = productDao.getupdateProduct(p_num);
		List<OptionBean> o_list = productDao.optionAllByProduct(p_num);
		 
		model.addAttribute("optionList", o_list);
		model.addAttribute("productBean", p_product);
		model.addAttribute("pageNumber", pageNumber);
		model.addAttribute("whatColumn", whatColumn);
		model.addAttribute("whatColumn1", whatColumn1);
		model.addAttribute("keyword", keyword);
		model.addAttribute("like_check", check);
		
		return getPage;
	}
}
