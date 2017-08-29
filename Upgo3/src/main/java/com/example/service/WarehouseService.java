package com.example.service;

import java.sql.Date;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.example.dao.WarehouseDao;
import com.example.dto.Member;
import com.example.dto.OrderDetail;
import com.example.dto.Product;
import com.example.dto.StoreRelease;

// Service는 트랜잭션 단위
@Service //@Component
public class WarehouseService {
	
	@Autowired
	@Qualifier("warehouseDao")
	private WarehouseDao warehouseDao;

	public ArrayList<StoreRelease> findStoreReleasesByDate(Date dateS, Date dateF) {
		
			ArrayList<StoreRelease> storeReleases = warehouseDao.selectStoreReleasesByDate(dateS, dateF);
		
		return storeReleases;
	}

	public Product findProductsByOdtNo(int odtNo) {

		Product storedProduct = warehouseDao.selectProductByOdtNo(odtNo); 
		
		return storedProduct;
	}

	public OrderDetail findOrderDetailQuantityByOdtNo(int odtNo) {
		
		OrderDetail storeOrderDetail = warehouseDao.selectOrderDetailByOdtNo(odtNo); 
		
		return storeOrderDetail;
		
	}
	
	
//	public Member authenticate(String mbrName, String mbrPhone) {
//		Member member = omsDao.findByNameAndPhoneNumber(mbrName, mbrPhone);
//		return member;
//	}

//	public ArrayList<Product> productList() {
//		ArrayList<Product> products = omsDao.productList();
//		return products;
//	}

}
