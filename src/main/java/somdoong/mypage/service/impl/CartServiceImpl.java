package somdoong.mypage.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import somdoong.mypage.dao.face.CartDao;
import somdoong.mypage.dto.Cart;
import somdoong.mypage.service.face.CartService;

@Service
public class CartServiceImpl implements CartService {

	@Autowired CartDao cartDao;
	
	@Override
	public int countCart(int product_no, String userid) {
		
			
		return cartDao.countCart(product_no,userid);
	}
	
	@Override
	public void insert(Cart cart) {
		cartDao.insert(cart);
		
	}
	
	@Override
	public void updateCart(Cart cart) {
		cartDao.updateCart(cart);
		
	}
	
	@Override
	public List<Cart> listCart(String userid) {
		
		return cartDao.listCart(userid);
	}
	
	
	@Override
	public int sumMoney(String userid) {
		
		return cartDao.sumMoney(userid);
	}
	
}
