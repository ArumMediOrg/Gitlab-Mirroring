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

SELECT Distinct                                                 
 ERI_EXAM_DT, ERI_EXAM_SQ, ERI_OCS_CD, ERI_OCSC_SNO, ERI_OSSB_CD
FROM ET_RSLT_ITEM                                               
 WHERE ERI_EXAM_DT = :EXAM_DT
   AND ERI_EXAM_SQ = :EXAM_SQ
   AND NVL(ERI_OCS_CD, ' ') <> ' '                       
   AND NVL(ERI_OCSC_SNO, ' ') = ' '                     
   AND NVL(ERI_CNCL_YN, 'N') <> 'Y'                    
   And SUBSTR(ERI_ITEM_CD,1,1) = 'T'                    
ORDER BY ERI_OCS_CD
		*/

		sql = " SELECT DISTINCT ERI_EXAM_DT, ERI_EXAM_SQ, ERI_OCS_CD, ERI_OCSC_SNO, ERI_OSSB_CD";
		sql += " FROM ET_RSLT_ITEM";
		sql += " WHERE ERI_EXAM_DT = '" + EXAM_DT + "'";
		sql += " AND ERI_EXAM_SQ = '" + EXAM_SQ + "'";
		sql += " AND NVL(ERI_OCS_CD, ' ') <> ' '";
		sql += " AND NVL(ERI_OCSC_SNO, ' ') = ' '";
		sql += " AND NVL(ERI_CNCL_YN, 'N') <> 'Y'";
		sql += " AND SUBSTR(ERI_ITEM_CD,1,1) = 'T'";
		sql += " ORDER BY ERI_OCS_CD";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uMain_OcsSugaInsert_001 \n";
			G_INFO += "설명 : 결과정보 로딩 \n";
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
		<s:AttributeType name='ERI_EXAM_DT' rs:number='1' rs:basetable='ET_RSLT_ITEM' rs:basecolumn='ERI_EXAM_DT'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_EXAM_SQ' rs:number='2' rs:basetable='ET_RSLT_ITEM' rs:basecolumn='ERI_EXAM_SQ'>
			<s:datatype dt:type='string' dt:maxLength='6' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_OCS_CD' rs:number='3' rs:nullable='true' rs:basetable='ET_RSLT_ITEM' rs:basecolumn='ERI_OCS_CD'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_OCSC_SNO' rs:number='4' rs:nullable='true' rs:basetable='ET_RSLT_ITEM' rs:basecolumn='ERI_OCSC_SNO'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_OSSB_CD' rs:number='5' rs:nullable='true' rs:basetable='ET_RSLT_ITEM' rs:basecolumn='ERI_OSSB_CD'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:extends type='rs:rowbase'/>
	</s:ElementType>
</s:Schema>
		<rs:data>
<%
		int cnt = 0;
		while(cRsList.next()) {

			cnt++;

			String ERI_EXAM_DT_T = cRsList.getString("ERI_EXAM_DT");
			String ERI_EXAM_SQ_T = cRsList.getString("ERI_EXAM_SQ");
			String ERI_OCS_CD_T = cRsList.getString("ERI_OCS_CD");
			String ERI_OCSC_SNO_T = cRsList.getString("ERI_OCSC_SNO");
			String ERI_OSSB_CD_T = cRsList.getString("ERI_OSSB_CD");
%>
			<z:row
<%
			if(! ERI_EXAM_DT_T.equals("")) {
%>
		 		ERI_EXAM_DT='<%= ERI_EXAM_DT_T%>'
<%
			}

			if(! ERI_EXAM_SQ_T.equals("")) {
%>
		 		ERI_EXAM_SQ='<%= ERI_EXAM_SQ_T%>'
<%
			}

			if(! ERI_OCS_CD_T.equals("")) {
%>
		 		ERI_OCS_CD='<%= ERI_OCS_CD_T%>'
<%
			}

			if(! ERI_OCSC_SNO_T.equals("")) {
%>
		 		ERI_OCSC_SNO='<%= ERI_OCSC_SNO_T%>'
<%
			}

			if(! ERI_OSSB_CD_T.equals("")) {
%>
		 		ERI_OSSB_CD='<%= ERI_OSSB_CD_T%>'
<%
			}
%>
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
