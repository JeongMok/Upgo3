package com.example.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.example.dao.OmsDao;
import com.example.dto.Member;
import com.example.dto.Product;

// Service는 트랜잭션 단위
@Service //@Component
public class OmsService {
	
	@Autowired
	@Qualifier("omsDao")
	private OmsDao omsDao;
	
	
	public Member authenticate(String mbrName, String mbrPhone) {
		Member member = omsDao.findByNameAndPhoneNumber(mbrName, mbrPhone);
		return member;
	}

	public ArrayList<Product> productList() {
		ArrayList<Product> products = omsDao.productList();
		return products;
	}

	public void orderConfirm(Member member, Product product) {
		omsDao.orderConfirm(member, product);
		
	}

	public void insertOrderList(String prdName, String prdQuantity, String mbrId) {
		omsDao.insertOrderList(prdName, prdQuantity, mbrId);
		
	}

	public void insertOrder(String mbrId, String ordAddress, String ordPhone, String ordName) {
		omsDao.insertOrder(mbrId, ordAddress, ordPhone, ordName);
		
	}

}
