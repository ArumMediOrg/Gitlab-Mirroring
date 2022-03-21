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

		String PackCode = htBody.get("PACKCODE");

		//
		if(PackCode == null) { PackCode = ""; }

		//
		String EXAM_CD = PackCode;

		// DB객체
		stmtList = connect.createStatement();

		sql = " SELECT LTRIM(RTRIM(A.IIM_ITEM_CD)) ITEM_CD, LTRIM(RTRIM(A.IIM_KNME_NM)) ITEM_NM, I.EPI_SALE_PR EPI_SALE_PR";
		sql += " FROM ET_PACK_ITEM I, IT_ITEM A, IT_ITEM_PRICE B";
		sql += " WHERE I.EPI_EXAM_CD = SUBSTR('" + EXAM_CD + "', 1, 5)";
		sql += " AND I.EPI_PACK_SQ = SUBSTR('" + EXAM_CD + "', 7, 11)";
		sql += " AND A.IIM_ITEM_CD = I.EPI_ITEM_CD";
		sql += " AND B.IIP_APLY_DT = GETITEM_PRICE_APPLYDATE(A.IIM_ITEM_CD, '2999-12-31', 'ITEM_CD')";
		sql += " AND B.IIP_ITEM_CD = A.IIM_ITEM_CD";
		sql += " AND UPPER(B.IIP_USE_YN) = 'Y'";
		sql += " ORDER BY I.EPI_SORT_SQ";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : GetPackItemList \n";
			G_INFO += "설명 : 07. 개인 건강검진 프로그램별 검진 목록 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " PackCode : " + PackCode + " \n";
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
        <ServiceID>GetPackItemList</ServiceID>
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
                <ItemCost><%=cRsList.getString("EPI_SALE_PR")%></ItemCost>
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
        <ServiceID>GetPackItemList</ServiceID>
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