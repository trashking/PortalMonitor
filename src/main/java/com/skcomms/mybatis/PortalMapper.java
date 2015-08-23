package com.skcomms.mybatis;

import java.util.ArrayList;
import java.util.List;

import com.skcomms.portal.PortalModel;

public interface PortalMapper {
	
	/* 
	 * 포털별 webPageTest 측정값 유무 확인
	 */
	public Integer getWebPageTestCnt(PortalModel portalmodel);

	/* 
	 * 포털별 webPageTest 측정값 Insert
	 */
	public void insertWebPageTest(PortalModel portalmodel);
	
	/* 
	 * 포털별 webPageTest 측정값 Delete
	 */
	public void deleteWebPageTest(PortalModel portalmodel);
	
	/*
	 * 포털별 webPageTest 측정값 일자별 목록 조회 
	 */
	public ArrayList<PortalModel> getWebPageTestByDateSeq(String portalCode);
	
	/*
	 * 포털별 webPageTest 측정값 불러오기
	 */
	public ArrayList<PortalModel> getWebPageTest(PortalModel params);
	
	/*
	 * 포털-일자-회차 단위별 WebPageTest 측정값 Summary 조회
	 */
	public ArrayList<PortalModel> getWebPageTestSummary(PortalModel params);
	
	/*
	 * 기간별 Summary 조회
	 */
	public List<PortalModel> getSummaryByDate(PortalModel params);
	
	/*
	 * Request Summary 조회
	 */
	public List<PortalModel> getRequestSummary(PortalModel params);
	
	/*
	 * Kbytes Summary 조회
	 */
	public List<PortalModel> getKbytesSummary(PortalModel params);
	
	/*
	 * js Request Summary 조회
	 */
	public List<PortalModel> getJsRequestSummary(PortalModel params);
	
}
