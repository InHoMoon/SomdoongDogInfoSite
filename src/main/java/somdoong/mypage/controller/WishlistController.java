package somdoong.mypage.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import somdoong.mypage.dto.Wishlist;
import somdoong.mypage.service.face.WishlistService;
import somdoong.util.WishlistPaging;

@Controller
@RequestMapping("/mypage/wishlist")
public class WishlistController {
	
	@Autowired WishlistService wishlistService;
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@RequestMapping("/list")
	public void list(@RequestParam(defaultValue="0") int curPage
			,Model model , HttpSession session,Wishlist wishlist) {
	
		
		wishlist.setUserid((String) session.getAttribute("userid"));
		
		WishlistPaging paging = wishlistService.getPaging(curPage,wishlist);
		paging.setiUserid((String)session.getAttribute("userid"));
		logger.debug("{}",paging);
		model.addAttribute("paging",paging);
		
		
		
		paging.setiUserid((String) session.getAttribute("userid"));
		
		
		
		
//		List<Wishlist> list = wishlistService.list(paging);
		
		List<HashMap<String,Object>> list = (List<HashMap<String,Object>>) wishlistService.lists(paging);
		
//		for(Wishlist W : list) logger.debug("{}", W);
		model.addAttribute("list", list);
		
		
		
		
	}
	
	@RequestMapping("/delete")
	public String delete(Model model, Wishlist wishlist) {
		
		wishlistService.delete(wishlist);
		model.addAttribute("list",wishlist);
		return "redirect:/mypage/wishlist/list";
		
	}
}
