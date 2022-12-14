package somdoong.store.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import somdoong.store.dao.face.StoreDao;
import somdoong.store.dto.ProductImg;
import somdoong.store.dto.Store;
import somdoong.store.service.face.StoreService;

@Service
public class StoreServiceImpl implements StoreService {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired StoreDao storeDao;
	
	@Autowired ServletContext context;
	
	@Override
	public List<Store> getListAll() {
		
		return storeDao.selectAll();
	}
	
	@Override
	public List<Store> getList(String category) {
		logger.info("{}", category);
		
		//카테고리별 게시글 조회
		return storeDao.selectByCategory(category);
	}

	@Override
	public Store view(Store viewStore) {
		
		//조회수 증가
		storeDao.updateHit(viewStore);
		
		//상세보기 조회 결과 리턴
		return storeDao.selectPostByStoreNo(viewStore);
	}

	@Override
	public void write(Store store, MultipartFile file) {
		
		//게시글 처리
		storeDao.insertStore(store);
		
		//첨부파일 처리
		
		//빈 파일일 경우
		if( file.getSize() <= 0) {
			return;
		}
		
		//파일이 저장될 경로
		String storedPath = context.getRealPath("upload");
		File uploadFolder = new File( storedPath );
		if ( !uploadFolder.exists() ) {
			uploadFolder.mkdir();
		}
		
		//파일이 저장될 이름
		String originName = file.getOriginalFilename();
		String storedName = originName + UUID.randomUUID().toString().split("-")[4];
		
		//저장할 파일의 정보 객체
		File dest = new File( uploadFolder, storedName );
		
		try {
			file.transferTo(dest);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		//-------------------------------------
		
		//첨부파일 정보 DB 기록
		ProductImg productImg = new ProductImg();
		productImg.setStoreNo( store.getStoreNo() );
		productImg.setOriginName(originName);
		productImg.setStoredName(storedName);
		
		storeDao.insertImg(productImg);
		
	}

	@Override
	public ProductImg getAttachFile(Store viewStore) {
		return storeDao.selectProductImgByStoreNo(viewStore);
	}

}
