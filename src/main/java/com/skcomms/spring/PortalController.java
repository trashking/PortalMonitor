package com.skcomms.spring;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.skcomms.portal.PortalService;
import com.skcomms.portal.PortalModel;

/**
 * @project	portal-monitor
 * @file	PortalController.java
 * @comment	
 * @author	양승준
 * @since	2015. 01. 18.
 */
@Controller
@RequestMapping("/")
public class PortalController {
	
	/** log */
	private final Log log = LogFactory.getLog(this.getClass());
	
	@Autowired
	private PortalService portalService;

	/**
	 * 포털별 webPageTest 측정값 생성
	 * @param request
	 * @param model
	 * @param URL 측정url
	 * @return 
	 * @return ModelAndView
	 * @throws Exception
	 */
	@RequestMapping(value = "/insert.sk", method = RequestMethod.GET)
	public ModelAndView ModelAndView (HttpServletRequest request, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("portal/portal_insert");
		
		return mav;
	}
	
	@RequestMapping(value = "/insert.sk", method = RequestMethod.POST)
	public ModelAndView insertWebPageTest(HttpServletRequest request,
			Model model,
			@RequestParam(value = "URL") String url) throws Exception {

		ModelAndView mav = new ModelAndView("portal/portal_insert");

		Document doc = Jsoup.connect(url).get();
		Elements headElements = doc.select("#header_data h2 span");
		Elements tableElements = doc.select("#tableDetails");
		Elements tableHeaderEles = tableElements.select("thead tr th");
		Elements tableRowEles = tableElements.select(":not(thead) tr");
		Elements baseElements = doc.select("#header_data p");
		
		String checkUrl = url;
		
		// 기존 테스트 결과도 입력 시점으로 들어가서 임시방편
		String checkDate = "20" + url.substring(34, 40);
		
		// portalCode 는 테스트할 포털의 고유 코드를 나타낸다.
		// 0 : NATE, 1 : DAUM, 2 : NAVER, 3 : ETC 
		String portalCode = "";
		String portalName = headElements.text().toLowerCase();

		if (portalName.indexOf("www.nate.com") >= 0) {
			portalCode = "0";
			portalName = "NATE";
		} else if (portalName.indexOf("www.daum.net") >= 0) {
			portalCode = "1";
			portalName = "DAUM";
		} else if (portalName.indexOf("www.naver.com") >= 0) {
			portalCode = "2";
			portalName = "NAVER";
		} else if (portalName.indexOf("m.nate.com") >= 0) {
			portalCode = "4";
			portalName = "mNATE";
		} else if (portalName.indexOf("m.news.nate.com") >= 0) {
			portalCode = "5";
			portalName = "mNATE News";
		} else {
			portalCode = "3";
			portalName = "ETC";
		}
		
		
		// 테스트 기준 분류
		// 지역, 브라우저, 연결품질 
		String checkBase = baseElements.text().trim().replaceAll(" ", "");
		
		String checkBaseLocation = checkBase.substring(checkBase.indexOf(":"), checkBase.indexOf("-")).replaceAll(":", "");
		String checkBaseBrowser = checkBase.substring(checkBase.indexOf("-"), checkBase.lastIndexOf("-")).replaceAll("-", "");
		String checkBaseConnection = checkBase.substring(checkBase.lastIndexOf("-")).replaceAll("-", "").replaceAll("[0-9//:]", "");
		
		// 헤더 정보 (SSL 컬럼 유/무)
		boolean headerSSL = false;
		if (tableHeaderEles.size() == 11) {
			headerSSL = false;
		} else if (tableHeaderEles.size() == 12) {
			headerSSL = true;
		}			
		
		int statNo;
		String statResource = "";
		String statType = "";
		String statTypeCode = "";
		Double statOffset;
		int statDNS;
		int statConn;
		int statSSL;
		int statTTFB;
		int statContent;
		Double statByte;
		int statCode;
		String statIP = ""; 
		String statLocation = "no more location 3/12";
		String statEventType = "";
		
		// 컬럼 값
		for (int i = 0; i < tableRowEles.size(); i++) {
			PortalModel stats = new PortalModel();
			
			Element row = tableRowEles.get(i);
			Elements rowItems = row.select("td");
			
			// 컬럼 값 셋팅, 단위는 자르고 -는 0으로 치환
			statNo = Integer.parseInt(rowItems.get(0).text());
			statResource = rowItems.get(1).select("a").attr("title");
			statType = rowItems.get(2).text();
			
			// 2015-01-23 작업중 시작
			
			// statTypeCode 변환
			// image = 1, js = 2, html = 3, css = 4, flash = 5, other = 6, font = 7
			if ( statType.indexOf("image") == 0 ) {
				statTypeCode = "1";
			} else if ( statType.indexOf("text") == 0 ) {
				if ( statType.indexOf("html") > 0 ) {
					statTypeCode = "3";
				} else if ( statType.indexOf("css") > 0 ) {
					statTypeCode = "4";
				}
			} else if ( statType.indexOf("application") == 0 ) {
				if ( statType.indexOf("javascript") > 0 ) {
					statTypeCode = "2";
				} else if ( statType.indexOf("flash") > 0 ) {
					statTypeCode = "5";
				}
			}
				
			// 2015-01-23 작업중 끝
			
			statOffset = Double.parseDouble(rowItems.get(3).text().substring(0,rowItems.get(3).text().lastIndexOf(" s"))); 
			if ("-".equals(rowItems.get(4).text())) {
				statDNS = 0;
			} else {
				statDNS = Integer.parseInt(rowItems.get(4).text().substring(0, rowItems.get(4).text().lastIndexOf(" ms")));
			}
			if ("-".equals(rowItems.get(5).text())) {
				statConn = 0;
			} else {
				statConn = Integer.parseInt(rowItems.get(5).text().substring(0, rowItems.get(5).text().lastIndexOf(" ms")));
			}
			// (SSL 컬럼 유/무)
			int k = 6;
			if (headerSSL) {
				if ("-".equals(rowItems.get(k).text())) {
					statSSL = 0;
				} else {
					statSSL = Integer.parseInt(rowItems.get(k).text().substring(0, rowItems.get(k).text().lastIndexOf(" ms")));
				}	
				if ("-".equals(rowItems.get(k + 1).text())) {
					statTTFB = 0;
				} else {
					statTTFB = Integer.parseInt(rowItems.get(k + 1).text().substring(0, rowItems.get(k + 1).text().lastIndexOf(" ms")));
				}
				if ("-".equals(rowItems.get(k + 2).text())) {
					statContent = 0;
				} else {
					statContent =Integer.parseInt(rowItems.get(k + 2).text().substring(0, rowItems.get(k + 2).text().lastIndexOf(" ms")));
				}
				if ("-".equals(rowItems.get(k + 3).text())) {
					statByte = (double) 0;
				} else {
					statByte = Double.parseDouble(rowItems.get(k + 3).text().replaceAll(",","").substring(0, rowItems.get(k + 3).text().lastIndexOf(" KB")));
				}
				statCode = Integer.parseInt(rowItems.get(k + 4).text());
				statIP = rowItems.get(k + 5).text();
				//statLocation = rowItems.get(k + 6).text();
			} else {
				statSSL = 0;
				if ("-".equals(rowItems.get(k).text())) {
					statTTFB = 0;
				} else {
					statTTFB = Integer.parseInt(rowItems.get(k).text().substring(0, rowItems.get(k).text().lastIndexOf(" ms")));
				}
				if ("-".equals(rowItems.get(k + 1).text())) {
					statContent = 0;
				} else {
					statContent =Integer.parseInt(rowItems.get(k + 1).text().substring(0, rowItems.get(k + 1).text().lastIndexOf(" ms")));
				}
				if ("-".equals(rowItems.get(k + 2).text())) {
					statByte = (double) 0;
				} else {
					statByte = Double.parseDouble(rowItems.get(k + 2).text().replaceAll(",","").substring(0, rowItems.get(k + 2).text().lastIndexOf(" KB")));
				}
				statCode = Integer.parseInt(rowItems.get(k + 3).text());
				statIP = rowItems.get(k + 4).text();
				//statLocation = rowItems.get(k + 5).text();
			}
			
			// 로드 이벤트 분류
			// oddRender = 1, evenRender = 2, oddDoc = 3, evenDoc = 4, odd = 5, even = 6, etc = 7
			// 1 ~ 4 = document complete, 5 ~ 6 = fully loaded, 7 = error?
			if ( rowItems.get(0).className().substring(7).equals("oddRender") ) {
				statEventType = "1";
			} else if ( rowItems.get(0).className().substring(7).equals("evenRender") ) {
				statEventType = "2";
			} else if ( rowItems.get(0).className().substring(7).equals("oddDoc") ) {
				statEventType = "3";
			} else if ( rowItems.get(0).className().substring(7).equals("evenDoc") ) {
				statEventType = "4";
			} else if ( rowItems.get(0).className().substring(7).equals("odd") ) {
				statEventType = "5";
			} else if ( rowItems.get(0).className().substring(7).equals("even") ) {
				statEventType = "6";
			} else {
				statEventType = "7";
			}
			
			// stats에 할당
			stats.setCheckDate(checkDate);
			stats.setPortalCode(portalCode);	
			stats.setCheckUrl(checkUrl);
			stats.setPortalName(portalName);
			stats.setStatNo(statNo);
			stats.setStatResource(statResource);
			stats.setStatType(statType);
			stats.setStatOffset(statOffset);
			stats.setStatDNS(statDNS);
			stats.setStatConn(statConn);
			stats.setStatSSL(statSSL);
			stats.setStatTTFB(statTTFB);
			stats.setStatContent(statContent);
			stats.setStatByte(statByte);
			stats.setStatCode(statCode);
			stats.setStatIP(statIP);
			stats.setStatLocation(statLocation);
			stats.setStatTypeCode(statTypeCode);
			stats.setStatEventType(statEventType);
			stats.setCheckBaseLocation(checkBaseLocation);
			stats.setCheckBaseBrowser(checkBaseBrowser);
			stats.setCheckBaseConnection(checkBaseConnection);
			
			portalService.insertWebPageTest(stats);
		}
		
		return mav;
	}
	
