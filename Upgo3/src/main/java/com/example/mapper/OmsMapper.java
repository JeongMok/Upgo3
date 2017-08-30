package com.example.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import com.example.dto.Member;
import com.example.dto.Product;

public interface OmsMapper {

	Member findByNameAndPhoneNumber(HashMap<String, Object> params);
	ArrayList<Product> productList();
	void orderConfirm(Member member, Product product);
	void insertOrderList(HashMap<String, Object> params);
	void insertOrder(HashMap<String, Object> params);
}
