<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/inc_prg/common.jsp"%>
<%
	// 전달자료
	HashMap<String, Object> htHeader = null;
	HashMap<String, String> htBody = null;

	// DB객체
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

		String RSVHOMEPAGE = htBody.get("RSVHOMEPAGE");
		String STARTDATE = htBody.get("STARTDATE");
		String ENDDATE = htBody.get("ENDDATE");

		//
		if(RSVHOMEPAGE == null) { RSVHOMEPAGE = ""; }
		if(STARTDATE == null) { STARTDATE = ""; }
		if(ENDDATE == null) { ENDDATE = ""; }

		// DB객체
		stmtList = connect.createStatement();

		if(RSVHOMEPAGE.equals("A")) {

			sql = " SELECT DATELIST, SUM(WEBCOUNT) DATELISTCNT";
			sql += " FROM ( SELECT A.DATELIST, NVL(RT_RSVT.WEBCOUNT, 0) WEBCOUNT";
			sql += " FROM ( SELECT TO_CHAR(TO_DATE('" + STARTDATE + "', 'YYYY-MM-DD') + ROWNUM - 1, 'YYYY-MM-DD') AS DATELIST";
			sql += " FROM ALL_OBJECTS";
			sql += " WHERE ROWNUM <= TO_NUMBER(TO_DATE('" + ENDDATE + "')-TO_DATE('" + STARTDATE + "') + 1) ) A LEFT OUTER JOIN (SELECT RRT_EXAM_DT, COUNT(RRT_EXAM_DT) WEBCOUNT, RRT_WEB_ID";
			sql += " FROM RT_RSVT";
			sql += " GROUP BY RRT_EXAM_DT, RRT_WEB_ID) RT_RSVT";
			sql += " ON A.DATELIST = RT_RSVT.RRT_EXAM_DT";
			sql += " WHERE (RT_RSVT.RRT_WEB_ID IS NULL)";
			sql += " OR (RT_RSVT.RRT_WEB_ID <> 'Y')";
			sql += " UNION";
			sql += " ALL SELECT A.DATELIST, NVL(RT_RSVT.WEBCOUNT, 0) WEBCOUNT";
			sql += " FROM ( SELECT TO_CHAR(TO_DATE('" + STARTDATE + "', 'YYYY-MM-DD') + ROWNUM - 1, 'YYYY-MM-DD') AS DATELIST";
			sql += " FROM ALL_OBJECTS";
			sql += " WHERE ROWNUM <= TO_NUMBER(TO_DATE('" + ENDDATE + "')-TO_DATE('" + STARTDATE + "') + 1) ) A LEFT OUTER JOIN (SELECT RRT_EXAM_DT, COUNT(RRT_EXAM_DT) WEBCOUNT, RRT_WEB_ID";
			sql += " FROM RT_RSVT_WEBPAGE";
			sql += " GROUP BY RRT_EXAM_DT, RRT_WEB_ID) RT_RSVT";
			sql += " ON A.DATELIST = RT_RSVT.RRT_EXAM_DT )";
			sql += " GROUP BY DATELIST, WEBCOUNT";
			sql += " ORDER BY DATELIST";
		} else if(RSVHOMEPAGE.equals("Y")) {

			sql = " SELECT DATELIST, SUM(WEBCOUNT) DATELISTCNT";
			sql += " FROM ( SELECT A.DATELIST, NVL(RT_RSVT.WEBCOUNT, 0) WEBCOUNT";
			sql += " FROM ( SELECT TO_CHAR(TO_DATE('" + STARTDATE + "', 'YYYY-MM-DD') + ROWNUM - 1, 'YYYY-MM-DD') AS DATELIST";
			sql += " FROM ALL_OBJECTS";
			sql += " WHERE ROWNUM <= TO_NUMBER(TO_DATE('" + ENDDATE + "')-TO_DATE('" + STARTDATE + "') + 1) ) A LEFT OUTER JOIN (SELECT RRT_EXAM_DT, COUNT(RRT_EXAM_DT) WEBCOUNT, RRT_WEB_ID";
			sql += " FROM RT_RSVT_WEBPAGE";
			sql += " WHERE NVL(RRT_CNCL_YN, 'N') <> 'Y' ";
			sql += " GROUP BY RRT_EXAM_DT, RRT_WEB_ID) RT_RSVT";
			sql += " ON A.DATELIST = RT_RSVT.RRT_EXAM_DT )";
			sql += " GROUP BY DATELIST, WEBCOUNT";
			sql += " ORDER BY DATELIST";
		} else if(RSVHOMEPAGE.equals("N")) {

			sql = " SELECT DATELIST, SUM(WEBCOUNT) DATELISTCNT";
			sql += " FROM ( SELECT A.DATELIST, NVL(RT_RSVT.WEBCOUNT, 0) WEBCOUNT";
			sql += " FROM ( SELECT TO_CHAR(TO_DATE('" + STARTDATE + "', 'YYYY-MM-DD') + ROWNUM - 1, 'YYYY-MM-DD') AS DATELIST";
			sql += " FROM ALL_OBJECTS";
			sql += " WHERE ROWNUM <= TO_NUMBER(TO_DATE('" + ENDDATE + "')-TO_DATE('" + STARTDATE + "') + 1) ) A LEFT OUTER JOIN (SELECT RRT_EXAM_DT, COUNT(RRT_EXAM_DT) WEBCOUNT, RRT_WEB_ID";
			sql += " FROM RT_RSVT";
			sql += " WHERE NVL(RRT_CNCL_YN, 'N') <> 'Y' ";
			sql += " GROUP BY RRT_EXAM_DT, RRT_WEB_ID) RT_RSVT";
			sql += " ON A.DATELIST = RT_RSVT.RRT_EXAM_DT";
			sql += " WHERE (RT_RSVT.RRT_WEB_ID IS NULL)";
			sql += " OR (RT_RSVT.RRT_WEB_ID <> 'Y') )";
			sql += " GROUP BY DATELIST, WEBCOUNT";
			sql += " ORDER BY DATELIST";
		}

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : GetReservedNumber \n";
			G_INFO += "설명 : 16. 건강검진 예약 건수 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " RSVHOMEPAGE : " + RSVHOMEPAGE + " \n";
			G_INFO += " STARTDATE : " + STARTDATE + " \n";
			G_INFO += " ENDDATE : " + ENDDATE + " \n";
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
        <ServiceID>GetReservedNumber</ServiceID>
        <Result>
            <ResultCode>00</ResultCode>
            <ResultMessage></ResultMessage>
        </Result>
    </Header>
    <Body>
        <ReservedList>
<%
		int cnt = 0;
		while(cRsList.next()) {

			cnt++;
%>
            <Reserve>
                <RsvDate><%=cRsList.getString("DATELIST")%></RsvDate>
                <RsvNumber><%=cRsList.getString("DATELISTCNT")%></RsvNumber>
            </Reserve>
<%
		}
%>
        </ReservedList>
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
        <ServiceID>GetReservedNumber</ServiceID>
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

		if(rsList != null) {
			rsList.close();
			rsList = null;
		}

		if(stmtList != null) {
			stmtList.close();
			stmtList = null;
		}
%>
<%@ include file="/inc_prg/disconnect.jsp"%>
<%
	}
%>