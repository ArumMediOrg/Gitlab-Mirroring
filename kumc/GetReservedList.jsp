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

		String CUSTOMERUNIQUEID = htBody.get("CUSTOMERUNIQUEID");
		String RSVHOMEPAGE = htBody.get("RSVHOMEPAGE");

		//
		if(CUSTOMERUNIQUEID == null) { CUSTOMERUNIQUEID = ""; }
		if(RSVHOMEPAGE == null) { RSVHOMEPAGE = ""; }

		// DB객체
		stmtList = connect.createStatement();

		if(RSVHOMEPAGE.equals("A")) {

			sql = " SELECT RRT_WEB_ID, RRT_CUST_NO, RRT_RSVN_NO, COMP_GUBN, RRT_COMP_CD, COMP_NM, 'C' RSVSTATUS, RRT_EXAM_DT, RRT_EXAM_TM, RRT_COMP_PR, RRT_PSNL_PR, RRT_RSVN_TX, HOME_RSVN, PACK_CD, PACK_NM, MNGT_YYYY, SALES_PR, RRT_CNCL_YN";
			sql += " FROM ( SELECT RRT_WEB_ID, RRT_CUST_NO, RRT_RSVN_NO, CASE WHEN RRT_COMP_CD IS NOT NULL THEN 'C' WHEN RRT_COMP_CD IS NULL THEN 'P' END COMP_GUBN, RRT_COMP_CD, (SELECT ICY_COMP_NM";
			sql += " FROM IT_COMPANY";
			sql += " WHERE ICY_COMP_CD = RRT_COMP_CD) COMP_NM, 'C' EXAM_CNT, RRT_EXAM_DT, RRT_EXAM_TM, RRT_COMP_PR, RRT_PSNL_PR, RRT_RSVN_TX, CASE WHEN NVL(RRT_WEB_ID, 'N') = 'Y' THEN 'Y' ELSE 'N' END HOME_RSVN, CASE WHEN SUBSTR(RRT_EXAM_LT,1,3) = 'P00' THEN SUBSTR(RRT_EXAM_LT,9,5)||'-'||SUBSTR(RRT_EXAM_LT,14,5) WHEN SUBSTR(RRT_EXAM_LT,1,3) = 'C03' THEN SUBSTR(RRT_EXAM_LT,5,13) END PACK_CD, RRT_EXAM_LT, CASE WHEN SUBSTR(RRT_EXAM_LT,1,3) = 'P00' THEN (SELECT EPK_PACK_NM";
			sql += " FROM ET_PACK";
			sql += " WHERE (EPK_EXAM_CD = SUBSTR(RRT_EXAM_LT,9,5))";
			sql += " AND (EPK_PACK_SQ = SUBSTR(RRT_EXAM_LT,14,5))) WHEN SUBSTR(RRT_EXAM_LT,1,3) = 'C03' THEN (SELECT ECP_PROF_NM";
			sql += " FROM ET_COMP_CNRT_PROF";
			sql += " WHERE (ECP_EXAM_CD = SUBSTR(RRT_EXAM_LT,9,5))";
			sql += " AND (ECP_CNRT_SQ = SUBSTR(RRT_EXAM_LT,14,2))";
			sql += " AND (ECP_PROF_SQ = SUBSTR(RRT_EXAM_LT,16,2))";
			sql += " AND (ECP_COMP_CD = RRT_COMP_CD)";
			sql += " AND (ECP_MNGT_YR = SUBSTR(RRT_EXAM_LT,5,4))) END PACK_NM, CASE WHEN SUBSTR(RRT_EXAM_LT,1,1) = 'P' THEN ' ' WHEN SUBSTR(RRT_EXAM_LT,1,1) = 'C' THEN SUBSTR(RRT_EXAM_LT,5,4) END MNGT_YYYY, (SELECT EPK_SALE_PR";
			sql += " FROM ET_PACK";
			sql += " WHERE (EPK_EXAM_CD = SUBSTR(RRT_EXAM_LT,9,5))";
			sql += " AND (EPK_PACK_SQ = SUBSTR(RRT_EXAM_LT,14,5))) SALES_PR, RRT_CNCL_YN ";
			sql += " FROM RT_RSVT)";
			sql += " WHERE RRT_CUST_NO = '" + CUSTOMERUNIQUEID + "'";
			sql += " AND NVL(RRT_WEB_ID,'N') <> 'N' ";
			sql += " AND NVL(RRT_CNCL_YN, 'N') <> 'Y' ";
			sql += " AND SUBSTRING(RRT_EXAM_DT, 1, 4) >= TO_CHAR(SYSDATE-(INTERVAL '1' YEAR), 'YYYY') ";
			sql += " UNION";
			sql += " ALL SELECT RRT_WEB_ID, RRT_CUST_NO, RRT_RSVN_NO, COMP_GUBN, RRT_COMP_CD, COMP_NM, 'R' RSVSTATUS, RRT_EXAM_DT, RRT_EXAM_TM, RRT_COMP_PR, RRT_PSNL_PR, RRT_RSVN_TX, HOME_RSVN, PACK_CD, PACK_NM, MNGT_YYYY, SALES_PR, RRT_CNCL_YN ";
			sql += " FROM ( SELECT RRT_WEB_ID, RRT_CUST_NO, RRT_RSVN_NO, CASE WHEN RRT_COMP_CD IS NOT NULL THEN 'C' WHEN RRT_COMP_CD IS NULL THEN 'P' END COMP_GUBN, RRT_COMP_CD, (SELECT ICY_COMP_NM";
			sql += " FROM IT_COMPANY";
			sql += " WHERE ICY_COMP_CD = RRT_COMP_CD) COMP_NM, 'R' EXAM_CNT, RRT_EXAM_DT, RRT_EXAM_TM, RRT_COMP_PR, RRT_PSNL_PR, RRT_RSVN_TX, 'Y' HOME_RSVN, CASE WHEN SUBSTR(RRT_EXAM_LT,1,3) = 'P00' THEN SUBSTR(RRT_EXAM_LT,9,5)||'-'||SUBSTR(RRT_EXAM_LT,14,5) WHEN SUBSTR(RRT_EXAM_LT,1,3) = 'C03' THEN SUBSTR(RRT_EXAM_LT,5,13) END PACK_CD, RRT_EXAM_LT, CASE WHEN SUBSTR(RRT_EXAM_LT,1,3) = 'P00' THEN (SELECT EPK_PACK_NM";
			sql += " FROM ET_PACK";
			sql += " WHERE (EPK_EXAM_CD = SUBSTR(RRT_EXAM_LT,9,5))";
			sql += " AND (EPK_PACK_SQ = SUBSTR(RRT_EXAM_LT,14,5))) WHEN SUBSTR(RRT_EXAM_LT,1,3) = 'C03' THEN (SELECT ECP_PROF_NM";
			sql += " FROM ET_COMP_CNRT_PROF";
			sql += " WHERE (ECP_EXAM_CD = SUBSTR(RRT_EXAM_LT,9,5))";
			sql += " AND (ECP_CNRT_SQ = SUBSTR(RRT_EXAM_LT,14,2))";
			sql += " AND (ECP_PROF_SQ = SUBSTR(RRT_EXAM_LT,16,2))";
			sql += " AND (ECP_COMP_CD = RRT_COMP_CD)";
			sql += " AND (ECP_MNGT_YR = SUBSTR(RRT_EXAM_LT,5,4))) END PACK_NM, CASE WHEN SUBSTR(RRT_EXAM_LT,1,1) = 'P' THEN ' ' WHEN SUBSTR(RRT_EXAM_LT,1,1) = 'C' THEN SUBSTR(RRT_EXAM_LT,5,4) END MNGT_YYYY, (SELECT EPK_SALE_PR";
			sql += " FROM ET_PACK";
			sql += " WHERE (EPK_EXAM_CD = SUBSTR(RRT_EXAM_LT,9,5))";
			sql += " AND (EPK_PACK_SQ = SUBSTR(RRT_EXAM_LT,14,5))) SALES_PR, RRT_CNCL_YN ";
			sql += " FROM RT_RSVT_WEBPAGE)";
			sql += " WHERE RRT_CUST_NO = '" + CUSTOMERUNIQUEID + "' ";
			sql += " AND NVL(RRT_WEB_ID, 'N') = 'N' ";
			sql += " AND NVL(RRT_CNCL_YN, 'N') <> 'Y' ";
			sql += " AND SUBSTRING(RRT_EXAM_DT, 1, 4) >= TO_CHAR(SYSDATE-(INTERVAL '1' YEAR), 'YYYY') ";
			sql += " UNION ";
			sql += " ALL SELECT RRT_WEB_ID, RRT_CUST_NO, RRT_RSVN_NO, COMP_GUBN, RRT_COMP_CD, COMP_NM, 'D' RSVSTATUS, RRT_EXAM_DT, RRT_EXAM_TM, RRT_COMP_PR, RRT_PSNL_PR, RRT_RSVN_TX, HOME_RSVN, PACK_CD, PACK_NM, MNGT_YYYY, SALES_PR, RRT_CNCL_YN ";
			sql += " FROM ( SELECT RRT_WEB_ID, RRT_CUST_NO, RRT_RSVN_NO, CASE WHEN RRT_COMP_CD IS NOT NULL THEN 'C' WHEN RRT_COMP_CD IS NULL THEN 'P' END COMP_GUBN, RRT_COMP_CD, (SELECT ICY_COMP_NM";
			sql += " FROM IT_COMPANY";
			sql += " WHERE ICY_COMP_CD = RRT_COMP_CD) COMP_NM, 'R' EXAM_CNT, RRT_EXAM_DT, RRT_EXAM_TM, RRT_COMP_PR, RRT_PSNL_PR, RRT_RSVN_TX, 'Y' HOME_RSVN, CASE WHEN SUBSTR(RRT_EXAM_LT,1,3) = 'P00' THEN SUBSTR(RRT_EXAM_LT,9,5)||'-'||SUBSTR(RRT_EXAM_LT,14,5) WHEN SUBSTR(RRT_EXAM_LT,1,3) = 'C03' THEN SUBSTR(RRT_EXAM_LT,5,13) END PACK_CD, RRT_EXAM_LT, CASE WHEN SUBSTR(RRT_EXAM_LT,1,3) = 'P00' THEN (SELECT EPK_PACK_NM";
			sql += " FROM ET_PACK";
			sql += " WHERE (EPK_EXAM_CD = SUBSTR(RRT_EXAM_LT,9,5))";
			sql += " AND (EPK_PACK_SQ = SUBSTR(RRT_EXAM_LT,14,5))) WHEN SUBSTR(RRT_EXAM_LT,1,3) = 'C03' THEN (SELECT ECP_PROF_NM";
			sql += " FROM ET_COMP_CNRT_PROF";
			sql += " WHERE (ECP_EXAM_CD = SUBSTR(RRT_EXAM_LT,9,5))";
			sql += " AND (ECP_CNRT_SQ = SUBSTR(RRT_EXAM_LT,14,2))";
			sql += " AND (ECP_PROF_SQ = SUBSTR(RRT_EXAM_LT,16,2))";
			sql += " AND (ECP_COMP_CD = RRT_COMP_CD)";
			sql += " AND (ECP_MNGT_YR = SUBSTR(RRT_EXAM_LT,5,4))) END PACK_NM, CASE WHEN SUBSTR(RRT_EXAM_LT,1,1) = 'P' THEN ' ' WHEN SUBSTR(RRT_EXAM_LT,1,1) = 'C' THEN SUBSTR(RRT_EXAM_LT,5,4) END MNGT_YYYY, (SELECT EPK_SALE_PR";
			sql += " FROM ET_PACK";
			sql += " WHERE (EPK_EXAM_CD = SUBSTR(RRT_EXAM_LT,9,5))";
			sql += " AND (EPK_PACK_SQ = SUBSTR(RRT_EXAM_LT,14,5))) SALES_PR, RRT_CNCL_YN";
			sql += " FROM RT_RSVT_WEBPAGE)";
			sql += " WHERE RRT_CUST_NO = '" + CUSTOMERUNIQUEID + "' ";
			sql += " AND NVL(RRT_CNCL_YN, 'N') = 'Y' ";  //누리온 화면에서 삭제처리하면 'Y'
			sql += " AND SUBSTRING(RRT_EXAM_DT, 1, 4) >= TO_CHAR(SYSDATE-(INTERVAL '1' YEAR), 'YYYY') ";
		} else if(RSVHOMEPAGE.equals("Y")) {
			//RSVSTATUS : R = 예약 신청
			sql = " SELECT RRT_WEB_ID, RRT_CUST_NO, RRT_RSVN_NO, COMP_GUBN, RRT_COMP_CD, COMP_NM, 'R' RSVSTATUS, RRT_EXAM_DT, RRT_EXAM_TM, RRT_COMP_PR, RRT_PSNL_PR, RRT_RSVN_TX, HOME_RSVN, PACK_CD, PACK_NM, MNGT_YYYY, SALES_PR";
			sql += " FROM ( SELECT RRT_WEB_ID, RRT_CUST_NO, RRT_RSVN_NO, CASE WHEN RRT_COMP_CD IS NOT NULL THEN 'C' WHEN RRT_COMP_CD IS NULL THEN 'P' END COMP_GUBN, RRT_COMP_CD, (SELECT ICY_COMP_NM";
			sql += " FROM IT_COMPANY";
			sql += " WHERE ICY_COMP_CD = RRT_COMP_CD) COMP_NM, '0' EXAM_CNT, RRT_EXAM_DT, RRT_EXAM_TM, RRT_COMP_PR, RRT_PSNL_PR, RRT_RSVN_TX, 'Y' HOME_RSVN, CASE WHEN SUBSTR(RRT_EXAM_LT,1,3) = 'P00' THEN SUBSTR(RRT_EXAM_LT,9,5)||'-'||SUBSTR(RRT_EXAM_LT,14,5) WHEN SUBSTR(RRT_EXAM_LT,1,3) = 'C03' THEN SUBSTR(RRT_EXAM_LT,5,13) END PACK_CD, RRT_EXAM_LT, CASE WHEN SUBSTR(RRT_EXAM_LT,1,3) = 'P00' THEN (SELECT EPK_PACK_NM";
			sql += " FROM ET_PACK";
			sql += " WHERE (EPK_EXAM_CD = SUBSTR(RRT_EXAM_LT,9,5))";
			sql += " AND (EPK_PACK_SQ = SUBSTR(RRT_EXAM_LT,14,5))) WHEN SUBSTR(RRT_EXAM_LT,1,3) = 'C03' THEN (SELECT ECP_PROF_NM";
			sql += " FROM ET_COMP_CNRT_PROF";
			sql += " WHERE (ECP_EXAM_CD = SUBSTR(RRT_EXAM_LT,9,5))";
			sql += " AND (ECP_CNRT_SQ = SUBSTR(RRT_EXAM_LT,14,2))";
			sql += " AND (ECP_PROF_SQ = SUBSTR(RRT_EXAM_LT,16,2))";
			sql += " AND (ECP_COMP_CD = RRT_COMP_CD)";
			sql += " AND (ECP_MNGT_YR = SUBSTR(RRT_EXAM_LT,5,4))) END PACK_NM, CASE WHEN SUBSTR(RRT_EXAM_LT,1,1) = 'P' THEN ' ' WHEN SUBSTR(RRT_EXAM_LT,1,1) = 'C' THEN SUBSTR(RRT_EXAM_LT,5,4) END MNGT_YYYY, (SELECT EPK_SALE_PR";
			sql += " FROM ET_PACK";
			sql += " WHERE (EPK_EXAM_CD = SUBSTR(RRT_EXAM_LT,9,5))";
			sql += " AND (EPK_PACK_SQ = SUBSTR(RRT_EXAM_LT,14,5))) SALES_PR";
			sql += " FROM RT_RSVT_WEBPAGE)";
			sql += " WHERE RRT_CUST_NO = '" + CUSTOMERUNIQUEID + "' ";
			sql += " AND NVL(RRT_WEB_ID, 'N') = 'N' ";
			sql += " AND SUBSTRING(RRT_EXAM_DT, 1, 4) >= TO_CHAR(SYSDATE-(INTERVAL '1' YEAR), 'YYYY') ";
		} else if(RSVHOMEPAGE.equals("N")) {
			//RSVSTATUS : C = 예약 완료
			sql = " SELECT RRT_WEB_ID, RRT_CUST_NO, RRT_RSVN_NO, COMP_GUBN, RRT_COMP_CD, COMP_NM, 'C' RSVSTATUS, RRT_EXAM_DT, RRT_EXAM_TM, RRT_COMP_PR, RRT_PSNL_PR, RRT_RSVN_TX, HOME_RSVN, PACK_CD, PACK_NM, MNGT_YYYY, SALES_PR";
			sql += " FROM ( SELECT RRT_WEB_ID, RRT_CUST_NO, RRT_RSVN_NO, CASE WHEN RRT_COMP_CD IS NOT NULL THEN 'C' WHEN RRT_COMP_CD IS NULL THEN 'P' END COMP_GUBN, RRT_COMP_CD, (SELECT ICY_COMP_NM";
			sql += " FROM IT_COMPANY";
			sql += " WHERE ICY_COMP_CD = RRT_COMP_CD) COMP_NM, '1' EXAM_CNT, RRT_EXAM_DT, RRT_EXAM_TM, RRT_COMP_PR, RRT_PSNL_PR, RRT_RSVN_TX, CASE WHEN NVL(RRT_WEB_ID, 'N') = 'Y' THEN 'Y' ELSE 'N' END HOME_RSVN, CASE WHEN SUBSTR(RRT_EXAM_LT,1,3) = 'P00' THEN SUBSTR(RRT_EXAM_LT,9,5)||'-'||SUBSTR(RRT_EXAM_LT,14,5) WHEN SUBSTR(RRT_EXAM_LT,1,3) = 'C03' THEN SUBSTR(RRT_EXAM_LT,5,13) END PACK_CD, RRT_EXAM_LT, CASE WHEN SUBSTR(RRT_EXAM_LT,1,3) = 'P00' THEN (SELECT EPK_PACK_NM";
			sql += " FROM ET_PACK";
			sql += " WHERE (EPK_EXAM_CD = SUBSTR(RRT_EXAM_LT,9,5))";
			sql += " AND (EPK_PACK_SQ = SUBSTR(RRT_EXAM_LT,14,5))) WHEN SUBSTR(RRT_EXAM_LT,1,3) = 'C03' THEN (SELECT ECP_PROF_NM";
			sql += " FROM ET_COMP_CNRT_PROF";
			sql += " WHERE (ECP_EXAM_CD = SUBSTR(RRT_EXAM_LT,9,5))";
			sql += " AND (ECP_CNRT_SQ = SUBSTR(RRT_EXAM_LT,14,2))";
			sql += " AND (ECP_PROF_SQ = SUBSTR(RRT_EXAM_LT,16,2))";
			sql += " AND (ECP_COMP_CD = RRT_COMP_CD)";
			sql += " AND (ECP_MNGT_YR = SUBSTR(RRT_EXAM_LT,5,4))) END PACK_NM, CASE WHEN SUBSTR(RRT_EXAM_LT,1,1) = 'P' THEN ' ' WHEN SUBSTR(RRT_EXAM_LT,1,1) = 'C' THEN SUBSTR(RRT_EXAM_LT,5,4) END MNGT_YYYY, (SELECT EPK_SALE_PR";
			sql += " FROM ET_PACK";
			sql += " WHERE (EPK_EXAM_CD = SUBSTR(RRT_EXAM_LT,9,5))";
			sql += " AND (EPK_PACK_SQ = SUBSTR(RRT_EXAM_LT,14,5))) SALES_PR";
			sql += " FROM RT_RSVT)";
			sql += " WHERE RRT_CUST_NO = '" + CUSTOMERUNIQUEID + "' ";
			sql += " AND NVL(RRT_WEB_ID,'N') <> 'N' ";
			sql += " AND SUBSTRING(RRT_EXAM_DT, 1, 4) >= TO_CHAR(SYSDATE-(INTERVAL '1' YEAR), 'YYYY') ";
		} else if(RSVHOMEPAGE.equals("D")) {
			//RSVSTATUS : D = 예약 삭제
			sql = " SELECT RRT_WEB_ID, RRT_CUST_NO, RRT_RSVN_NO, COMP_GUBN, RRT_COMP_CD, COMP_NM, 'D' RSVSTATUS, RRT_EXAM_DT, RRT_EXAM_TM, RRT_COMP_PR, RRT_PSNL_PR, RRT_RSVN_TX, HOME_RSVN, PACK_CD, PACK_NM, MNGT_YYYY, SALES_PR, RRT_CNCL_YN";
			sql += " FROM ( SELECT RRT_WEB_ID, RRT_CUST_NO, RRT_RSVN_NO, CASE WHEN RRT_COMP_CD IS NOT NULL THEN 'C' WHEN RRT_COMP_CD IS NULL THEN 'P' END COMP_GUBN, RRT_COMP_CD, (SELECT ICY_COMP_NM";
			sql += " FROM IT_COMPANY";
			sql += " WHERE ICY_COMP_CD = RRT_COMP_CD) COMP_NM, '1' EXAM_CNT, RRT_EXAM_DT, RRT_EXAM_TM, RRT_COMP_PR, RRT_PSNL_PR, RRT_RSVN_TX, CASE WHEN NVL(RRT_WEB_ID, 'N') = 'Y' THEN 'Y' ELSE 'N' END HOME_RSVN, CASE WHEN SUBSTR(RRT_EXAM_LT,1,3) = 'P00' THEN SUBSTR(RRT_EXAM_LT,9,5)||'-'||SUBSTR(RRT_EXAM_LT,14,5) WHEN SUBSTR(RRT_EXAM_LT,1,3) = 'C03' THEN SUBSTR(RRT_EXAM_LT,5,13) END PACK_CD, RRT_EXAM_LT, CASE WHEN SUBSTR(RRT_EXAM_LT,1,3) = 'P00' THEN (SELECT EPK_PACK_NM";
			sql += " FROM ET_PACK";
			sql += " WHERE (EPK_EXAM_CD = SUBSTR(RRT_EXAM_LT,9,5))";
			sql += " AND (EPK_PACK_SQ = SUBSTR(RRT_EXAM_LT,14,5))) WHEN SUBSTR(RRT_EXAM_LT,1,3) = 'C03' THEN (SELECT ECP_PROF_NM";
			sql += " FROM ET_COMP_CNRT_PROF";
			sql += " WHERE (ECP_EXAM_CD = SUBSTR(RRT_EXAM_LT,9,5))";
			sql += " AND (ECP_CNRT_SQ = SUBSTR(RRT_EXAM_LT,14,2))";
			sql += " AND (ECP_PROF_SQ = SUBSTR(RRT_EXAM_LT,16,2))";
			sql += " AND (ECP_COMP_CD = RRT_COMP_CD)";
			sql += " AND (ECP_MNGT_YR = SUBSTR(RRT_EXAM_LT,5,4))) END PACK_NM, CASE WHEN SUBSTR(RRT_EXAM_LT,1,1) = 'P' THEN ' ' WHEN SUBSTR(RRT_EXAM_LT,1,1) = 'C' THEN SUBSTR(RRT_EXAM_LT,5,4) END MNGT_YYYY, (SELECT EPK_SALE_PR";
			sql += " FROM ET_PACK";
			sql += " WHERE (EPK_EXAM_CD = SUBSTR(RRT_EXAM_LT,9,5))";
			sql += " AND (EPK_PACK_SQ = SUBSTR(RRT_EXAM_LT,14,5))) SALES_PR, RRT_CNCL_YN ";
			sql += " FROM RT_RSVT_WEBPAGE)";
			sql += " WHERE RRT_CUST_NO = '" + CUSTOMERUNIQUEID + "' ";
			sql += " AND NVL(RRT_CNCL_YN, 'N') = 'Y' ";  //누리온 화면에서 삭제처리하면 'Y'
			sql += " AND SUBSTRING(RRT_EXAM_DT, 1, 4) >= TO_CHAR(SYSDATE-(INTERVAL '1' YEAR), 'YYYY') ";
		}

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : GetReservedList \n";
			G_INFO += "설명 : 12. 건강검진 예약내역 목록 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " CUSTOMERUNIQUEID : " + CUSTOMERUNIQUEID + " \n";
			G_INFO += " RSVHOMEPAGE : " + RSVHOMEPAGE + " \n";
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
        <ServiceID>GetReservedList</ServiceID>
        <Result>
            <ResultCode>00</ResultCode>
            <ResultMessage></ResultMessage>
        </Result>
    </Header>
    <Body>
        <ReservedList>
