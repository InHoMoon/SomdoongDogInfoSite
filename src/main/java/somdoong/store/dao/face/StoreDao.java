package somdoong.store.dao.face;

import java.util.List;

import somdoong.store.dto.Store;

public interface StoreDao {

	/**
	 * 등록된 상품 목록 전체 조회
	 * 
	 * @return - 조회된 결과 목록
	 */
	public List<Store> selectFood();

}
