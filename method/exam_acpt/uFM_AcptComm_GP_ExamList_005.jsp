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

		String EXAM_CD = htMethod.get("EXAM_CD");
		String PACK_SQ = htMethod.get("PACK_SQ");

		//
		if(EXAM_CD == null) { EXAM_CD = ""; }
		if(PACK_SQ == null) { PACK_SQ = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT EPK_PACK_NM EXAM_NM, EPK_ITEM_LT ITEM_LT, EPK_PACK_DT PRCE_DT, EPK_CALC_CD CALC_CD, EPK_OPTN_YN OPTN_YN, 
       EPK_SALE_PR SALE_PR, EPK_GRUP_PR GRUP_PR, EPK_COUP_PR COUP_PR, EPK_FAMY_PR FAMY_PR, 
       EPK_CUPN_PR CUPN_PR, EPK_MMBR_PR MMBR_PR, EPK_OPTN_PR OPTN_PR 
  FROM ET_PACK 
 WHERE EPK_EXAM_CD = :EXAM_CD
   AND EPK_PACK_SQ = :PACK_SQ
		*/

		sql = " SELECT EPK_PACK_NM EXAM_NM, EPK_ITEM_LT ITEM_LT, EPK_PACK_DT PRCE_DT, EPK_CALC_CD CALC_CD, EPK_OPTN_YN OPTN_YN, EPK_SALE_PR SALE_PR, EPK_GRUP_PR GRUP_PR, EPK_COUP_PR COUP_PR, EPK_FAMY_PR FAMY_PR, EPK_CUPN_PR CUPN_PR, EPK_MMBR_PR MMBR_PR, EPK_OPTN_PR OPTN_PR";
		sql += " FROM ET_PACK";
		sql += " WHERE EPK_EXAM_CD = '" + EXAM_CD + "'";
		sql += " AND EPK_PACK_SQ = '" + PACK_SQ + "'";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uFM_AcptComm_GP_ExamList_005 \n";
			G_INFO += "설명 : 개별묶음 수가 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
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
		<s:AttributeType name='EXAM_NM' rs:number='1' rs:writeunknown='true' rs:basetable='ET_PACK' rs:basecolumn='EPK_PACK_NM'>
			<s:datatype dt:type='string' dt:maxLength='200' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ITEM_LT' rs:number='2' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_PACK'
			 rs:basecolumn='EPK_ITEM_LT'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='PRCE_DT' rs:number='3' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_PACK'
			 rs:basecolumn='EPK_PACK_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='CALC_CD' rs:number='4' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_PACK'
			 rs:basecolumn='EPK_CALC_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='OPTN_YN' rs:number='5' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_PACK'
			 rs:basecolumn='EPK_OPTN_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='SALE_PR' rs:number='6' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_PACK'
			 rs:basecolumn='EPK_SALE_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='GRUP_PR' rs:number='7' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_PACK'
			 rs:basecolumn='EPK_GRUP_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='COUP_PR' rs:number='8' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_PACK'
			 rs:basecolumn='EPK_COUP_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='FAMY_PR' rs:number='9' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_PACK'
			 rs:basecolumn='EPK_FAMY_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='CUPN_PR' rs:number='10' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_PACK'
			 rs:basecolumn='EPK_CUPN_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='MMBR_PR' rs:number='11' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_PACK'
			 rs:basecolumn='EPK_MMBR_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='OPTN_PR' rs:number='12' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_PACK'
			 rs:basecolumn='EPK_OPTN_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='13' rs:rowid='true' rs:basetable='ET_PACK' rs:basecolumn='ROWID' rs:keycolumn='true'
			 rs:hidden='true' rs:autoincrement='true'>
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

			String EXAM_NM_T = cRsList.getString("EXAM_NM");
			String ITEM_LT_T = cRsList.getString("ITEM_LT");
			String PRCE_DT_T = cRsList.getString("PRCE_DT");
			String CALC_CD_T = cRsList.getString("CALC_CD");
			String OPTN_YN_T = cRsList.getString("OPTN_YN");
			String SALE_PR_T = cRsList.getString("SALE_PR");
			String GRUP_PR_T = cRsList.getString("GRUP_PR");
			String COUP_PR_T = cRsList.getString("COUP_PR");
			String FAMY_PR_T = cRsList.getString("FAMY_PR");
			String CUPN_PR_T = cRsList.getString("CUPN_PR");
			String MMBR_PR_T = cRsList.getString("MMBR_PR");
			String OPTN_PR_T = cRsList.getString("OPTN_PR");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! EXAM_NM_T.equals("")) {
%>
		 		EXAM_NM='<%= EXAM_NM_T%>'
<%
			}

			if(! ITEM_LT_T.equals("")) {
%>
		 		ITEM_LT='<%= ITEM_LT_T%>'
<%
			}

			if(! PRCE_DT_T.equals("")) {
%>
		 		PRCE_DT='<%= PRCE_DT_T%>'
<%
			}

			if(! CALC_CD_T.equals("")) {
%>
		 		CALC_CD='<%= CALC_CD_T%>'
<%
			}

			if(! OPTN_YN_T.equals("")) {
%>
		 		OPTN_YN='<%= OPTN_YN_T%>'
<%
			}

			if(! SALE_PR_T.equals("")) {
%>
		 		SALE_PR='<%= SALE_PR_T%>'
<%
			}

			if(! GRUP_PR_T.equals("")) {
%>
		 		GRUP_PR='<%= GRUP_PR_T%>'
<%
			}

			if(! COUP_PR_T.equals("")) {
%>
		 		COUP_PR='<%= COUP_PR_T%>'
<%
			}

			if(! FAMY_PR_T.equals("")) {
%>
		 		FAMY_PR='<%= FAMY_PR_T%>'
<%
			}

			if(! CUPN_PR_T.equals("")) {
%>
		 		CUPN_PR='<%= CUPN_PR_T%>'
<%
			}

			if(! MMBR_PR_T.equals("")) {
%>
		 		MMBR_PR='<%= MMBR_PR_T%>'
<%
			}

			if(! OPTN_PR_T.equals("")) {
%>
		 		OPTN_PR='<%= OPTN_PR_T%>'
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
