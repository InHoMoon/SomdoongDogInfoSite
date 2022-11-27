package somdoong.store.service.face;

import java.util.List;

import somdoong.store.dto.Store;

public interface StoreService {

	/**
	 * 등록된 상품 목록 가져오기
	 * 
	 * @return - 조회된 상품 목록
	 */
	public List<Store> getFoodList();

}
