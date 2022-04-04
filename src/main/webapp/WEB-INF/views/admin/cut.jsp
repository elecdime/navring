<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
<!DOCTYPE html>
<html>

  <script src="//ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin.css">
<head>
<meta charset="UTF-8">
<title>나브링 짤릴친구들..</title>
</head>
<body>


<c:choose>

 	<c:when test ="${login == null}">
	                 <script type="text/javascript">
	                  alert("로그인후 이용해주세요");
	                  location.href='/admin/login'
	                 </script>
	                           
	                   
                    	</c:when>
                    	<c:otherwise>

<%@include file="../inc/head.jsp"%>
        <!--  left menu -->
  	<%@include file="../inc/left.jsp"%>

          <!--  seller_wrap  -->
    <form name="flist" class="local_sch01 local_sch" action="/admin/userlist" method="POST">

                <div class="formTitle">회원 리스트 <span>토벌전 2주미참 or 기여도 못채운인원 </span></div>
             

             

                <form name="signForm" method="post" onsubmit="return false;">

                    <table class="listTbl fixed">
               <colgroup>
                      
                            <col width="100">
                            <col width="100">
                            <col width="50">
                             <col width="100">
                            <col width="100">
                            <col width="200">
                             <col width="100">
                            <col width="300">
                          <col width="10">
                        </colgroup>
                        
                        <tbody>
                            <tr align="center" bgcolor="#5e718f">
                        
                                <th class="listTitle">닉네임</th>
                                <th class="listTitle">레벨</th>
                                <th class="listTitle">직업</th>
                                <th class="listTitle">마지막토벌전</th>
                                <th class="listTitle">기여도 달성</th>
                                <th class="listTitle">특이사항</th>
                                <th class="listTitle">경고횟수</th>
                                <th class="listTitle">경고사유</th>
                                 <th class="listTitle">기여도 채움여부</th>
                            </tr>
                            
                           <!-- jspl -->
                           
                        <c:forEach items="${memberList}" var = "memberList">
                           
                            <tr> 
                       
                                <td class="listData">
                                	<c:out value="${memberList.name}" />
                                </td>
                                <td class="listData">
                                	<c:out value="${memberList.lv}" /> 
                                </td>
                                    <td class="listData">
                                	<c:out value="${memberList.role}" /> 
                                </td>
                                <td class="listData">
                                	<c:out value="${memberList.real_tobal}"/>
                                </td>
                                <td class="listData">
                                	<c:out value="${memberList.sooncut}" /> 
                                </td>
                                <td class="listData">
                                	<c:out value="${memberList.issu}" />
                                </td>
                                <td class="listData">
                                	<c:out value="${memberList.yellowCard}" /> 
                                </td>
                                <td class="listData">
                                	<c:out value="${memberList.yellowCardWhy}" /> 
                                </td>
                                  <td class="listData">
                                	<c:out value="${memberList.sooncut}" /> 
                                </td>
                                
                            </tr>
                            
                           </c:forEach>
                            
                           
                        </tbody>
                    </table>
                </form>
            </div>
            </form>


    <script>
        $(document).ready(function() {
            $(".seller_menu_tit").click(function() {
                $(".seller_menu_con").removeClass('on');
                $(this).parent().find(".seller_menu_con").toggleClass('on');
            });
        });
    </script>
    <script type="text/javascript">
    var cookieName = "item";
    var splitStr = "/";
     
    $(document).ready(function(e){
        // 이전에 체크됐던 아이템들을 체크해준다.
        checkChkCookie(cookieName, "/", "chkValue");
     
        var checkedCnt = getChkCookieCnt(cookieName, "/", "chkValue");
        if(checkedCnt > 0){
            // 체크될 때마다 그 개수를 버튼명에 집어넣거나..
            //$("#btn").text("선택(" +checkedCnt + "개) 저장");
        }else{
            // 체크한 아이템이 없을 경우 다시 버튼명 변경..
            //$("#btn").text("선택한 것 없음");
        }
     
        // 신규 체크가 발생할 경우 실행.
        chkBoxCookie(cookieName, "/", "allCheck", "chk", "chk", "chkValue", "changeMigBtnName");
    });
     
    function checkAll(flag) {
        if(flag) {
            $("input[type=checkbox]").prop("checked", true);
        }else{
            $("input[type=checkbox]").prop("checked", false);
     
            $("#chkValue").val("");
            //$("#btn").text("선택한 것 없음");
     
            // 쿠키 삭제
            deleteCookie(cookieName);
        }
    }
     
    /**
     * 체크박스 체크 후 페이지를 이동해도 이전에 체크했던 기록이 남아있도록.
     * @param cookieName : 저장할 쿠키명
     * @param splitStr : 구분자 ex) "/"
     * @param chkAllId : 전체체크 체크박스 id
     * @param chkName : 목록 체크박스 name
     * @param chkClassName : 목록 체크박스 classname
     * @param basketId : 체크된 쿠키값을 들고 있을 input hidden id
     * @param funcName : 체크박스 동작 수행 후, 실행되어야 할 함수명
     * @returns
     */
    function chkBoxCookie(cookieName, splitStr, chkAllId, chkName, chkClassName, basketId, funcName){
        $("#"+chkAllId).click(function(){
            // 만약 전체 선택 체크박스가 체크된 상태일 경우
            if($("#"+chkAllId).prop("checked")) {
                // 화면 전체 checkbox들을 체크해준다
                $("input[type=checkbox]").prop("checked", true);
     
                var isExistOldCookie = false;
                var oldCookie = getCookie(cookieName);
                if(oldCookie != "") isExistOldCookie = true;
                var chkValue = "";
     
                if(isExistOldCookie){
                    chkValue = oldCookie;
                    var oldCookieArray = oldCookie.split(splitStr);
                    $("." + chkClassName + ":checked").each(function(i) {
                        for (var i = 0; i < oldCookieArray.length; i++) {
                            var checkedValue = $(this).val(); // 체크되어 있는 값
                            var oldV = oldCookieArray[i];
     
                            // 기존 체크한 쿠키와 전체로 체크한 쿠키가 같지 않다면,
                            if(oldCookieArray[i] != checkedValue && chkValue.indexOf(checkedValue) == -1){
                                chkValue += splitStr + checkedValue;
                            }
                        }
                    });
                }else{ // 기존 체크한 쿠키가 아예 없다면,
                    $("." + chkClassName + ":checked").each(function(i) {
                        var checkedValue = $(this).val(); // 체크되어 있는 값
                        var lastValue = $(".chk:checked:last").val();
     
                        if(lastValue == checkedValue){
                            chkValue += checkedValue;
                        }else{
                            chkValue += checkedValue + splitStr;
                        }
                    });
                }
     
                setCookie(cookieName, chkValue, null);
     
                // hidden에 값 넘기기
                $("#" + basketId).val(chkValue);
     
                var chkValueArray = chkValue.split(splitStr);
     
                if(funcName != "") window[funcName](chkValueArray); // 버튼명 변경
            } else {
                var oldCookie = getCookie(cookieName);
                var oldCookieArray = oldCookie.split(splitStr);
     
                $("." + chkClassName + ":checked").each(function(i) {
                    var allValue = $(this).val(); // 체크되어있는 값
                    oldCookieArray = removeA(oldCookieArray, allValue);
                });
     
                // 화면의 모든 checkbox들의 체크를 해제시킨다.
                $("input[type=checkbox]").prop("checked", false);
     
                var chkValue = oldCookieArray.join(splitStr);
     
                setCookie(cookieName, chkValue, null);
     
                // hidden에 값 넘기기
                $("#" + basketId).val(chkValue);
     
                if(funcName != "") window[funcName](oldCookieArray); // 버튼명 변경
            }
        });
     
        $("input:checkbox[name='"+ chkName + "']").change(function(){ // 목록 체크박스에 변화가 있다면,
            var chkValue = $(this).val();
            var oldCookie = getCookie(cookieName);
     
            if($("input:checkbox[id='" + chkValue + "']").is(":checked")){ // 체크했을 때,
                if(oldCookie != ""){ // 기존에 체크했던 쿠키가 있다면,
                    chkValue = oldCookie + splitStr + chkValue;
                }
     
                setCookie(cookieName, chkValue, null);
     
                var chkValueArray = chkValue.split(splitStr);
                if(funcName != "") window[funcName](chkValueArray); // 버튼명 변경
            }else{ // 체크 해제 시,
                var oldCookieArray = oldCookie.split(splitStr);
     
                for (var i = 0; i < oldCookieArray.length; i++) {
                    if(oldCookieArray[i] == chkValue){
                        oldCookieArray.splice(i, 1);
                    }
                }
     
                var oldCookieStr = oldCookieArray.join(splitStr);
     
                setCookie(cookieName, oldCookieStr, null);
     
                var chkValueArray = oldCookieStr.split(splitStr);
                if(funcName != "") window[funcName](chkValueArray); // 버튼명 변경
            }
     
            // hidden에 값 넘기기
            $("#" + basketId).val(chkValue);
        });
    }
     
    function changeBtnName(valueArray){
        var checkedCnt = valueArray.length;
        if(checkedCnt > 0){
            //$("#btn").text("선택(" +checkedCnt + "개) 저장");
        }else{
            //$("#btn").text("선택한 것 없음");
        }
    }
     
    /**
     * 체크된 쿠키 개수 반환
     * @param cookieName
     * @param splitStr
     * @param basketId
     * @returns
     */
    function getChkCookieCnt(cookieName, splitStr, basketId){
        var cookiesStr = getCookie(cookieName);
        var checkedCnt = 0;
        if(cookiesStr != ""){
            var cookieArray = cookiesStr.split(splitStr);
            checkedCnt = cookieArray.length;
        }
     
        return checkedCnt;
    }
     
    /**
     * 저장된 쿠키를 불러와서 체크박스 체크
     * @param cookieName
     * @param splitStr
     * @param basketId
     * @returns
     */
    function checkChkCookie(cookieName, splitStr, basketId){
        var cookiesStr = getCookie(cookieName);
        $("#"+basketId).val(cookiesStr);
        if(cookiesStr != ""){
            var cookieArray = cookiesStr.split(splitStr);
            for (var i = 0; i < cookieArray.length; i++) {
                $("input:checkbox[id='" + cookieArray[i] + "']").prop("checked", true);
            }
        }
    }
     
    function setCookie(cookieName, value, exdays){
        var exdate = new Date();
        exdate.setDate(exdate.getDate() + exdays);
        var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
        document.cookie = cookieName + "=" + cookieValue;
    }
     
    function deleteCookie(cookieName){
        var expireDate = new Date();
        expireDate.setDate(expireDate.getDate() - 1);
        document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
    }
     
    function getCookie(cookieName) {
        cookieName = cookieName + '=';
        var cookieData = document.cookie;
        var start = cookieData.indexOf(cookieName);
        var cookieValue = '';
        if(start != -1){
            start += cookieName.length;
            var end = cookieData.indexOf(';', start);
            if(end == -1)end = cookieData.length;
            cookieValue = cookieData.substring(start, end);
        }
        return unescape(cookieValue);
    }
     
    /**
     * 배열에서 값으로 삭제하기
     * @param arr
     * @returns
     */
    function removeA(arr) {
        var what, a = arguments, L = a.length, ax;
        while (L > 1 && arr.length) {
            what = a[--L];
            while ((ax = arr.indexOf(what)) !== -1) {
                arr.splice(ax, 1);
            }
        }
        return arr;
    }
    
    
    </script>
</c:otherwise>
</c:choose>
</body>
</html>
