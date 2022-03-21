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
		String PackPropertyCode = htBody.get("PACKPROPERTYCODE");
		String CustomerGender = htBody.get("CUSTOMERGENDER");
		String MgntYear = htBody.get("MGNTYEAR");
		String PrintPackNameYN = htBody.get("PRINTPACKNAMEYN");

		//
		if(CompanyCode == null) { CompanyCode = ""; }
		if(PackPropertyCode == null) { PackPropertyCode = ""; }
		if(CustomerGender == null) { CustomerGender = ""; }
		if(MgntYear == null) { MgntYear = ""; }
		if(PrintPackNameYN == null) { PrintPackNameYN = ""; }

		//
		String COMP_CD = CompanyCode;
		String MNGT_YR = MgntYear;
		String EXAM_CD = PackPropertyCode;
		String SEX_CD = CustomerGender;


		// DB객체
		stmtList = connect.createStatement();

		sql = " SELECT ECP_MNGT_YR||ECP_EXAM_CD||ECP_CNRT_SQ||ECP_PROF_SQ EXAM_CD, ECP_PROF_NM, ECP_CNRT_PR, ECP_SEX_CD ";
		sql += " FROM ET_COMP_CNRT_PROF";
		sql += " WHERE ECP_COMP_CD = '" + COMP_CD + "'";
		sql += " AND ECP_MNGT_YR = '" + MNGT_YR + "'";
		//sql += " AND ECP_CNRT_SQ = '01'";
		sql += " AND ECP_EXAM_CD LIKE '" + EXAM_CD + "%'";

		if(SEX_CD.equals("M")) {
			sql += " AND ECP_SEX_CD = '1'";
		} else if(SEX_CD.equals("F")) {
			sql += " AND ECP_SEX_CD = '2'";
		}

		sql += " AND ECP_USE_YN = 'Y'";
		sql += " ORDER BY ECP_SORT_SQ";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : GetCompanyPackList \n";
			G_INFO += "설명 : 06. 기업 건강검진 프로그램 목록 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " CompanyCode : " + CompanyCode + " \n";
			G_INFO += " PackPropertyCode : " + PackPropertyCode + " \n";
			G_INFO += " CustomerGender : " + CustomerGender + " \n";
			G_INFO += " MgntYear : " + MgntYear + " \n";
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
        <ServiceID>GetCompanyPackList</ServiceID>
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
			if (cnt==1) break;
			String PrintGender = cRsList.getString("ECP_SEX_CD");
			if(PrintGender.equals("1")){
				PrintGender = "(남)";
			} else if(PrintGender.equals("2")){
				PrintGender = "(여)";
			} else {
				PrintGender = "";
			}

			String PrintPackName = cRsList.getString("ECP_PROF_NM");
			if(!PrintPackNameYN.equals("Y")){
				PrintPackName = "기업체 종합검진" + PrintGender;
			}

			cnt++;
%>
            <Pack>
                <PackCode><%=cRsList.getString("EXAM_CD")%></PackCode>
                <PackName><%=PrintPackName%></PackName>
                <PackCost><%=cRsList.getString("ECP_CNRT_PR")%></PackCost>
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
        <ServiceID>GetCompanyPackList</ServiceID>
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