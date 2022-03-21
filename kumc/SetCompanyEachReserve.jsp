<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/inc_prg/common.jsp"%>
<%
	// 전달자료
	HashMap<String, Object> htHeader = null;
	HashMap<String, String> htBody = null;
	Vector<Object> vcAddItemList = null;

	// DB객체
	Statement stmtExec = null;
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

		String COMPANYCODE = htBody.get("COMPANYCODE");
		String CUSTOMERUNIQUEID = htBody.get("CUSTOMERUNIQUEID");
		String CUSTOMERNAME = htBody.get("CUSTOMERNAME");
		String RSVDATE = htBody.get("RSVDATE");
		String RSVTIME = htBody.get("RSVTIME");
		String CUSTOMERGENDER = htBody.get("CUSTOMERGENDER");
		String CUSTOMERAGE = htBody.get("CUSTOMERAGE");
		String CUSTOMERTEL = htBody.get("CUSTOMERTEL");
		String CUSTOMERMOBL = htBody.get("CUSTOMERMOBL");
		String CUSTOMERZIP = htBody.get("CUSTOMERZIP");
		String CUSTOMERADDR1 = htBody.get("CUSTOMERADDR1");
		String CUSTOMERADDR2 = htBody.get("CUSTOMERADDR2");
		String COMPANYCOST = htBody.get("COMPANYCOST");
		String PERSONALCOST = htBody.get("PERSONALCOST");
		String CUSTMEMO = htBody.get("CUSTMEMO");
		String RSVHOMEPAGE = htBody.get("RSVHOMEPAGE");
		String PACKCODE = htBody.get("PACKCODE");
		String PACKCOST = htBody.get("PACKCOST");
		String MGNTYEAR = htBody.get("MGNTYEAR");
		String ADDITEMLIST = htBody.get("ADDITEMLIST");
		String ITEM = htBody.get("ITEM");
		String ITEMCODE = htBody.get("ITEMCODE");
		String ITEMCOST = htBody.get("ITEMCOST");

		//
		if(COMPANYCODE == null) { COMPANYCODE = ""; }
		if(CUSTOMERUNIQUEID == null) { CUSTOMERUNIQUEID = ""; }
		if(CUSTOMERNAME == null) { CUSTOMERNAME = ""; }
		if(RSVDATE == null) { RSVDATE = ""; }
		if(RSVTIME == null) { RSVTIME = ""; }
		if(CUSTOMERGENDER == null) { CUSTOMERGENDER = ""; }
		if(CUSTOMERAGE == null) { CUSTOMERAGE = ""; }
		if(CUSTOMERTEL == null) { CUSTOMERTEL = ""; }
		if(CUSTOMERMOBL == null) { CUSTOMERMOBL = ""; }
		if(CUSTOMERZIP == null) { CUSTOMERZIP = ""; }
		if(CUSTOMERADDR1 == null) { CUSTOMERADDR1 = ""; }
		if(CUSTOMERADDR2 == null) { CUSTOMERADDR2 = ""; }
		if(COMPANYCOST == null) { COMPANYCOST = ""; }
		if(PERSONALCOST == null) { PERSONALCOST = ""; }
		if(CUSTMEMO == null) { CUSTMEMO = ""; }
		if(RSVHOMEPAGE == null) { RSVHOMEPAGE = ""; }
		if(PACKCODE == null) { PACKCODE = ""; }
		if(PACKCOST == null) { PACKCOST = ""; }
		if(MGNTYEAR == null) { MGNTYEAR = ""; }
		if(ADDITEMLIST == null) { ADDITEMLIST = ""; }
		if(ITEM == null) { ITEM = ""; }
		if(ITEMCODE == null) { ITEMCODE = ""; }
		if(ITEMCOST == null) { ITEMCOST = ""; }

		// DB객체
		stmtExec = connect.createStatement();
		stmtList = connect.createStatement();

		String SuccessYN = "";

		sql = " SELECT RRT_CUST_NO, RRT_EXAM_DT, RRT_RSVN_NO FROM ARUME.RT_RSVT_WEBPAGE  ";
		sql += " WHERE RRT_CUST_NO = '" + CUSTOMERUNIQUEID + "' ";
		sql += "   AND SUBSTRING(RRT_EXAM_DT, 1, 4) = TO_CHAR(SYSDATE, 'YYYY') ";
		sql += "   AND NVL(RRT_CNCL_YN, 'N') <> 'Y' ";
		sql += " ORDER BY RRT_EXAM_DT DESC ";

		rsList = stmtList.executeQuery(sql);
		cRsList = new CRs(rsList);

		if(cRsList.next()){
			SuccessYN = "N";
		} else {
			SuccessYN = "Y";

			sql = " SELECT ICR_ZIP_CD, ICR_ZIP_AR, ICR_ROAD_AR FROM IT_CUSTOMER ";
			sql += " WHERE ICR_CUST_NO = '" + CUSTOMERUNIQUEID + "' ";

			rsList = stmtList.executeQuery(sql);
			cRsList = new CRs(rsList);

			if(cRsList.next() && CUSTOMERADDR1.equals("")){
				CUSTOMERZIP = cRsList.getString("ICR_ZIP_CD");
				CUSTOMERADDR1 = cRsList.getString("ICR_ZIP_AR");
				CUSTOMERADDR2 = cRsList.getString("ICR_ROAD_AR");
			}

			PACKCODE = PACKCODE.replace("-", "");

			String STREXAMLT = "";
			STREXAMLT += "'C031' || '" + PACKCODE + "$" + PACKCOST + "|'";

			if(vcAddItemList != null) {

				for(int i=0; i<vcAddItemList.size(); i++) {

					HashMap hmItem = (HashMap) vcAddItemList.get(i);
					STREXAMLT += "|| 'I811" + hmItem.get("ITEMCODE") + "$" + hmItem.get("ITEMCOST") + "|'";
				}
			}

			//
			sql = " INSERT INTO RT_RSVT_WEBPAGE ( RRT_RSVN_NO, RRT_COMP_CD, RRT_CUST_NO, RRT_EXAM_DT, RRT_EXAM_TM, RRT_PSNL_NM, RRT_SEX_CD, ";
			sql += " RRT_PSNL_AGE, RRT_TEL_NO, RRT_MOBL_NO, RRT_ZIP_CD, RRT_ZIP_AR, RRT_ROAD_AR, RRT_COMP_PR, RRT_PSNL_PR, RRT_RSVN_TX, RRT_WEB_ID, ";
			sql += " RRT_EXAM_LT, RRT_ACPT_CD, RRT_EXAM_CD, RRT_INPT_ID, RRT_INPT_DTT ) VALUES (";
			sql += " (SELECT CASE WHEN A.RSVN_CNT = 0 THEN (SELECT TO_CHAR(SYSDATE, 'YYYYMMDD')||'000001' RSVN_NO FROM DUAL)";
			sql += "			 WHEN A.RSVN_CNT > 0 THEN (";
			sql += "				SELECT TO_CHAR(RSVN_NO) RSVN_NO";
			sql += "				FROM (";
			sql += "					SELECT RRT_RSVN_NO + 1 RSVN_NO";
			sql += " 					FROM RT_RSVT_WEBPAGE";
			sql += " 					WHERE RRT_RSVN_NO LIKE TO_CHAR(SYSDATE, 'YYYYMMDD') || '%'";
			sql += " 					ORDER BY RSVN_NO DESC";
			sql += "				)";
			sql += " 				WHERE ROWNUM = 1";
			sql += "	) END CASE";
			sql += " FROM (";
			sql += "	SELECT COUNT(RRT_RSVN_NO) RSVN_CNT";
			sql += " 	FROM RT_RSVT_WEBPAGE";
			sql += " 	WHERE RRT_RSVN_NO LIKE TO_CHAR(SYSDATE, 'YYYYMMDD') || '%'";
			sql += " ) A)";
			sql += ", '" + COMPANYCODE + "'";
			sql += ", '" + CUSTOMERUNIQUEID + "'";
			sql += ", '" + RSVDATE + "'";
			sql += ", '" + RSVTIME + "'";
			sql += ", '" + CUSTOMERNAME + "'";
			sql += ", '" + CUSTOMERGENDER + "'";
			sql += ", '" + CUSTOMERAGE + "'";
			sql += ", '" + CUSTOMERTEL + "'";
			sql += ", '" + CUSTOMERMOBL + "'";
			sql += ", '" + CUSTOMERZIP + "'";
			sql += ", '" + CUSTOMERADDR1 + "'";
			sql += ", '" + CUSTOMERADDR2 + "'";
			sql += ", '" + COMPANYCOST + "'";
			sql += ", '" + PERSONALCOST + "'";
			sql += ", '" + CUSTMEMO + "'";
			sql += ", '' ";
			sql += ", " + STREXAMLT;
			sql += ", '2' ";
			sql += ", '21001' ";
			sql += ", 'PCN' ";
			sql += ", SYSDATE ";
			sql += ")";

			stmtExec.executeUpdate(sql);


			sql = " SELECT RRT_RSVN_NO";
			sql += " FROM ( SELECT RRT_RSVN_NO ";
			sql += " FROM RT_RSVT_WEBPAGE";
			sql += " WHERE (RRT_RSVN_NO LIKE TO_CHAR(SYSDATE, 'YYYYMMDD')||'%')";
			sql += " AND (RRT_CUST_NO = '" + CUSTOMERUNIQUEID + "')";
			sql += " ORDER BY RRT_RSVN_NO DESC )";
			sql += " WHERE ROWNUM = 1";

			rsList = stmtList.executeQuery(sql);
			cRsList = new CRs(rsList);
		}

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : SetCompanyEachReserve \n";
			G_INFO += "설명 : 10. 기업 건강검진 예약 입력 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " COMPANYCODE : " + COMPANYCODE + " \n";
			G_INFO += " CUSTOMERUNIQUEID : " + CUSTOMERUNIQUEID + " \n";
			G_INFO += " CUSTOMERNAME : " + CUSTOMERNAME + " \n";
			G_INFO += " RSVDATE : " + RSVDATE + " \n";
			G_INFO += " RSVTIME : " + RSVTIME + " \n";
			G_INFO += " CUSTOMERGENDER : " + CUSTOMERGENDER + " \n";
			G_INFO += " CUSTOMERAGE : " + CUSTOMERAGE + " \n";
			G_INFO += " CUSTOMERTEL : " + CUSTOMERTEL + " \n";
			G_INFO += " CUSTOMERMOBL : " + CUSTOMERMOBL + " \n";
			G_INFO += " CUSTOMERZIP : " + CUSTOMERZIP + " \n";
			G_INFO += " CUSTOMERADDR1 : " + CUSTOMERADDR1 + " \n";
			G_INFO += " CUSTOMERADDR2 : " + CUSTOMERADDR2 + " \n";
			G_INFO += " COMPANYCOST : " + COMPANYCOST + " \n";
			G_INFO += " PERSONALCOST : " + PERSONALCOST + " \n";
			G_INFO += " CUSTMEMO : " + CUSTMEMO + " \n";
			G_INFO += " RSVHOMEPAGE : " + RSVHOMEPAGE + " \n";
			G_INFO += " PACKCODE : " + PACKCODE + " \n";
			G_INFO += " PACKCOST : " + PACKCOST + " \n";
			G_INFO += " MGNTYEAR : " + MGNTYEAR + " \n";
			G_INFO += " ADDITEMLIST : " + ADDITEMLIST + " \n";
			G_INFO += " ITEM : " + ITEM + " \n";
			G_INFO += " ITEMCODE : " + ITEMCODE + " \n";
			G_INFO += " ITEMCOST : " + ITEMCOST + " \n";
			G_INFO += "\n\n";

			G_INFO += "질의문 : " + sql + " \n";
			G_INFO += "-->";

		out.clear();		// include된 파일안의 공백 제거
		response.addHeader("Content-type", "text/xml");
