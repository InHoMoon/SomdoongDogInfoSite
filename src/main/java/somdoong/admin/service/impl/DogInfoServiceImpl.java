package somdoong.admin.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import somdoong.admin.dao.face.DogInfoDao;
import somdoong.admin.dto.DogInfo;
import somdoong.admin.dto.DogInfoFile;
import somdoong.admin.dto.DoginfoLike;
import somdoong.admin.service.face.DogInfoService;
import somdoong.util.AdminPaging;

@Service
public class DogInfoServiceImpl implements DogInfoService {
	
	@Autowired DogInfoDao doginfoDao;
	
	@Autowired ServletContext context;
	
	@Override
	public AdminPaging getPaging(int curPage) {
		
		//총 게시글 수 조회
		int totalCount = doginfoDao.selectCntAll();
		
		//페이징 계산
		AdminPaging paging = new AdminPaging(totalCount, curPage);

		return paging;
	}
	
	@Override
	public List<DogInfo> list(AdminPaging paging) {
		return doginfoDao.selectList(paging);
	}
	
	@Override
	public DogInfo view(DogInfo viewDogInfo) {
		
		//조회수 증가
		doginfoDao.updateHit(viewDogInfo);
		
		//상세보기 조회 결과 리턴
		return doginfoDao.selectDogInfo(viewDogInfo);
	}

	@Override
	public void write(DogInfo doginfo, MultipartFile file) {
		
		//게시글 처리
		if( "".equals( doginfo.getDtitle() ) ) {
			doginfo.setDtitle("(제목없음)");
		}
		
		doginfoDao.insertDogInfo(doginfo);
		
		//--------------------------------------------
		
		//첨부파일 처리
		
		//빈 파일일 경우
		if( file.getSize() <= 0 ) {
			return;
		}
		
		//파일이 저장될 경로
		String storedPath = context.getRealPath("upload");
		File storedFolder = new File( storedPath );
		if( !storedFolder.exists() ) {
			storedFolder.mkdir();
		}
		
		//파일이 저장될 이름
		String originName = file.getOriginalFilename();
		String storedName = originName + UUID.randomUUID().toString().split("-")[4];
		
		//저장할 파일의 정보 객체
		File dest = new File( storedFolder, storedName );
		
		try {
			file.transferTo(dest);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		//--------------------------------------------
		
		//첨부파일 정보 DB 기록
		DogInfoFile doginfoFile = new DogInfoFile();
		doginfoFile.setDno( doginfo.getDno() );
		doginfoFile.setOriginName(originName);
		doginfoFile.setStoredName(storedName);
		
		doginfoDao.insertFile(doginfoFile);		
		
	}
	
	@Override
	public DogInfoFile getAttachFile(DogInfo viewDogInfo) {
		return doginfoDao.selectDogInfoFileByDno(viewDogInfo);
	}
	
	@Override
	public DogInfoFile getFile(DogInfoFile doginfoFile) {
		return doginfoDao.selectDogInfoFileByFileNo(doginfoFile);
	}
	
	@Override
	public void update(DogInfo doginfo, MultipartFile file) {
		
		//게시글 처리
		if( "".equals( doginfo.getDtitle() ) ) {
			doginfo.setDtitle("(제목없음)");
		}
		
		doginfoDao.updateDogInfo(doginfo);
		
		//--------------------------------------------
		
		//첨부파일 처리
		
		//빈 파일일 경우
		if( file.getSize() <= 0 ) {
			return;
		}
		
		//파일이 저장될 경로
		String storedPath = context.getRealPath("upload");
		File storedFolder = new File( storedPath );
		if( !storedFolder.exists() ) {
			storedFolder.mkdir();
		}
		
		//파일이 저장될 이름
		String originName = file.getOriginalFilename();
		String storedName = originName + UUID.randomUUID().toString().split("-")[4];
		
		//저장할 파일의 정보 객체
		File dest = new File( storedFolder, storedName );
		
		try {
			file.transferTo(dest);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		//--------------------------------------------
		
		//첨부파일 정보 DB 기록
		DogInfoFile doginfoFile = new DogInfoFile();
		doginfoFile.setDno( doginfo.getDno() );
		doginfoFile.setOriginName(originName);
		doginfoFile.setStoredName(storedName);
		
		//기존에 게시글에 연결된 첨부파일을 삭제한다
		doginfoDao.deleteFile(doginfo);
		
		doginfoDao.insertFile(doginfoFile);		
		
	}
	
	@Override
	public void delete(DogInfo doginfo) {
		
		//첨부파일 삭제
		doginfoDao.deleteFile(doginfo);
		
		//게시글 삭제
		doginfoDao.delete(doginfo);
		
	}
	
	
	@Override
	public int findLike(DoginfoLike dLike) {
		return doginfoDao.findLike(dLike);
	}
	
	
	@Override
	public int insertLike(DoginfoLike dLike) {
		int data = doginfoDao.findLike(dLike);
		
		if(data == 0 ) {
			data = doginfoDao.insertLike(dLike);
			return 1;
		} else if(data == 1) {
			doginfoDao.deleteLike(dLike);
			return 0;
		}
		
		return data;
	}
	
}
