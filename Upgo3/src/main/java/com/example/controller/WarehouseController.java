package com.example.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.xml.bind.ParseConversionEvent;

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
	public String warehouseStatusForm(Model model) {

		//////// Warehouse Status JSP Basic Info
		ArrayList<Integer> wlTotalQuantityBywlNo = new ArrayList<>();
		for (int wlno = 1; wlno < 21; wlno++) {
			int wlTotalQuantity = warehouseService.findWlQuantity(wlno);
			wlTotalQuantityBywlNo.add(wlTotalQuantity);
		}
		model.addAttribute("wlTotalQuantityBywlNo", wlTotalQuantityBywlNo);
		///////////////////////////////////////////////

		// Store & Release data Select from Database
		Date dateS = new Date();
		dateS.setTime(0);
		Date dateF = new Date();
		java.sql.Date dbdateS = new java.sql.Date(dateS.getTime());
		java.sql.Date dbdateF = new java.sql.Date(dateF.getTime());
		
		ArrayList<StoreRelease> storeReleases = warehouseService.findStoreReleasesByDate(dbdateS, dbdateF);
		ArrayList<StoreRelease> stores = new ArrayList<>();
		ArrayList<StoreRelease> releases = new ArrayList<>();
		
		for (int i = 0; i < storeReleases.size(); i++) {
			if (storeReleases.get(i).getSrType() == 0) {
				stores.add(storeReleases.get(i));
			} else {
				releases.add(storeReleases.get(i));
			}
		}

		model.addAttribute("stores", stores);
		model.addAttribute("releases", releases);
		int storeSize = stores.size();
		int releaseSize = releases.size();
		model.addAttribute("storeSize", storeSize);
		model.addAttribute("releaseSize", releaseSize);

		///////////////////////////////////////////////////////

		// Find Stored Product From stores By odtNo
		ArrayList<Product> storeProducts = new ArrayList<>();
		for (int i = 0; i < stores.size(); i++) {
			storeProducts.add(warehouseService.findProductsByOdtNo(stores.get(i).getOdtNo()));
			storeProducts.get(i).setPrdQuantity(productService.codeByAmount(storeProducts.get(i).getPrdCode()));
		}
		model.addAttribute("storeProducts", storeProducts);
		///////////////////////////////////////////

		// Find Released Product From releases By odtNo
		ArrayList<Product> releaseProducts = new ArrayList<>();
		for (int i = 0; i < releases.size(); i++) {
			releaseProducts.add(warehouseService.findProductsByOdtNo(releases.get(i).getOdtNo()));
			releaseProducts.get(i).setPrdQuantity(productService.codeByAmount(releaseProducts.get(i).getPrdCode()));
		}
		model.addAttribute("releaseProducts", releaseProducts);
		///////////////////////////////////////////

		// Find Order Quantity From stores By odtNo
		ArrayList<OrderDetail> storeOrderDetails = new ArrayList<>();
		for (int i = 0; i < stores.size(); i++) {
			storeOrderDetails.add(warehouseService.findOrderDetailQuantityByOdtNo(stores.get(i).getOdtNo()));
			model.addAttribute("storeOrderDetails", storeOrderDetails);
		}
		////////////////////////////////////////////

		// Find Order Quantity From releases By odtNo
		ArrayList<OrderDetail> releaseOrderDetails = new ArrayList<>();
		for (int i = 0; i < releases.size(); i++) {
			releaseOrderDetails.add(warehouseService.findOrderDetailQuantityByOdtNo(releases.get(i).getOdtNo()));
			model.addAttribute("releaseOrderDetails", releaseOrderDetails);
		}
		////////////////////////////////////////////

		return "warehouse/warehouse-status";
	}

	 
	 	@RequestMapping(value = "alwaysAnswerSuccess.action", method = RequestMethod.POST)
		@ResponseBody
		public String alwaysAnswerSuccess(HttpServletRequest request,String wlno) {
			return "success";
		}
	 	
	 	@RequestMapping(value = "warehouseStatus.action", method = {RequestMethod.GET, RequestMethod.POST})
		public String warehouseStatus(Model model, int warehouseno) {
	 		
			ArrayList<Product> products = warehouseService.findProductsByWlNo(warehouseno);
			ArrayList<WarehouseLocation> wls = warehouseService.findWlByWlno(warehouseno);
			for(int i=0; i<products.size(); i++){
				products.get(i).setPrdQuantity(productService.codeByAmount(products.get(i).getPrdCode()));
			}
			model.addAttribute("size", products.size());
			model.addAttribute("products", products);
			model.addAttribute("warehouselocations", wls);
			
			return "warehouse/warehouseStatus";
		}
	 	
	 	@RequestMapping(value = "warehouseInAndOut.action", method = {RequestMethod.GET, RequestMethod.POST})
	 	public String warehouseInAndOut(Model model, Date DateS, Date DateF, int type){
	 		
	 		java.sql.Date dbdateS = new java.sql.Date(DateS.getTime());
			java.sql.Date dbdateF = new java.sql.Date(DateF.getTime());
			ArrayList<StoreRelease> storeReleases = warehouseService.findStoreReleasesByDate(dbdateS, dbdateF);
			ArrayList<StoreRelease> stores = new ArrayList<>();
			ArrayList<StoreRelease> releases = new ArrayList<>();
			for (int i = 0; i < storeReleases.size(); i++) {
				if (storeReleases.get(i).getSrType() == 0) {
					stores.add(storeReleases.get(i));
				} else {
					releases.add(storeReleases.get(i));
				}
			}
			// Find Stored Product From stores By odtNo
			ArrayList<Product> storeProducts = new ArrayList<>();
			for (int i = 0; i < stores.size(); i++) {
				storeProducts.add(warehouseService.findProductsByOdtNo(stores.get(i).getOdtNo()));
				storeProducts.get(i).setPrdQuantity(productService.codeByAmount(storeProducts.get(i).getPrdCode()));
			}
			///////////////////////////////////////////
			// Find Released Product From releases By odtNo
			ArrayList<Product> releaseProducts = new ArrayList<>();
			for (int i = 0; i < releases.size(); i++) {
				releaseProducts.add(warehouseService.findProductsByOdtNo(releases.get(i).getOdtNo()));
				releaseProducts.get(i).setPrdQuantity(productService.codeByAmount(releaseProducts.get(i).getPrdCode()));
			}
			///////////////////////////////////////////
			// Find Order Quantity From stores By odtNo
			ArrayList<OrderDetail> storeOrderDetails = new ArrayList<>();
			for (int i = 0; i < stores.size(); i++) {
				storeOrderDetails.add(warehouseService.findOrderDetailQuantityByOdtNo(stores.get(i).getOdtNo()));
			}
			////////////////////////////////////////////
			// Find Order Quantity From releases By odtNo
			ArrayList<OrderDetail> releaseOrderDetails = new ArrayList<>();
			for (int i = 0; i < releases.size(); i++) {
				releaseOrderDetails.add(warehouseService.findOrderDetailQuantityByOdtNo(releases.get(i).getOdtNo()));
			}
			////////////////////////////////////////////
			
			
			if(type==0){
				model.addAttribute("stores", stores);
				model.addAttribute("storeSize", stores.size());
				model.addAttribute("storeProducts", storeProducts);
				model.addAttribute("storeOrderDetails", storeOrderDetails);
				return "warehouse/warehouseIn";
			}else{
				model.addAttribute("releases", releases);
				model.addAttribute("releaseSize", releases.size());
				model.addAttribute("releaseProducts", releaseProducts);
				model.addAttribute("releaseOrderDetails", releaseOrderDetails);
				return "warehouse/warehouseOut";
			}
	 		
	 	}
	 	
	 	@RequestMapping(value = "clickedProductInfoInInAndOut.action", method = {RequestMethod.GET, RequestMethod.POST})
	 	public String clickedProductInfoInInAndOut(Model model, String prdCode, int type){
			
	 		System.out.println("type : "+type);
	 		System.out.println("prdcode : "+prdCode);
	 		
	 		Product clickedProduct = warehouseService.findProductByPrdCode(prdCode);
	 		model.addAttribute("clickedProduct", clickedProduct);
	 		
	 		if(type==0){
				return "warehouse/clickedProductInfoIn";
			}else{
				return "warehouse/clickedProductInfoOut";
			}
	 		
	 	}
	 	
	 	

}