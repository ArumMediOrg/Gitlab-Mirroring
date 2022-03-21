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
		String CUST_NO = htMethod.get("CUST_NO");
		String ITEM_CD = htMethod.get("ITEM_CD");

		//
		if(EXAM_DT == null) { EXAM_DT = ""; }
		if(CUST_NO == null) { CUST_NO = ""; }
		if(ITEM_CD == null) { ITEM_CD = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

 SELECT EEA_EXAM_DT, EEA_EXAM_SQ
  FROM ET_EXAM_ACPT A
 INNER JOIN ET_RSLT_ITEM B
    ON A.EEA_EXAM_DT = B.ERI_EXAM_DT
   AND A.EEA_EXAM_SQ = B.ERI_EXAM_SQ
   AND B.ERI_CNCL_YN <> 'Y'
 INNER JOIN IT_ITEM C
    ON B.ERI_ITEM_CD = C.IIM_ITEM_CD
   AND C.IIM_EXGN_CD = 'M'
 WHERE A.EEA_EXAM_DT < :EXAM_DT
   AND A.EEA_CUST_NO = :CUST_NO
   AND A.EEA_ORDER_YN <> 'C'
   AND B.ERI_ITEM_CD = :ITEM_CD
   AND ROWNUM = 1
 ORDER BY EEA_EXAM_DT DESC

		*/

		sql = " SELECT EEA_EXAM_DT, EEA_EXAM_SQ";
		sql += " FROM ET_EXAM_ACPT A INNER JOIN ET_RSLT_ITEM B";
		sql += " ON A.EEA_EXAM_DT = B.ERI_EXAM_DT";
		sql += " AND A.EEA_EXAM_SQ = B.ERI_EXAM_SQ";
		sql += " AND B.ERI_CNCL_YN <> 'Y' INNER JOIN IT_ITEM C";
		sql += " ON B.ERI_ITEM_CD = C.IIM_ITEM_CD";
		sql += " AND C.IIM_EXGN_CD = 'M'";
		sql += " WHERE A.EEA_EXAM_DT < '" + EXAM_DT + "'";
		sql += " AND A.EEA_CUST_NO = '" + CUST_NO + "'";
		sql += " AND A.EEA_ORDER_YN <> 'C'";
		sql += " AND B.ERI_ITEM_CD = '" + ITEM_CD + "'";
		sql += " AND ROWNUM = 1";
		sql += " ORDER BY EEA_EXAM_DT DESC";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uSP_Health_UP_GridDisplay_001 \n";
			G_INFO += "설명 : 문진조회-과거문진 검진번호조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " EXAM_DT : " + EXAM_DT + " \n";
			G_INFO += " CUST_NO : " + CUST_NO + " \n";
			G_INFO += " ITEM_CD : " + ITEM_CD + " \n";
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
		<s:AttributeType name='EEA_EXAM_DT' rs:number='1' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_EXAM_DT'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_EXAM_SQ' rs:number='2' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_EXAM_SQ'>
			<s:datatype dt:type='string' dt:maxLength='6' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='3' rs:rowid='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c3' rs:name='ROWID' rs:number='4' rs:rowid='true' rs:basetable='ET_RSLT_ITEM' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c4' rs:name='ROWID' rs:number='5' rs:rowid='true' rs:basetable='IT_ITEM' rs:basecolumn='ROWID'
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

			String EEA_EXAM_DT_T = cRsList.getString("EEA_EXAM_DT");
			String EEA_EXAM_SQ_T = cRsList.getString("EEA_EXAM_SQ");
			String ROWID_T = cRsList.getString("ROWID");
			String c3_T = cRsList.getString("c3");
			String c4_T = cRsList.getString("c4");
%>
			<z:row
<%
			if(! EEA_EXAM_DT_T.equals("")) {
%>
		 		EEA_EXAM_DT='<%= EEA_EXAM_DT_T%>'
<%
			}

			if(! EEA_EXAM_SQ_T.equals("")) {
%>
		 		EEA_EXAM_SQ='<%= EEA_EXAM_SQ_T%>'
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