%><?xml version="1.0" encoding="UTF-8"?>

<%= G_INFO%>

<KUMC>
    <Header>
        <ServiceID>SetCompanyEachReserve</ServiceID>
        <Result>
            <ResultCode>00</ResultCode>
            <ResultMessage></ResultMessage>
        </Result>
    </Header>
    <Body>
<%
		if(SuccessYN.equals("Y")){
			int cnt = 0;
			while(cRsList.next()) {
				cnt++;
%>
			<SuccessYN><%= SuccessYN%></SuccessYN>
        	<RsvID><%= cRsList.getString("RRT_RSVN_NO")%></RsvID>
			<RecentRsvnDt></RecentRsvnDt>
<%
			}
		} else {
%>
			<SuccessYN><%= SuccessYN%></SuccessYN>
			<RsvID><%= cRsList.getString("RRT_RSVN_NO")%></RsvID>
			<RecentRsvnDt><%= cRsList.getString("RRT_EXAM_DT")%></RecentRsvnDt>
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
        <ServiceID>SetCompanyEachReserve</ServiceID>
        <Result>
            <ResultCode>99</ResultCode>
            <ResultMessage><![CDATA[<%= e.toString()%>]]></ResultMessage>
            <sql><![CDATA[<%= sql%>]]></sql>
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

		if(stmtExec != null) {
			stmtExec.close();
			stmtExec = null;
		}
%>
<%@ include file="/inc_prg/disconnect.jsp"%>
<%
	}
%>