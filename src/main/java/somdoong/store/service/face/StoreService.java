package somdoong.store.service.face;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import somdoong.store.dto.Store;

public interface StoreService {


	/**
	 * 상품목록 전체 조회
	 * 
	 * @return - 조회된 상품 목록 객체
	 */
	public List<Store> getListAll();
	
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

	/**
	 * 게시글 정보, 첨부파일 처리 
	 * 
	 * @param store - 게시글 정보 객체
	 * @param file - 첨부파일 정보 객체
	 */
	public void write(Store store, MultipartFile file);




}
