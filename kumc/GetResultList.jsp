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

			sql = " SELECT AA.EEA_CUST_NO CUST_NO, AA.EEA_RSVN_NO RSVN_NO, AA.EEA_EXAM_DT EXAM_DT, AA.EEA_EXAM_SQ EXAM_SQ, SSV_RPT_DT RPT_DT, CASE WHEN SUBSTR(EEA_EXAM_LT,1,1) = 'C' THEN 'C' WHEN SUBSTR(EEA_EXAM_LT,1,1) = 'P' THEN 'P' END COMP_GUBN, EEA_COMP_CD COMP_CD, (SELECT ICY_COMP_NM";
			sql += " FROM IT_COMPANY";
			sql += " WHERE ICY_COMP_CD = EEA_COMP_CD) COMP_NM, EEA_CHART_NO CHART_NO, EEA_DEPT_NM DEPT_NM, (SELECT IAU_PENL_NM";
			sql += " FROM IT_AUTH_USER";
			sql += " WHERE IAU_EMP_NO = SSV_DOCTOR) DOCTOR_NM, RRT_EXAM_DT, RRT_EXAM_TM, EEA_COMP_PR, EEA_PSNL_PR, EEA_ACPT_TX, CASE WHEN (NVL(RRT_WEB_ID, 'N') <> 'N' AND NVL(RRT_WEB_ID, 'N') <> ' ') THEN 'Y' ELSE 'N' END HOME_RSVN, CASE WHEN SUBSTR(EEA_EXAM_LT,1,3) = 'P00' THEN SUBSTR(EEA_EXAM_LT,9,5)||'-'||SUBSTR(EEA_EXAM_LT,14,5) WHEN SUBSTR(EEA_EXAM_LT,1,3) = 'C03' THEN SUBSTR(EEA_EXAM_LT,9,5)||'-'||SUBSTR(EEA_EXAM_LT,14,4) END PACK_CD, EEA_EXAM_LT, CASE WHEN SUBSTR(EEA_EXAM_LT,1,3) = 'P00' THEN (SELECT EPK_PACK_NM";
			sql += " FROM ET_PACK";
			sql += " WHERE (EPK_EXAM_CD = SUBSTR(EEA_EXAM_LT,9,5))";
			sql += " AND (EPK_PACK_SQ = SUBSTR(EEA_EXAM_LT,14,5))) WHEN SUBSTR(RRT_EXAM_LT,1,3) = 'C03' THEN (SELECT ECP_PROF_NM";
			sql += " FROM ET_COMP_CNRT_PROF";
			sql += " WHERE (ECP_EXAM_CD = SUBSTR(EEA_EXAM_LT,9,5))";
			sql += " AND (ECP_CNRT_SQ = SUBSTR(EEA_EXAM_LT,11,2))";
			sql += " AND (ECP_PROF_SQ = SUBSTR(EEA_EXAM_LT,13,2))";
			sql += " AND (ECP_MNGT_YR = SUBSTR(EEA_EXAM_LT,5,4))) END PACK_NM, CASE WHEN SUBSTR(EEA_EXAM_LT,1,1) = 'P' THEN ' ' WHEN SUBSTR(EEA_EXAM_LT,1,1) = 'C' THEN SUBSTR(RRT_EXAM_LT,5,4) END MNGT_YYYY";
			sql += " FROM ( SELECT A.*, B.*";
			sql += " FROM ET_EXAM_ACPT A JOIN ST_SYTH_VIEW B";
			sql += " ON A.EEA_EXAM_DT = B.SSV_EXAM_DT";
			sql += " AND A.EEA_EXAM_SQ = B.SSV_EXAM_SQ";
			sql += " AND B.SSV_CFRM_CD = 2";
			sql += " AND A.EEA_CUST_NO = '" + CUSTOMERUNIQUEID + "') AA, RT_RSVT BB";
			sql += " WHERE AA.EEA_RSVN_NO = BB.RRT_RSVN_NO";
		} else if(RSVHOMEPAGE.equals("Y")) {

			sql = " SELECT AA.EEA_CUST_NO CUST_NO, AA.EEA_RSVN_NO RSVN_NO, AA.EEA_EXAM_DT EXAM_DT, AA.EEA_EXAM_SQ EXAM_SQ, SSV_RPT_DT RPT_DT, CASE WHEN SUBSTR(EEA_EXAM_LT,1,1) = 'C' THEN 'C' WHEN SUBSTR(EEA_EXAM_LT,1,1) = 'P' THEN 'P' END COMP_GUBN, EEA_COMP_CD COMP_CD, (SELECT ICY_COMP_NM";
			sql += " FROM IT_COMPANY";
			sql += " WHERE ICY_COMP_CD = EEA_COMP_CD) COMP_NM, EEA_CHART_NO CHART_NO, EEA_DEPT_NM DEPT_NM, (SELECT IAU_PENL_NM";
			sql += " FROM IT_AUTH_USER";
			sql += " WHERE IAU_EMP_NO = SSV_DOCTOR) DOCTOR_NM, RRT_EXAM_DT, RRT_EXAM_TM, EEA_COMP_PR, EEA_PSNL_PR, EEA_ACPT_TX, 'Y' HOME_RSVN, CASE WHEN SUBSTR(EEA_EXAM_LT,1,3) = 'P00' THEN SUBSTR(EEA_EXAM_LT,9,5)||'-'||SUBSTR(EEA_EXAM_LT,14,5) WHEN SUBSTR(EEA_EXAM_LT,1,3) = 'C03' THEN SUBSTR(EEA_EXAM_LT,9,5)||'-'||SUBSTR(EEA_EXAM_LT,14,4) END PACK_CD, EEA_EXAM_LT, CASE WHEN SUBSTR(EEA_EXAM_LT,1,3) = 'P00' THEN (SELECT EPK_PACK_NM";
			sql += " FROM ET_PACK";
			sql += " WHERE (EPK_EXAM_CD = SUBSTR(EEA_EXAM_LT,9,5))";
			sql += " AND (EPK_PACK_SQ = SUBSTR(EEA_EXAM_LT,14,5))) WHEN SUBSTR(RRT_EXAM_LT,1,3) = 'C03' THEN (SELECT ECP_PROF_NM";
			sql += " FROM ET_COMP_CNRT_PROF";
			sql += " WHERE (ECP_EXAM_CD = SUBSTR(EEA_EXAM_LT,9,5))";
			sql += " AND (ECP_CNRT_SQ = SUBSTR(EEA_EXAM_LT,11,2))";
			sql += " AND (ECP_PROF_SQ = SUBSTR(EEA_EXAM_LT,13,2))";
			sql += " AND (ECP_MNGT_YR = SUBSTR(EEA_EXAM_LT,5,4))) END PACK_NM, CASE WHEN SUBSTR(EEA_EXAM_LT,1,1) = 'P' THEN ' ' WHEN SUBSTR(EEA_EXAM_LT,1,1) = 'C' THEN SUBSTR(RRT_EXAM_LT,5,4) END MNGT_YYYY";
			sql += " FROM ( SELECT A.*, B.*";
			sql += " FROM ET_EXAM_ACPT A JOIN ST_SYTH_VIEW B";
			sql += " ON A.EEA_EXAM_DT = B.SSV_EXAM_DT";
			sql += " AND A.EEA_EXAM_SQ = B.SSV_EXAM_SQ";
			sql += " AND B.SSV_CFRM_CD = 2";
			sql += " AND A.EEA_CUST_NO = '" + CUSTOMERUNIQUEID + "') AA, RT_RSVT BB";
			sql += " WHERE AA.EEA_RSVN_NO = BB.RRT_RSVN_NO";
			sql += " AND NVL(BB.RRT_WEB_ID, 'N') <> 'N' ";
		} else if(RSVHOMEPAGE.equals("N")) {

			sql = " SELECT AA.EEA_CUST_NO CUST_NO, AA.EEA_RSVN_NO RSVN_NO, AA.EEA_EXAM_DT EXAM_DT, AA.EEA_EXAM_SQ EXAM_SQ, SSV_RPT_DT RPT_DT, CASE WHEN SUBSTR(EEA_EXAM_LT,1,1) = 'C' THEN 'C' WHEN SUBSTR(EEA_EXAM_LT,1,1) = 'P' THEN 'P' END COMP_GUBN, EEA_COMP_CD COMP_CD, (SELECT ICY_COMP_NM";
			sql += " FROM IT_COMPANY";
			sql += " WHERE ICY_COMP_CD = EEA_COMP_CD) COMP_NM, EEA_CHART_NO CHART_NO, EEA_DEPT_NM DEPT_NM, (SELECT IAU_PENL_NM";
			sql += " FROM IT_AUTH_USER";
			sql += " WHERE IAU_EMP_NO = SSV_DOCTOR) DOCTOR_NM, RRT_EXAM_DT, RRT_EXAM_TM, EEA_COMP_PR, EEA_PSNL_PR, EEA_ACPT_TX, 'N' HOME_RSVN, CASE WHEN SUBSTR(EEA_EXAM_LT,1,3) = 'P00' THEN SUBSTR(EEA_EXAM_LT,9,5)||'-'||SUBSTR(EEA_EXAM_LT,14,5) WHEN SUBSTR(EEA_EXAM_LT,1,3) = 'C03' THEN SUBSTR(EEA_EXAM_LT,9,5)||'-'||SUBSTR(EEA_EXAM_LT,14,4) END PACK_CD, EEA_EXAM_LT, CASE WHEN SUBSTR(EEA_EXAM_LT,1,3) = 'P00' THEN (SELECT EPK_PACK_NM";
			sql += " FROM ET_PACK";
			sql += " WHERE (EPK_EXAM_CD = SUBSTR(EEA_EXAM_LT,9,5))";
			sql += " AND (EPK_PACK_SQ = SUBSTR(EEA_EXAM_LT,14,5))) WHEN SUBSTR(RRT_EXAM_LT,1,3) = 'C03' THEN (SELECT ECP_PROF_NM";
			sql += " FROM ET_COMP_CNRT_PROF";
			sql += " WHERE (ECP_EXAM_CD = SUBSTR(EEA_EXAM_LT,9,5))";
			sql += " AND (ECP_CNRT_SQ = SUBSTR(EEA_EXAM_LT,11,2))";
			sql += " AND (ECP_PROF_SQ = SUBSTR(EEA_EXAM_LT,13,2))";
			sql += " AND (ECP_MNGT_YR = SUBSTR(EEA_EXAM_LT,5,4))) END PACK_NM, CASE WHEN SUBSTR(EEA_EXAM_LT,1,1) = 'P' THEN ' ' WHEN SUBSTR(EEA_EXAM_LT,1,1) = 'C' THEN SUBSTR(RRT_EXAM_LT,5,4) END MNGT_YYYY";
			sql += " FROM ( SELECT A.*, B.*";
			sql += " FROM ET_EXAM_ACPT A JOIN ST_SYTH_VIEW B";
			sql += " ON A.EEA_EXAM_DT = B.SSV_EXAM_DT";
			sql += " AND A.EEA_EXAM_SQ = B.SSV_EXAM_SQ";
			sql += " AND B.SSV_CFRM_CD = 2";
			sql += " AND A.EEA_CUST_NO = '" + CUSTOMERUNIQUEID + "') AA, RT_RSVT BB";
			sql += " WHERE AA.EEA_RSVN_NO = BB.RRT_RSVN_NO";
			sql += " AND NVL(BB.RRT_WEB_ID, 'N') = 'N' ";
		}

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : GetResultList \n";
			G_INFO += "설명 : 14. 건강검진 완료내역 목록 조회(10년) \n";
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
        <ServiceID>GetResultList</ServiceID>
        <Result>
            <ResultCode>00</ResultCode>
            <ResultMessage></ResultMessage>
        </Result>
    </Header>
    <Body>
        <ExamResultList>
