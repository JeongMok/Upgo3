package com.example.dto;

import java.util.Date;

public class StoreRelease {
	private int srNo;
	private Date srDate;
	private int odtNo;
	private int srType;
	public int getSrNo() {
		return srNo;
	}
	public void setSrNo(int srNo) {
		this.srNo = srNo;
	}
	public Date getSrDate() {
		return srDate;
	}
	public void setSrDate(Date srDate) {
		this.srDate = srDate;
	}
	public int getOdtNo() {
		return odtNo;
	}
	public void setOdtNo(int odtNo) {
		this.odtNo = odtNo;
	}
	public int getSrType() {
		return srType;
	}
	public void setSrType(int srType) {
		this.srType = srType;
	}
}
