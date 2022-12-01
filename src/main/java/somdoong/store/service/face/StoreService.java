package somdoong.store.service.face;

import java.util.List;

import somdoong.store.dto.Store;

public interface StoreService {

	/**
	 * 등록된 상품 목록 가져오기
	 * 
	 * @return - 조회된 상품 목록
	 */
	public List<Store> getList(String category);

	/**
	 * 게시글 상세보기 
	 * 
	 * @param viewStore - 상세 조회할 게시글 번호 객체
	 * @return 조회된 상세 게시글 객체 
	 * 
	 */
	public Store view(Store viewStore);



}
