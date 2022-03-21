<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/inc_prg/common.jsp"%>
<%
	// 전달자료
	HashMap<String, Object> htHeader = null;
	HashMap<String, String> htBody = null;

	// DB객체
	Statement stmtExec = null;

	//
	String G_INFO = "";

	try {
%>
<%@ include file="/inc_prg/connect.jsp"%>
<%
		// 전달자료
		htHeader = (HashMap<String, Object>)request.getAttribute("htHeader");
		htBody = (HashMap<String, String>)request.getAttribute("htBody");

		String RSVID = htBody.get("RSVID");
		String CUSTOMERUNIQUEID = htBody.get("CUSTOMERUNIQUEID");
		String CUSTOMERNAME = htBody.get("CUSTOMERNAME");
		String CUSTOMERGENDER = htBody.get("CUSTOMERGENDER");
		String CUSTOMERTEL = htBody.get("CUSTOMERTEL");
		String CUSTOMERAGE = htBody.get("CUSTOMERAGE");
		String CUSTOMERZIP = htBody.get("CUSTOMERZIP");
		String CUSTOMERADDR1 = htBody.get("CUSTOMERADDR1");
		String CUSTOMERADDR2 = htBody.get("CUSTOMERADDR2");
		String CUSTOMERMOBL = htBody.get("CUSTOMERMOBL");

		//
		if(RSVID == null) { RSVID = ""; }
		if(CUSTOMERUNIQUEID == null) { CUSTOMERUNIQUEID = ""; }
		if(CUSTOMERNAME == null) { CUSTOMERNAME = ""; }
		if(CUSTOMERGENDER == null) { CUSTOMERGENDER = ""; }
		if(CUSTOMERTEL == null) { CUSTOMERTEL = ""; }
		if(CUSTOMERAGE == null) { CUSTOMERAGE = ""; }
		if(CUSTOMERZIP == null) { CUSTOMERZIP = ""; }
		if(CUSTOMERADDR1 == null) { CUSTOMERADDR1 = ""; }
		if(CUSTOMERADDR2 == null) { CUSTOMERADDR2 = ""; }
		if(CUSTOMERMOBL == null) { CUSTOMERMOBL = ""; }

		CUSTOMERTEL = CUSTOMERTEL.replace("-", "");
		CUSTOMERMOBL = CUSTOMERMOBL.replace("-", "");
		// DB객체
		stmtExec = connect.createStatement();

		sql = "UPDATE RT_RSVT_WEBPAGE SET ";
		sql += "  RRT_CUST_NO = '" + CUSTOMERUNIQUEID + "'";
		sql += ", RRT_PSNL_NM = '" + CUSTOMERNAME + "'";
		sql += ", RRT_SEX_CD = '" + CUSTOMERGENDER + "'";
		sql += ", RRT_PSNL_AGE = '" + CUSTOMERAGE + "'";
		sql += ", RRT_TEL_NO = '" + CUSTOMERTEL + "'";
		sql += ", RRT_MOBL_NO = '" + CUSTOMERMOBL + "'";
		sql += ", RRT_ZIP_CD = '" + CUSTOMERZIP + "'";
		sql += ", RRT_ZIP_AR = '" + CUSTOMERADDR1 + "'";
		sql += ", RRT_ROAD_AR = '" + CUSTOMERADDR2 + "'";
		sql += " WHERE RRT_RSVN_NO = '" + RSVID + "'";

		stmtExec.executeUpdate(sql);

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : SetReserveCustomerInfo \n";
			G_INFO += "설명 : 11. 건강검진 예약내역 환자정보 수정 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " RSVID : " + RSVID + " \n";
			G_INFO += " CUSTOMERUNIQUEID : " + CUSTOMERUNIQUEID + " \n";
			G_INFO += " CUSTOMERNAME : " + CUSTOMERNAME + " \n";
			G_INFO += " CUSTOMERGENDER : " + CUSTOMERGENDER + " \n";
			G_INFO += " CUSTOMERTEL : " + CUSTOMERTEL + " \n";
			G_INFO += " CUSTOMERAGE : " + CUSTOMERAGE + " \n";
			G_INFO += " CUSTOMERZIP : " + CUSTOMERZIP + " \n";
			G_INFO += " CUSTOMERADDR1 : " + CUSTOMERADDR1 + " \n";
			G_INFO += " CUSTOMERADDR2 : " + CUSTOMERADDR2 + " \n";
			G_INFO += " CUSTOMERMOBL : " + CUSTOMERMOBL + " \n";
			G_INFO += "\n\n";

			G_INFO += "질의문 : " + sql + " \n";
			G_INFO += "-->";

		out.clear();		// include된 파일안의 공백 제거
		response.addHeader("Content-type", "text/xml");
%><?xml version="1.0" encoding="UTF-8"?>

<%= G_INFO%>

<KUMC>
    <Header>
        <ServiceID>SetReserveCustomerInfo</ServiceID>
        <Result>
            <ResultCode>00</ResultCode>
            <ResultMessage></ResultMessage>
        </Result>
    </Header>
    <Body>
    </Body>
</KUMC>

<%
	} catch (Exception e) {

		out.clear();		// include된 파일안의 공백 제거
		response.addHeader("Content-type", "text/xml");
%><?xml version="1.0" encoding="UTF-8"?>

<%= G_INFO%>

<KUMC>
    <Header>
        <ServiceID>SetReserveCustomerInfo</ServiceID>
        <Result>
            <ResultCode>99</ResultCode>
            <ResultMessage><![CDATA[<%= e.toString()%>]]></ResultMessage>
        </Result>
    </Header>
    <Body>
    </Body>
</KUMC>

<%
	} finally {

		if(stmtExec != null) {
			stmtExec.close();
			stmtExec = null;
		}
%>
<%@ include file="/inc_prg/disconnect.jsp"%>
<%
	}
%>