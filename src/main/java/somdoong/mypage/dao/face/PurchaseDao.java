package somdoong.mypage.dao.face;

import java.util.List;

import somdoong.mypage.dto.Purchase;
import somdoong.util.PurchasePaging;

public interface PurchaseDao {

	public int selectCntAll(Purchase purchase);

	public List<Purchase> list(PurchasePaging paging);

	public void delete(Purchase purchase);

	public List<Purchase> selectPurchase(Purchase purchase);

	

}
