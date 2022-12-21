package somdoong.mypage.service.face;

import java.util.List;

import somdoong.mypage.dto.Purchase;
import somdoong.util.PurchasePaging;

public interface PurchaseService {

	public PurchasePaging getPaging(int curPage, Purchase purchase);

	public List<Purchase> list(PurchasePaging paging);

	public void delete(Purchase purchase);

	public List<Purchase> view(Purchase purchase);



	
	
}
