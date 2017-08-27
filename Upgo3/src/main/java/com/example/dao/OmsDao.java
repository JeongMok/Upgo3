package com.example.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.example.dto.Member;
import com.example.dto.Product;
import com.example.mapper.OmsMapper;

@Repository
public class OmsDao {

	@Autowired
	@Qualifier("omsMapper")
	private OmsMapper omsMapper;

	public Member findByNameAndPhoneNumber(String mbrName, String mbrPhone) {
		// 전달인자가 2개 이상일 때에는 hashmap으로 전달한다
		HashMap<String, Object> params = new HashMap<>();
		params.put("mbrName", mbrName);
		params.put("mbrPhone", mbrPhone);
		
		Member member = omsMapper.findByNameAndPhoneNumber(params);
		return member;
	}

	public ArrayList<Product> productList() {
		ArrayList<Product> products = omsMapper.productList();
		return products;
	}
}
