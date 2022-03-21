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

		String COMP_NM = htBody.get("COMP_NM");

		//
		if(COMP_NM == null) { COMP_NM = ""; }

		// DB객체
		stmtList = connect.createStatement();

		sql = " SELECT CCN_SMALL, CCN_NAME";
		sql += " FROM (";
		sql += "	SELECT ICY_COMP_CD CCN_SMALL, ICY_COMP_NM CCN_NAME, '' CCN_VALUE";
		sql += " 	FROM IT_COMPANY";
		sql += " 	WHERE ICY_COMP_NM LIKE '%" + COMP_NM + "%'";
		sql += " 	AND UPPER(NVL(ICY_USE_YN, 'Y')) = 'Y'";
		sql += " ) A";
		sql += " ORDER BY A.CCN_NAME";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : GetCompanyList \n";
			G_INFO += "설명 : 03. 기업코드 목록 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " COMP_NM : " + COMP_NM + " \n";
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
        <ServiceID>GetCompanyList</ServiceID>
        <Result>
            <ResultCode>00</ResultCode>
            <ResultMessage></ResultMessage>
        </Result>
    </Header>
    <Body>
       <CompanyList>
<%
		int cnt = 0;
		while(cRsList.next()) {

			cnt++;

			String CCN_SMALL = cRsList.getString("CCN_SMALL");
			String CCN_NAME = cRsList.getString("CCN_NAME");
%>
            <Company>
                <CompanyCode><%=CCN_SMALL%></CompanyCode>
                <CompanyName><%=CCN_NAME%></CompanyName>
            </Company>
<%
		}
%>
        </CompanyList>
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
        <ServiceID>GetCompanyList</ServiceID>
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