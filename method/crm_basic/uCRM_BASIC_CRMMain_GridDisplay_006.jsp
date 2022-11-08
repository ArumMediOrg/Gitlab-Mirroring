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

		String SEXAM_DT = htMethod.get("SEXAM_DT");
		String EEXAM_DT = htMethod.get("EEXAM_DT");
		String SSQL_ADD = htMethod.get("SSQL_ADD");

		//
		if(SEXAM_DT == null) { SEXAM_DT = ""; }
		if(EEXAM_DT == null) { EEXAM_DT = ""; }
		if(SSQL_ADD == null) { SSQL_ADD = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

Select A.RRT_EXAM_DT  As EXAM_DT,   A.RRT_EXAM_SQ As EXAM_SQ,
       A.RRT_CHART_NO As CHART_NO,  A.RRT_PSNL_NM As PSNL_NM,
       B.ICR_PENL_ID  As PENL_ID,   A.RRT_RSVN_NO As RSVN_NO,
       A.RRT_CUST_NO  As CUST_NO,
       A.RRT_MOBL_NO  AS PHONE_NUM, A.RRT_EXAM_TM AS EXAM_TM
       From RT_RSVT A
Left Outer Join IT_CUSTOMER B On B.ICR_CUST_NO = A.RRT_CUST_NO
Where A.RRT_EXAM_DT >= :sEXAM_DT
  And A.RRT_EXAM_DT <= :eEXAM_DT
  And isnull(A.RRT_EXAM_SQ, '') = ''
:sSQL_ADD
		*/

		sql =  " SELECT A.RRT_EXAM_DT AS EXAM_DT, A.RRT_EXAM_SQ AS EXAM_SQ, A.RRT_CHART_NO AS CHART_NO, A.RRT_PSNL_NM AS PSNL_NM, B.ICR_PENL_ID AS PENL_ID, A.RRT_RSVN_NO AS RSVN_NO, A.RRT_CUST_NO AS CUST_NO, A.RRT_MOBL_NO AS PHONE_NUM, A.RRT_EXAM_TM AS EXAM_TM,";
		sql += " (SELECT COUNT(*) FROM ST_ADVICE WHERE SAE_RSVT_NO = A.RRT_RSVN_NO";
		sql += " AND SAE_USE_YN <> 'N') AS RESE_CNT,";
		sql += " (SELECT COUNT(*) FROM ST_ADVICE WHERE SAE_RSVT_NO = A.RRT_RSVN_NO";
		sql += " AND SAE_USE_YN <> 'N' AND SAE_ADVI_STEP = '1') AS COMP_CNT";
		sql += " FROM RT_RSVT A LEFT OUTER JOIN IT_CUSTOMER B";
		sql += " ON B.ICR_CUST_NO = A.RRT_CUST_NO";
		sql += " WHERE A.RRT_EXAM_DT >= '" + SEXAM_DT + "'";
		sql += " AND A.RRT_EXAM_DT <= '" + EEXAM_DT + "'";
		sql += " AND NVL(A.RRT_EXAM_SQ, ' ') = ' '";
		sql += SSQL_ADD;

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uCRM_BASIC_CRMMain_GridDisplay_006 \n";
			G_INFO += "설명 : 상담관리-예약조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " SEXAM_DT : " + SEXAM_DT + " \n";
			G_INFO += " EEXAM_DT : " + EEXAM_DT + " \n";
			G_INFO += " SSQL_ADD : " + SSQL_ADD + " \n";
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
		<s:AttributeType name='EXAM_DT' rs:number='1' rs:writeunknown='true' rs:basetable='RT_RSVT' rs:basecolumn='RRT_EXAM_DT'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EXAM_SQ' rs:number='2' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT'
			 rs:basecolumn='RRT_EXAM_SQ'>
			<s:datatype dt:type='string' dt:maxLength='6'/>
		</s:AttributeType>
		<s:AttributeType name='CHART_NO' rs:number='3' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT'
			 rs:basecolumn='RRT_CHART_NO'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='PSNL_NM' rs:number='4' rs:writeunknown='true' rs:basetable='RT_RSVT' rs:basecolumn='RRT_PSNL_NM'>
			<s:datatype dt:type='string' dt:maxLength='100' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='PENL_ID' rs:number='5' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_PENL_ID'>
			<s:datatype dt:type='string' dt:maxLength='13'/>
		</s:AttributeType>
		<s:AttributeType name='RSVN_NO' rs:number='6' rs:writeunknown='true' rs:basetable='RT_RSVT' rs:basecolumn='RRT_RSVN_NO'>
			<s:datatype dt:type='string' dt:maxLength='14' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='CUST_NO' rs:number='7' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT'
			 rs:basecolumn='RRT_CUST_NO'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='PHONE_NUM' rs:number='8' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT'
			 rs:basecolumn='RRT_MOBL_NO'>
			<s:datatype dt:type='string' dt:maxLength='12'/>
		</s:AttributeType>
		<s:AttributeType name='EXAM_TM' rs:number='9' rs:writeunknown='true' rs:basetable='RT_RSVT' rs:basecolumn='RRT_EXAM_TM'>
			<s:datatype dt:type='string' dt:maxLength='5' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='10' rs:rowid='true' rs:basetable='RT_RSVT' rs:basecolumn='ROWID' rs:keycolumn='true'
			 rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c10' rs:name='ROWID' rs:number='11' rs:rowid='true' rs:basetable='IT_CUSTOMER' rs:basecolumn='ROWID'
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

			String EXAM_DT_T = cRsList.getString("EXAM_DT");
			String EXAM_SQ_T = cRsList.getString("EXAM_SQ");
			String CHART_NO_T = cRsList.getString("CHART_NO");
			String PSNL_NM_T = cRsList.getString("PSNL_NM");
			String PENL_ID_T = cRsList.getString("PENL_ID");
			String RSVN_NO_T = cRsList.getString("RSVN_NO");
			String CUST_NO_T = cRsList.getString("CUST_NO");
			String PHONE_NUM_T = cRsList.getString("PHONE_NUM");
			String EXAM_TM_T = cRsList.getString("EXAM_TM");
			String ROWID_T = cRsList.getString("ROWID");
			String c10_T = cRsList.getString("c10");
%>
			<z:row
<%
			if(! EXAM_DT_T.equals("")) {
%>
		 		EXAM_DT='<%= EXAM_DT_T%>'
<%
			}

			if(! EXAM_SQ_T.equals("")) {
%>
		 		EXAM_SQ='<%= EXAM_SQ_T%>'
<%
			}

			if(! CHART_NO_T.equals("")) {
%>
		 		CHART_NO='<%= CHART_NO_T%>'
<%
			}

			if(! PSNL_NM_T.equals("")) {
%>
		 		PSNL_NM='<%= PSNL_NM_T%>'
<%
			}

			if(! PENL_ID_T.equals("")) {
%>
		 		PENL_ID='<%= PENL_ID_T%>'
<%
			}

			if(! RSVN_NO_T.equals("")) {
%>
		 		RSVN_NO='<%= RSVN_NO_T%>'
<%
			}

			if(! CUST_NO_T.equals("")) {
%>
		 		CUST_NO='<%= CUST_NO_T%>'
<%
			}

			if(! PHONE_NUM_T.equals("")) {
%>
		 		PHONE_NUM='<%= PHONE_NUM_T%>'
<%
			}

			if(! EXAM_TM_T.equals("")) {
%>
		 		EXAM_TM='<%= EXAM_TM_T%>'
<%
			}
%>
				ROWID='<%= cnt%>'
<%
			if(! c10_T.equals("")) {
%>
		 		c10='<%= c10_T%>'
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
