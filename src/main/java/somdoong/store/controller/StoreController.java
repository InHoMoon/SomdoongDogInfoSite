package somdoong.store.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import somdoong.store.dto.ProductImg;
import somdoong.store.dto.Store;
import somdoong.store.service.face.StoreService;

@Controller
@RequestMapping("/store")
public class StoreController {

	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired StoreService storeService;
	
	//--------------------------  상품정보 목록  --------------------------

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String listMain() {
		
		return "store/list_main";
	}
	
	@RequestMapping("/list/index")
	public String StoreList(Model model) {

		return "store/list_index";
	}

	
	@RequestMapping("/list/all")
	public String ListAll(Model model) {

		List<Store> list = storeService.getListAll();

		logger.info("{}", list);

		model.addAttribute("list", list);

		return "store/list_all";
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

		List<Store> list = storeService.getList(category);

		model.addAttribute("list", list);

		return "store/list_snack";
	}

	@RequestMapping("/list/medical")
	public String MedicalList(@RequestParam("id_check") String category, Model model) {

		List<Store> list = storeService.getList(category);

		model.addAttribute("list", list);

		return "store/list_medical";
	}

	@RequestMapping("/list/toy")
	public String ToyList(@RequestParam("id_check") String category, Model model) {

		List<Store> list = storeService.getList(category);

		model.addAttribute("list", list);

		return "store/list_toy";
	}
	
	//--------------------------  상품정보 상세보기  --------------------------
	
	@RequestMapping(value = "/list/detail", method = RequestMethod.GET)
	public String View(Store viewStore, Model model) {
		
		//게시글 조회
		viewStore = storeService.view(viewStore);
		
		logger.info("조회된 게시글 {}", viewStore);
		
		model.addAttribute("viewStore", viewStore);
		
		//첨부파일 모델값 전달
		ProductImg productImg = storeService.getAttachFile(viewStore);
		model.addAttribute("productImg", productImg);
		
		return "store/list_detail"; 
	}
	
	@RequestMapping("/product/info")
	public String productInfo() {
		
		return "store/product_info";
	}
	
	@RequestMapping("/product/review")
	public String productReview() {
		
		return "store/product_review";
	}

	//--------------------------  상품정보 추가  --------------------------

	@GetMapping("/list/write")
	public String Write() {
		return "store/store_write";
	}
	
	@PostMapping("/list/write")
	public String WriteProcess(Store store, MultipartFile file, HttpSession session) {
		
		storeService.write(store, file);
		
		logger.info("{}", store);
		logger.info("{}", file);
		
		return "redirect:/store/list/detail?storeNo=" + store.getStoreNo();
	}
	
}