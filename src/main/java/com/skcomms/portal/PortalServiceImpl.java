package com.skcomms.portal;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skcomms.mybatis.PortalMapper;

/**
 * @project	portal-monitor
 * @file	PortalServiceImpl.java
 * @comment	
 * @author	양승준
 * @since	2015. 01. 18.
 */
@Service
public class PortalServiceImpl implements PortalService {
	@Autowired
	private PortalMapper portalMapper;

	public void setPortalMapper(PortalMapper portalmapper) {
		this.portalMapper = portalmapper;
	}
	
	/*
	 * 포털별 webPageTest 측정값 유무 확인
	 */
	public Integer getWebPageTestCnt(PortalModel portalmodel) {
		return portalMapper.getWebPageTestCnt(portalmodel);
	}
	
	/*
	 * 포털별 webPageTest 측정값 Insert
	 */
	public void insertWebPageTest(PortalModel portalmodel) {
		portalMapper.insertWebPageTest(portalmodel);
	}

	public void insertAutoNate(PortalModel portalmodel) {
		portalMapper.insertAuto(portalmodel);
	}
	public void insertAutoDaum(PortalModel portalmodel) {
		portalMapper.insertAuto(portalmodel);
	}
	public void insertAutoNaver(PortalModel portalmodel) {
		portalMapper.insertAuto(portalmodel);
	}
	public List<PortalModel> getAuto(PortalModel portalmodel) {
		return portalMapper.getAuto(portalmodel);
	}
	
	
	/*
	 * 포털별 webPageTest 측정값 Delete
	 */
	public void deleteWebPageTest(PortalModel portalmodel) {
		portalMapper.deleteWebPageTest(portalmodel);
	}

	/*
	 * 포털별 webPageTest 측정값 일자별 목록 조회 
	 */
	public ArrayList<PortalModel> getWebPageTestByDateSeq(String portalCode) {
		return portalMapper.getWebPageTestByDateSeq(portalCode);
	}
	
	/*
	 * 포털별 회차의 webPageTest 측정값 불러오기
	 */
	public ArrayList<PortalModel> getWebPageTest(String checkDate, String portalCode) {
		PortalModel params = new PortalModel();
		params.setCheckDate(checkDate);
		params.setPortalCode(portalCode);
		
		return portalMapper.getWebPageTest(params);
	}
	
	/*
	 * 포털-일자-회차 단위별 WebPageTest 측정값 Summary 조회
	 */
	public ArrayList<PortalModel> getWebPageTestSummary(String checkDate, String portalCode) {
		PortalModel params = new PortalModel();
		params.setCheckDate(checkDate);
		params.setPortalCode(portalCode);
		
		return portalMapper.getWebPageTestSummary(params);
	}
	
	/*
	 * 기간별 Summary 조회
	 */
	public List<PortalModel> getSummaryByDate(String sDate, String eDate, String portalCode) {
		PortalModel params = new PortalModel();
		params.setSdate(sDate);
		params.setEdate(eDate);
		params.setPortalCode(portalCode);
		
		return portalMapper.getSummaryByDate(params);
	}

}
