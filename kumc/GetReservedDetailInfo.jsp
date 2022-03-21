<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/inc_prg/common.jsp"%>
<%
	// 전달자료
	HashMap<String, Object> htHeader = null;
	HashMap<String, String> htBody = null;

	// DB객체
	Statement stmtList = null;
	Statement stmtTmp = null;

	ResultSet rsList = null;
	ResultSet rsTmp = null;

	CRs cRsList = null;
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

		String RSVID = htBody.get("RSVID");
		String RSVHOMEPAGE = htBody.get("RSVHOMEPAGE");

		//
		if(RSVID == null) { RSVID = ""; }
		if(RSVHOMEPAGE == null) { RSVHOMEPAGE = ""; }

		// DB객체
		stmtList = connect.createStatement();
		stmtTmp = connect.createStatement();


		if(RSVHOMEPAGE.equals("Y")) {  //웹 예약 까지만 한 경우

			sql = " SELECT RRT_CUST_NO, RRT_RSVN_NO, COMP_GUBN, RRT_COMP_CD, COMP_NM, 'R' RSVSTATUS, RRT_EXAM_DT, RRT_EXAM_TM, RRT_COMP_PR, RRT_PSNL_PR, RRT_RSVN_TX, HOME_RSVN, PACK_CD, PACK_NM, MNGT_YYYY, RRT_PSNL_NM, RRT_SEX_CD, RRT_PSNL_AGE, RRT_TEL_NO, RRT_MOBL_NO, RRT_ZIP_CD, RRT_ZIP_AR, RRT_ROAD_AR, RRT_EXAM_LT, SALES_PR, ICR_BRTH_DT";
			sql += " FROM ( SELECT RRT_CUST_NO, RRT_RSVN_NO, CASE WHEN RRT_COMP_CD IS NOT NULL THEN 'C' WHEN RRT_COMP_CD IS NULL THEN 'P' END COMP_GUBN, RRT_COMP_CD, (SELECT ICY_COMP_NM";
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
			sql += " AND (ECP_MNGT_YR = SUBSTR(RT_RSVT_WEBPAGE.RRT_EXAM_LT,5,4))) END PACK_NM, CASE WHEN SUBSTR(RRT_EXAM_LT,1,1) = 'P' THEN ' ' WHEN SUBSTR(RRT_EXAM_LT,1,1) = 'C' THEN SUBSTR(RRT_EXAM_LT,5,4) END MNGT_YYYY, RRT_PSNL_NM, RRT_SEX_CD, RRT_PSNL_AGE, RRT_TEL_NO, RRT_MOBL_NO, RRT_ZIP_CD, RRT_ZIP_AR, RRT_ROAD_AR, (SELECT EPK_SALE_PR";
			sql += " FROM ET_PACK";
			sql += " WHERE (EPK_EXAM_CD = SUBSTR(RRT_EXAM_LT,9,5))";
			sql += " AND (EPK_PACK_SQ = SUBSTR(RRT_EXAM_LT,14,5))) SALES_PR,";
			sql += " CASE WHEN SUBSTRING(ICR_PENL_ID,7,1) IN ('1', '2', '5', '6') THEN '19'||SUBSTRING(ICR_PENL_ID,1,6) ";
 	        sql += "                                                   		      ELSE '20'||SUBSTRING(ICR_PENL_ID,1,6) END ICR_BRTH_DT ";
			sql += " FROM RT_RSVT_WEBPAGE";
			sql += " LEFT OUTER JOIN IT_CUSTOMER ON ICR_CUST_NO = RRT_CUST_NO ";
			sql += " WHERE (RRT_RSVN_NO = '" + RSVID + "') )";

		} else if (RSVHOMEPAGE.equals("N")) {  //완전 예약까지 다 한 경우

			sql = " SELECT RRT_CUST_NO, RRT_RSVN_NO, COMP_GUBN, RRT_COMP_CD, COMP_NM, 'C' RSVSTATUS, RRT_EXAM_DT, RRT_EXAM_TM, RRT_COMP_PR, RRT_PSNL_PR, RRT_RSVN_TX, HOME_RSVN, PACK_CD, PACK_NM, MNGT_YYYY, RRT_PSNL_NM, RRT_SEX_CD, RRT_PSNL_AGE, RRT_TEL_NO, RRT_MOBL_NO, RRT_ZIP_CD, RRT_ZIP_AR, RRT_ROAD_AR, RRT_EXAM_LT, SALES_PR, ICR_BRTH_DT";
			sql += " FROM ( SELECT RRT_CUST_NO, RRT_RSVN_NO, CASE WHEN RRT_COMP_CD IS NOT NULL THEN 'C' WHEN RRT_COMP_CD IS NULL THEN 'P' END COMP_GUBN, RRT_COMP_CD, (SELECT ICY_COMP_NM";
			sql += " FROM IT_COMPANY";
			sql += " WHERE ICY_COMP_CD = RRT_COMP_CD) COMP_NM, 'C' EXAM_CNT, RRT_EXAM_DT, RRT_EXAM_TM, RRT_COMP_PR, RRT_PSNL_PR, RRT_RSVN_TX, 'Y' HOME_RSVN, CASE WHEN SUBSTR(RRT_EXAM_LT,1,3) = 'P00' THEN SUBSTR(RRT_EXAM_LT,9,5)||'-'||SUBSTR(RRT_EXAM_LT,14,5) WHEN SUBSTR(RRT_EXAM_LT,1,3) = 'C03' THEN SUBSTR(RRT_EXAM_LT,5,13) END PACK_CD, RRT_EXAM_LT, CASE WHEN SUBSTR(RRT_EXAM_LT,1,3) = 'P00' THEN (SELECT EPK_PACK_NM";
			sql += " FROM ET_PACK";
			sql += " WHERE (EPK_EXAM_CD = SUBSTR(RRT_EXAM_LT,9,5))";
			sql += " AND (EPK_PACK_SQ = SUBSTR(RRT_EXAM_LT,14,5))) WHEN SUBSTR(RRT_EXAM_LT,1,3) = 'C03' THEN (SELECT ECP_PROF_NM";
			sql += " FROM ET_COMP_CNRT_PROF";
			sql += " WHERE (ECP_EXAM_CD = SUBSTR(RRT_EXAM_LT,9,5))";
			sql += " AND (ECP_CNRT_SQ = SUBSTR(RRT_EXAM_LT,14,2))";
			sql += " AND (ECP_PROF_SQ = SUBSTR(RRT_EXAM_LT,16,2))";
			sql += " AND (ECP_COMP_CD = RRT_COMP_CD)";
			sql += " AND (ECP_MNGT_YR = SUBSTR(RT_RSVT.RRT_EXAM_LT,5,4))) END PACK_NM, CASE WHEN SUBSTR(RRT_EXAM_LT,1,1) = 'P' THEN ' ' WHEN SUBSTR(RRT_EXAM_LT,1,1) = 'C' THEN SUBSTR(RRT_EXAM_LT,5,4) END MNGT_YYYY, RRT_PSNL_NM, RRT_SEX_CD, RRT_PSNL_AGE, RRT_TEL_NO, RRT_MOBL_NO, RRT_ZIP_CD, RRT_ZIP_AR, RRT_ROAD_AR, (SELECT EPK_SALE_PR";
			sql += " FROM ET_PACK";
			sql += " WHERE (EPK_EXAM_CD = SUBSTR(RRT_EXAM_LT,9,5))";
			sql += " AND (EPK_PACK_SQ = SUBSTR(RRT_EXAM_LT,14,5))) SALES_PR,";
			sql += " CASE WHEN SUBSTRING(ICR_PENL_ID,7,1) IN ('1', '2', '5', '6') THEN '19'||SUBSTRING(ICR_PENL_ID,1,6) ";
 	        sql += "                                                   		      ELSE '20'||SUBSTRING(ICR_PENL_ID,1,6) END ICR_BRTH_DT ";
			sql += " FROM RT_RSVT";
			sql += " LEFT OUTER JOIN IT_CUSTOMER ON ICR_CUST_NO = RRT_CUST_NO ";
			sql += " WHERE (RRT_RSVN_NO = '" + RSVID + "') )";

		}


			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : GetReservedDetailInfo \n";
			G_INFO += "설명 : 13. 건강검진 예약내역 상세 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " RSVID : " + RSVID + " \n";
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
        <ServiceID>GetReservedDetailInfo</ServiceID>
        <Result>
            <ResultCode>00</ResultCode>
            <ResultMessage></ResultMessage>
        </Result>
    </Header>
    <Body>
