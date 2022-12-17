package somdoong.store.dao.face;

import java.util.List;

import somdoong.store.dto.Product;
import somdoong.store.dto.ProductImg;
import somdoong.store.dto.Store;

public interface StoreDao {
	
	/**
	 * 상품 게시글 목록 전체 조회
	 * 
	 * @return - 조회된 상품 게시글 목록
	 */
	public List<Store> selectAll();
	
	/**
	 * 상품정보 목록 전체 조회 
	 * 
	 * @return - 조회된 상품정보 목록
	 */
	public List<Product> selectAllProduct();
	/**
	 * 카테고리 별 상품 전체 조회
	 * 
	 * @return - 조회된 결과 목록
	 */
	public List<Store> selectByCategory(String category);

	/**
	 * 게시글 번호를 이용하여 게시글 상세 조회 
	 * 
	 * @param viewStore - 조회하려는 게시글 번호
	 * @return 조회된 게시글 정보
	 */
	public Store selectPostByStoreNo(Store viewStore);

	/**
	 * 상품 정보 삽임
	 * 
	 * @param product - 삽입할 상품 정보
	 */
	public void insertProduct(Product product);
	
	/**
	 * 게시글 정보 삽입
	 * 
	 * @param store - 삽입할 게시글 정보
	 */
	public void insertStore(Store store);

	/**
	 * 첨부이미지 정보를 삽입
	 * 
	 * @param productImg
	 */
	public void insertImg(ProductImg productImg);

	/**
	 * 게시글 번호를 이용하여 첨부파일 정보를 조회
	 * 
	 * @param viewStore - 조회할 게시글 번호
	 * @return 조회된 첨부파일 정보
	 */
	public ProductImg selectProductImgByStoreNo(Store viewStore);



}
