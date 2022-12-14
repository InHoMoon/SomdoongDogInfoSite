package somdoong.mypage.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import somdoong.mypage.dto.Cart;
import somdoong.mypage.service.face.CartService;

@Controller
@RequestMapping("/mypage/cart")
public class CartController {

	
	@Autowired CartService cartService;
	
	@RequestMapping("/productList")
	public String productList() {
	
		return null;
	}
	
	
	//장바구니 추가
	@RequestMapping("/insert")
	public String insert(@ModelAttribute Cart cart, HttpSession session) {
		String userid =  (String) session.getAttribute("userid");
		cart.setUserid(userid);
		
		int count = cartService.countCart(cart.getProductNo(),userid);
		
		if(count == 0) {
			cartService.insert(cart);
			
		}else {
			cartService.updateCart(cart);
		}
		
		return "redirect:/mypage/cart/list";
	} 
	
	
	@RequestMapping("/list")
	public ModelAndView list(HttpSession session,ModelAndView mav) {
		String userid = (String) session.getAttribute("userid");
		Map<String, Object> map = new HashMap<String, Object>();
		
		//장바구니 정보
		List<Cart> list = cartService.listCart(userid);
		
		//장바구니 전체 금액 호출
		int sumMoney = cartService.sumMoney(userid);
		
		map.put("list", list);
		map.put("count", list.size());
		map.put("sumMoney", sumMoney);
		mav.setViewName("/mypage/cart/list");
		mav.addObject("map", map);
		
		return mav;
		
	}
}
