package somdoong.store.dao.face;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import somdoong.store.dto.ProductImg;
import somdoong.store.dto.Store;

public interface StoreDao {
	
	/**
	 * 상품목록 전체 조회
	 * 
	 * @return - 조회된 상품목록
	 */
	public List<Store> selectAll();
	
	/**
	 * 카테고리 별 상품 전체 조회
	 * 
	 * @return - 조회된 결과 목록
	 */
	public List<Store> selectByCategory(String category);

	/**
	 * 조회하려는 게시글의 조회수를 1 증가시킨다 
	 * 
	 * @param viewStore - 조회된 게시글 번호
	 */
	public void updateHit(Store viewStore);

	/**
	 * 게시글 번호를 이용하여 게시글 상세 조회 
	 * 
	 * @param viewStore - 조회하려는 게시글 번호
	 * @return 조회된 게시글 정보
	 */
	public Store selectPostByStoreNo(Store viewStore);

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
