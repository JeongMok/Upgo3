package com.example.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.example.dto.Product;
import com.example.mapper.ProductMapper;

@Repository
public class ProductDao {
	
	@Autowired
	@Qualifier("productMapper")
	ProductMapper productMapper;
	
	public List<Product> selectProduct() {
		List<Product> product = productMapper.selectProduct();
		return product;
	}

	public Product selectProductByCode(Product product) {
		Product data = productMapper.selectProductByCode(product);
		return data;
	}

	public int codeByAmount(String code) {
		int sum = productMapper.codeByAmount(code);
		return sum;
	}
}
