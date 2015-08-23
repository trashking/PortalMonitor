package com.skcomms.portal;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

/**
 * @project	portal-monitor
 * @file	PortalService.java
 * @comment	
 * @author	양승준
 * @since	2015. 01. 18.
 */
@Repository
public interface PortalService {
	
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
	 * 포털별 회차의 webPageTest 측정값 불러오기
	 */
	public ArrayList<PortalModel> getWebPageTest(String checkDate, String portalCode);
	
	/*
	 * 포털-일자-회차 단위별 WebPageTest 측정값 Summary 조회
	 */
	public ArrayList<PortalModel> getWebPageTestSummary(String checkDate, String portalCode);
	
	/*
	 * 기간별 Summary 조회
	 */
	public List<PortalModel> getSummaryByDate(String sDate, String eDate, String portalCode);
}
