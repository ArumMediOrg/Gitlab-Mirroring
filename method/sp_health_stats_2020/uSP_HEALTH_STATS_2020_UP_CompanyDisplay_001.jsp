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
		String COMP_CD = htMethod.get("COMP_CD");

		//
		if(MNGT_YR == null) { MNGT_YR = ""; }
		if(COMP_CD == null) { COMP_CD = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT A.ICY_COMP_CD, A.ICY_COMP_NM, A.ICY_COMP_NO, A.ICY_ZIP_AR || A.ICY_ROAD_AR ICY_ADRESS,
       A.ICY_INDD_NO, A.ICY_TKGJ_CD, A.ICY_PROD_NM, A.ICY_PRES_NM, A.ICY_LABO_CD, A.ICY_JIDO_CD,
       CASE WHEN A.ICY_LABO_CD IS NULL OR A.ICY_LABO_CD = '' THEN A.ICY_LABO_CD ELSE GETCOMMON_LVCDTONM('0833', A.ICY_LABO_CD, '5', LENGTH(A.ICY_LABO_CD)) END ICY_LABO_NM, 
       CASE WHEN A.ICY_JIDO_CD IS NULL OR A.ICY_JIDO_CD = '' THEN A.ICY_JIDO_CD ELSE GETCOMMON_LVCDTONM('0812', A.ICY_JIDO_CD, '5', LENGTH(A.ICY_JIDO_CD)) END ICY_JIDO_NM, 
       NVL(B.ICP_TOT_M, 0) ICP_TOT_M, NVL(B.ICP_TOT_F, 0) ICP_TOT_F 
  FROM IT_COMPANY A 
       LEFT OUTER JOIN IT_COMPANY_PERS B 
                    ON A.ICY_COMP_CD = B.ICP_COMP_CD 
                   AND B.ICP_MNGT_YR = :MNGT_YR     
 WHERE A.ICY_COMP_CD = :COMP_CD
		*/

		sql = " SELECT A.ICY_COMP_CD, A.ICY_COMP_NM, A.ICY_COMP_NO, A.ICY_ZIP_AR || A.ICY_ROAD_AR ICY_ADRESS, A.ICY_INDD_NO, A.ICY_TKGJ_CD, A.ICY_PROD_NM, A.ICY_PRES_NM, A.ICY_LABO_CD, A.ICY_JIDO_CD";
		sql += ", CASE WHEN A.ICY_LABO_CD IS NULL OR A.ICY_LABO_CD = '' THEN A.ICY_LABO_CD ELSE GETCOMMON_LVCDTONM('0833', A.ICY_LABO_CD, '5', LENGTH(A.ICY_LABO_CD)) END ICY_LABO_NM";
		sql += ", CASE WHEN A.ICY_JIDO_CD IS NULL OR A.ICY_JIDO_CD = '' THEN A.ICY_JIDO_CD ELSE GETCOMMON_LVCDTONM('0812', A.ICY_JIDO_CD, '5', LENGTH(A.ICY_JIDO_CD)) END ICY_JIDO_NM";
		sql += ", NVL(B.ICP_TOT_M, 0) ICP_TOT_M, NVL(B.ICP_TOT_F, 0) ICP_TOT_F";
		sql += " FROM IT_COMPANY A LEFT OUTER JOIN IT_COMPANY_PERS B";
		sql += " ON A.ICY_COMP_CD = B.ICP_COMP_CD";
		sql += " AND B.ICP_MNGT_YR = '" + MNGT_YR + "'";
		sql += " WHERE A.ICY_COMP_CD = '" + COMP_CD + "'";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uSP_HEALTH_STATS_2020_UP_CompanyDisplay_001 \n";
			G_INFO += "설명 : 사업장정보 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " MNGT_YR : " + MNGT_YR + " \n";
			G_INFO += " COMP_CD : " + COMP_CD + " \n";
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
		<s:AttributeType name='ICY_COMP_CD' rs:number='1' rs:writeunknown='true' rs:basetable='IT_COMPANY' rs:basecolumn='ICY_COMP_CD'>
			<s:datatype dt:type='string' dt:maxLength='12' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_COMP_NM' rs:number='2' rs:writeunknown='true' rs:basetable='IT_COMPANY' rs:basecolumn='ICY_COMP_NM'>
			<s:datatype dt:type='string' dt:maxLength='100' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_COMP_NO' rs:number='3' rs:writeunknown='true' rs:basetable='IT_COMPANY' rs:basecolumn='ICY_COMP_NO'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_ADRESS' rs:number='4' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_INDD_NO' rs:number='5' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMPANY'
			 rs:basecolumn='ICY_INDD_NO'>
			<s:datatype dt:type='string' dt:maxLength='11'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_TKGJ_CD' rs:number='6' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMPANY'
			 rs:basecolumn='ICY_TKGJ_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_PROD_NM' rs:number='7' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMPANY'
			 rs:basecolumn='ICY_PROD_NM'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_PRES_NM' rs:number='8' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMPANY'
			 rs:basecolumn='ICY_PRES_NM'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_LABO_CD' rs:number='9' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMPANY'
			 rs:basecolumn='ICY_LABO_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_JIDO_CD' rs:number='10' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMPANY'
			 rs:basecolumn='ICY_JIDO_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_LABO_NM' rs:number='11' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_JIDO_NM' rs:number='12' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='ICP_TOT_M' rs:number='13' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='ICP_TOT_F' rs:number='14' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='15' rs:rowid='true' rs:basetable='IT_COMPANY' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c15' rs:name='ROWID' rs:number='16' rs:rowid='true' rs:basetable='IT_COMPANY_PERS' rs:basecolumn='ROWID'
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

			String ICY_COMP_CD_T = cRsList.getString("ICY_COMP_CD");
			String ICY_COMP_NM_T = cRsList.getString("ICY_COMP_NM");
			String ICY_COMP_NO_T = cRsList.getString("ICY_COMP_NO");
			String ICY_ADRESS_T = cRsList.getString("ICY_ADRESS");
			String ICY_INDD_NO_T = cRsList.getString("ICY_INDD_NO");
			String ICY_TKGJ_CD_T = cRsList.getString("ICY_TKGJ_CD");
			String ICY_PROD_NM_T = cRsList.getString("ICY_PROD_NM");
			String ICY_PRES_NM_T = cRsList.getString("ICY_PRES_NM");
			String ICY_LABO_CD_T = cRsList.getString("ICY_LABO_CD");
			String ICY_JIDO_CD_T = cRsList.getString("ICY_JIDO_CD");
			String ICY_LABO_NM_T = cRsList.getString("ICY_LABO_NM");
			String ICY_JIDO_NM_T = cRsList.getString("ICY_JIDO_NM");
			String ICP_TOT_M_T = cRsList.getString("ICP_TOT_M");
			String ICP_TOT_F_T = cRsList.getString("ICP_TOT_F");
			String ROWID_T = cRsList.getString("ROWID");
			String c15_T = cRsList.getString("c15");
%>
			<z:row
<%
			if(! ICY_COMP_CD_T.equals("")) {
%>
		 		ICY_COMP_CD='<%= ICY_COMP_CD_T%>'
<%
			}

			if(! ICY_COMP_NM_T.equals("")) {
%>
		 		ICY_COMP_NM='<%= ICY_COMP_NM_T%>'
<%
			}

			if(! ICY_COMP_NO_T.equals("")) {
%>
		 		ICY_COMP_NO='<%= ICY_COMP_NO_T%>'
<%
			}

			if(! ICY_ADRESS_T.equals("")) {
%>
		 		ICY_ADRESS='<%= ICY_ADRESS_T%>'
<%
			}

			if(! ICY_INDD_NO_T.equals("")) {
%>
		 		ICY_INDD_NO='<%= ICY_INDD_NO_T%>'
<%
			}

			if(! ICY_TKGJ_CD_T.equals("")) {
%>
		 		ICY_TKGJ_CD='<%= ICY_TKGJ_CD_T%>'
<%
			}

			if(! ICY_PROD_NM_T.equals("")) {
%>
		 		ICY_PROD_NM='<%= ICY_PROD_NM_T%>'
<%
			}

			if(! ICY_PRES_NM_T.equals("")) {
%>
		 		ICY_PRES_NM='<%= ICY_PRES_NM_T%>'
<%
			}

			if(! ICY_LABO_CD_T.equals("")) {
%>
		 		ICY_LABO_CD='<%= ICY_LABO_CD_T%>'
<%
			}

			if(! ICY_JIDO_CD_T.equals("")) {
%>
		 		ICY_JIDO_CD='<%= ICY_JIDO_CD_T%>'
<%
			}

			if(! ICY_LABO_NM_T.equals("")) {
%>
		 		ICY_LABO_NM='<%= ICY_LABO_NM_T%>'
<%
			}

			if(! ICY_JIDO_NM_T.equals("")) {
%>
		 		ICY_JIDO_NM='<%= ICY_JIDO_NM_T%>'
<%
			}

			if(! ICP_TOT_M_T.equals("")) {
%>
		 		ICP_TOT_M='<%= ICP_TOT_M_T%>'
<%
			}

			if(! ICP_TOT_F_T.equals("")) {
%>
		 		ICP_TOT_F='<%= ICP_TOT_F_T%>'
<%
			}
%>
				ROWID='<%= cnt%>'
				c15='<%= cnt%>'
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
