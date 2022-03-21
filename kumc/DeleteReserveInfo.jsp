<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/inc_prg/common.jsp"%>
<%
	// 전달자료
	HashMap<String, Object> htHeader = null;
	HashMap<String, String> htBody = null;
	Vector<Object> vcAddItemList = null;

	// DB객체
	Statement stmtExec = null;
	Statement stmtList = null;

	ResultSet rsList = null;

	CRs cRsList = null;

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

		//
		if(RSVID == null) { RSVID = ""; }


		// DB객체
		stmtExec = connect.createStatement();
		stmtList = connect.createStatement();

		String ExecYN = ""; //삭제 여부

		sql = " SELECT RRT_RSVN_NO, RRT_CNCL_YN ";
		sql += " FROM RT_RSVT_WEBPAGE";
		sql += " WHERE RRT_RSVN_NO = '" + RSVID + "' ";
		sql += "   AND RRT_WEB_ID IS NULL ";

		rsList = stmtList.executeQuery(sql);
		if(rsList.next()) {
			ExecYN = "Y";

			sql = " UPDATE RT_RSVT_WEBPAGE SET RRT_CNCL_YN = '" + ExecYN + "' ";
			sql += " WHERE RRT_RSVN_NO = '" + RSVID + "' ";

			stmtExec.executeUpdate(sql);

		} else {
			ExecYN = "N";
		}

		rsList.close();


			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : DeleteReserveInfo \n";
			G_INFO += "설명 : 18. 건강검진 가예약 취소 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " RSVID : " + RSVID + " \n";
			G_INFO += "\n\n";

			G_INFO += "질의문 : " + sql + " \n";
			G_INFO += "-->";

		rsList = stmtList.executeQuery(sql);
		cRsList = new CRs(rsList);

		out.clear();		// include된 파일안의 공백 제거
		response.addHeader("Content-type", "text/xml");
%><?xml version="1.0" encoding="UTF-8"?>

<%= G_INFO%>

<KUMC>
    <Header>
        <ServiceID>DeleteReserveInfo</ServiceID>
        <Result>
            <ResultCode>00</ResultCode>
            <ResultMessage></ResultMessage>
        </Result>
    </Header>
    <Body>
        <IsComplete><%= ExecYN%></IsComplete>
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
        <ServiceID>DeleteReserveInfo</ServiceID>
        <Result>
            <ResultCode>99</ResultCode>
            <ResultMessage><![CDATA[<%= e.toString()%>]]></ResultMessage>
            <sql><![CDATA[<%= sql%>]]></sql>
        </Result>
    </Header>
    <Body>
    </Body>
</KUMC>

<%
	} finally {

		if(rsList != null) {
			rsList.close();
			rsList = null;
		}

		if(stmtList != null) {
			stmtList.close();
			stmtList = null;
		}

		if(stmtExec != null) {
			stmtExec.close();
			stmtExec = null;
		}
%>
<%@ include file="/inc_prg/disconnect.jsp"%>
<%
	}
%>