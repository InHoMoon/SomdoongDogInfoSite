package somdoong.mypage.service.face;

import java.util.List;

import somdoong.mypage.dto.Cart;

public interface CartService {

	public int countCart(int product_no, String userid);

	/**
	 * 장바구니 추가
	 * 
	 * @param cart
	 */
	public void insert(Cart cart);

	/**
	 * 장바구니 업데이트
	 * 
	 * @param cart
	 */
	public void updateCart(Cart cart);

	public List<Cart> listCart(String userid);

	public int sumMoney(String userid);

}
