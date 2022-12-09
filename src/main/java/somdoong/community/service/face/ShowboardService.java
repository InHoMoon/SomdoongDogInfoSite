package somdoong.community.service.face;

import java.util.HashMap;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import somdoong.community.dto.SboardFile;
import somdoong.community.dto.Showboard;
import somdoong.util.Paging;

public interface ShowboardService {

	public Paging getPaging(int curPage);

	public List<HashMap<String, Object>> list(Paging paging);

	public SboardFile getFile(Showboard viewboard);

	public void write(Showboard board, MultipartFile file);

	public Showboard view(Showboard viewboard);

}
