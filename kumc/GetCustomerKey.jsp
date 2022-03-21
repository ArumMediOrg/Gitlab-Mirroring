<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/inc_prg/common.jsp"%>
<%
	// 전달자료
	HashMap<String, Object> htHeader = null;
	HashMap<String, String> htBody = null;

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

		String CustomerName = htBody.get("CUSTOMERNAME");
		String CustomerID = htBody.get("CUSTOMERID");
		String CustomerGender = htBody.get("CUSTOMERGENDER");
		String CustomerTel = htBody.get("CUSTOMERTEL");
		String CustomerZip = htBody.get("CUSTOMERZIP");
		String CustomerAddr1 = htBody.get("CUSTOMERADDR1");
		String CustomerAddr2 = htBody.get("CUSTOMERADDR2");

		//
		if(CustomerName == null) { CustomerName = ""; }
		if(CustomerID == null) { CustomerID = ""; }
		if(CustomerGender == null) { CustomerGender = ""; }
		if(CustomerTel == null) { CustomerTel = ""; }
		if(CustomerZip == null) { CustomerZip = ""; }
		if(CustomerAddr1 == null) { CustomerAddr1 = ""; }
		if(CustomerAddr2 == null) { CustomerAddr2 = ""; }

		//
		String ICR_PENL_NM = CustomerName;
		String ICR_PENL_ID = CustomerID;
		String ICR_SEX_KD = CustomerGender;

		String ICR_TEL_NO = CustomerTel;
		String ICR_ZIP_CD = CustomerZip;
		String ICR_ZIP_AR = CustomerAddr1;
		String ICR_ROAD_AR = CustomerAddr2;

		String ICR_CUST_NO = "";

		// DB객체
		stmtExec = connect.createStatement();
		stmtList = connect.createStatement();

		sql = " SELECT *";
		sql += " FROM IT_CUSTOMER";
		sql += " WHERE (ICR_PENL_NM = '" + ICR_PENL_NM + "')";
		sql += " AND (ICR_PENL_ID = '" + ICR_PENL_ID + "')";

		rsList = stmtList.executeQuery(sql);
		if(rsList.next()) {

			ICR_CUST_NO = rsList.getString("ICR_CUST_NO");
		} else {

			sql = "INSERT INTO IT_CUSTOMER (ICR_CUST_NO, ICR_PENL_ID, ICR_PENL_NM, ICR_SEX_KD, ICR_TEL_NO, ICR_ZIP_CD, ICR_ZIP_AR, ICR_ROAD_AR, ICR_INPT_DTT, ICR_INPT_ID, ICR_PENL_SQ) VALUES (";
			sql += " (SELECT NVL(ICR_CUST_NO, 0) + 1 ICR_CUST_NO";
			sql += " FROM (";
			sql += "	SELECT ICR_CUST_NO ";
			sql += "  	FROM IT_CUSTOMER";
			sql += "	ORDER BY ICR_CUST_NO DESC";
			sql += " )";
			sql += " WHERE ROWNUM = 1)";

			sql += ", '" + ICR_PENL_ID + "'";
			sql += ", '" + ICR_PENL_NM + "'";
			if(ICR_SEX_KD.equals("M")) {
				sql += ", '1'";
			} else if(ICR_SEX_KD.equals("F")) {
				sql += ", '2'";
			} else {
				sql += ", '0'";
			}
			sql += ", '" + ICR_TEL_NO + "'";
			sql += ", '" + ICR_ZIP_CD + "'";
			sql += ", '" + ICR_ZIP_AR + "'";
			sql += ", '" + ICR_ROAD_AR + "'";
			sql += ", SYSDATE";
			sql += ", 'WebRegister'";
			sql += ", 0";
			sql += ")";

			stmtExec.executeUpdate(sql);

			rsList.close();

			//
			sql = " SELECT *";
			sql += " FROM IT_CUSTOMER";
			sql += " WHERE (ICR_PENL_NM = '" + ICR_PENL_NM + "')";
			sql += " AND (ICR_PENL_ID = '" + ICR_PENL_ID + "')";

			rsList = stmtList.executeQuery(sql);
			rsList.next();
			ICR_CUST_NO = rsList.getString("ICR_CUST_NO");
		}

		rsList.close();

		//
		G_INFO += "<!-- \n";
		G_INFO += "서비스명 : GetCustomerKey \n";
		G_INFO += "설명 : 01. 환자번호 조회/생성 \n";
		G_INFO += "\n\n";

		G_INFO += "전달인자 : \n";
		G_INFO += " CustomerName : " + CustomerName + " \n";
		G_INFO += " CustomerID : " + CustomerID + " \n";
		G_INFO += " CustomerGender : " + CustomerGender + " \n";
		G_INFO += " CustomerTel : " + CustomerTel + " \n";
		G_INFO += " CustomerZip : " + CustomerZip + " \n";
		G_INFO += " CustomerAddr1 : " + CustomerAddr1 + " \n";
		G_INFO += " CustomerAddr2 : " + CustomerAddr2 + " \n";
		G_INFO += "\n\n";

		G_INFO += "질의문 : " + sql + " \n";
		G_INFO += "-->";

		out.clear();		// include된 파일안의 공백 제거
		response.addHeader("Content-type", "text/xml");
%><?xml version="1.0" encoding="UTF-8"?>

<%= G_INFO%>

<KUMC>
    <Header>
        <ServiceID>GetCustomerKey</ServiceID>
        <Result>
            <ResultCode>00</ResultCode>
            <ResultMessage></ResultMessage>
        </Result>
    </Header>
    <Body>
        <CustomerUniqueID><%=ICR_CUST_NO%></CustomerUniqueID>
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
        <ServiceID>GetCustomerKey</ServiceID>
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