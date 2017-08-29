package com.example.dao;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.example.dto.Member;
import com.example.dto.OrderDetail;
import com.example.dto.Product;
import com.example.dto.StoreRelease;
import com.example.mapper.WarehouseMapper;

@Repository
public class WarehouseDao {

	@Autowired
	@Qualifier("warehouseMapper")
	private WarehouseMapper warehouseMapper;

	public ArrayList<StoreRelease> selectStoreReleasesByDate(Date dateS, Date dateF) {

		HashMap<String, Object> date = null;
		date.put("dateS", dateS);
		date.put("dateF", dateF);
		ArrayList<StoreRelease> storeReleases = warehouseMapper.selectStoreReleasesByDate(date);
		
		return storeReleases;
	}

	public Product selectProductByOdtNo(int odtNo) {

		Product storedProduct = warehouseMapper.selectProductByOdtNo(odtNo); 
		
		return storedProduct;

	}

	public OrderDetail selectOrderDetailByOdtNo(int odtNo) {
		
		OrderDetail storeOrderDetail = warehouseMapper.selectOrderDetailByOdtNo(odtNo); 
		
		return storeOrderDetail;
	}

//	public Member findByNameAndPhoneNumber(String mbrName, String mbrPhone) {
//		// 전달인자가 2개 이상일 때에는 hashmap으로 전달한다
//		HashMap<String, Object> params = new HashMap<>();
//		params.put("mbrName", mbrName);
//		params.put("mbrPhone", mbrPhone);
//		
//		Member member = omsMapper.findByNameAndPhoneNumber(params);
//		return member;
//	}

//	public ArrayList<Product> productList() {
//		ArrayList<Product> products = omsMapper.productList();
//		return products;
//	}
}
