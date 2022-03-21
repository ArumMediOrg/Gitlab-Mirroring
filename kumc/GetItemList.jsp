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

		// DB객체
		stmtList = connect.createStatement();

		sql = " SELECT EXAM_CD, EXAM_NM, EXAM_PR";
		sql += " FROM (";
		sql += "	SELECT (SELECT TO_CHAR(SYSDATE,'YYYY') FROM DUAL) EXAM_YR";
		sql += "	, LTRIM(RTRIM(A.IIM_ITEM_CD)) EXAM_CD";
		sql += "	, '' EXAM_SQ";
		sql += "	, A.IIM_CANCER_CD CAN_CD";
		sql += "	, LTRIM(RTRIM(A.IIM_ITEM_CD)) EXAM_DP";
		sql += "	, LTRIM(RTRIM(A.IIM_KNME_NM)) EXAM_NM";
		sql += "	, F_ITEM_CALL('H', (SELECT TO_CHAR(SYSDATE,'YYYY') FROM DUAL), A.IIM_ITEM_CD) AS GBHC_KD";
		sql += "	, '' EXAM_YN";
		sql += "	, CASE WHEN '81' = '91' OR '7' = '1' THEN (SELECT TO_CHAR(SYSDATE,'YYYY-MM-DD') FROM DUAL) ELSE (SELECT TO_CHAR(SYSDATE,'YYYY-MM-DD') FROM DUAL) END AS PRCE_DT";
		sql += "	, '1' CALC_CD";
		sql += "	, A.IIM_ITEM_CD ITEM_LT";
		sql += "	, CASE WHEN '1' = '1' THEN B.IIP_JCSG_PR WHEN '1' = '2' THEN B.IIP_HESG_PR WHEN '1' = '3' THEN B.IIP_GBSG_PR WHEN '1' = '4' THEN B.IIP_SBSG_PR WHEN '1' = '5' THEN B.IIP_TGSG_PR ELSE B.IIP_JCSG_PR END AS EXAM_PR";
		sql += "	, 0 SALE_PR";
		sql += "	, 0 GRUP_PR";
		sql += "	, 0 COUP_PR";
		sql += "	, 0 FAMY_PR";
		sql += "	, 0 CUPN_PR";
		sql += "	, 0 MMBR_PR";
		sql += "	, 0 OPTN_PR";
		sql += "	, B.IIP_JCSG_PR JCSG_PR";
		sql += "	, B.IIP_HESG_PR HESG_PR";
		sql += "	, B.IIP_GBSG_PR GBSG_PR";
		sql += "	, B.IIP_SBSG_PR SBSG_PR";
		sql += "	, B.IIP_TGSG_PR TGSG_PR";
		sql += "	, 'N' HTSB_YN";
		sql += "	, 'N' SPSB_YN";
		sql += "	, 'N' CVSB_YN";
		sql += "	, 'N' ETSB_YN";
		sql += "	, 'N' EMSB_YN";
		sql += "	, '' HTPR_CD";
		sql += "	, '' SPPR_CD";
		sql += "	, '' CVPR_CD";
		sql += "	, '' ETPR_CD";
		sql += "	, '' EMPR_CD";
		sql += "	, '9' CNCL_CD";
		sql += "	, 'N' OPTN_YN";
		sql += "	, '0' EXAM_KD";
		sql += "	, '' PACK_RMK";
		sql += "	, '' SALE_ID";
		sql += "	, '1' PYER_CD";
		sql += "	, '9' CMPY_CD";
		sql += "	, '3' PRPY_CD";
		sql += "	, 'N' UBEH_YN";
		sql += " 	FROM IT_ITEM A, IT_ITEM_PRICE B";
		sql += " 	WHERE 1 = 1";
		sql += " 	AND UPPER(A.IIM_USE_YN) = 'Y'";
		sql += " 	AND B.IIP_APLY_DT = GETITEM_PRICE_APPLYDATE(A.IIM_ITEM_CD, CASE WHEN '81' = '91' OR '7' = '1' THEN (SELECT TO_CHAR(SYSDATE,'YYYY-MM-DD') FROM DUAL) ELSE (SELECT TO_CHAR(SYSDATE,'YYYY-MM-DD') FROM DUAL) END, 'ITEM_CD')";
		sql += " 	AND B.IIP_ITEM_CD = A.IIM_ITEM_CD";
		sql += " 	AND UPPER(B.IIP_USE_YN) = 'Y'";
		sql += " 	ORDER BY A.IIM_EXGN_CD, A.IIM_SORT_SQ, A.IIM_ITEM_CD";
		sql += ")";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : GetItemList \n";
			G_INFO += "설명 : 02. 건강검진 검진목록(전체) 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
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
        <ServiceID>GetItemList</ServiceID>
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

			String EXAM_CD = cRsList.getString("EXAM_CD");
			String EXAM_NM = cRsList.getString("EXAM_NM");
			String EXAM_PR = cRsList.getString("EXAM_PR");
%>
            <Item>
                <ItemCode><%=EXAM_CD%></ItemCode>
                <ItemName><%=EXAM_NM%></ItemName>
                <ItemCost><%=EXAM_PR%></ItemCost>
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
        <ServiceID>GetItemList</ServiceID>
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