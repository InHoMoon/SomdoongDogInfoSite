package somdoong.store.service.face;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import somdoong.store.dto.Product;
import somdoong.store.dto.ProductImg;
import somdoong.store.dto.Store;

public interface StoreService {


	/**
	 * 상품목록 전체 조회
	 * 
	 * @return - 조회된 상품 목록 객체
	 */
	public List<Store> getListAll();
	
	/**
	 * 등록된 상품 게시글 목록 가져오기
	 * 
	 * @return - 조회된 상품 게시글 목록
	 */
	public List<Store> getList(String category);

	/**
	 * 상품 정보 목록 가져오기 
	 * 
	 * @return - 조회된 상품 목록
	 */
	public List<Product> getProductList();
	/**
	 * 게시글 상세보기 
	 * 
	 * @param viewStore - 상세 조회할 게시글 번호 객체
	 * @return 조회된 상세 게시글 객체 
	 * 
	 */
	public Store view(Store viewStore);

	/**
	 * 상품 정보 추가, 첨부파일 처리
	 * 
	 * @param product - 상품 정보 객체
	 */
	public void insertProduct(Product product, MultipartFile file);
	
	/**
	 * 게시글 생성, 첨부파일 처리 
	 * 
	 * @param store - 게시글 정보 객체
	 * @param file - 첨부파일 정보 객체
	 */
	public void write(Store store, MultipartFile file);
	
	/**
	 * 게시글 번호를 이용하여 업로드된 파일 정보 조회
	 * 
	 * @param viewStore - 조회할 게시글 번호 객체
	 * @return 첨부 파일 정보
	 */
	public ProductImg getAttachFile(Store viewStore);



}
