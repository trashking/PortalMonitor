package com.skcomms.portal;

public class PortalModel {
	private String checkDate;
	private int checkSeq;
	private String checkUrl;
	private String portalCode;
	private String portalName;
	private int statNo;
	private String statResource;
	private String statTypeCode;
	private int statRequest;
	private String statType;
	private Double statOffset;
	private int statDNS;
	private int statConn; 
	private int statSSL;
	private int statTTFB;
	private int statContent; 
	private Double statByte;
	private int statCode;
	private String statIP;
	private String statLocation;
	private String statEventType;
	private String checkBaseLocation;
	private String checkBaseBrowser;
	private String checkBaseConnection;
	private String modifiedStatResource;
	
	private String autoTest;
	
	/* 사용자추가 시작 (Table에 없음) */
	
	public String getAutoTest() {
		return autoTest;
	}
	public void setAutoTest(String autoTest) {
		this.autoTest = autoTest;
	}

	private String loadEventType;
	private String sDate;
	private String eDate;
	private Double statByteImage;
	private Double statByteJs;
	private Double statByteHtml;
	private Double statByteCss;
	private Double statByteFlash;
	private Double statByteOther;
	private Double statByteFont;
	private Double statByteText;
	private int statImageRequest;
	private int statJsRequest;
	private int statHtmlRequest;
	private int statCssRequest;
	private int statFlashRequest;
	private int statOtherRequest;
	private int statFontRequest;
	private int statTextRequest;
	
	/* 사용자추가 끝 */
	
	public String getCheckDate() {
		return checkDate;
	}
	public void setCheckDate(String value) {
		this.checkDate = value;
	}
	public int getCheckSeq() {
		return checkSeq;
	}
	public void setCheckSeq(int value) {
		this.checkSeq = value;
	}
	public String getCheckUrl() {
		return checkUrl;
	}
	public void setCheckUrl(String value) {
		this.checkUrl = value;
	}
	public String getPortalCode() {
		return portalCode;
	}
	public void setPortalCode(String value) {
		this.portalCode = value;
	}
	public String getPortalName() {
		return portalName;
	}
	public void setPortalName(String value) {
		this.portalName = value;
	}
	public int getStatNo() {
		return statNo;
	}
	public void setStatNo(int value) {
		this.statNo = value;
	}
	public String getStatResource() {
		return statResource;
	}
	public void setStatResource(String value) {
		this.statResource = value;
	}
	public String getStatTypeCode() {
		return statTypeCode;
	}
	public void setStatTypeCode(String value) {
		this.statTypeCode = value;
	}
	public String getStatType() {
		return statType;
	}
	public void setStatType(String value) {
		this.statType = value;
	}
	public Double getStatOffset() {
		return statOffset;
	}
	public void setStatOffset(Double value) {
		this.statOffset = value;
	}
	public int getStatDNS() {
		return statDNS;
	}
	public void setStatDNS(int value) {
		this.statDNS = value;
	}
	public int getStatConn() {
		return statConn;
	}
	public void setStatConn(int value) {
		this.statConn = value;
	}
	public int getStatSSL() {
		return statSSL;
	}
	public void setStatSSL(int value) {
		this.statSSL = value;
	}
	public int getStatTTFB() {
		return statTTFB;
	}
	public void setStatTTFB(int value) {
		this.statTTFB = value;
	}
	public int getStatContent() {
		return statContent;
	}
	public void setStatContent(int value) {
		this.statContent = value;
	}
	public Double getStatByte() {
		return statByte;
	}
	public void setStatByte(Double value) {
		this.statByte = value;
	}
	public int getStatCode() {
		return statCode;
	}
	public void setStatCode(int value) {
		this.statCode = value;
	}
	public String getStatIP() {
		return statIP;
	}
	public void setStatIP(String value) {
		this.statIP = value;
	}
	public String getStatLocation() {
		return statLocation;
	}
	public void setStatLocation(String value) {
		this.statLocation = value;
	}
	public int getStatRequest() {
		return statRequest;
	}
	public void setStatRequest(int statRequest) {
		this.statRequest = statRequest;
	}
	public String getStatEventType() {
		return statEventType;
	}
	public void setStatEventType(String statEventType) {
		this.statEventType = statEventType;
	}
	public String getCheckBaseLocation() {
		return checkBaseLocation;
	}
	public void setCheckBaseLocation(String checkBaseLocation) {
		this.checkBaseLocation = checkBaseLocation;
	}
	public String getCheckBaseBrowser() {
		return checkBaseBrowser;
	}
	public void setCheckBaseBrowser(String checkBaseBrowser) {
		this.checkBaseBrowser = checkBaseBrowser;
	}
	public String getCheckBaseConnection() {
		return checkBaseConnection;
	}
	public void setCheckBaseConnection(String checkBaseConnection) {
		this.checkBaseConnection = checkBaseConnection;
	}
	public String getModifiedStatResource() {
		return modifiedStatResource;
	}
	public void setModifiedStatResource(String modifiedStatResource) {
		this.modifiedStatResource = modifiedStatResource;
	}
	
