package com.nkt.shop.cart;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CartServiceImpl implements CartService {

	@Autowired
	CartDAO cartDao;
	
	@Override
	public List<CartDTO> cartMoney() {
		return null;
	}

	@Override
	public void insert(CartDTO dto) {
		cartDao.insert(dto);
	}

	@Override
	public List<CartDTO> listCart(String id) {
		return cartDao.listCart(id);
	}

	@Override
	public void delete(int cart_id) {
		cartDao.delete(cart_id);
	}

	@Override
	public void deleteAll(String id) {
		cartDao.deleteAll(id);
	}

	@Override
	public void update(int cart_id) {

	}

	@Override
	public int sumMoney(String id) {
		return cartDao.sumMoney(id);
	}

	@Override
	public int countCart(String id, int product_id) {
		return 0;
	}

	@Override
	public void updateCart(CartDTO dto) {

	}

	@Override
	public void modifyCart(CartDTO dto) {
		cartDao.modifyCart(dto);
	}

}
