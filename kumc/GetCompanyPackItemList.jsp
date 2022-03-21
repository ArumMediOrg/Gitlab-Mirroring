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

		String PACKCODE = htBody.get("PACKCODE");

		//
		if(PACKCODE == null) { PACKCODE = ""; }

		// DB객체
		stmtList = connect.createStatement();

		sql = " SELECT A.ECI_ITEM_CD ITEM_CD";
		sql += ", (SELECT IIM_KNME_NM FROM IT_ITEM WHERE IIM_ITEM_CD = A.ECI_ITEM_CD) AS ITEM_NM";
		sql += ", A.ECI_CNRT_PR ITEM_PR";
		sql += " FROM ET_COMP_CNRT_PROF_ITEM A, (";
		sql += "	SELECT SUBSTR('" + PACKCODE + "', 1, INSTR('" + PACKCODE + "', '-', 1) - 1) COMP_CD";
		sql += "	, SUBSTR('" + PACKCODE + "', INSTR('" + PACKCODE + "', '-', 1, 1) + 1, 4) MNGT_YR";
		sql += "	, SUBSTR('" + PACKCODE + "', INSTR('" + PACKCODE + "', '-', 1, 2) + 1, 5) EXAM_CD";
		sql += "	, SUBSTR('" + PACKCODE + "', INSTR('" + PACKCODE + "', '-', 1, 3) + 1, 2) PROF_SQ";
		sql += " 	FROM DUAL";
		sql += " ) INPARAM";
		sql += " WHERE A.ECI_COMP_CD = INPARAM.COMP_CD";
		sql += " AND ECI_MNGT_YR = INPARAM.MNGT_YR";
		sql += " AND ECI_CNRT_SQ = '01'";
		sql += " AND ECI_PROF_SQ = INPARAM.PROF_SQ";
		sql += " ORDER BY A.ECI_SORT_SQ";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : GetCompanyPackItemList \n";
			G_INFO += "설명 : 08. 기업 건강검진 프로그램별 검진 목록 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " PACKCODE : " + PACKCODE + " \n";
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
        <ServiceID>GetCompanyPackItemList</ServiceID>
        <Result>
            <ResultCode>00</ResultCode>
            <ResultMessage></ResultMessage>
        </Result>
    </Header>
    <Body>
        <ItemList>
<%
		int cnt = 0;
		while(cRsList.next()) {

			cnt++;
%>
            <Item>
                <ItemCode><%=cRsList.getString("ITEM_CD")%></ItemCode>
                <ItemName><%=cRsList.getString("ITEM_NM")%></ItemName>
                <ItemCost><%=cRsList.getString("ITEM_PR")%></ItemCost>
            </Item>
<%
		}
%>
        </ItemList>
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
        <ServiceID>GetCompanyPackItemList</ServiceID>
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