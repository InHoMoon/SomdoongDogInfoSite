package somdoong.community.dao.face;

import java.util.HashMap;
import java.util.List;

import somdoong.community.dto.SboardFile;
import somdoong.community.dto.Showboard;
import somdoong.util.Paging;

public interface ShowboardDao {

	//전체 게시글 조회
	public int selectAll();

	//페이징 적용 게시글 조회
	public List<HashMap<String, Object>> selectList(Paging paging);

	//게시글 번호 이용하여 첨부파일 정보 조회
	public SboardFile selectFile(Showboard viewboard);

	public void insertBoard(Showboard board);

	public void insertFile(SboardFile sboardFile);

	public void upHit(Showboard viewboard);

	public Showboard selectBySno(Showboard viewboard);

}
