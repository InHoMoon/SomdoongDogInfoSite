package somdoong.store.dao.face;

import java.util.List;

import somdoong.store.dto.Product;
import somdoong.store.dto.ProductImg;
import somdoong.store.dto.Store;
import somdoong.store.dto.WishList;

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
	 * 상품 번호를 이용하여 상품 상세 조회
	 * 
	 * @param viewProduct - 조회하려는 상품 번호
	 * @return 조회된 상품 정보
	 */
	public Product selectProductByProductNo(Product viewProduct);
	
	/**
	 * 게시글 번호를 이용하여 게시글 상세 조회 
	 * 
	 * @param viewStore - 조회하려는 게시글 번호
	 * @return 조회된 게시글 정보
	 */
	public Store selectPostByStoreNo(Store viewStore);

	/**
	 * 상품 정보 삽입
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
	 * 상품 번호를 이용하여 첨부파일 정보를 조회
	 * 
	 * @param viewStore - 조회할 상품 번호
	 * @return 조회된 첨부파일 정보
	 */
	public ProductImg selectProductImgByProductNo(Store viewStore);
	
	/**
	 * 게시글 번호를 이용하여 첨부파일 정보를 조회
//	 * 
	 * @param viewStore - 조회할 게시글 번호
	 * @return 조회된 첨부파일 정보
	 */
	public ProductImg selectProductImgByStoreNo(Store viewStore);

	/**
	 * 관심 상품 추가
	 * 
	 * @param wishList - 관심상품 정보
	 */
	public void addWishList(WishList wishList);

	/**
	 * 상품 정보 수정
	 * 
	 * @param product - 수정할 상품 정보
	 */
	public void updateProduct(Product product);

	/**
	 * 상품 이미지 삭제 
	 * 
	 * @param product - 이미지를 삭제할 상품 번호
	 */
	public void deleteProductImg(Product product);

	/**
	 * 상품 정보 삭제
	 * 
	 * @param product - 삭제할 상품 정보
	 */
	public void deleteProduct(Product product);

	/**
	 * 상품 게시글 정보 수정 
	 * 
	 * @param store - 수정할 상품 게시글 정보
	 */
	public void updateStore(Store store);

	/**
	 * 상품 게시글 이미지 삭제 
	 * 
	 * @param store - 이미지를 삭제할 상품 게시글 번호
	 */
	public void deleteStoreImg(Store store);

	/**
	 * 상품 게시글 정보 삭제
	 * 
	 * @param store - 삭제할 상품 정보
	 */
	public void deleteStore(Store store);	

}
