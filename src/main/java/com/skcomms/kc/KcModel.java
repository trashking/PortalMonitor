package com.skcomms.kc;

public class KcModel {
	private String checkDate;
	private String portalCode;
	private String portalName;
	private double loadTime;
	
	/* 사용자추가 시작 (Table에 없음) */
	
	private String sDate;
	private String eDate;
	
	/* 사용자추가 끝 */
	
	public String getCheckDate() {
		return checkDate;
	}
	public void setCheckDate(String checkDate) {
		this.checkDate = checkDate;
	}
	public String getPortalCode() {
		return portalCode;
	}
	public void setPortalCode(String portalCode) {
		this.portalCode = portalCode;
	}
	public String getPortalName() {
		return portalName;
	}
	public void setPortalName(String portalName) {
		this.portalName = portalName;
	}
	public double getLoadTime() {
		return loadTime;
	}
	public void setLoadTime(double loadTime) {
		this.loadTime = loadTime;
	}

	public String getSdate() {
		return sDate;
	}
	public void setSdate(String value) {
		this.sDate = value;
	}
	public String getEdate() {
		return eDate;
	}
	public void setEdate(String value) {
		this.eDate = value;
	}	
	
	@Override
	public String toString() {
		return "KcModel [checkDate=" + checkDate + ", portalCode=" + portalCode
				+ ", portalName=" + portalName + ", loadTime=" + loadTime
				+ ", getCheckDate()=" + getCheckDate() + ", getPortalCode()="
				+ getPortalCode() + ", getPortalName()=" + getPortalName()
				+ ", getLoadTime()=" + getLoadTime() + ", getClass()="
				+ getClass() + ", hashCode()=" + hashCode() + ", toString()="
				+ super.toString() + "]";
	}
}
