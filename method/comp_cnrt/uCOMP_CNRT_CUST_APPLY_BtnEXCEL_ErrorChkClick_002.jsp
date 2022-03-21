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
		String MNGT_YR = htMethod.get("MNGT_YR");

		//
		if(COMP_CD == null) { COMP_CD = ""; }
		if(MNGT_YR == null) { MNGT_YR = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

 SELECT ICD_HALF_CD, ICD_DEPT_CD, ICD_DEPT_NM, ICD_SUBD_NM,
  CASE WHEN ICD_HALF_CD IS NULL OR ICD_HALF_CD = '' THEN ICD_HALF_CD  else  ICD_HALF_CD  || '-' || GetSP_COMMON_cdToNm('HM99F',ICD_HALF_CD) END HALF_NM,
  CASE WHEN ICD_SUBD_NM IS NULL OR ICD_SUBD_NM = '' THEN  ICD_DEPT_CD || '-' || ICD_DEPT_NM  else ICD_DEPT_CD || '-' || ICD_DEPT_NM || '(' || ICD_SUBD_NM || ')' END  DEPT_NM
FROM IT_COMP_DEPT
WHERE ICD_COMP_CD = :COMP_CD
  AND ICD_MNGT_YR = :MNGT_YR
  AND ICD_USE_YN  = 'Y'
		*/

		sql = " SELECT ICD_HALF_CD, ICD_DEPT_CD, ICD_DEPT_NM, ICD_SUBD_NM";
		sql += ", CASE WHEN ICD_HALF_CD IS NULL OR ICD_HALF_CD = '' THEN ICD_HALF_CD ELSE ICD_HALF_CD || '-' || GETSP_COMMON_CDTONM('HM99F',ICD_HALF_CD) END HALF_NM";
		sql += ", CASE WHEN ICD_SUBD_NM IS NULL OR ICD_SUBD_NM = '' THEN ICD_DEPT_CD || '-' || ICD_DEPT_NM ELSE ICD_DEPT_CD || '-' || ICD_DEPT_NM || '(' || ICD_SUBD_NM || ')' END DEPT_NM";
		sql += " FROM IT_COMP_DEPT";
		sql += " WHERE ICD_COMP_CD = '" + COMP_CD + "'";
		sql += " AND ICD_MNGT_YR = '" + MNGT_YR + "'";
		sql += " AND ICD_USE_YN = 'Y'";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uCOMP_CNRT_CUST_APPLY_BtnEXCEL_ErrorChkClick_002 \n";
			G_INFO += "설명 : 엑셀오류체크-부서코드 내역 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " COMP_CD : " + COMP_CD + " \n";
			G_INFO += " MNGT_YR : " + MNGT_YR + " \n";
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
		<s:AttributeType name='ICD_HALF_CD' rs:number='1' rs:writeunknown='true' rs:basetable='IT_COMP_DEPT' rs:basecolumn='ICD_HALF_CD'>
			<s:datatype dt:type='string' dt:maxLength='1' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ICD_DEPT_CD' rs:number='2' rs:writeunknown='true' rs:basetable='IT_COMP_DEPT' rs:basecolumn='ICD_DEPT_CD'>
			<s:datatype dt:type='string' dt:maxLength='4' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ICD_DEPT_NM' rs:number='3' rs:writeunknown='true' rs:basetable='IT_COMP_DEPT' rs:basecolumn='ICD_DEPT_NM'>
			<s:datatype dt:type='string' dt:maxLength='100' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ICD_SUBD_NM' rs:number='4' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMP_DEPT'
			 rs:basecolumn='ICD_SUBD_NM'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='HALF_NM' rs:number='5' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMP_DEPT'
			 rs:basecolumn='HALF_NM'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='DEPT_NM' rs:number='6' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMP_DEPT'
			 rs:basecolumn='DEPT_NM'>
			<s:datatype dt:type='string' dt:maxLength='207'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='7' rs:rowid='true' rs:basetable='IT_COMP_DEPT' rs:basecolumn='ROWID'
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

			String ICD_HALF_CD_T = cRsList.getString("ICD_HALF_CD");
			String ICD_DEPT_CD_T = cRsList.getString("ICD_DEPT_CD");
			String ICD_DEPT_NM_T = cRsList.getString("ICD_DEPT_NM");
			String ICD_SUBD_NM_T = cRsList.getString("ICD_SUBD_NM");
			String HALF_NM_T = cRsList.getString("HALF_NM");
			String DEPT_NM_T = cRsList.getString("DEPT_NM");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! ICD_HALF_CD_T.equals("")) {
%>
		 		ICD_HALF_CD='<%= ICD_HALF_CD_T%>'
<%
			}

			if(! ICD_DEPT_CD_T.equals("")) {
%>
		 		ICD_DEPT_CD='<%= ICD_DEPT_CD_T%>'
<%
			}

			if(! ICD_DEPT_NM_T.equals("")) {
%>
		 		ICD_DEPT_NM='<%= ICD_DEPT_NM_T%>'
<%
			}

			if(! ICD_SUBD_NM_T.equals("")) {
%>
		 		ICD_SUBD_NM='<%= ICD_SUBD_NM_T%>'
<%
			}

			if(! HALF_NM_T.equals("")) {
%>
		 		HALF_NM='<%= HALF_NM_T%>'
<%
			}

			if(! DEPT_NM_T.equals("")) {
%>
		 		DEPT_NM='<%= DEPT_NM_T%>'
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
