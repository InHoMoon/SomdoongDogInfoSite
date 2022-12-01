package somdoong.store.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import somdoong.store.dto.Store;
import somdoong.store.service.face.StoreService;

@Controller
@RequestMapping("/store")
public class StoreController {

	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired StoreService storeService;

	@RequestMapping("/list")
	public String StoreList(Model model) {
		logger.info("/store/list");

		return "store/list_index";
	}

	@RequestMapping(value = "/list/main", method = RequestMethod.GET)
	public String listMain() {
		return null;
	}

	@RequestMapping("/list/food")
	public String FoodList(@RequestParam("id_check") String category, Model model) {

		logger.info("/store/list/food");

		List<Store> list = storeService.getList(category);

		model.addAttribute("list", list);

		return "store/list_food";
	}

	@RequestMapping("/list/snack")
	public String SnackList(@RequestParam("id_check") String category, Model model) {

		logger.info("/store/list/snack");

		List<Store> list = storeService.getList(category);

		model.addAttribute("list", list);

		return "store/list_snack";
	}

	@RequestMapping("/list/medical")
	public String MedicalList(@RequestParam("id_check") String category, Model model) {

		logger.info("/store/list/medical");

		List<Store> list = storeService.getList(category);

		model.addAttribute("list", list);

		return "store/list_medical";
	}

	@RequestMapping("/list/toy")
	public String ToyList(@RequestParam("id_check") String category, Model model) {

		logger.info("/store/list/toy");

		List<Store> list = storeService.getList(category);

		model.addAttribute("list", list);

		return "store/list_toy";
	}
	
	@RequestMapping(value = "/list/detail", method = RequestMethod.GET)
	public String View(Store viewStore, Model model) {
		
		logger.info("/store/list/detail");
		
		viewStore = storeService.view(viewStore);
		
		logger.info("조회된 게시글 {}", viewStore);
		
		model.addAttribute("viewStore", viewStore);
		
		return "store/list_detail"; 
	}

}