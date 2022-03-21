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

		String MNGT_YR = htMethod.get("MNGT_YR");
		String ESTI_CD = htMethod.get("ESTI_CD");

		//
		if(MNGT_YR == null) { MNGT_YR = ""; }
		if(ESTI_CD == null) { ESTI_CD = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT BEP_PROF_SQ, BEP_PROF_TL, BEP_PROF_NM, BEP_TOTL_PR, BEP_PROF_PR, BEP_PROF_RT, BEP_CUST_CNT, BEP_SALE_PR,  
       CASE WHEN BEP_SEX_CD IS NULL OR BEP_SEX_CD   = '' THEN BEP_SEX_CD   else GetCOMMON_LvCdToNm('0411',BEP_SEX_CD, '5',1) END BEP_SEX_NM
FROM BT_ESTI_PROF 
WHERE BEP_MNGT_YR = :MNGT_YR
   AND BEP_ESTI_CD = :ESTI_CD
   AND BEP_USE_YN = 'Y'
ORDER BY BEP_PROF_TL, BEP_PROF_NM 

		*/

		sql = " SELECT BEP_PROF_SQ, BEP_PROF_TL, BEP_PROF_NM, BEP_TOTL_PR, BEP_PROF_PR, BEP_PROF_RT, BEP_CUST_CNT, BEP_SALE_PR";
		sql += ", CASE WHEN BEP_SEX_CD IS NULL OR BEP_SEX_CD = '' THEN BEP_SEX_CD ELSE GetCOMMON_LvCdToNm('0411',BEP_SEX_CD, '5',1) END BEP_SEX_NM";
		sql += " FROM BT_ESTI_PROF";
		sql += " WHERE BEP_MNGT_YR = '" + MNGT_YR + "'";
		sql += " AND BEP_ESTI_CD = '" + ESTI_CD + "'";
		sql += " AND BEP_USE_YN = 'Y'";
		sql += " ORDER BY BEP_PROF_TL, BEP_PROF_NM";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uBT_ESTIMATE_DataSourceBT_ESTIMATEDataChange_003 \n";
			G_INFO += "설명 : 합산정보 로딩 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " MNGT_YR : " + MNGT_YR + " \n";
			G_INFO += " ESTI_CD : " + ESTI_CD + " \n";
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
		<s:AttributeType name='BEP_PROF_SQ' rs:number='1' rs:writeunknown='true' rs:basetable='BT_ESTI_PROF' rs:basecolumn='BEP_PROF_SQ'>
			<s:datatype dt:type='string' dt:maxLength='2' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='BEP_PROF_TL' rs:number='2' rs:nullable='true' rs:writeunknown='true' rs:basetable='BT_ESTI_PROF'
			 rs:basecolumn='BEP_PROF_TL'>
			<s:datatype dt:type='string' dt:maxLength='50'/>
		</s:AttributeType>
		<s:AttributeType name='BEP_PROF_NM' rs:number='3' rs:writeunknown='true' rs:basetable='BT_ESTI_PROF' rs:basecolumn='BEP_PROF_NM'>
			<s:datatype dt:type='string' dt:maxLength='50' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='BEP_TOTL_PR' rs:number='4' rs:nullable='true' rs:writeunknown='true' rs:basetable='BT_ESTI_PROF'
			 rs:basecolumn='BEP_TOTL_PR'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='BEP_PROF_PR' rs:number='5' rs:nullable='true' rs:writeunknown='true' rs:basetable='BT_ESTI_PROF'
			 rs:basecolumn='BEP_PROF_PR'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='BEP_PROF_RT' rs:number='6' rs:nullable='true' rs:writeunknown='true' rs:basetable='BT_ESTI_PROF'
			 rs:basecolumn='BEP_PROF_RT'>
			<s:datatype dt:type='float' dt:maxLength='8' rs:precision='15' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='BEP_CUST_CNT' rs:number='7' rs:nullable='true' rs:writeunknown='true' rs:basetable='BT_ESTI_PROF'
			 rs:basecolumn='BEP_CUST_CNT'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='BEP_SALE_PR' rs:number='8' rs:nullable='true' rs:writeunknown='true' rs:basetable='BT_ESTI_PROF'
			 rs:basecolumn='BEP_SALE_PR'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='BEP_SEX_NM' rs:number='9' rs:nullable='true' rs:writeunknown='true' rs:basetable='BT_ESTI_PROF'
			 rs:basecolumn='BEP_SEX_NM'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='10' rs:rowid='true' rs:basetable='BT_ESTI_PROF' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:extends type='rs:rowbase'/>
	</s:ElementType>
</s:Schema>		<rs:data>
<%
		int cnt = 0;
		while(cRsList.next()) {

			cnt++;

			String BEP_PROF_SQ_T = cRsList.getString("BEP_PROF_SQ");
			String BEP_PROF_TL_T = cRsList.getString("BEP_PROF_TL");
			String BEP_PROF_NM_T = cRsList.getString("BEP_PROF_NM");
			String BEP_TOTL_PR_T = cRsList.getString("BEP_TOTL_PR");
			String BEP_PROF_PR_T = cRsList.getString("BEP_PROF_PR");
			String BEP_PROF_RT_T = cRsList.getString("BEP_PROF_RT");
			String BEP_CUST_CNT_T = cRsList.getString("BEP_CUST_CNT");
			String BEP_SALE_PR_T = cRsList.getString("BEP_SALE_PR");
			String BEP_SEX_NM_T = cRsList.getString("BEP_SEX_NM");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! BEP_PROF_SQ_T.equals("")) {
%>
		 		BEP_PROF_SQ='<%= BEP_PROF_SQ_T%>'
<%
			}

			if(! BEP_PROF_TL_T.equals("")) {
%>
		 		BEP_PROF_TL='<%= BEP_PROF_TL_T%>'
<%
			}

			if(! BEP_PROF_NM_T.equals("")) {
%>
		 		BEP_PROF_NM='<%= BEP_PROF_NM_T%>'
<%
			}

			if(! BEP_TOTL_PR_T.equals("")) {
%>
		 		BEP_TOTL_PR='<%= BEP_TOTL_PR_T%>'
<%
			}

			if(! BEP_PROF_PR_T.equals("")) {
%>
		 		BEP_PROF_PR='<%= BEP_PROF_PR_T%>'
<%
			}

			if(! BEP_PROF_RT_T.equals("")) {
%>
		 		BEP_PROF_RT='<%= BEP_PROF_RT_T%>'
<%
			}

			if(! BEP_CUST_CNT_T.equals("")) {
%>
		 		BEP_CUST_CNT='<%= BEP_CUST_CNT_T%>'
<%
			}

			if(! BEP_SALE_PR_T.equals("")) {
%>
		 		BEP_SALE_PR='<%= BEP_SALE_PR_T%>'
<%
			}

			if(! BEP_SEX_NM_T.equals("")) {
%>
		 		BEP_SEX_NM='<%= BEP_SEX_NM_T%>'
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
