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
import com.example.dto.WarehouseLocation;
import com.example.mapper.WarehouseMapper;

@Repository
public class WarehouseDao {

	@Autowired
	@Qualifier("warehouseMapper")
	private WarehouseMapper warehouseMapper;

	public ArrayList<StoreRelease> selectStoreReleasesByDate(Date dateS, Date dateF) {

		HashMap<String, Object> date = new HashMap<>();
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

	public ArrayList<WarehouseLocation> selectWL() {
		ArrayList<WarehouseLocation> wl = warehouseMapper.selectWL();
		return wl;
	}

	public int selectWlQuantity(int wlno) {
		int wlQuantity = warehouseMapper.selectWlQuantity(wlno);
		return wlQuantity;
	}

	public ArrayList<Product> selectProductsByWlNo(int iwarehouseno) {
		ArrayList<Product> products = warehouseMapper.selectProductsByWlNo(iwarehouseno);
		return products;
	}

	public ArrayList<WarehouseLocation> selectWlByWlno(int iwarehouseno) {
		ArrayList<WarehouseLocation> wls = warehouseMapper.selectWlByWlno(iwarehouseno);
		return wls;
	}

	public Product selectProductByPrdCode(String prdCode) {
		Product clickedProduct = warehouseMapper.selectProductByPrdCode(prdCode);
		return clickedProduct;
	}

}
