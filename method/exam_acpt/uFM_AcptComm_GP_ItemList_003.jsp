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

		String PACK_LT = htMethod.get("PACK_LT");

		//
		if(PACK_LT == null) { PACK_LT = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT LTRIM(RTRIM(B.IIM_ITEM_CD)) ITEM_CD, LTRIM(RTRIM(B.IIM_KNME_NM)) ITEM_NM, 
       '00000000000' GBHC_KD, 
       0 ITEM_PR, 0 HOLI_PR, A.EPI_SORT_SQ SORT_SQ 
  FROM ET_PACK_ITEM A, IT_ITEM B 
 WHERE A.EPI_EXAM_CD || A.EPI_PACK_SQ IN (:PACK_LT) 
   AND B.IIM_ITEM_CD = A.EPI_ITEM_CD 
 ORDER BY A.EPI_EXAM_CD, A.EPI_PACK_SQ, A.EPI_SORT_SQ
		*/

		sql = " SELECT LTRIM(RTRIM(B.IIM_ITEM_CD)) ITEM_CD, LTRIM(RTRIM(B.IIM_KNME_NM)) ITEM_NM, '00000000000' GBHC_KD, 0 ITEM_PR, 0 HOLI_PR, A.EPI_SORT_SQ SORT_SQ";
		sql += " FROM ET_PACK_ITEM A, IT_ITEM B";
		sql += " WHERE A.EPI_EXAM_CD || A.EPI_PACK_SQ IN ('" + PACK_LT + "')";
		sql += " AND B.IIM_ITEM_CD = A.EPI_ITEM_CD";
		sql += " ORDER BY A.EPI_EXAM_CD, A.EPI_PACK_SQ, A.EPI_SORT_SQ";
			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uFM_AcptComm_GP_ItemList_003 \n";
			G_INFO += "설명 : 옵션용 개별묶음 검사항목 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " PACK_LT : " + PACK_LT + " \n";
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
		<s:AttributeType name='ITEM_CD' rs:number='1' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ITEM_NM' rs:number='2' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='GBHC_KD' rs:number='3' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='11' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ITEM_PR' rs:number='4' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='HOLI_PR' rs:number='5' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='SORT_SQ' rs:number='6' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_PACK_ITEM'
			 rs:basecolumn='EPI_SORT_SQ'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='7' rs:rowid='true' rs:basetable='ET_PACK_ITEM' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c7' rs:name='ROWID' rs:number='8' rs:rowid='true' rs:basetable='IT_ITEM' rs:basecolumn='ROWID'
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

			String ITEM_CD_T = cRsList.getString("ITEM_CD");
			String ITEM_NM_T = cRsList.getString("ITEM_NM");
			String GBHC_KD_T = cRsList.getString("GBHC_KD");
			String ITEM_PR_T = cRsList.getString("ITEM_PR");
			String HOLI_PR_T = cRsList.getString("HOLI_PR");
			String SORT_SQ_T = cRsList.getString("SORT_SQ");
			String ROWID_T = cRsList.getString("ROWID");
			String c7_T = cRsList.getString("c7");
%>
			<z:row
<%
			if(! ITEM_CD_T.equals("")) {
%>
		 		ITEM_CD='<%= ITEM_CD_T%>'
<%
			}

			if(! ITEM_NM_T.equals("")) {
%>
		 		ITEM_NM='<%= ITEM_NM_T%>'
<%
			}

			if(! GBHC_KD_T.equals("")) {
%>
		 		GBHC_KD='<%= GBHC_KD_T%>'
<%
			}

			if(! ITEM_PR_T.equals("")) {
%>
		 		ITEM_PR='<%= ITEM_PR_T%>'
<%
			}

			if(! HOLI_PR_T.equals("")) {
%>
		 		HOLI_PR='<%= HOLI_PR_T%>'
<%
			}

			if(! SORT_SQ_T.equals("")) {
%>
		 		SORT_SQ='<%= SORT_SQ_T%>'
<%
			}
%>
				ROWID='<%= cnt%>'
				c7='<%= cnt%>'
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
