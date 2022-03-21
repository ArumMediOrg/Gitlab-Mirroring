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

		String CAN_YN = htMethod.get("CAN_YN");
		String USE_YN = htMethod.get("USE_YN");

		//
		if(CAN_YN == null) { CAN_YN = ""; }
		if(USE_YN == null) { USE_YN = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT IAU_EMP_NO, IAU_PENL_NM, CASE WHEN IAU_USE_YN = 'N' THEN '(X)' ELSE '' END USE_YN,
       IAU_LICEN1_NO, IAU_LICEN2_NO 
  FROM IT_AUTH_USER 
 WHERE (IAU_LICEN1_CD IN ('11', '12') OR  IAU_LICEN2_CD IN ('11', '12')) 

if (:CAN_YN = 'Y') then
   AND (NVL(IAU_STOMA_DR, ' ') <> ' ' OR NVL(IAU_COLON_DR, ' ') <> ' ')
   
if (:USE_YN <> '') then
   AND NVL(IAU_USE_YN, 'Y') = :USE_YN
       
 ORDER BY IAU_USE_YN DESC, IAU_PENL_NM
 

		*/

		sql = " SELECT IAU_EMP_NO, IAU_PENL_NM, CASE WHEN IAU_USE_YN = 'N' THEN '(X)' ELSE '' END USE_YN, IAU_LICEN1_NO, IAU_LICEN2_NO";
		sql += " FROM IT_AUTH_USER";
		sql += " WHERE (";
		sql += "	IAU_LICEN1_CD IN ('11', '12')";
		sql += " 	OR IAU_LICEN2_CD IN ('11', '12')";
		sql += ")";

		if(CAN_YN.equals("Y")) {
			sql += " AND (";
			sql += "	NVL(IAU_STOMA_DR, ' ') <> ' '";
			sql += " 	OR NVL(IAU_COLON_DR, ' ') <> ' '";
			sql += ")";
		}
		if(! USE_YN.equals("")) {
			sql += " AND NVL(IAU_USE_YN, 'Y') = '" + USE_YN + "'";
		}
       
		sql += " ORDER BY IAU_USE_YN DESC, IAU_PENL_NM";
 

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uFM_AcptComm_GF_FindDr_001 \n";
			G_INFO += "설명 : 의사 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " CAN_YN : " + CAN_YN + " \n";
			G_INFO += " USE_YN : " + USE_YN + " \n";
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
		<s:AttributeType name='IAU_EMP_NO' rs:number='1' rs:writeunknown='true' rs:basetable='IT_AUTH_USER' rs:basecolumn='IAU_EMP_NO'>
			<s:datatype dt:type='string' dt:maxLength='20' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_PENL_NM' rs:number='2' rs:writeunknown='true' rs:basetable='IT_AUTH_USER' rs:basecolumn='IAU_PENL_NM'>
			<s:datatype dt:type='string' dt:maxLength='100' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='USE_YN' rs:number='3' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='USE_YN'>
			<s:datatype dt:type='string' dt:maxLength='3'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_LICEN1_NO' rs:number='4' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_LICEN2_NO' rs:number='5' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_LICEN2_NO'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='6' rs:rowid='true' rs:basetable='IT_AUTH_USER' rs:basecolumn='ROWID'
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

			String IAU_EMP_NO_T = cRsList.getString("IAU_EMP_NO");
			String IAU_PENL_NM_T = cRsList.getString("IAU_PENL_NM");
			String USE_YN_T = cRsList.getString("USE_YN");
			String IAU_LICEN1_NO_T = cRsList.getString("IAU_LICEN1_NO");
			String IAU_LICEN2_NO_T = cRsList.getString("IAU_LICEN2_NO");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! IAU_EMP_NO_T.equals("")) {
%>
		 		IAU_EMP_NO='<%= IAU_EMP_NO_T%>'
<%
			}

			if(! IAU_PENL_NM_T.equals("")) {
%>
		 		IAU_PENL_NM='<%= IAU_PENL_NM_T%>'
<%
			}

			if(! USE_YN_T.equals("")) {
%>
		 		USE_YN='<%= USE_YN_T%>'
<%
			}

			if(! IAU_LICEN1_NO_T.equals("")) {
%>
		 		IAU_LICEN1_NO='<%= IAU_LICEN1_NO_T%>'
<%
			}

			if(! IAU_LICEN2_NO_T.equals("")) {
%>
		 		IAU_LICEN2_NO='<%= IAU_LICEN2_NO_T%>'
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
