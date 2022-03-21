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

		String ORGA_CD = htMethod.get("ORGA_CD");
		String EXAM_CD = htMethod.get("EXAM_CD");
		String PACK_SQ = htMethod.get("PACK_SQ");

		//
		if(ORGA_CD == null) { ORGA_CD = ""; }
		if(EXAM_CD == null) { EXAM_CD = ""; }
		if(PACK_SQ == null) { PACK_SQ = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT A.EPI_ITEM_CD 
  FROM ET_PACK_ITEM A              
       INNER JOIN ET_PACK B ON B.EPK_EXAM_CD = A.EPI_EXAM_CD 
                           AND B.EPK_PACK_SQ = A.EPI_PACK_SQ 
                           AND B.EPK_USE_YN  = 'Y'                     
                           AND B.EPK_ORGA_CD = :ORGA_CD       
 WHERE A.EPI_EXAM_CD = :EXAM_CD      
   AND A.EPI_PACK_SQ = :PACK_SQ      
   AND A.EPI_USE_YN  = 'Y'                           
 ORDER BY A.EPI_SORT_SQ
		*/

		sql = " SELECT A.EPI_ITEM_CD";
		sql += " FROM ET_PACK_ITEM A INNER JOIN ET_PACK B";
		sql += " ON B.EPK_EXAM_CD = A.EPI_EXAM_CD";
		sql += " AND B.EPK_PACK_SQ = A.EPI_PACK_SQ";
		sql += " AND B.EPK_USE_YN = 'Y'";
		sql += " AND B.EPK_ORGA_CD = '" + ORGA_CD + "'";
		sql += " WHERE A.EPI_EXAM_CD = '" + EXAM_CD + "'";
		sql += " AND A.EPI_PACK_SQ = '" + PACK_SQ + "'";
		sql += " AND A.EPI_USE_YN = 'Y'";
		sql += " ORDER BY A.EPI_SORT_SQ";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uSP_HEALTH_POSTMANAGEMENT_UF_GumSokunDisplay_005 \n";
			G_INFO += "설명 : 추가검사 조회-3 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " ORGA_CD : " + ORGA_CD + " \n";
			G_INFO += " EXAM_CD : " + EXAM_CD + " \n";
			G_INFO += " PACK_SQ : " + PACK_SQ + " \n";
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
		<s:AttributeType name='EPI_ITEM_CD' rs:number='1' rs:writeunknown='true' rs:basetable='ET_PACK_ITEM' rs:basecolumn='EPI_ITEM_CD'>
			<s:datatype dt:type='string' dt:maxLength='20' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='2' rs:rowid='true' rs:basetable='ET_PACK_ITEM' rs:basecolumn='ROWID'
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

			String EPI_ITEM_CD_T = cRsList.getString("EPI_ITEM_CD");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! EPI_ITEM_CD_T.equals("")) {
%>
		 		EPI_ITEM_CD='<%= EPI_ITEM_CD_T%>'
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
