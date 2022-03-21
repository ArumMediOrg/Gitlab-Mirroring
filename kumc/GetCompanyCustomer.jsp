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

		String CompanyCode = htBody.get("COMPANYCODE");
		String EmployeeID = htBody.get("EMPLOYEEID");
		String EmployeeName = htBody.get("EMPLOYEENAME");
		String MngtYear = htBody.get("MNGTYEAR");

		//
		if(CompanyCode == null) { CompanyCode = ""; }
		if(EmployeeID == null) { EmployeeID = ""; }
		if(EmployeeName == null) { EmployeeName = ""; }
		if(MngtYear == null) { MngtYear = ""; }

		//
		String COMP_CD = CompanyCode;
		String DIVI_NO = EmployeeID;
		String PENL_NM = EmployeeName;
		String MNGT_YEAR = MngtYear;

		// DB객체
		stmtList = connect.createStatement();

		/*sql = " SELECT ICR_DIVI_NO, ICR_PENL_NM, ICR_COMP_CD, ICY_COMP_NM";
		sql += " FROM IT_CUSTOMER";
		sql += " LEFT OUTER JOIN IT_COMPANY ON ICR_COMP_CD = ICY_COMP_CD ";
		sql += " WHERE ICR_COMP_CD = '" + COMP_CD + "'";
		sql += " AND ICR_PENL_NM = '" + PENL_NM + "'";

		if (!DIVI_NO.equals("")){
			sql += " AND ICR_DIVI_NO = '" + DIVI_NO + "'";
		}*/

		sql = " SELECT ECT_EMPL_CD, ECT_CUST_NM, ECT_COMP_CD, ICY_COMP_NM, ECT_MNGT_YR FROM ET_COMP_CNRT_CUST ";
		sql += " LEFT OUTER JOIN IT_COMPANY ON ECT_COMP_CD = ICY_COMP_CD ";
		sql += " WHERE ECT_COMP_CD = '" + COMP_CD + "'";
		sql += " AND ECT_CUST_NM = '" + PENL_NM + "'";

		if (!DIVI_NO.equals("")){
			sql += " AND ECT_EMPL_CD = '" + DIVI_NO + "'";
		}

		if (!MNGT_YEAR.equals("")){
			sql += " AND ECT_MNGT_YR = '" + MNGT_YEAR + "'";
		}



			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : GetCompanyCustomer \n";
			G_INFO += "설명 : 04. 기업 건강검진 사원 확인 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " CompanyCode : " + CompanyCode + " \n";
			G_INFO += " EmployeeID : " + EmployeeID + " \n";
			G_INFO += " EmployeeName : " + EmployeeName + " \n";
			G_INFO += " MngtYear : " + MngtYear + " \n";
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
        <ServiceID>GetCompanyCustomer</ServiceID>
        <Result>
            <ResultCode>00</ResultCode>
            <ResultMessage></ResultMessage>
        </Result>
    </Header>
    <Body>
        <IsEmployee><%=cRsList.next() ? "Y" : "N"%></IsEmployee>
		<CompanyCode><%=cRsList.getString("ECT_COMP_CD")%></CompanyCode>
		<CompanyName><%=cRsList.getString("ICY_COMP_NM")%></CompanyName>
		<MngtYear><%=cRsList.getString("ECT_MNGT_YR")%></MngtYear>
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
        <ServiceID>GetCompanyCustomer</ServiceID>
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