<%
		int cnt = 0;
		String MNGT_YEAR = "";
		while(cRsList.next()) {

			cnt++;
			MNGT_YEAR = cRsList.getString("MNGT_YYYY");
			MNGT_YEAR = MNGT_YEAR.replace(" ", "");
%>
            <Reserve>
                <CustomerUniqueID><%=cRsList.getString("RRT_CUST_NO")%></CustomerUniqueID>
                <RsvID><%=cRsList.getString("RRT_RSVN_NO")%></RsvID>
                <RsvInfo><%=cRsList.getString("COMP_GUBN")%></RsvInfo>
                <CompanyCode><%=cRsList.getString("RRT_COMP_CD")%></CompanyCode>
                <CompanyName><%=cRsList.getString("COMP_NM")%></CompanyName>
                <RsvStatus><%=cRsList.getString("RSVSTATUS")%></RsvStatus>
                <RsvDate><%=cRsList.getString("RRT_EXAM_DT")%></RsvDate>
                <RsvTime><%=cRsList.getString("RRT_EXAM_TM")%></RsvTime>
                <CompanyCost><%=cRsList.getString("RRT_COMP_PR")%></CompanyCost>
                <PersonalCost><%=cRsList.getString("RRT_PSNL_PR")%></PersonalCost>
                <CustMemo><%=cRsList.getString("RRT_RSVN_TX")%></CustMemo>
                <RsvHomePage><%=cRsList.getString("HOME_RSVN")%></RsvHomePage>
                <PackCode><%=cRsList.getString("PACK_CD")%></PackCode>
                <PackName><%=cRsList.getString("PACK_NM")%></PackName>
                <MgntYear><%=MNGT_YEAR%></MgntYear>
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
        <ServiceID>GetReservedList</ServiceID>
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