package somdoong.mypage.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import somdoong.mypage.dao.face.WishlistDao;
import somdoong.mypage.dto.Wishlist;
import somdoong.mypage.service.face.WishlistService;
import somdoong.util.Paging;
import somdoong.util.WishlistPaging;

@Service
public class WishlistServiceImpl implements WishlistService {

	@Autowired WishlistDao wishlistDao;
	
	@Override
	public WishlistPaging getPaging(int curPage, Wishlist wishlist) {
	
		int totalCount = wishlistDao.selectCntAll(wishlist);
		
		WishlistPaging paging = new WishlistPaging(totalCount, curPage);
		
		return paging;
	}
	
//	@Override
//	public List<Wishlist> list(WishlistPaging paging) {
//		
//		return wishlistDao.selectList(paging);
//	}
	
	@Override
	public void delete(Wishlist wishlist) {
		wishlistDao.delete(wishlist);
		
	}

	@Override
	public List<HashMap<String, Object>> lists(WishlistPaging paging) {
		
		
		return wishlistDao.selectLists(paging);
	}
	
}