<%
		int cnt = 0;
		String MNGT_YEAR = "";
		while(cRsList.next()) {

			cnt++;
			MNGT_YEAR = cRsList.getString("MNGT_YYYY");
			MNGT_YEAR = MNGT_YEAR.replace(" ", "");
%>
            <ExamResult>
                <CustomerUniqueID><%=cRsList.getString("CUST_NO")%></CustomerUniqueID>
                <RsvID><%=cRsList.getString("RSVN_NO")%></RsvID>
                <ExamID><%=cRsList.getString("EXAM_SQ")%></ExamID>
                <ExamDate><%=cRsList.getString("EXAM_DT")%></ExamDate>
                <JudgeDate><%=cRsList.getString("RPT_DT")%></JudgeDate>
                <RsvInfo><%=cRsList.getString("COMP_GUBN")%></RsvInfo>
                <CompanyCode><%=cRsList.getString("COMP_CD")%></CompanyCode>
                <CompanyName><%=cRsList.getString("COMP_NM")%></CompanyName>
                <ChartNo><%=cRsList.getString("CHART_NO")%></ChartNo>
                <ExamDepartment><%=cRsList.getString("DEPT_NM")%></ExamDepartment>
                <ExamDoctor><%=cRsList.getString("DOCTOR_NM")%></ExamDoctor>
                <RsvStatus></RsvStatus>
                <RsvDate><%=cRsList.getString("RRT_EXAM_DT")%></RsvDate>
                <RsvTime><%=cRsList.getString("RRT_EXAM_TM")%></RsvTime>
                <CompanyCost><%=cRsList.getString("EEA_COMP_PR")%></CompanyCost>
                <PersonalCost><%=cRsList.getString("EEA_PSNL_PR")%></PersonalCost>
                <CustMemo><%=cRsList.getString("EEA_ACPT_TX")%></CustMemo>
                <RsvHomePage><%=cRsList.getString("HOME_RSVN")%></RsvHomePage>
                <PackCode><%=cRsList.getString("PACK_CD")%></PackCode>
                <PackName><%=cRsList.getString("PACK_NM")%></PackName>
                <MgntYear><%=MNGT_YEAR%></MgntYear>
            </ExamResult>
<%
		}
%>
        </ExamResultList>
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
        <ServiceID>GetResultList</ServiceID>
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