	/* 사용자추가 시작 (Table에 없음) */
	
	public String getLoadEventType() {
		return loadEventType;
	}
	public void setLoadEventType(String value) {
		this.loadEventType = value;
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
	public Double getStatByteImage() {
		return statByteImage;
	}
	public void setStatByteImage(Double statByteImage) {
		this.statByteImage = statByteImage;
	}
	public Double getStatByteJs() {
		return statByteJs;
	}
	public void setStatByteJs(Double statByteJs) {
		this.statByteJs = statByteJs;
	}
	public Double getStatByteHtml() {
		return statByteHtml;
	}
	public void setStatByteHtml(Double statByteHtml) {
		this.statByteHtml = statByteHtml;
	}
	public Double getStatByteCss() {
		return statByteCss;
	}
	public void setStatByteCss(Double statByteCss) {
		this.statByteCss = statByteCss;
	}
	public Double getStatByteFlash() {
		return statByteFlash;
	}
	public void setStatByteFlash(Double statByteFlash) {
		this.statByteFlash = statByteFlash;
	}
	public Double getStatByteOther() {
		return statByteOther;
	}
	public void setStatByteOther(Double statByteOther) {
		this.statByteOther = statByteOther;
	}
	public Double getStatByteFont() {
		return statByteFont;
	}
	public void setStatByteFont(Double statByteFont) {
		this.statByteFont = statByteFont;
	}
	public Double getStatByteText() {
		return statByteText;
	}
	public void setStatByteText(Double statByteText) {
		this.statByteText = statByteText;
	}
	public int getStatImageRequest() {
		return statImageRequest;
	}
	public void setStatImageRequest(int statImageRequest) {
		this.statImageRequest = statImageRequest;
	}
	public int getStatJsRequest() {
		return statJsRequest;
	}
	public void setStatJsRequest(int statJsRequest) {
		this.statJsRequest = statJsRequest;
	}
	public int getStatHtmlRequest() {
		return statHtmlRequest;
	}
	public void setStatHtmlRequest(int statHtmlRequest) {
		this.statHtmlRequest = statHtmlRequest;
	}
	public int getStatCssRequest() {
		return statCssRequest;
	}
	public void setStatCssRequest(int statCssRequest) {
		this.statCssRequest = statCssRequest;
	}
	public int getStatFlashRequest() {
		return statFlashRequest;
	}
	public void setStatFlashRequest(int statFlashRequest) {
		this.statFlashRequest = statFlashRequest;
	}
	public int getStatOtherRequest() {
		return statOtherRequest;
	}
	public void setStatOtherRequest(int statOtherRequest) {
		this.statOtherRequest = statOtherRequest;
	}
	public int getStatFontRequest() {
		return statFontRequest;
	}
	public void setStatFontRequest(int statFontRequest) {
		this.statFontRequest = statFontRequest;
	}
	public int getStatTextRequest() {
		return statTextRequest;
	}
	public void setStatTextRequest(int statTextRequest) {
		this.statTextRequest = statTextRequest;
	}
	
	/* 사용자추가 끝 */
	
	@Override
	public String toString() {
		return "PortalModel [checkDate=" + checkDate + ", checkSeq=" + checkSeq
				+ ", checkUrl=" + checkUrl + ", portalCode=" + portalCode
				+ ", portalName=" + portalName + ", statNo=" + statNo
				+ ", statResource=" + statResource + ", statTypeCode="
				+ statTypeCode + ", statRequest=" + statRequest + ", statType="
				+ statType + ", statOffset=" + statOffset + ", statDNS="
				+ statDNS + ", statConn=" + statConn + ", statSSL=" + statSSL
				+ ", statTTFB=" + statTTFB + ", statContent=" + statContent
				+ ", statByte=" + statByte + ", statCode=" + statCode
				+ ", statIP=" + statIP + ", statLocation=" + statLocation
				+ ", statEventType=" + statEventType + ", checkBaseLocation="
				+ checkBaseLocation + ", checkBaseBrowser=" + checkBaseBrowser
				+ ", checkBaseConnection=" + checkBaseConnection
				+ ", modifiedStatResource=" + modifiedStatResource
				+ ", loadEventType=" + loadEventType + ", sDate=" + sDate
				+ ", eDate=" + eDate + ", statByteImage=" + statByteImage
				+ ", statByteJs=" + statByteJs + ", statByteHtml="
				+ statByteHtml + ", statByteCss=" + statByteCss
				+ ", statByteFlash=" + statByteFlash + ", statByteOther="
				+ statByteOther + ", statByteFont=" + statByteFont
				+ ", statByteText=" + statByteText + "]";
	}
}
