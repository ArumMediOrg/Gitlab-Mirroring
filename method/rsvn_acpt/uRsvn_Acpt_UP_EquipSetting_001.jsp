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


		//

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT RRE_EQUI_CD, RRE_USE_YN, 
       CASE WHEN UPPER(RRE_USE_YN) = 'Y' THEN '' ELSE 'X' END || RRE_EQUI_NM RRE_EQUI_NM  
  FROM RT_RSVT_EQUIP
 ORDER BY RRE_EQUI_CD
		*/

		sql = " SELECT RRE_EQUI_CD, RRE_USE_YN, CASE WHEN UPPER(RRE_USE_YN) = 'Y' THEN '' ELSE 'X' END || RRE_EQUI_NM RRE_EQUI_NM";
		sql += " FROM RT_RSVT_EQUIP";
		sql += " ORDER BY RRE_EQUI_CD";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uRsvn_Acpt_UP_EquipSetting_001 \n";
			G_INFO += "설명 : 예약장비명 세팅 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
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
		<s:AttributeType name='RRE_EQUI_CD' rs:number='1' rs:writeunknown='true' rs:basetable='RT_RSVT_EQUIP' rs:basecolumn='RRE_EQUI_CD'>
			<s:datatype dt:type='string' dt:maxLength='2' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='RRE_USE_YN' rs:number='2' rs:writeunknown='true' rs:basetable='RT_RSVT_EQUIP' rs:basecolumn='RRE_USE_YN'>
			<s:datatype dt:type='string' dt:maxLength='1' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='RRE_EQUI_NM' rs:number='3' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='101'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='4' rs:rowid='true' rs:basetable='RT_RSVT_EQUIP' rs:basecolumn='ROWID'
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

			String RRE_EQUI_CD_T = cRsList.getString("RRE_EQUI_CD");
			String RRE_USE_YN_T = cRsList.getString("RRE_USE_YN");
			String RRE_EQUI_NM_T = cRsList.getString("RRE_EQUI_NM");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! RRE_EQUI_CD_T.equals("")) {
%>
		 		RRE_EQUI_CD='<%= RRE_EQUI_CD_T%>'
<%
			}

			if(! RRE_USE_YN_T.equals("")) {
%>
		 		RRE_USE_YN='<%= RRE_USE_YN_T%>'
<%
			}

			if(! RRE_EQUI_NM_T.equals("")) {
%>
		 		RRE_EQUI_NM='<%= RRE_EQUI_NM_T%>'
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
