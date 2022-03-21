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

		sql = " SELECT IIM_ITEM_CD, IIM_KNME_NM";
		sql += " FROM IT_ITEM";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : GetExamList \n";
			G_INFO += "설명 : 17. 건강검진 검사목록 조회 \n";
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
	  <ServiceID>GetExamList</ServiceID>
	  <Result>
	  <ResultCode>00</ResultCode>
	  <ResultMessage></ResultMessage>
	  </Result>
  </Header>
  <Body>
  <ExamList>
<%
		int cnt = 0;
		while(cRsList.next()) {

			cnt++;
%>
  <Exam>
  	<ExamCode><%=cRsList.getString("IIM_ITEM_CD")%></ExamCode>
  	<ExamName><%=cRsList.getString("IIM_KNME_NM")%></ExamName>
  	<KumcExamCode></KumcExamCode >
  </Exam>
<%
		}
%>
  </ExamList>
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
        <ServiceID>GetExamList</ServiceID>
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