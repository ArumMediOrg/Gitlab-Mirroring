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

SELECT A.ERI_ITEM_CD, A.ERI_RSLT_VL, A.ERI_VLDT_LH, A.ERI_STSB_PANJ 
  FROM ET_RSLT_ITEM A 
 WHERE A.ERI_EXAM_DT = :EXAM_DT
   AND A.ERI_EXAM_SQ = :EXAM_SQ
   AND A.ERI_ITEM_CD NOT IN ('A0014', 'A0015') 
   AND NVL(A.ERI_VLDT_LH, ' ') <> ' ' 
   AND A.ERI_CNCL_YN = 'N' 
UNION 
SELECT * 
  FROM (SELECT A.ERI_ITEM_CD, A.ERI_RSLT_VL, A.ERI_VLDT_LH, A.ERI_STSB_PANJ 
          FROM ET_RSLT_ITEM A 
         WHERE A.ERI_EXAM_DT = :EXAM_DT 
           AND A.ERI_EXAM_SQ = :EXAM_SQ
           AND A.ERI_ITEM_CD IN ('A0014', 'A0015') 
           AND NVL(A.ERI_VLDT_LH, ' ') <> ' ' 
           AND A.ERI_CNCL_YN = 'N' 
         ORDER BY A.ERI_STSB_PANJ DESC 
       ) B     
 WHERE ROWNUM = 1    
		*/

		sql = " SELECT A.ERI_ITEM_CD, A.ERI_RSLT_VL, A.ERI_VLDT_LH, A.ERI_STSB_PANJ";
		sql += " FROM ET_RSLT_ITEM A";
		sql += " WHERE A.ERI_EXAM_DT = '" + EXAM_DT + "'";
		sql += " AND A.ERI_EXAM_SQ = '" + EXAM_SQ + "'";
		sql += " AND A.ERI_ITEM_CD NOT IN ('A0014', 'A0015')";
		sql += " AND NVL(A.ERI_VLDT_LH, ' ') <> ' '";
		sql += " AND A.ERI_CNCL_YN = 'N'";

		sql += " UNION";

		sql += " SELECT *";
		sql += " FROM (";
		sql += "	SELECT A.ERI_ITEM_CD, A.ERI_RSLT_VL, A.ERI_VLDT_LH, A.ERI_STSB_PANJ";
		sql += " 	FROM ET_RSLT_ITEM A";
		sql += " 	WHERE A.ERI_EXAM_DT = '" + EXAM_DT + "'";
		sql += " 	AND A.ERI_EXAM_SQ = '" + EXAM_SQ + "'";
		sql += " 	AND A.ERI_ITEM_CD IN ('A0014', 'A0015')";
		sql += " 	AND NVL(A.ERI_VLDT_LH, ' ') <> ' '";
		sql += " 	AND A.ERI_CNCL_YN = 'N'";
		sql += " 	ORDER BY A.ERI_STSB_PANJ DESC";
		sql += " ) B";
		sql += " WHERE ROWNUM = 1";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uStdt_Pnjn_btnPnjn_EachClick_001 \n";
			G_INFO += "설명 : 학생 검진 비정상 항목 조회 \n";
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
		<s:AttributeType name='ERI_ITEM_CD' rs:number='1' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_RSLT_ITEM'
			 rs:basecolumn='ERI_ITEM_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_RSLT_VL' rs:number='2' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_RSLT_ITEM'
			 rs:basecolumn='ERI_RSLT_VL'>
			<s:datatype dt:type='string' dt:maxLength='50'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_VLDT_LH' rs:number='3' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_RSLT_ITEM'
			 rs:basecolumn='ERI_VLDT_LH'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_STSB_PANJ' rs:number='4' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_RSLT_ITEM'
			 rs:basecolumn='ERI_STSB_PANJ'>
			<s:datatype dt:type='string' dt:maxLength='30'/>
		</s:AttributeType>
		<s:extends type='rs:rowbase'/>
	</s:ElementType>
</s:Schema>
		<rs:data>
<%
		int cnt = 0;
		while(cRsList.next()) {

			cnt++;

			String ERI_ITEM_CD_T = cRsList.getString("ERI_ITEM_CD");
			String ERI_RSLT_VL_T = cRsList.getString("ERI_RSLT_VL");
			String ERI_VLDT_LH_T = cRsList.getString("ERI_VLDT_LH");
			String ERI_STSB_PANJ_T = cRsList.getString("ERI_STSB_PANJ");
%>
			<z:row
<%
			if(! ERI_ITEM_CD_T.equals("")) {
%>
		 		ERI_ITEM_CD='<%= ERI_ITEM_CD_T%>'
<%
			}

			if(! ERI_RSLT_VL_T.equals("")) {
%>
		 		ERI_RSLT_VL='<%= ERI_RSLT_VL_T%>'
<%
			}

			if(! ERI_VLDT_LH_T.equals("")) {
%>
		 		ERI_VLDT_LH='<%= ERI_VLDT_LH_T%>'
<%
			}

			if(! ERI_STSB_PANJ_T.equals("")) {
%>
		 		ERI_STSB_PANJ='<%= ERI_STSB_PANJ_T%>'
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
