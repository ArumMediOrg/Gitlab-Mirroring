<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="/inc_prg/common.jsp"%>
<%
	// 전달자료
	HashMap<String, Object> htData = null;
	HashMap<String, String> htMethod = null;

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
		htData = (HashMap<String, Object>)request.getAttribute("htData");
		htMethod = (HashMap<String, String>)request.getAttribute("htMethod_1");

		String STBNM = htMethod.get("STBNM");
		String SCOL1 = htMethod.get("SCOL1");
		String SCOL2 = htMethod.get("SCOL2");
		String SEXDT = htMethod.get("SEXDT");
		String SEXNO = htMethod.get("SEXNO");
		String SGUBN = htMethod.get("SGUBN");
		String SCOL = htMethod.get("SCOL");
		int colCnt = 0;

		String[] scolAry = SCOL.split(",");

		if(STBNM == null) { STBNM = ""; }
		if(SCOL1 == null) { SCOL1 = ""; }
		if(SCOL2 == null) { SCOL2 = ""; }
		if(SEXDT == null) { SEXDT = ""; }
		if(SEXNO == null) { SEXNO = ""; }
		if(SGUBN == null) { SGUBN = ""; }
		if(SCOL == null) { SCOL = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*
			Select :SCOL From :STBNM                 
			Where :SCOL1 = :SEXDT
			And :SCOL2 = :SEXNO

				If :SGUBN = '6' Then
				And Spg_Exam_Cha = '1'
				Else If :SGUBN = '7' Then
				And Spg_Exam_Cha = '2'

		*/

		sql = " Select " + SCOL + " From " + STBNM + " ";  //필드 정의해서 보내주면 작업 마무리 예정
		sql += " Where " + SCOL1 + " = '" + SEXDT + "' ";
		sql += " And " + SCOL2 + " = '" + SEXNO + "' ";

		if (SGUBN.equals("6")) {
			sql += "And Spg_Exam_Cha = '1' ";
		} else if (SGUBN.equals("7")) {
			sql += "And Spg_Exam_Cha = '2' ";
		}

			//
		G_INFO += "<!-- \n";
		G_INFO += "서비스명 : SmartCMS_SetuInputValue_002 \n";
		G_INFO += "설명 : 테이블 데이터 조회 \n";
		G_INFO += "\n\n";

		G_INFO += "전달인자 : \n";
		G_INFO += " STBNM : " + STBNM + " \n";
		G_INFO += " SCOL1 : " + SCOL1 + " \n";
		G_INFO += " SCOL2 : " + SCOL2 + " \n";
		G_INFO += " SEXDT : " + SEXDT + " \n";
		G_INFO += " SEXNO : " + SEXNO + " \n";
		G_INFO += " SGUBN : " + SGUBN + " \n";
	
		G_INFO += "\n\n";

		G_INFO += "질의문 : " + sql + " \n";
		G_INFO += "-->";

		rsList = stmtList.executeQuery(sql);
		cRsList = new CRs(rsList);

		out.clear();		// include된 파일안의 공백 제거
		response.addHeader("Content-type", "text/xml");
%><?xml version="1.0" encoding="UTF-8"?>

<%= G_INFO%>

<nurionXml>
	<resultCode>200</resultCode>
	<resultXml>
		<xml xmlns:s='uuid:BDC6E3F0-6DA3-11d1-A2A3-00AA00C14882'
			xmlns:dt='uuid:C2F41010-65B3-11d1-A29F-00AA00C14882'
			xmlns:rs='urn:schemas-microsoft-com:rowset'
			xmlns:z='#RowsetSchema'>

<s:Schema id='RowsetSchema'>
	<s:ElementType name='row' content='eltOnly' rs:updatable='true'>
<%
		for (String scol : scolAry) {
			colCnt++;
%>
		<s:AttributeType name='<%= scol.trim()%>' rs:number='<%= Integer.toString(colCnt)%>' rs:nullable='true' rs:writeunknown='true' rs:basetable='DUAL'
			 rs:basecolumn='<%= scol.trim()%>'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
<%
		}

		colCnt++;
%>
		<s:AttributeType name='ROWID' rs:number='<%= Integer.toString(colCnt)%>' rs:rowid='true' rs:basetable='DUAL' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:extends type='rs:rowbase'/>
	</s:ElementType>
</s:Schema>
		<rs:data>
<%
		int cnt = 0;
		while(cRsList.next()) {

			cnt++;
	
%>
			<z:row
<%
			for (String scol : scolAry) {
				String col_T = cRsList.getString(scol.trim());
				if(! col_T.equals("")) {
%>
					<%= scol%>='<%= col_T%>'
<%
				}
			}
%>
				ROWID='<%= cnt%>'
			/>
<%
		}
%>
		</rs:data>
		</xml>
	</resultXml>
	<errorMsg></errorMsg>
</nurionXml>

<%
	} catch (Exception e) {

		out.clear();		// include된 파일안의 공백 제거
		response.addHeader("Content-type", "text/xml");
%><?xml version="1.0" encoding="UTF-8"?>

<%= G_INFO%>

<nurionXml>
	<resultCode>400</resultCode>
	<resultXml></resultXml>
	<errorMsg><![CDATA[<%= e.toString()%>]]></errorMsg>
	<sql><![CDATA[<%= sql%>]]></sql>
</nurionXml>

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
