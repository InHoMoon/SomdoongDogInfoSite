package somdoong.mypage.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import somdoong.mypage.dao.face.PurchaseDao;
import somdoong.mypage.dto.Purchase;
import somdoong.mypage.service.face.PurchaseService;
import somdoong.util.PurchasePaging;

@Service
public class PurchaseServiceImpl implements PurchaseService {

	@Autowired PurchaseDao purchaseDao;
	@Override
	public PurchasePaging getPaging(int curPage, Purchase purchase) {
		
		int totalCount = purchaseDao.selectCntAll(purchase);
		PurchasePaging paging = new PurchasePaging(totalCount,curPage);
		
		
		return paging;
	}
	
	@Override
	public List<Purchase> list(PurchasePaging paging) {
		return purchaseDao.list(paging);
	}
	
	@Override
	public void delete(Purchase purchase) {
		purchaseDao.delete(purchase);
	}

//	 @Override
//	public List<Purchase> view(Purchase purchase) {
//		return purchaseDao.selectPurchase(purchase);
//	}
}
