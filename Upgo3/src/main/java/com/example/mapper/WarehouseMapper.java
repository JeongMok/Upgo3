package com.example.mapper;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import com.example.dto.Member;
import com.example.dto.OrderDetail;
import com.example.dto.Product;
import com.example.dto.StoreRelease;
import com.example.dto.WarehouseLocation;

public interface WarehouseMapper {

	ArrayList<StoreRelease> selectStoreReleasesByDate(HashMap<String, Object> date);

	Product selectProductByOdtNo(int odtNo);

	OrderDetail selectOrderDetailByOdtNo(int odtNo);

	ArrayList<WarehouseLocation> selectWL();

	int selectWlQuantity(int wlno);

	ArrayList<Product> selectProductsByWlNo(int iwarehouseno);

	ArrayList<WarehouseLocation> selectWlByWlno(int iwarehouseno);

	Product selectProductByPrdCode(String prdCode);

}
