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

		String COMP_CD = htMethod.get("COMP_CD");

		//
		if(COMP_CD == null) { COMP_CD = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT CASE WHEN C.ICY_TKCG_CD IS NULL OR C.ICY_TKCG_CD = '' THEN C.ICY_TKCG_CD ELSE '[' + C.ICY_TKCG_CD + ']' + dbo.GetCOMMON_LvCdToNm('0804',C.ICY_TKCG_CD,'5',1) END ICY_TKCG_NM,
              CASE WHEN C.ICY_TBAS_CD IS NULL OR C.ICY_TBAS_CD = '' THEN C.ICY_TBAS_CD ELSE '[' + C.ICY_TBAS_CD + ']' + dbo.GetCOMMON_LvCdToNm('0815',C.ICY_TBAS_CD,'5',1) END ICY_TBAS_NM,
              CASE WHEN C.ICY_TKDE_CD IS NULL OR C.ICY_TKDE_CD = '' THEN C.ICY_TKDE_CD ELSE '[' + C.ICY_TKDE_CD + ']' + dbo.GetCOMMON_LvCdToNm('0814',C.ICY_TKDE_CD,'5',1) END ICY_TKDE_NM,
       C.ICY_COMP_NM, C.ICY_SUTK_YN,  C.ICY_COTK_CD, C.ICY_DISC_RT                                                                                                                            
FROM IT_COMPANY C                                                                                                                                                                             
 WHERE C.ICY_COMP_CD = :COMP_CD
		*/

		sql = " SELECT CASE WHEN C.ICY_TKCG_CD IS NULL";
		sql += " OR C.ICY_TKCG_CD = '' THEN C.ICY_TKCG_CD ELSE '[' || C.ICY_TKCG_CD || ']' || GETCOMMON_LVCDTONM('0804',C.ICY_TKCG_CD,'5',1) END ICY_TKCG_NM, CASE WHEN C.ICY_TBAS_CD IS NULL";
		sql += " OR C.ICY_TBAS_CD = '' THEN C.ICY_TBAS_CD ELSE '[' || C.ICY_TBAS_CD || ']' || GETCOMMON_LVCDTONM('0815',C.ICY_TBAS_CD,'5',1) END ICY_TBAS_NM, CASE WHEN C.ICY_TKDE_CD IS NULL";
		sql += " OR C.ICY_TKDE_CD = '' THEN C.ICY_TKDE_CD ELSE '[' || C.ICY_TKDE_CD || ']' || GETCOMMON_LVCDTONM('0814',C.ICY_TKDE_CD,'5',1) END ICY_TKDE_NM, C.ICY_COMP_NM, C.ICY_SUTK_YN, C.ICY_COTK_CD, C.ICY_DISC_RT";
		sql += " FROM IT_COMPANY C";
		sql += " WHERE C.ICY_COMP_CD = '" + COMP_CD + "'";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uCOMP_DEPT_TRNS_UP_Setting_001 \n";
			G_INFO += "설명 : 사업장부서관리 이월 사업장 정보 조회1 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
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
		<s:AttributeType name='ICY_TKCG_NM' rs:number='1' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMPANY'
			 rs:basecolumn='ICY_TKCG_NM'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_TBAS_NM' rs:number='2' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMPANY'
			 rs:basecolumn='ICY_TBAS_NM'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_TKDE_NM' rs:number='3' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMPANY'
			 rs:basecolumn='ICY_TKDE_NM'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_COMP_NM' rs:number='4'>
			<s:datatype dt:type='string' dt:maxLength='120' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_SUTK_YN' rs:number='5' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMPANY'
			 rs:basecolumn='ICY_SUTK_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_COTK_CD' rs:number='6' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMPANY'
			 rs:basecolumn='ICY_COTK_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_DISC_RT' rs:number='7' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMPANY'
			 rs:basecolumn='ICY_DISC_RT'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='8' rs:rowid='true' rs:basetable='IT_COMPANY' rs:basecolumn='ROWID'
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

			String ICY_TKCG_NM_T = cRsList.getString("ICY_TKCG_NM");
			String ICY_TBAS_NM_T = cRsList.getString("ICY_TBAS_NM");
			String ICY_TKDE_NM_T = cRsList.getString("ICY_TKDE_NM");
			String ICY_COMP_NM_T = cRsList.getString("ICY_COMP_NM");
			String ICY_SUTK_YN_T = cRsList.getString("ICY_SUTK_YN");
			String ICY_COTK_CD_T = cRsList.getString("ICY_COTK_CD");
			String ICY_DISC_RT_T = cRsList.getString("ICY_DISC_RT");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! ICY_TKCG_NM_T.equals("")) {
%>
		 		ICY_TKCG_NM='<%= ICY_TKCG_NM_T%>'
<%
			}

			if(! ICY_TBAS_NM_T.equals("")) {
%>
		 		ICY_TBAS_NM='<%= ICY_TBAS_NM_T%>'
<%
			}

			if(! ICY_TKDE_NM_T.equals("")) {
%>
		 		ICY_TKDE_NM='<%= ICY_TKDE_NM_T%>'
<%
			}

			if(! ICY_COMP_NM_T.equals("")) {
%>
		 		ICY_COMP_NM='<%= ICY_COMP_NM_T%>'
<%
			}

			if(! ICY_SUTK_YN_T.equals("")) {
%>
		 		ICY_SUTK_YN='<%= ICY_SUTK_YN_T%>'
<%
			}

			if(! ICY_COTK_CD_T.equals("")) {
%>
		 		ICY_COTK_CD='<%= ICY_COTK_CD_T%>'
<%
			}

			if(! ICY_DISC_RT_T.equals("")) {
%>
		 		ICY_DISC_RT='<%= ICY_DISC_RT_T%>'
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