<%
		int cnt = 0;
		String MNGT_YEAR = "";
		String Pack_Name = "";

		while(cRsList.next()) {

			cnt++;
			MNGT_YEAR = cRsList.getString("MNGT_YYYY");
			MNGT_YEAR = MNGT_YEAR.replace(" ", "");
			if (cRsList.getString("COMP_GUBN").equals("C")) {
				String PrintGender = "";
				if (cRsList.getString("RRT_SEX_CD").equals("M")) {
					PrintGender = "(남)";
				} else {
					PrintGender = "(여)";
				}
				Pack_Name = "기업체 종합검진" + PrintGender;
			} else {
				Pack_Name = cRsList.getString("PACK_NM");
			}

%>
        <CustomerUniqueID><%=cRsList.getString("RRT_CUST_NO")%></CustomerUniqueID>
        <RsvID><%=cRsList.getString("RRT_RSVN_NO")%></RsvID>
        <RsvInfo><%=cRsList.getString("COMP_GUBN")%></RsvInfo>
        <CompanyCode><%=cRsList.getString("RRT_COMP_CD")%></CompanyCode>
        <CompanyName><%=cRsList.getString("COMP_NM")%></CompanyName>
        <RsvStatus><%=cRsList.getString("RSVSTATUS")%></RsvStatus>
        <RsvDate><%=cRsList.getString("RRT_EXAM_DT")%></RsvDate>
        <RsvTime><%=cRsList.getString("RRT_EXAM_TM")%></RsvTime>
        <CustomerName><%=cRsList.getString("RRT_PSNL_NM")%></CustomerName>
        <CustomerGender><%=cRsList.getString("RRT_SEX_CD")%></CustomerGender>
        <CustomerAge><%=cRsList.getString("RRT_PSNL_AGE")%></CustomerAge>
        <CustomerTel><%=cRsList.getString("RRT_TEL_NO")%></CustomerTel>
		<CustomerMobl><%=cRsList.getString("RRT_MOBL_NO")%></CustomerMobl>
        <CustomerZip><%=cRsList.getString("RRT_ZIP_CD")%></CustomerZip>
        <CustomerAddr1><%=cRsList.getString("RRT_ZIP_AR")%></CustomerAddr1>
        <CustomerAddr2><%=cRsList.getString("RRT_ROAD_AR")%></CustomerAddr2>
        <CompanyCost><%=cRsList.getString("RRT_COMP_PR")%></CompanyCost>
        <PersonalCost><%=cRsList.getString("RRT_PSNL_PR")%></PersonalCost>
        <CustMemo><%=cRsList.getString("RRT_RSVN_TX")%></CustMemo>
        <RsvHomePage><%=cRsList.getString("HOME_RSVN")%></RsvHomePage>
        <PackCode><%=cRsList.getString("PACK_CD")%></PackCode>
        <PackName><%=Pack_Name%></PackName>
		<Birthday><%=cRsList.getString("ICR_BRTH_DT")%></Birthday>
        <MgntYear><%=MNGT_YEAR%></MgntYear>
        <AddItemList><%
			String RRT_EXAM_LT = cRsList.getString("RRT_EXAM_LT");
			String[] arrData = RRT_EXAM_LT.split("\\|");
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

				String strExamLT := RRT_EXAM_LT;
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
        <ServiceID>GetReservedDetailInfo</ServiceID>
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

		if(rsList != null) {
			rsList.close();
			rsList = null;
		}

		if(stmtTmp != null) {
			stmtTmp.close();
			stmtTmp = null;
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