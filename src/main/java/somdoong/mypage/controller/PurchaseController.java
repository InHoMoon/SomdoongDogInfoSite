package somdoong.mypage.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import somdoong.mypage.dto.Purchase;
import somdoong.mypage.service.face.PurchaseService;
import somdoong.util.PurchasePaging;

@Controller
@RequestMapping("/mypage/purchase")
public class PurchaseController {

	private Logger logger = LoggerFactory.getLogger(this.getClass());

	
	@Autowired PurchaseService purchaseService;
	
	@RequestMapping("/list")
	public void list(@RequestParam(defaultValue="0") int curPage ,
			Model model , HttpSession session,Purchase purchase) {
		
		purchase.setUserid ((String) session.getAttribute("userid"));
		
		PurchasePaging paging = purchaseService.getPaging(curPage, purchase);
		logger.debug("{}",paging);
		model.addAttribute("paging", paging);
		
		
		List<Purchase> list= purchaseService.list(paging);
		for (Purchase P : list) logger.debug("{}", P);
		model.addAttribute("list" ,list);
		
		List<Purchase> viewlist = purchaseService.view(purchase);
		logger.debug("조회된 물품",viewlist);
		model.addAttribute("viewlist",viewlist);
		

	}
	
	
	
	@RequestMapping("/delete")
	public String delete(Model model,Purchase purchase) {
		
		
		purchaseService.delete(purchase);
		model.addAttribute("lists",purchase);
		return "redirect:/mypage/purchase/list";
	}
}
