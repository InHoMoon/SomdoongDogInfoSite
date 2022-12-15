package somdoong.community.service.face;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import somdoong.community.dto.RboardFile;
import somdoong.community.dto.RboardLike;
import somdoong.community.dto.Recommendboard;
import somdoong.community.util.Paging_f;

public interface RecommendboardService {

	//게시글 목록 페이징
	public Paging_f getPaging(int curPage);

	//게시글 목록 조회
	public List<Recommendboard> list(Paging_f paging);

	//게시글 상세보기
	public Recommendboard view(Recommendboard rboard);
	
	//해당 유저의 좋아요 여부 확인
	public int findLike(RboardLike rLike);

	//좋아요
	public int insertLike(RboardLike rLike);

	//게시글 작성
	public void write(Recommendboard rboard, MultipartFile file);
//	public void write(Recommendboard rboard, List<MultipartFile> file);

	//게시글 번호를 이용하여 업로드된 파일 정보 조회
	public RboardFile getAttachFile(Recommendboard rboard);

	//파일 번호를 이용하여 업로드된 파일 정보 조회
	public RboardFile getFile(RboardFile rboardfile);

	//검색 게시물 페이징
	public Paging_f getPagingSearchCnt(Paging_f paging);

	//검색 리스트
	public List<Recommendboard> getList(Paging_f paging);

	//게시글 수정
	public void update(Recommendboard rboard, MultipartFile file);

	//게시글 삭제
	public void delete(Recommendboard rboard);


}
