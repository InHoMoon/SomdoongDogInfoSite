package somdoong.mypage.dao.face;

import java.util.List;

import somdoong.mypage.dto.Cart;

public interface CartDao {

	public int countCart(int product_no, String userid);

	public void insert(Cart cart);

	public void updateCart(Cart cart);

	public List<Cart> listCart(String userid);

	public int sumMoney(String userid);

}
