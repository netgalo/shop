package com.nkt.shop.product;

import java.util.List;

public interface ProductService {
	List<ProductDTO> listProduct();
	ProductDTO detailProduct(int product_id);
	String fileinfo(int product_id);
	void updateProduct(ProductDTO dto);
	void deleteProduct(int product_id);
	void insertProduct(ProductDTO dto);
}
