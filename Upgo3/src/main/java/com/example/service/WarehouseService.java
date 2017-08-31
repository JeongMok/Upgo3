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
import com.example.dto.WarehouseLocation;

// Service는 트랜잭션 단위
@Service //@Component
public class WarehouseService {
	
	@Autowired
	@Qualifier("warehouseDao")
	private WarehouseDao warehouseDao;

	public int findWlQuantity(int wlno) {
		int wlQuantity = warehouseDao.selectWlQuantity(wlno);
		return wlQuantity;
	}

	public ArrayList<StoreRelease> findStoreReleasesByDate(Date dbdateS, Date dbdateF) {
		ArrayList<StoreRelease> storeReleaseByDate = warehouseDao.selectStoreReleasesByDate(dbdateS, dbdateF);
		return storeReleaseByDate;
	}

	public Product findProductsByOdtNo(int odtNo) {
		Product product = warehouseDao.selectProductByOdtNo(odtNo);
		return product;
	}

	public OrderDetail findOrderDetailQuantityByOdtNo(int odtNo) {
		OrderDetail orderDetailQuantity = warehouseDao.selectOrderDetailByOdtNo(odtNo);
		return orderDetailQuantity;
	}

	public ArrayList<Product> findProductsByWlNo(int warehouseno) {
		ArrayList<Product> productsBywlNo = warehouseDao.selectProductsByWlNo(warehouseno);
		return productsBywlNo;
	}

	public ArrayList<WarehouseLocation> findWlByWlno(int warehouseno) {
		ArrayList<WarehouseLocation> wls = warehouseDao.selectWlByWlno(warehouseno);
		return wls;
	}

	public Product findProductByPrdCode(String prdCode) {
		Product clickedProduct = warehouseDao.selectProductByPrdCode(prdCode);
		return clickedProduct;
	}
	
	
	
	
	
	
}
