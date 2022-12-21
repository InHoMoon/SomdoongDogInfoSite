package somdoong.mypage.service.face;

import java.util.HashMap;
import java.util.List;

import somdoong.mypage.dto.Wishlist;
import somdoong.util.WishlistPaging;

public interface WishlistService {

	public WishlistPaging getPaging(int curPage, Wishlist wishlist);

//	public List<Wishlist> list(WishlistPaging paging);

	public void delete(Wishlist wishlist);

	public List<HashMap<String, Object>> lists(WishlistPaging paging);

}
