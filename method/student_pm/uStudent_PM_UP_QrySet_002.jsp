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

		String EXAM_DT = htMethod.get("EXAM_DT");
		String EXAM_SQ = htMethod.get("EXAM_SQ");

		//
		if(EXAM_DT == null) { EXAM_DT = ""; }
		if(EXAM_SQ == null) { EXAM_SQ = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT B.IAU_SIGN_IM, C.IAU_SIGN_IM IAU_OSIGN_IM
  FROM ET_STDT_PNJN A 
       LEFT OUTER JOIN IT_AUTH_USER  B ON A.ESP_EXAM_DR  = B.IAU_EMP_NO  
       LEFT OUTER JOIN IT_AUTH_USER  C ON A.ESP_ORAL_DR  = C.IAU_EMP_NO  
 WHERE A.ESP_EXAM_DT = :EXAM_DT 
   AND A.ESP_EXAM_SQ = :EXAM_SQ
 
		*/

		sql = " SELECT B.IAU_SIGN_IM, C.IAU_SIGN_IM IAU_OSIGN_IM";
		sql += " FROM ET_STDT_PNJN A LEFT OUTER JOIN IT_AUTH_USER B";
		sql += " ON A.ESP_EXAM_DR = B.IAU_EMP_NO LEFT OUTER JOIN IT_AUTH_USER C";
		sql += " ON A.ESP_ORAL_DR = C.IAU_EMP_NO";
		sql += " WHERE A.ESP_EXAM_DT = '" + EXAM_DT + "'";
		sql += " AND A.ESP_EXAM_SQ = '" + EXAM_SQ + "'";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uStudent_PM_UP_QrySet_002 \n";
			G_INFO += "설명 : 학생검진 판정의사 사인 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " EXAM_DT : " + EXAM_DT + " \n";
			G_INFO += " EXAM_SQ : " + EXAM_SQ + " \n";
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
		<s:AttributeType name='IAU_SIGN_IM' rs:number='1' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_SIGN_IM'>
			<s:datatype dt:type='bin.hex' dt:maxLength='2147483647' rs:long='true'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_OSIGN_IM' rs:number='2' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_SIGN_IM'>
			<s:datatype dt:type='bin.hex' dt:maxLength='2147483647' rs:long='true'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='3' rs:rowid='true' rs:basetable='ET_STDT_PNJN' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c3' rs:name='ROWID' rs:number='4' rs:rowid='true' rs:basetable='IT_AUTH_USER' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c4' rs:name='ROWID' rs:number='5' rs:rowid='true' rs:basetable='IT_AUTH_USER' rs:basecolumn='ROWID'
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

			String IAU_SIGN_IM_T = "";
			byte[] buf_IAU_SIGN_IM = rsList.getBytes("IAU_SIGN_IM");
			if(buf_IAU_SIGN_IM != null) {
				IAU_SIGN_IM_T = new String(buf_IAU_SIGN_IM);
			}

			String IAU_OSIGN_IM_T = "";
			byte[] buf_IAU_OSIGN_IM = rsList.getBytes("IAU_OSIGN_IM");
			if(buf_IAU_OSIGN_IM != null) {
				IAU_OSIGN_IM_T = new String(buf_IAU_OSIGN_IM);
			}


			String ROWID_T = cRsList.getString("ROWID");
			String c3_T = cRsList.getString("c3");
			String c4_T = cRsList.getString("c4");
%>
			<z:row
<%
			if(! IAU_SIGN_IM_T.equals("")) {
%>
		 		IAU_SIGN_IM='<%= IAU_SIGN_IM_T%>'
<%
			}

			if(! IAU_OSIGN_IM_T.equals("")) {
%>
		 		IAU_OSIGN_IM='<%= IAU_OSIGN_IM_T%>'
<%
			}
%>
				ROWID='<%= cnt%>'
				c3='<%= cnt%>'
				c4='<%= cnt%>'
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
