package somdoong.community.service.face;

import java.util.HashMap;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import somdoong.community.dto.SboardComm;
import somdoong.community.dto.SboardFile;
import somdoong.community.dto.SboardLike;
import somdoong.community.dto.Showboard;
import somdoong.util.Paging;

public interface ShowboardService {

	//페이징 생성
	public Paging getPaging(int curPage);

	//페이징 적용된 게시글 조회(첨부파일이랑 같이)
	public List<HashMap<String, Object>> list(Paging paging);

	//게시글번호 이용하여 업로드된 파일정보 조회
	public SboardFile getFile(Showboard viewboard);

	//게시글 정보, 첨부파일 같이
	public void write(Showboard board, MultipartFile file);

	//게시글 상세 조기
	public Showboard view(Showboard viewboard);

	//댓글 작성
	public List<SboardComm> commList(int sno) throws Exception;

	//좋아요 확인
	public int chkLike(SboardLike sLike);

	//좋아요 등록
	public int insertLike(SboardLike sLike);

	//게시글 정보, 첨부파일 수정
	public void update(Showboard sboard, MultipartFile file);

	//게시글 + 첨부파일 삭제
	public void deleteBoard(Showboard sboard);

}
