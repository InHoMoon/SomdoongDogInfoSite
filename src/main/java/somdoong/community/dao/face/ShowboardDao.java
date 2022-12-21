package somdoong.community.dao.face;

import java.util.HashMap;
import java.util.List;

import somdoong.community.dto.SboardFile;
import somdoong.community.dto.SboardLike;
import somdoong.community.dto.Showboard;
import somdoong.community.util.Paging_s;

public interface ShowboardDao {

	//전체 게시글 조회
	public int selectAll();

	//페이징 적용 게시글 조회
	public List<HashMap<String, Object>> selectList(Paging_s paging);

	//게시글 번호 이용하여 첨부파일 정보 조회
	public SboardFile selectFile(Showboard viewboard);

	//게시글 입력
	public void insertBoard(Showboard board);

	//첨부파일 입력
	public void insertFile(SboardFile sboardFile);

	public void upHit(Showboard viewboard);

	//게시글 상세보기
	public Showboard selectBySno(Showboard viewboard);

	public int chkLike(SboardLike sLike);

	public int insertLike(SboardLike sLike);

	public void deleteLike(SboardLike sLike);

	//첨부파일 삭제
	public void deleteFile(Showboard sboard);

	//게시글 정보 수정
	public void updateBoard(Showboard sboard);

	//게시글 삭제
	public void delete(Showboard sboard);



}
