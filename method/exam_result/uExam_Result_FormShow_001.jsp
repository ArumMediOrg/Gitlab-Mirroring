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


		//

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT NVL(IHL_BLOODCK_KD, 0) AS IHL_BLOODCK_KD,
       NVL(IHL_VIEW_WIDTH, 0) AS IHL_VIEW_WIDTH,
       IHL_ATCF_YN, IHL_QSTN_KD,
       NVL(IHL_DOCT_KD, 0) AS IHL_DOCT_KD,
       NVL(IHL_HABIT_KD, 0) AS IHL_HABIT_KD,
      IHL_VIEWER_PATH
  FROM IT_HOSPITAL
		*/

		sql = " SELECT NVL(IHL_BLOODCK_KD, 0) AS IHL_BLOODCK_KD, NVL(IHL_VIEW_WIDTH, 0) AS IHL_VIEW_WIDTH, IHL_ATCF_YN, IHL_QSTN_KD, NVL(IHL_DOCT_KD, 0) AS IHL_DOCT_KD, NVL(IHL_HABIT_KD, 0) AS IHL_HABIT_KD, IHL_VIEWER_PATH";
		sql += " FROM IT_HOSPITAL";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uExam_Result_FormShow_001 \n";
			G_INFO += "설명 : 병원정보조회(특정컬럼) \n";
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

<nurionXml>
	<resultCode>200</resultCode>
	<resultXml>
		<xml xmlns:s='uuid:BDC6E3F0-6DA3-11d1-A2A3-00AA00C14882'
			xmlns:dt='uuid:C2F41010-65B3-11d1-A29F-00AA00C14882'
			xmlns:rs='urn:schemas-microsoft-com:rowset'
			xmlns:z='#RowsetSchema'>

<s:Schema id='RowsetSchema'>
	<s:ElementType name='row' content='eltOnly' rs:updatable='true'>
		<s:AttributeType name='IHL_BLOODCK_KD' rs:number='1' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='IHL_VIEW_WIDTH' rs:number='2' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='IHL_ATCF_YN' rs:number='3' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_HOSPITAL'
			 rs:basecolumn='IHL_ATCF_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='IHL_QSTN_KD' rs:number='4' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_HOSPITAL'
			 rs:basecolumn='IHL_QSTN_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='IHL_DOCT_KD' rs:number='5' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='IHL_HABIT_KD' rs:number='6' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='IHL_VIEWER_PATH' rs:number='7' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_HOSPITAL'
			 rs:basecolumn='IHL_VIEWER_PATH'>
			<s:datatype dt:type='string' dt:maxLength='30'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='8' rs:rowid='true' rs:basetable='IT_HOSPITAL' rs:basecolumn='ROWID'
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

			String IHL_BLOODCK_KD_T = cRsList.getString("IHL_BLOODCK_KD");
			String IHL_VIEW_WIDTH_T = cRsList.getString("IHL_VIEW_WIDTH");
			String IHL_ATCF_YN_T = cRsList.getString("IHL_ATCF_YN");
			String IHL_QSTN_KD_T = cRsList.getString("IHL_QSTN_KD");
			String IHL_DOCT_KD_T = cRsList.getString("IHL_DOCT_KD");
			String IHL_HABIT_KD_T = cRsList.getString("IHL_HABIT_KD");
			String IHL_VIEWER_PATH_T = cRsList.getString("IHL_VIEWER_PATH");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! IHL_BLOODCK_KD_T.equals("")) {
%>
		 		IHL_BLOODCK_KD='<%= IHL_BLOODCK_KD_T%>'
<%
			}

			if(! IHL_VIEW_WIDTH_T.equals("")) {
%>
		 		IHL_VIEW_WIDTH='<%= IHL_VIEW_WIDTH_T%>'
<%
			}

			if(! IHL_ATCF_YN_T.equals("")) {
%>
		 		IHL_ATCF_YN='<%= IHL_ATCF_YN_T%>'
<%
			}

			if(! IHL_QSTN_KD_T.equals("")) {
%>
		 		IHL_QSTN_KD='<%= IHL_QSTN_KD_T%>'
<%
			}

			if(! IHL_DOCT_KD_T.equals("")) {
%>
		 		IHL_DOCT_KD='<%= IHL_DOCT_KD_T%>'
<%
			}

			if(! IHL_HABIT_KD_T.equals("")) {
%>
		 		IHL_HABIT_KD='<%= IHL_HABIT_KD_T%>'
<%
			}

			if(! IHL_VIEWER_PATH_T.equals("")) {
%>
		 		IHL_VIEWER_PATH='<%= IHL_VIEWER_PATH_T%>'
<%
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
