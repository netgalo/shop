package com.nkt.shop.cart;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CartDAOImpl implements CartDAO {
	
	@Autowired
	SqlSession sqlSession;

	@Override
	public List<CartDTO> cartMoney() {
		return null;
	}

	@Override
	public void insert(CartDTO dto) {
		sqlSession.insert("cart.insert", dto);
	}

	@Override
	public List<CartDTO> listCart(String id) {
		return sqlSession.selectList("cart.listCart", id);
	}

	@Override
	public void delete(int cart_id) {
		sqlSession.delete("cart.delete", cart_id);
	}

	@Override
	public void deleteAll(String id) {
		sqlSession.delete("cart.deleteAll",id);
	}

	@Override
	public void update(int cart_id) {

	}

	@Override
	public int sumMoney(String id) {
		return sqlSession.selectOne("cart.sumMoney", id);
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
		sqlSession.update("cart.modify", dto);
	}

}
