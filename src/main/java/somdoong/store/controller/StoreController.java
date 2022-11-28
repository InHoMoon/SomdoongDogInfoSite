package somdoong.store.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import somdoong.store.dto.Store;
import somdoong.store.service.face.StoreService;

@Controller
@RequestMapping("/store")
public class StoreController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired StoreService storeService;
	
	@RequestMapping("/list")
	public String Storelist(Model model) {
		logger.info("/store/list");
		
		List<Store> foodList = storeService.getFoodList();
		
//		logger.info("{}", foodList);
		
		model.addAttribute("foodList", foodList);
		
		return "store/list_food";
	}

}