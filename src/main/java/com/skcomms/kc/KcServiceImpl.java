package com.skcomms.kc;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skcomms.mybatis.KcMapper;

/**
 * @project	portal-monitor
 * @file	KcServiceImpl.java
 * @comment	
 * @author	양승준
 * @since	2016. 06. 22.
 */
@Service
public class KcServiceImpl implements KcService {
	@Autowired
	private KcMapper kcMapper;

	public void setKcMapper(KcMapper kcmapper) {
		this.kcMapper = kcmapper;
	}
	
	/*
	 * 코리안클릭 로딩 시간 입력
	 */	
	public void insertKc(KcModel kcmodel) {
		kcMapper.insertKc(kcmodel);
	}
	
	/*
	 * 코리안클릭 로딩 시간 출력
	 */
	public List<KcModel> getKcByDate(String sDate, String eDate, String portalCode) {
		KcModel params = new KcModel();
		params.setSdate(sDate);
		params.setEdate(eDate);
		params.setPortalCode(portalCode);
		
		return kcMapper.getKcByDate(params);
	}
}