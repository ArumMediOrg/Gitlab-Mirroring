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
		String PSNL_NM = htMethod.get("PSNL_NM");
		String SPCL_CD = htMethod.get("SPCL_CD");

		//
		if(EXAM_DT == null) { EXAM_DT = ""; }
		if(EXAM_SQ == null) { EXAM_SQ = ""; }
		if(PSNL_NM == null) { PSNL_NM = ""; }
		if(SPCL_CD == null) { SPCL_CD = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

Select
  A.EEA_EXAM_DT,  A.EEA_EXAM_SQ,  A.EEA_PSNL_NM, A.EEA_SPSB_CD, A.EEA_EXAM_LT,
  A.EEA_ORDER_YN, B.SIR_EXAM_DT,  B.SIR_EXAM_SQ, B.SIR_MATT_CD, B.SIR_ORGA_CD,
  B.SIR_EXAM_DT2, B.SIR_EXAM_SQ2
From ET_EXAM_ACPT A
     Inner Join ST_ITEM_RECHECK B On B.SIR_EXAM_DT = :EXAM_DT
                                 And B.SIR_EXAM_SQ = :EXAM_SQ
                                 And B.SIR_MATT_CD In ('70001', '70002')
                                 And B.SIR_ORGA_CD = '05'
Where A.EEA_PSNL_NM = :PSNL_NM
  And A.EEA_SPSB_CD = '42001'
  And A.EEA_SPCL_CD = :SPCL_CD
  And SUBSTR(A.EEA_EXAM_LT,5,8)  = :EXAM_DT
  And SUBSTR(A.EEA_EXAM_LT,13,6) = :EXAM_SQ
  And A.EEA_ORDER_YN <> 'C'
		*/

		sql = " SELECT A.EEA_EXAM_DT, A.EEA_EXAM_SQ, A.EEA_PSNL_NM, A.EEA_SPSB_CD, A.EEA_EXAM_LT, A.EEA_ORDER_YN, B.SIR_EXAM_DT, B.SIR_EXAM_SQ, B.SIR_MATT_CD, B.SIR_ORGA_CD, B.SIR_EXAM_DT2, B.SIR_EXAM_SQ2";
		sql += " FROM ET_EXAM_ACPT A INNER JOIN ST_ITEM_RECHECK B";
		sql += " ON B.SIR_EXAM_DT = '" + EXAM_DT + "'";
		sql += " AND B.SIR_EXAM_SQ = '" + EXAM_SQ + "'";
		sql += " AND B.SIR_MATT_CD IN ('70001', '70002')";
		sql += " AND B.SIR_ORGA_CD = '05'";
		sql += " WHERE A.EEA_PSNL_NM = '" + PSNL_NM + "'";
		sql += " AND A.EEA_SPSB_CD = '42001'";
		sql += " AND A.EEA_SPCL_CD = '" + SPCL_CD + "'";
		sql += " AND SUBSTR(A.EEA_EXAM_LT,5,8) = '" + EXAM_DT + "'";
		sql += " AND SUBSTR(A.EEA_EXAM_LT,13,6) = '" + EXAM_SQ + "'";
		sql += " AND A.EEA_ORDER_YN <> 'C'";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uSP_Health_RzBmpButton5Click_002 \n";
			G_INFO += "설명 : 접수조회(야간2차 신경계 생성) \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " EXAM_DT : " + EXAM_DT + " \n";
			G_INFO += " EXAM_SQ : " + EXAM_SQ + " \n";
			G_INFO += " PSNL_NM : " + PSNL_NM + " \n";
			G_INFO += " SPCL_CD : " + SPCL_CD + " \n";
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
		<s:AttributeType name='EEA_PSNL_NM' rs:number='3' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_PSNL_NM'>
			<s:datatype dt:type='string' dt:maxLength='100' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SPSB_CD' rs:number='4' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_SPSB_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_EXAM_LT' rs:number='5' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_EXAM_LT'>
			<s:datatype dt:type='string' dt:maxLength='1000'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_ORDER_YN' rs:number='6' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_ORDER_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='SIR_EXAM_DT' rs:number='7' rs:writeunknown='true' rs:basetable='ST_ITEM_RECHECK' rs:basecolumn='SIR_EXAM_DT'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='SIR_EXAM_SQ' rs:number='8' rs:writeunknown='true' rs:basetable='ST_ITEM_RECHECK' rs:basecolumn='SIR_EXAM_SQ'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='SIR_MATT_CD' rs:number='9' rs:writeunknown='true' rs:basetable='ST_ITEM_RECHECK' rs:basecolumn='SIR_MATT_CD'>
			<s:datatype dt:type='string' dt:maxLength='5' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='SIR_ORGA_CD' rs:number='10' rs:writeunknown='true' rs:basetable='ST_ITEM_RECHECK' rs:basecolumn='SIR_ORGA_CD'>
			<s:datatype dt:type='string' dt:maxLength='2' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='SIR_EXAM_DT2' rs:number='11' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_ITEM_RECHECK'
			 rs:basecolumn='SIR_EXAM_DT2'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='SIR_EXAM_SQ2' rs:number='12' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_ITEM_RECHECK'
			 rs:basecolumn='SIR_EXAM_SQ2'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='13' rs:rowid='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c13' rs:name='ROWID' rs:number='14' rs:rowid='true' rs:basetable='ST_ITEM_RECHECK' rs:basecolumn='ROWID'
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
			String EEA_PSNL_NM_T = cRsList.getString("EEA_PSNL_NM");
			String EEA_SPSB_CD_T = cRsList.getString("EEA_SPSB_CD");
			String EEA_EXAM_LT_T = cRsList.getString("EEA_EXAM_LT");
			String EEA_ORDER_YN_T = cRsList.getString("EEA_ORDER_YN");
			String SIR_EXAM_DT_T = cRsList.getString("SIR_EXAM_DT");
			String SIR_EXAM_SQ_T = cRsList.getString("SIR_EXAM_SQ");
			String SIR_MATT_CD_T = cRsList.getString("SIR_MATT_CD");
			String SIR_ORGA_CD_T = cRsList.getString("SIR_ORGA_CD");
			String SIR_EXAM_DT2_T = cRsList.getString("SIR_EXAM_DT2");
			String SIR_EXAM_SQ2_T = cRsList.getString("SIR_EXAM_SQ2");
			String ROWID_T = cRsList.getString("ROWID");
			String c13_T = cRsList.getString("c13");
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

			if(! EEA_PSNL_NM_T.equals("")) {
%>
		 		EEA_PSNL_NM='<%= EEA_PSNL_NM_T%>'
<%
			}

			if(! EEA_SPSB_CD_T.equals("")) {
%>
		 		EEA_SPSB_CD='<%= EEA_SPSB_CD_T%>'
<%
			}

			if(! EEA_EXAM_LT_T.equals("")) {
%>
		 		EEA_EXAM_LT='<%= EEA_EXAM_LT_T%>'
<%
			}

			if(! EEA_ORDER_YN_T.equals("")) {
%>
		 		EEA_ORDER_YN='<%= EEA_ORDER_YN_T%>'
<%
			}

			if(! SIR_EXAM_DT_T.equals("")) {
%>
		 		SIR_EXAM_DT='<%= SIR_EXAM_DT_T%>'
<%
			}

			if(! SIR_EXAM_SQ_T.equals("")) {
%>
		 		SIR_EXAM_SQ='<%= SIR_EXAM_SQ_T%>'
<%
			}

			if(! SIR_MATT_CD_T.equals("")) {
%>
		 		SIR_MATT_CD='<%= SIR_MATT_CD_T%>'
<%
			}

			if(! SIR_ORGA_CD_T.equals("")) {
%>
		 		SIR_ORGA_CD='<%= SIR_ORGA_CD_T%>'
<%
			}

			if(! SIR_EXAM_DT2_T.equals("")) {
%>
		 		SIR_EXAM_DT2='<%= SIR_EXAM_DT2_T%>'
<%
			}

			if(! SIR_EXAM_SQ2_T.equals("")) {
%>
		 		SIR_EXAM_SQ2='<%= SIR_EXAM_SQ2_T%>'
<%
			}
%>
				ROWID='<%= cnt%>'
				c13='<%= cnt%>'
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
