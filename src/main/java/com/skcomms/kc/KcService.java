package com.skcomms.kc;

import java.util.List;

import org.springframework.stereotype.Repository;

/**
 * @project	PortalMonitor
 * @file	KcService.java
 * @comment	
 * @author	양승준
 * @since	2015. 06. 22.
 */
@Repository
public interface KcService {
	/*
	 * 코리안클릭 로딩 시간 입력
	 */
	public void insertKc(KcModel kcmodel);
	
	/*
	 * 코리안클릭 로딩 시간 출력
	 */
	public List<KcModel> getKcByDate(String sDate, String eDate, String portalCode);
}