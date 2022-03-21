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

		String ASTOMA_DR = htMethod.get("ASTOMA_DR");
		String ACOLON_DR = htMethod.get("ACOLON_DR");
		String ALIVER_DR = htMethod.get("ALIVER_DR");
		String ABAST_DR = htMethod.get("ABAST_DR");
		String AUTER_DR = htMethod.get("AUTER_DR");
		String ALUNG_DR = htMethod.get("ALUNG_DR");
		String IAU_EMP_NO = htMethod.get("IAU_EMP_NO");

		//
		if(ASTOMA_DR == null) { ASTOMA_DR = ""; }
		if(ACOLON_DR == null) { ACOLON_DR = ""; }
		if(ALIVER_DR == null) { ALIVER_DR = ""; }
		if(ABAST_DR == null) { ABAST_DR = ""; }
		if(AUTER_DR == null) { AUTER_DR = ""; }
		if(ALUNG_DR == null) { ALUNG_DR = ""; }
		if(IAU_EMP_NO == null) { IAU_EMP_NO = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT IAU_SIGN_IM, IAU_USE_YN, 
       dbo.f_user_find(:ASTOMA_DR) as stoma_dr,
       dbo.f_user_find(:ACOLON_DR) as colon_dr,
       dbo.f_user_find(:ALIVER_DR) as liver_dr,
       dbo.f_user_find(:ABAST_DR)  as bast_dr, 
       dbo.f_user_find(:AUTER_DR)  as uter_dr, 
       dbo.f_user_find(:ALUNG_DR)  as lung_dr 
  FROM IT_AUTH_USER '
 WHERE UPPER(IAU_EMP_NO) = UPPER(:IAU_EMP_NO)

		*/

		sql = " SELECT IAU_SIGN_IM, IAU_USE_YN, F_USER_FIND('" + ASTOMA_DR + "') AS STOMA_DR, F_USER_FIND('" + ACOLON_DR + "') AS COLON_DR, F_USER_FIND('" + ALIVER_DR + "') AS LIVER_DR, F_USER_FIND('" + ABAST_DR + "') AS BAST_DR, F_USER_FIND('" + AUTER_DR + "') AS UTER_DR, F_USER_FIND('" + ALUNG_DR + "') AS LUNG_DR";
		sql += " FROM IT_AUTH_USER";
		sql += " WHERE UPPER(IAU_EMP_NO) = UPPER('" + IAU_EMP_NO + "')";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uIT_User_re_SetModifyMode_001 \n";
			G_INFO += "설명 : 계정정보로딩 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " ASTOMA_DR : " + ASTOMA_DR + " \n";
			G_INFO += " ACOLON_DR : " + ACOLON_DR + " \n";
			G_INFO += " ALIVER_DR : " + ALIVER_DR + " \n";
			G_INFO += " ABAST_DR : " + ABAST_DR + " \n";
			G_INFO += " AUTER_DR : " + AUTER_DR + " \n";
			G_INFO += " ALUNG_DR : " + ALUNG_DR + " \n";
			G_INFO += " IAU_EMP_NO : " + IAU_EMP_NO + " \n";
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
		<s:AttributeType name='IAU_SIGN_IM' rs:number='1' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_SIGN_IM'>
			<s:datatype dt:type='bin.hex' dt:maxLength='2147483647' rs:long='true'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_USE_YN' rs:number='2' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_USE_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='STOMA_DR' rs:number='3' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='COLON_DR' rs:number='4' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='LIVER_DR' rs:number='5' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='BAST_DR' rs:number='6' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='UTER_DR' rs:number='7' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='LUNG_DR' rs:number='8' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='9' rs:rowid='true' rs:basetable='IT_AUTH_USER' rs:basecolumn='ROWID'
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

			String IAU_SIGN_IM_T = "";
			byte[] buf_IAU_SIGN_IM = rsList.getBytes("IAU_SIGN_IM");
			if(buf_IAU_SIGN_IM != null) {
				IAU_SIGN_IM_T = new String(buf_IAU_SIGN_IM);
			}

			String IAU_USE_YN_T = cRsList.getString("IAU_USE_YN");
			String STOMA_DR_T = cRsList.getString("STOMA_DR");
			String COLON_DR_T = cRsList.getString("COLON_DR");
			String LIVER_DR_T = cRsList.getString("LIVER_DR");
			String BAST_DR_T = cRsList.getString("BAST_DR");
			String UTER_DR_T = cRsList.getString("UTER_DR");
			String LUNG_DR_T = cRsList.getString("LUNG_DR");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! IAU_SIGN_IM_T.equals("")) {
%>
		 		IAU_SIGN_IM='<%= IAU_SIGN_IM_T%>'
<%
			}

			if(! IAU_USE_YN_T.equals("")) {
%>
		 		IAU_USE_YN='<%= IAU_USE_YN_T%>'
<%
			}

			if(! STOMA_DR_T.equals("")) {
%>
		 		STOMA_DR='<%= STOMA_DR_T%>'
<%
			}

			if(! COLON_DR_T.equals("")) {
%>
		 		COLON_DR='<%= COLON_DR_T%>'
<%
			}

			if(! LIVER_DR_T.equals("")) {
%>
		 		LIVER_DR='<%= LIVER_DR_T%>'
<%
			}

			if(! BAST_DR_T.equals("")) {
%>
		 		BAST_DR='<%= BAST_DR_T%>'
<%
			}

			if(! UTER_DR_T.equals("")) {
%>
		 		UTER_DR='<%= UTER_DR_T%>'
<%
			}

			if(! LUNG_DR_T.equals("")) {
%>
		 		LUNG_DR='<%= LUNG_DR_T%>'
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
