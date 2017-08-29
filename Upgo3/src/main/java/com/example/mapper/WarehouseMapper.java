package com.example.mapper;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import com.example.dto.Member;
import com.example.dto.OrderDetail;
import com.example.dto.Product;
import com.example.dto.StoreRelease;

public interface WarehouseMapper {

	ArrayList<StoreRelease> selectStoreReleasesByDate(HashMap<String, Object> date);

	Product selectProductByOdtNo(int odtNo);

	OrderDetail selectOrderDetailByOdtNo(int odtNo);

//	Member findByNameAndPhoneNumber(HashMap<String, Object> params);
//	ArrayList<Product> productList();
}
