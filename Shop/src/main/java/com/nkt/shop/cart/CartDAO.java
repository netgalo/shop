package com.nkt.shop.cart;

import java.util.List;

public interface CartDAO {
	List<CartDTO> cartMoney();
	void insert(CartDTO dto);	// 장바구니 추가
	List<CartDTO> listCart(String id);	// 장바구니 목록
	void delete(int cart_id);	// 장바구니 개별삭제
	void deleteAll(String id);	// 장바구니 비우기
	void update(int cart_id);
	int sumMoney(String id);	//장바구니 금액 합계
	int countCart(String id, int product_id);	//장바구니 상품 갯수
	void updateCart(CartDTO dto);
	void modifyCart(CartDTO dto);
}
