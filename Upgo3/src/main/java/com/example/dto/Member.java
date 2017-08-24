package com.example.dto;

import java.util.Date;

public class Member {

	private String mbrId;
	private String mbrPasswd;
	private String mbrName;
	private String mbrPhone;
	private String mbrAddress;
	private int mbrUserType;
	private Date mbrRegDate;
	
	public String getMbrId() {
		return mbrId;
	}
	public void setMbrId(String mbrId) {
		this.mbrId = mbrId;
	}
	public String getMbrPasswd() {
		return mbrPasswd;
	}
	public void setMbrPasswd(String mbrPasswd) {
		this.mbrPasswd = mbrPasswd;
	}
	public String getMbrName() {
		return mbrName;
	}
	public void setMbrName(String mbrName) {
		this.mbrName = mbrName;
	}
	public String getMbrPhone() {
		return mbrPhone;
	}
	public void setMbrPhone(String mbrPhone) {
		this.mbrPhone = mbrPhone;
	}
	public String getMbrAddress() {
		return mbrAddress;
	}
	public void setMbrAddress(String mbrAddress) {
		this.mbrAddress = mbrAddress;
	}
	public int getMbrUserType() {
		return mbrUserType;
	}
	public void setMbrUserType(int mbrUserType) {
		this.mbrUserType = mbrUserType;
	}
	public Date getMbrRegDate() {
		return mbrRegDate;
	}
	public void setMbrRegDate(Date mbrRegDate) {
		this.mbrRegDate = mbrRegDate;
	}
}
