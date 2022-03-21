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
		String ITEM_CD = htMethod.get("ITEM_CD");

		//
		if(EXAM_DT == null) { EXAM_DT = ""; }
		if(EXAM_SQ == null) { EXAM_SQ = ""; }
		if(ITEM_CD == null) { ITEM_CD = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

Select B.CSC_ETC1_CD, B.CSC_FULL_NM, B.CSC_ETC2_CD From ET_RSLT_ITEM A
Inner Join CT_SP_COMMON B On B.CSC_LARGE = 'HM06D'
                         And B.CSC_SMALL LIke 'X01%'
                                           And B.CSC_LEVEL = '5'
                         And B.CSC_ETC1_CD = A.ERI_SPRT_CD
 Where A.ERI_EXAM_DT = :EXAM_DT
   And A.ERI_EXAM_SQ = :EXAM_SQ
   And A.ERI_ITEM_CD = :ITEM_CD

		*/

		sql = " SELECT B.CSC_ETC1_CD, B.CSC_FULL_NM, B.CSC_ETC2_CD";
		sql += " FROM ET_RSLT_ITEM A INNER JOIN CT_SP_COMMON B";
		sql += " ON B.CSC_LARGE = 'HM06D'";
		sql += " AND B.CSC_SMALL LIKE 'X01%'";
		sql += " AND B.CSC_LEVEL = '5'";
		sql += " AND B.CSC_ETC1_CD = A.ERI_SPRT_CD";
		sql += " WHERE A.ERI_EXAM_DT = '" + EXAM_DT + "'";
		sql += " AND A.ERI_EXAM_SQ = '" + EXAM_SQ + "'";
		sql += " AND A.ERI_ITEM_CD = '" + ITEM_CD + "'";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uSP_HEALTH_PRINT_UF_ItemCheck_001 \n";
			G_INFO += "설명 : 특검 결과정보 로딩 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " EXAM_DT : " + EXAM_DT + " \n";
			G_INFO += " EXAM_SQ : " + EXAM_SQ + " \n";
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
		<s:AttributeType name='CSC_ETC1_CD' rs:number='1' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_SP_COMMON'
			 rs:basecolumn='CSC_ETC1_CD'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='CSC_FULL_NM' rs:number='2' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_SP_COMMON'
			 rs:basecolumn='CSC_FULL_NM'>
			<s:datatype dt:type='string' dt:maxLength='500'/>
		</s:AttributeType>
		<s:AttributeType name='CSC_ETC2_CD' rs:number='3' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_SP_COMMON'
			 rs:basecolumn='CSC_ETC2_CD'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='4' rs:rowid='true' rs:basetable='ET_RSLT_ITEM' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c4' rs:name='ROWID' rs:number='5' rs:rowid='true' rs:basetable='CT_SP_COMMON' rs:basecolumn='ROWID'
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

			String CSC_ETC1_CD_T = cRsList.getString("CSC_ETC1_CD");
			String CSC_FULL_NM_T = cRsList.getString("CSC_FULL_NM");
			String CSC_ETC2_CD_T = cRsList.getString("CSC_ETC2_CD");
			String ROWID_T = cRsList.getString("ROWID");
			String c4_T = cRsList.getString("c4");
%>
			<z:row
<%
			if(! CSC_ETC1_CD_T.equals("")) {
%>
		 		CSC_ETC1_CD='<%= CSC_ETC1_CD_T%>'
<%
			}

			if(! CSC_FULL_NM_T.equals("")) {
%>
		 		CSC_FULL_NM='<%= CSC_FULL_NM_T%>'
<%
			}

			if(! CSC_ETC2_CD_T.equals("")) {
%>
		 		CSC_ETC2_CD='<%= CSC_ETC2_CD_T%>'
<%
			}
%>
				ROWID='<%= cnt%>'
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
