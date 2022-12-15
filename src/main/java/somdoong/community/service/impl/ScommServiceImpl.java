package somdoong.community.service.impl;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import somdoong.community.dao.face.ScommDao;
import somdoong.community.dto.SboardComm;
import somdoong.community.service.face.ScommService;

@Service
public class ScommServiceImpl implements ScommService {
	
	@Autowired ScommDao scommDao;

	@Override
	public List<SboardComm> list(int sno, HttpSession session) {
		
		List<SboardComm> list = scommDao.list(sno);
		
        // 세션에서 현재 사용자 id값 저장
        String userid = (String) session.getAttribute("userid");
        
        return list; 
	}

	@Override
	public void write(SboardComm comm) {
		scommDao.write(comm);
	}

	@Override
	public SboardComm replySelect(SboardComm comm) throws Exception {
		return scommDao.replySelect(comm);
	}

}
