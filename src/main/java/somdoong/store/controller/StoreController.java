package somdoong.store.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import somdoong.member.dto.SomDoongMember;
import somdoong.store.dto.OrderProduct;
import somdoong.store.dto.Product;
import somdoong.store.dto.ProductImg;
import somdoong.store.dto.Store;
import somdoong.store.dto.WishList;
import somdoong.store.service.face.StoreService;

@Controller
@RequestMapping("/store")
public class StoreController {

	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired StoreService storeService;
	
	//--------------------------  상품정보 목록  --------------------------

	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public void listMain(Model model) {
		
		List<Store> list = storeService.getListAll();

		logger.debug("{}", list);

		model.addAttribute("list", list);
	}
	
	@RequestMapping("/all")
	public void listAll(Model model) {}
	
	
	@RequestMapping("/product")
	public void productList(Model model) {
		
		List<Product> productList = storeService.getProductList();
		model.addAttribute("productList", productList);
		
		logger.debug("{}", productList);
	}

	@RequestMapping("/food")
	public void foodList(@RequestParam("id_check") String category, Model model) {

		List<Store> list = storeService.getList(category);
		
		logger.debug("{}", list);
		
		model.addAttribute("list", list);
		
		logger.debug("{}", model);

	}

	
	@RequestMapping("/snack")
	public void SnackList(@RequestParam("id_check") String category, Model model) {

		List<Store> list = storeService.getList(category);

		model.addAttribute("list", list);
	}

	
	@RequestMapping("/medical")
	public void MedicalList(@RequestParam("id_check") String category, Model model) {

		List<Store> list = storeService.getList(category);

		model.addAttribute("list", list);
	}

	
	@RequestMapping("/toy")
	public void ToyList(@RequestParam("id_check") String category, Model model) {

		List<Store> list = storeService.getList(category);

		model.addAttribute("list", list);
	}
	
	//--------------------------  상품정보 상세보기  --------------------------
	
	@GetMapping("/product/detail")
	public void ViewProductDetail(Product viewProduct, Model model) {
		
		viewProduct = storeService.viewProduct(viewProduct);
		
		model.addAttribute("viewProduct", viewProduct);
		
		logger.debug("{}", viewProduct);
	}
	
	@GetMapping("/detail")
	public void View(Store viewStore, Model model) {
		
		//게시글 조회
		viewStore = storeService.view(viewStore);
		
		model.addAttribute("viewStore", viewStore);
		
		//첨부파일 모델값 전달
		ProductImg productImg = storeService.getAttachFile(viewStore);
		model.addAttribute("productImg", productImg);
		
		ProductImg profileImg = storeService.getAttachFileByProduct(viewStore);
		model.addAttribute("profileImg", profileImg);
		
		logger.debug("{}", viewStore);
	}
	
	@ResponseBody
	@RequestMapping(value = "/detail", method = RequestMethod.POST)
	public int addWishList(@RequestParam("storeNo")int storeNo, WishList wishList, HttpSession session) throws Exception {	
		
		int result = 0;	
		
		String member = (String)session.getAttribute("userid");
		
		logger.debug("{}", member);
		
		if(member != null) {
			wishList.setStoreNo(storeNo);
			wishList.setUserid(member);
			result = 1;
		}
		
		logger.debug("{}", wishList);
		logger.debug("{}", result);
		
		storeService.addWishList(wishList);
		
		return result;
	}
	
	
	@RequestMapping("/info")
	public void productInfo() {}
	
	//--------------------------  상품정보 추가  --------------------------

	@GetMapping("/product/insert")
	public void insertProduct() {}
	
	
	@PostMapping("/product/insert")
	public String insertProductProcess(Product product, MultipartFile file) {
		
		logger.debug("{}", product);
		logger.debug("{}", file);
		
		storeService.insertProduct(product, file);
		
		return "redirect:/store/product/detail?productNo=" + product.getProductNo();
	}
	
	
	@GetMapping("/write")
	public void Write(Product viewProduct, Model model) {
		
		viewProduct = storeService.viewProduct(viewProduct);

		model.addAttribute("viewProduct", viewProduct);
		
		logger.debug("{}", viewProduct);
	}
	
	
	@PostMapping("/write")
	public String WriteProcess(Store store, MultipartFile file, Model model) {
		
		logger.debug("{}",file);
		logger.debug("{}", store);
		
		storeService.write(store, file);
		
		return "redirect:/store/detail?storeNo=" + store.getStoreNo();
	}
	
	
	//--------------------------  상품정보 수정,삭제  --------------------------
	
	@GetMapping("/product/update")
	public void updateProduct(Product product, Model model) {
		
		product = storeService.viewProduct(product);
		model.addAttribute("updateProduct", product);
		
		logger.debug("{}", product);
	}
	
	
	@PostMapping("/product/update")
	public String updateProductProc(Product product, MultipartFile file) {
		
		logger.debug("{}", product);
		
		storeService.updateProduct(product, file);
	
		return "redirect:/store/product/detail?productNo=" + product.getProductNo();
	}
	
	
	@RequestMapping("/product/delete")
	public String deleteProduct(Product product) {
		
		storeService.deleteProduct(product);
		
		return "redirect:/store/product";
	}
	
	
	@GetMapping("/update")
	public void UpdateStore(Store store, Model model) {
		
		//게시글 조회
		store = storeService.view(store);
		model.addAttribute("viewStore", store);

		//첨부파일 모델값 전달
		ProductImg productImg = storeService.getAttachFile(store);
		model.addAttribute("productImg", productImg);
		
		ProductImg profileImg = storeService.getAttachFileByProduct(store);
		model.addAttribute("profileImg", profileImg);
		
		logger.debug("{}", store);
		logger.debug("{}", productImg);
		logger.debug("{}", profileImg);
		
	}
	
	
	@PostMapping("/update")
	public String updateStoreProc(Store store, MultipartFile file) {
		
		storeService.updateStore(store, file);
		
		logger.debug("{}", store);
		logger.debug("{}", file);
		
		return "redirect:/store/detail?storeNo=" + store.getStoreNo();
	}
	
	@RequestMapping("/delete")
	public String deleteStore(Store store) {
		
		logger.info("{}",store);
		
		storeService.deleteStore(store);
		
		return "redirect:/store/main";
	}
	
	//--------------------------  상품구매, 결제  --------------------------

	@GetMapping("/order/item")
	public void order(	SomDoongMember userid,
						OrderProduct orderQuantity,
						Store store,
						Product viewProduct,
						Model model
					)
	{
		store = storeService.view(store);
		viewProduct = storeService.viewProduct(viewProduct);
		
		model.addAttribute("store", store);
		model.addAttribute("userid", userid);
		model.addAttribute("viewProduct", viewProduct);
		model.addAttribute("orderProduct", orderQuantity);
		
//		logger.info("전달받은 storeNo : {}", store);
//		logger.info("전달받은 userid :{}", userid);
//		logger.info("전달받은 productNo : {}", viewProduct);
//		logger.info("전달받은 orderQuantity {}", orderQuantity);
	}
	
	@PostMapping("/order/item")
	public String orderSuccess(OrderProduct orderProduct, SomDoongMember member, Product product) {
		
		Map<String,Object> map = new HashMap<String,Object>();

		map.put("orderQuantity", orderProduct.getOrderQuantity());
		map.put("productNo", product.getProductNo());
		
		storeService.order(orderProduct);
		
		logger.info("{}", orderProduct.getOrderQuantity());
		logger.info("{}", product.getProductNo());
		
		storeService.updateStock(map);
		
		return "redirect:/store/main";
	}
}