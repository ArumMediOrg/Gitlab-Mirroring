<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/inc_prg/common.jsp"%>
<%
	// 전달자료
	HashMap<String, Object> htHeader = null;
	HashMap<String, String> htBody = null;

	// DB객체
	Statement stmtList = null;
	Statement stmtLoop = null;
	Statement stmtTmp = null;

	ResultSet rsList = null;
	ResultSet rsLoop = null;
	ResultSet rsTmp = null;

	CRs cRsList = null;
	CRs cRsLoop = null;
	CRs cRsTmp = null;

	//
	String G_INFO = "";

	try {
%>
<%@ include file="/inc_prg/connect.jsp"%>
<%
		// 전달자료
		htHeader = (HashMap<String, Object>)request.getAttribute("htHeader");
		htBody = (HashMap<String, String>)request.getAttribute("htBody");

		String EXAMDATE = htBody.get("EXAMDATE");
		String EXAMID = htBody.get("EXAMID");

		//
		if(EXAMDATE == null) { EXAMDATE = ""; }
		if(EXAMID == null) { EXAMID = ""; }

		// DB객체
		stmtList = connect.createStatement();
		stmtLoop = connect.createStatement();
		stmtTmp = connect.createStatement();

		sql =  " SELECT AA.EEA_CUST_NO CUST_NO, AA.EEA_RSVN_NO RSVN_NO, AA.EEA_EXAM_DT EXAM_DT, AA.EEA_EXAM_SQ EXAM_SQ, BB.RRT_ASSO_CD ASSO_CD, SSV_RPT_DT RPT_DT";
		sql += ", CASE WHEN SUBSTR(EEA_EXAM_LT,1,1) = 'C' THEN 'C' WHEN SUBSTR(EEA_EXAM_LT,1,1) = 'P' THEN 'P' END COMP_GUBN";
		sql += ", EEA_COMP_CD COMP_CD";
		sql += ", (SELECT ICY_COMP_NM FROM IT_COMPANY WHERE ICY_COMP_CD = EEA_COMP_CD) COMP_NM";
		sql += ", EEA_CHART_NO CHART_NO, EEA_DEPT_NM DEPT_NM";
		sql += ", (SELECT IAU_PENL_NM FROM IT_AUTH_USER WHERE IAU_EMP_NO = SSV_DOCTOR) DOCTOR_NM";
		sql += ", RRT_EXAM_DT, RRT_EXAM_TM, EEA_COMP_PR, EEA_PSNL_PR, EEA_ACPT_TX";
		sql += ", CASE WHEN RRT_WEB_ID = 'Y' THEN 'Y' WHEN RRT_WEB_ID <> 'Y' THEN 'N' WHEN RRT_WEB_ID IS NULL THEN 'N' END HOME_RSVN";
		sql += ", CASE WHEN SUBSTR(EEA_EXAM_LT,1,3) = 'P00' THEN SUBSTR(EEA_EXAM_LT,9,5) || '-' || SUBSTR(EEA_EXAM_LT,14,5) WHEN SUBSTR(EEA_EXAM_LT,1,3) = 'C03' THEN SUBSTR(EEA_EXAM_LT,9,5) || '-' || SUBSTR(EEA_EXAM_LT,14,4) END PACK_CD";
		sql += ", EEA_EXAM_LT";
		sql += ", CASE WHEN SUBSTR(EEA_EXAM_LT,1,3) = 'P00' THEN (SELECT EPK_PACK_NM FROM ET_PACK WHERE (EPK_EXAM_CD = SUBSTR(EEA_EXAM_LT,9,5)) AND (EPK_PACK_SQ = SUBSTR(EEA_EXAM_LT,14,5)))";
		sql += "	   WHEN SUBSTR(RRT_EXAM_LT,1,3) = 'C03' THEN (SELECT ECP_PROF_NM FROM ET_COMP_CNRT_PROF WHERE (ECP_EXAM_CD = SUBSTR(EEA_EXAM_LT,9,5)) AND (ECP_CNRT_SQ = SUBSTR(EEA_EXAM_LT,11,2)) AND (ECP_PROF_SQ = SUBSTR(EEA_EXAM_LT,13,2)) AND (ECP_MNGT_YR = SUBSTR(EEA_EXAM_LT,5,4))) END PACK_NM";
		sql += ", CASE WHEN SUBSTR(EEA_EXAM_LT,1,1) = 'P' THEN ' ' WHEN SUBSTR(EEA_EXAM_LT,1,1) = 'C' THEN SUBSTR(RRT_EXAM_LT,5,4) END MNGT_YYYY";
		sql += ", EEA_PSNL_NM PSNL_NM, EEA_SEX_CD SEX_CD, EEA_PSNL_AGE PSNL_AGE, EEA_TEL_NO TEL_NO, EEA_MOBL_NO MOBL_NO, EEA_ZIP_CD ZIP_CD, EEA_ZIP_AR ZIP_AR, EEA_ROAD_AR READ_AR, ICR_BRTH_DT";
		sql += " FROM (";
		sql += "	SELECT A.*, B.*, ";
		sql += "           CASE WHEN SUBSTRING(C.ICR_PENL_ID,7,1) IN ('1', '2', '5', '6') THEN '19'||SUBSTRING(C.ICR_PENL_ID,1,6) ";
        sql += "                                                                          ELSE '20'||SUBSTRING(C.ICR_PENL_ID,1,6) END ICR_BRTH_DT ";
		sql += " 	FROM ET_EXAM_ACPT A JOIN ST_SYTH_VIEW B";
		sql += " 	ON A.EEA_EXAM_DT = B.SSV_EXAM_DT";
		sql += "    INNER JOIN IT_CUSTOMER C ON C.ICR_CUST_NO = A.EEA_CUST_NO ";
		sql += " 	AND A.EEA_EXAM_SQ = B.SSV_EXAM_SQ";
		sql += " 	AND B.SSV_CFRM_CD = 2";
		sql += " 	AND A.EEA_EXAM_DT = '" + EXAMDATE + "'";
		sql += " 	AND A.EEA_EXAM_SQ = '" + EXAMID + "'";
		sql += " ) AA LEFT OUTER JOIN RT_RSVT BB";
		sql += " ON AA.EEA_RSVN_NO = BB.RRT_RSVN_NO";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : GetResultDetailInfo \n";
			G_INFO += "설명 : 15. 건강검진 완료내역 상세 조회(협의/보완) \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " EXAMID : " + EXAMID + " \n";
			G_INFO += " EXAMDATE : " + EXAMDATE + " \n";
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
        <ServiceID>GetResultDetailInfo</ServiceID>
        <Result>
            <ResultCode>00</ResultCode>
            <ResultMessage></ResultMessage>
        </Result>
    </Header>
    <Body>
<%
		int cnt = 0;
		String MNGT_YEAR = "";
		while(cRsList.next()) {

			cnt++;
			MNGT_YEAR = cRsList.getString("MNGT_YYYY");
			MNGT_YEAR = MNGT_YEAR.replace(" ", "");
%>
        <CustomerUniqueID><%=cRsList.getString("CUST_NO")%></CustomerUniqueID>
        <RsvID><%=cRsList.getString("ASSO_CD")%></RsvID>
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
        <CustomerName><%=cRsList.getString("PSNL_NM")%></CustomerName>
        <CustomerGender><%=cRsList.getString("SEX_CD")%></CustomerGender>
        <CustomerAge><%=cRsList.getString("PSNL_AGE")%></CustomerAge>
        <CustomerTel><%=cRsList.getString("TEL_NO")%></CustomerTel>
		<CustomerMobl><%=cRsList.getString("MOBL_NO")%></CustomerMobl>
        <CustomerZip><%=cRsList.getString("ZIP_CD")%></CustomerZip>
        <CustomerAddr1><%=cRsList.getString("ZIP_AR")%></CustomerAddr1>
        <CustomerAddr2><%=cRsList.getString("READ_AR")%></CustomerAddr2>
        <CompanyCost><%=cRsList.getString("EEA_COMP_PR")%></CompanyCost>
        <PersonalCost><%=cRsList.getString("EEA_PSNL_PR")%></PersonalCost>
        <CustMemo><%=cRsList.getString("EEA_ACPT_TX")%></CustMemo>
        <RsvHomePage><%=cRsList.getString("HOME_RSVN")%></RsvHomePage>
        <PackCode><%=cRsList.getString("PACK_CD")%></PackCode>
        <PackName><%=cRsList.getString("PACK_NM")%></PackName>
		<Birthday><%=cRsList.getString("ICR_BRTH_DT")%></Birthday>
        <MgntYear><%=MNGT_YEAR%></MgntYear>
        <AddItemList><%
			String EEA_EXAM_LT = cRsList.getString("EEA_EXAM_LT");
			String[] arrData = EEA_EXAM_LT.split("\\|");
			String data;

			for(int i=1; i<arrData.length; i++) {

				data = arrData[i];
				if(! data.equals("")) {

					String[] arrItem = data.split("\\$");
					String ItemCode = arrItem[0];
					ItemCode = ItemCode.substring(4, 8);
					String ItemCost = arrItem[1];
					String ItemName = "";

					sql2 = "SELECT IIM_KNME_NM";
					sql2 += " FROM IT_ITEM";
					sql2 += " WHERE IIM_ITEM_CD = '" + ItemCode + "'";

					rsTmp = stmtList.executeQuery(sql2);
					if(rsTmp.next()) {

						cRsTmp = new CRs(rsTmp);
						ItemName = cRsTmp.getString("IIM_KNME_NM");
					}
					rsTmp.close();
%>
            <Item>
                <ItemCode><%=ItemCode%></ItemCode>
                <ItemName><%=ItemName%></ItemName>
                <ItemCost><%=ItemCost%></ItemCost>
            </Item>
<%
				}
			}

			/*
				  String strExamLT := EEA_EXAM_LT;
				-- strExamLT := P00120192100100001$200000|O619E0002$50000|I811S0034$0|I811H0002$400000|
				String[] strWords = strExamLT.Split('|');
				String strWord;
				for(int i=1;i<strWords.length;i++) {
				  strWord = strWords[i];
				  if (strWord != "")
				  {
					String[] ExamData = strWord.Split('$');
					String ExamCode = ExamData[0];
					ExamCode = ExamCode.substring(4,8);
					select IIM_KNME_NM from it_item where IIM_ITEM_CD = ExamCode;
					String ExamName = IIM_KNME_NM;
					String ExamCost = ExamData[1];
					result ExamCode, ExamName, ExamCost -- ItemCode, ItemName, ItemCost
				  }
				}
			*/
%></AddItemList>
        <ExamItemList><%
			sql2 = "SELECT A.ERI_ITEM_CD As Cd, B.IIM_ITEM_CD As Edi_Cd, B.IIM_KNME_NM As Edi_Nm, A.ERI_RSLT_VL As Result1, A.ERI_RSLT_EX As Result2, A.ERI_RSLT_LOW As Low_Man, A.ERI_RSLT_HIGH As High_Man, A.ERI_RSLT_LOW As Low_WOMAN, A.ERI_RSLT_HIGH As High_WOMAN, A.ERI_RSLT_UNIT Rslt_Unit";
			sql2 += " FROM ET_RSLT_ITEM A";
			sql2 += " INNER JOIN IT_ITEM B ON B.IIM_ITEM_CD = A.ERI_ITEM_CD";
			sql2 += " WHERE A.ERI_EXAM_DT = '" + cRsList.getString("EXAM_DT") + "'";
			sql2 += " AND A.ERI_EXAM_SQ  = '" + cRsList.getString("EXAM_SQ") + "'";
			sql2 += " AND (A.ERI_RSLT_VL <> ' ' OR A.ERI_RSLT_EX <> ' ')";
			rsLoop = stmtLoop.executeQuery(sql2);
			cRsLoop = new CRs(rsLoop);
			while(cRsLoop.next()) {
%>
            <ExamItem>
                <ExamCode><%=cRsLoop.getString("CD")%></ExamCode>
                <ExamName><%=cRsLoop.getString("Edi_Nm")%></ExamName>
                <ExamResult><%=cRsLoop.getString("Result1")%></ExamResult>
                <ReferUnit><%=cRsLoop.getString("ReferUnit")%></ReferUnit>
                <ReferNomalA><%=cRsLoop.getString("Low_Man")%>미만이며/<%=cRsLoop.getString("High_Man")%>미만</ReferNomalA>
                <ReferNomalB><%=cRsLoop.getString("Low_WOMAN")%> 또는/<%=cRsLoop.getString("High_WOMAN")%></ReferNomalB>
                <ReferDisease><%=cRsLoop.getString("Result2")%></ReferDisease>
            </ExamItem>
<%
			}
			rsLoop.close();

			/*
				Select
				A.ERI_ITEM_CD As Cd,            B.IIM_ITEM_CD As Edi_Cd,        B.IIM_KNME_NM As Edi_Nm,
				A.ERI_RSLT_VL As Result1,       A.ERI_RSLT_EX As Result2,
				A.ERI_RSLT_LOW As Low_Man,      A.ERI_RSLT_HIGH As High_Man,
				A.ERI_RSLT_LOW As Low_WOMAN,      A.ERI_RSLT_HIGH As High_WOMAN, A.ERI_RSLT_UNIT Rslt_Unit
				From ET_RSLT_ITEM A
				Inner Join IT_ITEM B On B.IIM_ITEM_CD = A.ERI_ITEM_CD
				Where A.ERI_EXAM_DT = :ExamDate
				  And A.ERI_EXAM_SQ  = :ExamID
				  And (A.ERI_RSLT_VL <> '''' Or A.ERI_RSLT_EX <> '''')

				result CD, Edi_Nm, Result1, Rslt_Unit, Low_Man, High_Man, Low_WOMAN, High_WOMAN, Result2
				-- ExamCode, ExamName, ExamResult, ReferUnit, ReferNomalA_Low, ReferNomalA_High, ReferNomalB_Low, ReferNomalB_High, ExamOpinion
			*/
%></ExamItemList>
        <ExamOpinion></ExamOpinion>
<%
		}
%>
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
        <ServiceID>GetResultDetailInfo</ServiceID>
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

		if(rsTmp != null) {
			// rsTmp.close();
			rsTmp = null;
		}

		if(rsLoop != null) {
			rsLoop.close();
			rsLoop = null;
		}

		if(rsList != null) {
			rsList.close();
			rsList = null;
		}

		if(stmtTmp != null) {
			stmtTmp.close();
			stmtTmp = null;
		}

		if(stmtLoop != null) {
			stmtLoop.close();
			stmtLoop = null;
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