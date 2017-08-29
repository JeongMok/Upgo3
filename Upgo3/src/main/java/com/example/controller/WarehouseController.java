package com.example.controller;

import java.util.ArrayList;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.dto.Member;
import com.example.dto.OrderDetail;
import com.example.dto.Product;
import com.example.dto.StoreRelease;
import com.example.dto.WarehouseLocation;
import com.example.service.ProductService;
import com.example.service.WarehouseService;

@Controller
@RequestMapping(value = "warehouse")
public class WarehouseController {

	@Autowired
	@Qualifier("warehouseService")
	private WarehouseService warehouseService;
	
	@Autowired
	@Qualifier("productService")
	private ProductService productService;

	@RequestMapping(value = "warehouse-status.action", method = RequestMethod.GET)
	public String warehouseStatusForm(Model model){
		
		// Store & Release data Select from Database
		Date dateS = new Date(0);
		Date dateF = new Date();
		java.sql.Date dbdateS = new java.sql.Date(dateS.getTime());
		java.sql.Date dbdateF = new java.sql.Date(dateF.getTime());
		ArrayList<StoreRelease> storeReleases = warehouseService.findStoreReleasesByDate(dbdateS,dbdateF);
		ArrayList<StoreRelease> stores = null;
		ArrayList<StoreRelease> releases = null;
		for(int i=0; i<storeReleases.size();  i++){
			if(storeReleases.get(i).getSrType()==0){
				stores.add(storeReleases.get(i));
			}else{
				releases.add(storeReleases.get(i));
			}
		}
		model.addAttribute(stores);
		model.addAttribute(releases);
		int storeSize = stores.size();
		int releaseSize = releases.size();
		model.addAttribute(storeSize);
		model.addAttribute(releaseSize);
		///////////////////////////////////////////////////////
		
		// Find Stored Product From stores By odtNo
		ArrayList<Product> storeProducts = null;
		for(int i=0; i<stores.size();  i++){
		storeProducts.add(warehouseService.findProductsByOdtNo(stores.get(i).getOdtNo()));
		storeProducts.get(i).setPrdQuantity(productService.codeByAmount(storeProducts.get(i).getPrdCode()));
		}
		model.addAttribute(storeProducts);
		///////////////////////////////////////////

		// Find Released Product From releases By odtNo
		ArrayList<Product> releaseProducts = null;
		for(int i=0; i<releases.size();  i++){
		releaseProducts.add(warehouseService.findProductsByOdtNo(releases.get(i).getOdtNo()));
		releaseProducts.get(i).setPrdQuantity(productService.codeByAmount(releaseProducts.get(i).getPrdCode()));
		}
		model.addAttribute(releaseProducts);
		///////////////////////////////////////////

		// Find Order Quantity From stores By odtNo
		ArrayList<OrderDetail> storeOrderDetails = null;
		for(int i=0; i<stores.size();  i++){
		storeOrderDetails.add(warehouseService.findOrderDetailQuantityByOdtNo(stores.get(i).getOdtNo()));
		model.addAttribute(storeOrderDetails);
		}
		////////////////////////////////////////////
		
		// Find Order Quantity From releases By odtNo
		ArrayList<OrderDetail> releaseOrderDetails = null;
		for(int i=0; i<stores.size();  i++){
		releaseOrderDetails.add(warehouseService.findOrderDetailQuantityByOdtNo(stores.get(i).getOdtNo()));
		model.addAttribute(releaseOrderDetails);
		}
		////////////////////////////////////////////
				
		return "warehouse/warehouse-status";
	}
	
	
//	@RequestMapping(value = "searchMember.action", method = RequestMethod.POST)
//	@ResponseBody
//	public String searchMember(String mbrName, String mbrPhone){
//		
//		Member member = omsService.authenticate(mbrName, mbrPhone);
//		if (member == null){
//			System.out.println("�??��결과?��?��");
//		} else {
//			System.out.println(member.getMbrAddress());
//		}
//		return "";
//	}
	
	
}