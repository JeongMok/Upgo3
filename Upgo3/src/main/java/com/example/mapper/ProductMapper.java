package com.example.mapper;

import java.util.List;

import com.example.dto.Product;

public interface ProductMapper {
	
	List<Product> selectProduct();

	Product selectProductByCode(Product product);

}
