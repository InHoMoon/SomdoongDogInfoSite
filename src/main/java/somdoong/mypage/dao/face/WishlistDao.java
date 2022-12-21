package somdoong.mypage.dao.face;

import java.util.List;

import somdoong.mypage.dto.Wishlist;
import somdoong.util.WishlistPaging;

public interface WishlistDao {

	public int selectCntAll(Wishlist wishlist);

	public List<Wishlist> selectList(WishlistPaging paging);

}