	/**
	 * 포털별 webPageTest 측정값 일자-회차 별 목록 조회
	 * @param request
	 * @param response
	 * @param pCode 포털코드
	 * @return ModelAndView
	 * @throws Exception
	 */
	@RequestMapping(value = "/portalViewList.sk", method = RequestMethod.GET)
	public ModelAndView getWebPageTestByDateSeq(HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam(value = "pCode") String portalCode) throws Exception {
		
		// return 되는 modelAndView 생성 및 설정
		ModelAndView mav = new ModelAndView("portal/portal_view_list");
		// 포털별 webPageTest 측정값 불러오기
		ArrayList<PortalModel> stats = portalService.getWebPageTestByDateSeq(portalCode);
		
		// 화면에 파라미터 담기
		mav.addObject("pCode", portalCode);
		// 화면에 결과 담기
		mav.addObject("stats", stats);

		return mav;
	}
	
	/**
	 * 포털별 회차의 webPageTest 측정값 불러오기
	 * @param request
	 * @param response
	 * @param pCode 포털코드
	 * @param cDate 테스트일자
	 * @return ModelAndView
	 * @throws Exception
	 */
	@RequestMapping(value = "/portalViewDetail.sk", method = RequestMethod.GET)
	public ModelAndView getWebPageTest(HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam(value = "pCode") String portalCode,
			@RequestParam(value = "cDate") String checkDate) throws Exception {
		
		// return 되는 modelAndView 생성 및 설정
		ModelAndView mav = new ModelAndView("portal/portal_view_detail");
		// 포털별 webPageTest 측정값 불러오기
		ArrayList<PortalModel> stats = portalService.getWebPageTest(checkDate, portalCode);
		// summary 값 불러오기
		ArrayList<PortalModel> summary = portalService.getWebPageTestSummary(checkDate, portalCode);
		
		// 화면에 결과 담기
		mav.addObject("stats", stats);
		mav.addObject("summary", summary);

		return mav;
	}
	
