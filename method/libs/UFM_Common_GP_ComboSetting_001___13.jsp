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

		String SLARGE = htMethod.get("SLARGE");
		String SSMALL = htMethod.get("SSMALL");
		String SLEVEL = htMethod.get("SLEVEL");
		String SSEARCH = htMethod.get("SSEARCH");

		//
		if(SLARGE == null) { SLARGE = ""; }
		if(SSMALL == null) { SSMALL = ""; }
		if(SLEVEL == null) { SLEVEL = ""; }
		if(SSEARCH == null) { SSEARCH = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

      SELECT ECP_PROF_SQ, ECP_PROF_NM, ECP_PROF_TL, 
                         CASE WHEN NVL(ECP_SEX_CD, ' ') = ' ' THEN ECP_SEX_CD  else dbo.GetCOMMON_LvCdToNm('0411',ECP_SEX_CD,'5',1) END ECP_SEX_NM 
                  FROM ET_COMP_CNRT_PROF
                  WHERE ECP_COMP_CD = :sLarge AND ECP_MNGT_YR = :sSmall
                    AND ECP_CNRT_SQ = :sLevel
                    AND ECP_SEX_CD IN (:sSearch)
                    AND ECP_USE_YN = 'Y'
                  ORDER BY ECP_PROF_SQ 

		*/

		sql = " SELECT ECP_PROF_SQ, ECP_PROF_NM, ECP_PROF_TL, CASE WHEN NVL(ECP_SEX_CD, ' ') = ' ' THEN ECP_SEX_CD ELSE GETCOMMON_LVCDTONM('0411',ECP_SEX_CD,'5',1) END ECP_SEX_NM";
		sql += " FROM ET_COMP_CNRT_PROF";
		sql += " WHERE ECP_COMP_CD = '" + SLARGE + "'";
		sql += " AND ECP_MNGT_YR = '" + SSMALL + "'";
		sql += " AND ECP_CNRT_SQ = '" + SLEVEL + "'";
		sql += " AND ECP_SEX_CD IN ('" + SSEARCH + "')";
		sql += " AND ECP_USE_YN = 'Y'";
		sql += " ORDER BY ECP_PROF_SQ";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : UFM_Common_GP_ComboSetting_001___13 \n";
			G_INFO += "설명 : 구분값에 따른 콤보박스 정보 로딩___13 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " SLARGE : " + SLARGE + " \n";
			G_INFO += " SSMALL : " + SSMALL + " \n";
			G_INFO += " SLEVEL : " + SLEVEL + " \n";
			G_INFO += " SSEARCH : " + SSEARCH + " \n";
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
		<s:AttributeType name='ECP_PROF_SQ' rs:number='1' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_PROF' rs:basecolumn='ECP_PROF_SQ'>
			<s:datatype dt:type='string' dt:maxLength='2' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ECP_PROF_NM' rs:number='2' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_PROF' rs:basecolumn='ECP_PROF_NM'>
			<s:datatype dt:type='string' dt:maxLength='100' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ECP_PROF_TL' rs:number='3' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_PROF'
			 rs:basecolumn='ECP_PROF_TL'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='ECP_SEX_NM' rs:number='4' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_PROF'
			 rs:basecolumn='ECP_SEX_NM'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='5' rs:rowid='true' rs:basetable='ET_COMP_CNRT_PROF' rs:basecolumn='ROWID'
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

			String ECP_PROF_SQ_T = cRsList.getString("ECP_PROF_SQ");
			String ECP_PROF_NM_T = cRsList.getString("ECP_PROF_NM");
			String ECP_PROF_TL_T = cRsList.getString("ECP_PROF_TL");
			String ECP_SEX_NM_T = cRsList.getString("ECP_SEX_NM");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! ECP_PROF_SQ_T.equals("")) {
%>
		 		ECP_PROF_SQ='<%= ECP_PROF_SQ_T%>'
<%
			}

			if(! ECP_PROF_NM_T.equals("")) {
%>
		 		ECP_PROF_NM='<%= ECP_PROF_NM_T%>'
<%
			}

			if(! ECP_PROF_TL_T.equals("")) {
%>
		 		ECP_PROF_TL='<%= ECP_PROF_TL_T%>'
<%
			}

			if(! ECP_SEX_NM_T.equals("")) {
%>
		 		ECP_SEX_NM='<%= ECP_SEX_NM_T%>'
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
