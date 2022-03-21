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

		String PackPropertyCode = htBody.get("PACKPROPERTYCODE");
		String CustomerGender = htBody.get("CUSTOMERGENDER");

		//
		if(PackPropertyCode == null) { PackPropertyCode = ""; }
		if(CustomerGender == null) { CustomerGender = ""; }

		//
		String EXAM_CD = PackPropertyCode;
		String SEX_CD = CustomerGender;

		// DB객체
		stmtList = connect.createStatement();

		sql = " SELECT A.EPK_EXAM_CD||'-'||A.EPK_PACK_SQ EPK_PACK_CD, A.EPK_PACK_NM EPK_PACK_NM, B.EPK_SALE_PR EPK_SALE_PR";
		sql += " FROM ( SELECT EPK_EXAM_CD, EPK_PACK_SQ, EPK_PACK_NM, EPK_USE_YN, EPK_INPT_ID, EPK_MODI_ID";
		sql += " FROM ET_PACK";
		sql += " WHERE 1 = 1";
		sql += " AND EPK_USE_YN = 'Y'";
		sql += " AND EPK_EXAM_CD LIKE '" + EXAM_CD + "%'";
		sql += " AND NVL(EPK_HOMEPAGE_YN, 'N') = 'Y' ";

		if(SEX_CD.equals("M")) {
			sql += " AND EPK_SEX_CD = 1";
		} else if(SEX_CD.equals("F")) {
			sql += " AND EPK_SEX_CD = 2";
		}

		sql += " ) A, ( SELECT EPK_EXAM_CD, EPK_PACK_SQ, EPK_SALE_PR";
		sql += " FROM ET_PACK ) B";
		sql += " WHERE A.EPK_EXAM_CD = B.EPK_EXAM_CD";
		sql += " AND A.EPK_PACK_SQ = B.EPK_PACK_SQ";
		sql += " ORDER BY A.EPK_EXAM_CD, A.EPK_PACK_SQ";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : GetPackList \n";
			G_INFO += "설명 : 05. 개인 건강검진 프로그램 목록 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " PackPropertyCode : " + PackPropertyCode + " \n";
			G_INFO += " CustomerGender : " + CustomerGender + " \n";
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
        <ServiceID>GetPackList</ServiceID>
        <Result>
            <ResultCode>00</ResultCode>
            <ResultMessage></ResultMessage>
        </Result>
    </Header>
    <Body>
        <PackList>
<%
		int cnt = 0;
		while(cRsList.next()) {

			cnt++;

			String EPK_PACK_CD = cRsList.getString("EPK_PACK_CD");
			String EPK_PACK_NM = cRsList.getString("EPK_PACK_NM");
			String EPK_SALE_PR = cRsList.getString("EPK_SALE_PR");
%>
            <Pack>
                <PackCode><%=EPK_PACK_CD%></PackCode>
                <PackName><%=EPK_PACK_NM%></PackName>
                <PackCost><%=EPK_SALE_PR%></PackCost>
            </Pack>
<%
		}
%>
        </PackList>
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
        <ServiceID>GetPackList</ServiceID>
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