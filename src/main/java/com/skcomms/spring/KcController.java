package com.skcomms.spring;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.skcomms.kc.KcService;
import com.skcomms.kc.KcModel;

/**
 * @project	portal-monitor
 * @file	KcController.java
 * @comment	
 * @author	양승준
 * @since	2015. 06. 22.
 */
@Controller
@RequestMapping("/")
public class KcController {
	
	/** log */
	private final Log log = LogFactory.getLog(this.getClass());
	
	@Autowired
	private KcService kcService;
	
	/**
	 * 포털별 코리안클릭 로딩타임 입력
	 * @param date 날짜
	 * @param nate 네이트
	 * @param daum 다음
	 * @param naver 네이버
	 * @param params
	 * @return ModelAndView
	 * @throws Exception
	 */
	@RequestMapping(value = "/insertKc.sk", method = RequestMethod.GET)
	public ModelAndView ModelAndView (HttpServletRequest request, Model model) throws Exception {
		
		ModelAndView mav = new ModelAndView("kc/kc_insert");
		
		return mav;
	}
	
	@RequestMapping(value = "/insertKc.sk", method = RequestMethod.POST)
	public ModelAndView insertKc(
			HttpServletRequest request,
			Model model,
			@RequestParam(value = "date") @Valid String date,
			@RequestParam(value = "nate") double nate,
			@RequestParam(value = "daum") double daum,
			@RequestParam(value = "naver") double naver,
			@RequestParam Map<String, String> params,
			BindingResult bindingResult) throws Exception {
		
		ModelAndView mav = new ModelAndView("kc/kc_insert");
		
		String checkDate = date;
		String portalCode = "";
		String portalName = "";
		double loadTime;
		
		if (bindingResult.hasErrors()) {
			return mav;
		}
		
		for ( String key : params.keySet() ) {
			KcModel kcLoadTime = new KcModel();
			
			if (key.equals("nate")) {
				portalCode = "0";
				portalName = "NATE";
			} else if (key.equals("daum")) {
				portalCode = "1";
				portalName = "DAUM";
			} else if (key.equals("naver")) {
				portalCode = "2";
				portalName = "NAVER";
			}
		
			loadTime = Double.parseDouble(params.get(key));

			// kcLoadTime에 할당
			kcLoadTime.setCheckDate(checkDate);
			kcLoadTime.setPortalCode(portalCode);
			kcLoadTime.setPortalName(portalName);
			kcLoadTime.setLoadTime(loadTime);
			
			// map의 date는 db에 입력하지 않게;
			if (kcLoadTime.getPortalCode() != "") {
				kcService.insertKc(kcLoadTime);
			}
		}
		
		return mav;
	}
	
	/**
	 * 기간별 Summary 조회
	 * @param request
	 * @param response
	 * @param sDate 시작일자
	 * @param eDate 종료일자
	 * @param pCode 포털코드
	 * @return
	 * @throws Exception 
	 */	
	@RequestMapping(value = "/summaryKc.sk", method = RequestMethod.GET)
	public ModelAndView getKc(HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam(value = "sDate", required = false) String sDate,
			@RequestParam(value = "eDate", required = false) String eDate,
			@RequestParam(value = "pCode", required = false) String portalCode) throws Exception {
		
		// return 되는 modelAndView 생성 및 설정
		ModelAndView mav = new ModelAndView("kc/kc_summary");
		
		// 조회조건이 있는경우에만 summary 조회 수행
		if ( sDate != null && eDate != null ) {
			List<KcModel> resultList = getKcList(request, response, sDate, eDate, portalCode);
			
			// 화면에 결과 담기
			mav.addObject("summary", resultList);
			// 검색조건 유지
			mav.addObject("sDate", sDate);
			mav.addObject("eDate", eDate);
			mav.addObject("pCode", portalCode);
		}		
		
		return mav;
	}
	
	/**
	 * 기간별 Summary 조회
	 * @param request
	 * @param response
	 * @param sDate 시작일자
	 * @param eDate 종료일자
	 * @param pCode 포털코드
	 * @return
	 * @throws Exception 
	 */	
	@ResponseBody
	@RequestMapping(value = "/getKcList", method = RequestMethod.POST)
	public List<KcModel> getKcList(HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam(value = "sDate") String sDate,
			@RequestParam(value = "eDate") String eDate,
			@RequestParam(value = "pCode") String portalCode) throws Exception {

		List<KcModel> resultList = new ArrayList<KcModel>();
		
		try {
			// summary 값 불러오기
			resultList = kcService.getKcByDate(sDate, eDate, portalCode);
		} catch (Exception e) {
			log.error("KcController.getKcList.error : " + e.getMessage());
			e.printStackTrace();
		}
		
		return resultList;
	}
	
}