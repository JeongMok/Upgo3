package com.example.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.example.dao.WarehouseDao;
import com.example.dto.Member;
import com.example.dto.Product;

// Service는 트랜잭션 단위
@Service //@Component
public class WarehouseService {
	
	@Autowired
	@Qualifier("warehouseDao")
	private WarehouseDao omsDao;
	
	
//	public Member authenticate(String mbrName, String mbrPhone) {
//		Member member = omsDao.findByNameAndPhoneNumber(mbrName, mbrPhone);
//		return member;
//	}

//	public ArrayList<Product> productList() {
//		ArrayList<Product> products = omsDao.productList();
//		return products;
//	}

}