	/**
	 * 포털-일자-회차 단위별 WebPageTest 측정값 Summary 조회
	 * @param request
	 * @param response
	 * @param pCode 포털코드
	 * @param cDate 테스트일자
	 * @param seq 테스트회차 
	 * @return ModelAndView
	 * @throws Exception
	 */
	@RequestMapping(value = "/portalViewSummary.sk", method = RequestMethod.GET)
	public ModelAndView getWebPageTestSummary(HttpServletRequest request, 
			HttpServletResponse response,
			@RequestParam(value = "pCode") String portalCode,
			@RequestParam(value = "cDate") String checkDate) throws Exception {

		// return 되는 modelAndView 생성 및 설정
		ModelAndView mav = new ModelAndView("portal/portal_view_summary");
		
		// summary 값 불러오기
		ArrayList<PortalModel> summary = portalService.getWebPageTestSummary(checkDate, portalCode);
		
		// 화면에 결과 담기
		mav.addObject("summary", summary);

		return mav;
	}
	
	/**
	 * 기간별 Summary 조회 페이지
	 * @param request
	 * @param response
	 * @param sDate 시작일자
	 * @param eDate 종료일자
	 * @param pCode 포털코드
	 * @return ModelAndView
	 * @throws Exception
	 */
	@RequestMapping(value = "/summaryView.sk", method = RequestMethod.GET)
	public ModelAndView summaryView(HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam(value = "sDate", required = false) String sDate,
			@RequestParam(value = "eDate", required = false) String eDate,
			@RequestParam(value = "pCode", required = false) String portalCode) throws Exception {
	
		// return 되는 modelAndView 생성 및 설정
		ModelAndView mav = new ModelAndView("portal/portal_summary");
		
		// 조회조건이 있는경우에만 summary 조회 수행
		if ( sDate != null && eDate != null ) {
			List<PortalModel> resultList = getSummaryList(request, response, sDate, eDate, portalCode);
			
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
	@RequestMapping(value = "/getSummaryList", method = RequestMethod.POST)
	public List<PortalModel> getSummaryList(HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam(value = "sDate") String sDate,
			@RequestParam(value = "eDate") String eDate,
			@RequestParam(value = "pCode") String portalCode) throws Exception {
		List<PortalModel> resultList = new ArrayList<PortalModel>();
		
		try {
			// summary 값 불러오기
			resultList = portalService.getSummaryByDate(sDate, eDate, portalCode);
		} catch (Exception e) {
			log.error("PortalController.getSummaryList.error : " + e.getMessage());
			e.printStackTrace();
		}
		
		return resultList;
	}
}