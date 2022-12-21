package somdoong.mypage.dao.face;

import java.util.HashMap;
import java.util.List;

import somdoong.mypage.dto.Wishlist;
import somdoong.util.WishlistPaging;

public interface WishlistDao {

	public int selectCntAll(Wishlist wishlist);

//	public List<Wishlist> selectList(WishlistPaging paging);

	public void delete(Wishlist wishlist);

	public List<HashMap<String, Object>> selectLists(WishlistPaging paging);

}
