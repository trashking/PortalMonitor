/***************************************************************************
 * Name			: submitToURL
 * Desc			: 해당 주소로 form 을 hidden으로 생성하여 submit 처리한다.
 * @param		: 전송 URL
 * 				  params : 전송 데이터 {'q':'a','s':'b','c':'d'...}으로 묶어서 배열 입력
 * 				  method : 전송 방식(생략가능)
 * @returns		: 
 * @since		: 2014. 09. 13.
 ***************************************************************************/
function submitToURL(path, params, method) {
	method = method || "post"; // Set method to post by default, if not specified.
	
	// The rest of this code assumes you are not using a library.
	// It can be made less wordy if you use one.
	var form = document.createElement("form");
	
	form.setAttribute("method", method);
	form.setAttribute("action", path);
	
	for(var key in params) {
		
		var hiddenField = document.createElement("input");
		
		hiddenField.setAttribute("type", "hidden");
		hiddenField.setAttribute("name", key);
		hiddenField.setAttribute("value", params[key]);
		
		form.appendChild(hiddenField);
		
	}
	
	document.body.appendChild(form);
	form.submit();
}

// 화면로딩후 실행되는 function
$(document).ready(function() {
	// 조회버튼 클릭
	$(".btn").click(function() {
		getSummary();
	});
});

// 조회하기
function getSummary() {
	var portalCode = $("#portal-code option:selected").val();
	var sDate = $("#sDate").val().replace(/-/gi,"");
	var eDate = $("#eDate").val().replace(/-/gi,"");
	
	if ( portalCode == 'none' ) {
		alert("조회하실 포털사이트를 선택해 주세요.");
		
		return false;
	}
	
	submitToURL("/PortalMonitor/summaryKc.sk", { 'pCode' : portalCode , 'sDate' : sDate, 'eDate' : eDate }, 'get' );
}