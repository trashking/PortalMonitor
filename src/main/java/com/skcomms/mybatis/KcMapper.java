package com.skcomms.mybatis;

import java.util.ArrayList;
import java.util.List;

import com.skcomms.kc.KcModel;

public interface KcMapper {
	/* 
	 * 포털별 webPageTest 측정값 유무 확인
	 */
	public Integer getWebPageTestCnt(KcModel kcmodel);

	/* 
	 * 포털별 webPageTest 측정값 Insert
	 */
	public void insertKc(KcModel kcmodel);

	public ArrayList<KcModel> getKc(KcModel params);
	
	/*
	 * 기간별 Summary 조회
	 */
	public List<KcModel> getKcByDate(KcModel params);

}
