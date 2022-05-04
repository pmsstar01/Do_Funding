package board.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import board.model.BoardDao;
import board.model.NoticeBean;
import utility.Paging;

@Controller
public class Notice_ListController {

	private final String command="/notice_list.bd";
	private String getPage="notice_list";

	@Autowired
	private BoardDao boardDao;

	//start.jsp
	@RequestMapping(command)
	public ModelAndView doAction(
			@RequestParam(value="pageNumber",required = false)String pageNumber,
			@RequestParam(value="pageSize",required = false)String pageSize,
			@RequestParam(value="whatColumn",required = false)String whatColumn,
			@RequestParam(value="keyword",required = false)String keyword,
			HttpServletRequest request
			) {
		
		Map<String, String> map=new HashMap<String, String>();
		map.put("whatColumn", whatColumn);
		map.put("keyword", "%"+keyword+"%");

		int totalCount= boardDao.getNoticeCount(map);
		System.out.println("totalCount:"+totalCount);


		String url=request.getContextPath()+command;
		if(pageSize==null) {
			pageSize="10";
		}
		Paging pageInfo=new Paging(pageNumber,pageSize,totalCount,url,whatColumn,keyword);
		List<NoticeBean> noticeList=boardDao.getNotices(pageInfo, map);

		ModelAndView mav=new ModelAndView();
		mav.addObject("noticeList", noticeList);
		mav.addObject("totalCount", totalCount);
		mav.addObject("pageInfo", pageInfo);
		mav.setViewName(getPage);
		return mav;
	}


}
