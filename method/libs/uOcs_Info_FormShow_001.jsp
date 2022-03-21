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

select * from it_ocs_info
		*/

		sql = " SELECT *";
		sql += " FROM it_ocs_info";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uOcs_Info_FormShow_001 \n";
			G_INFO += "설명 : OCS 설정내용 로딩 \n";
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
		<s:AttributeType name='IOI_OCS_KD' rs:number='1' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_OCS_INFO'
			 rs:basecolumn='IOI_OCS_KD'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='IOI_USE_YN' rs:number='2' rs:writeunknown='true' rs:basetable='IT_OCS_INFO' rs:basecolumn='IOI_USE_YN'>
			<s:datatype dt:type='string' dt:maxLength='1' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='IOI_DB_KD' rs:number='3' rs:writeunknown='true' rs:basetable='IT_OCS_INFO' rs:basecolumn='IOI_DB_KD'>
			<s:datatype dt:type='string' dt:maxLength='1' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='IOI_DB_IP' rs:number='4' rs:writeunknown='true' rs:basetable='IT_OCS_INFO' rs:basecolumn='IOI_DB_IP'>
			<s:datatype dt:type='string' dt:maxLength='256' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='IOI_DB_NM' rs:number='5' rs:writeunknown='true' rs:basetable='IT_OCS_INFO' rs:basecolumn='IOI_DB_NM'>
			<s:datatype dt:type='string' dt:maxLength='256' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='IOI_DB_ID' rs:number='6' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_OCS_INFO'
			 rs:basecolumn='IOI_DB_ID'>
			<s:datatype dt:type='string' dt:maxLength='256'/>
		</s:AttributeType>
		<s:AttributeType name='IOI_DB_PW' rs:number='7' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_OCS_INFO'
			 rs:basecolumn='IOI_DB_PW'>
			<s:datatype dt:type='string' dt:maxLength='256'/>
		</s:AttributeType>
		<s:AttributeType name='IOI_TBL_NM' rs:number='8' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_OCS_INFO'
			 rs:basecolumn='IOI_TBL_NM'>
			<s:datatype dt:type='string' dt:maxLength='60'/>
		</s:AttributeType>
		<s:AttributeType name='IOI_CHART_NO' rs:number='9' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_OCS_INFO'
			 rs:basecolumn='IOI_CHART_NO'>
			<s:datatype dt:type='string' dt:maxLength='60'/>
		</s:AttributeType>
		<s:AttributeType name='IOI_PSNL_ID' rs:number='10' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_OCS_INFO'
			 rs:basecolumn='IOI_PSNL_ID'>
			<s:datatype dt:type='string' dt:maxLength='60'/>
		</s:AttributeType>
		<s:AttributeType name='IOI_PSNL_NM' rs:number='11' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_OCS_INFO'
			 rs:basecolumn='IOI_PSNL_NM'>
			<s:datatype dt:type='string' dt:maxLength='60'/>
		</s:AttributeType>
		<s:AttributeType name='IOI_ZIP_CD' rs:number='12' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_OCS_INFO'
			 rs:basecolumn='IOI_ZIP_CD'>
			<s:datatype dt:type='string' dt:maxLength='60'/>
		</s:AttributeType>
		<s:AttributeType name='IOI_ZIP_SQ' rs:number='13' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_OCS_INFO'
			 rs:basecolumn='IOI_ZIP_SQ'>
			<s:datatype dt:type='string' dt:maxLength='60'/>
		</s:AttributeType>
		<s:AttributeType name='IOI_ZIP_AR' rs:number='14' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_OCS_INFO'
			 rs:basecolumn='IOI_ZIP_AR'>
			<s:datatype dt:type='string' dt:maxLength='60'/>
		</s:AttributeType>
		<s:AttributeType name='IOI_ROAD_AR' rs:number='15' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_OCS_INFO'
			 rs:basecolumn='IOI_ROAD_AR'>
			<s:datatype dt:type='string' dt:maxLength='60'/>
		</s:AttributeType>
		<s:AttributeType name='IOI_BLDG_NO' rs:number='16' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_OCS_INFO'
			 rs:basecolumn='IOI_BLDG_NO'>
			<s:datatype dt:type='string' dt:maxLength='60'/>
		</s:AttributeType>
		<s:AttributeType name='IOI_TEL_NO' rs:number='17' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_OCS_INFO'
			 rs:basecolumn='IOI_TEL_NO'>
			<s:datatype dt:type='string' dt:maxLength='60'/>
		</s:AttributeType>
		<s:AttributeType name='IOI_MOBL_NO' rs:number='18' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_OCS_INFO'
			 rs:basecolumn='IOI_MOBL_NO'>
			<s:datatype dt:type='string' dt:maxLength='60'/>
		</s:AttributeType>
		<s:AttributeType name='IOI_EMAIL_AR' rs:number='19' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_OCS_INFO'
			 rs:basecolumn='IOI_EMAIL_AR'>
			<s:datatype dt:type='string' dt:maxLength='60'/>
		</s:AttributeType>
		<s:AttributeType name='IOI_LAST_DT' rs:number='20' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_OCS_INFO'
			 rs:basecolumn='IOI_LAST_DT'>
			<s:datatype dt:type='string' dt:maxLength='60'/>
		</s:AttributeType>
		<s:AttributeType name='IOI_ENCRT_KD' rs:number='21' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_OCS_INFO'
			 rs:basecolumn='IOI_ENCRT_KD'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='IOI_BIRTH_DT' rs:number='22' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_OCS_INFO'
			 rs:basecolumn='IOI_BIRTH_DT'>
			<s:datatype dt:type='string' dt:maxLength='30'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='23' rs:rowid='true' rs:writeunknown='true' rs:basetable='IT_OCS_INFO'
			 rs:basecolumn='ROWID' rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:extends type='rs:rowbase'/>
	</s:ElementType>
</s:Schema>		<rs:data>
<%
		int cnt = 0;
		while(cRsList.next()) {

			cnt++;

			String IOI_OCS_KD_T = cRsList.getString("IOI_OCS_KD");
			String IOI_USE_YN_T = cRsList.getString("IOI_USE_YN");
			String IOI_DB_KD_T = cRsList.getString("IOI_DB_KD");
			String IOI_DB_IP_T = cRsList.getString("IOI_DB_IP");
			String IOI_DB_NM_T = cRsList.getString("IOI_DB_NM");
			String IOI_DB_ID_T = cRsList.getString("IOI_DB_ID");
			String IOI_DB_PW_T = cRsList.getString("IOI_DB_PW");
			String IOI_TBL_NM_T = cRsList.getString("IOI_TBL_NM");
			String IOI_CHART_NO_T = cRsList.getString("IOI_CHART_NO");
			String IOI_PSNL_ID_T = cRsList.getString("IOI_PSNL_ID");
			String IOI_PSNL_NM_T = cRsList.getString("IOI_PSNL_NM");
			String IOI_ZIP_CD_T = cRsList.getString("IOI_ZIP_CD");
			String IOI_ZIP_SQ_T = cRsList.getString("IOI_ZIP_SQ");
			String IOI_ZIP_AR_T = cRsList.getString("IOI_ZIP_AR");
			String IOI_ROAD_AR_T = cRsList.getString("IOI_ROAD_AR");
			String IOI_BLDG_NO_T = cRsList.getString("IOI_BLDG_NO");
			String IOI_TEL_NO_T = cRsList.getString("IOI_TEL_NO");
			String IOI_MOBL_NO_T = cRsList.getString("IOI_MOBL_NO");
			String IOI_EMAIL_AR_T = cRsList.getString("IOI_EMAIL_AR");
			String IOI_LAST_DT_T = cRsList.getString("IOI_LAST_DT");
			String IOI_ENCRT_KD_T = cRsList.getString("IOI_ENCRT_KD");
			String IOI_BIRTH_DT_T = cRsList.getString("IOI_BIRTH_DT");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! IOI_OCS_KD_T.equals("")) {
%>
		 		IOI_OCS_KD='<%= IOI_OCS_KD_T%>'
<%
			}

			if(! IOI_USE_YN_T.equals("")) {
%>
		 		IOI_USE_YN='<%= IOI_USE_YN_T%>'
<%
			}

			if(! IOI_DB_KD_T.equals("")) {
%>
		 		IOI_DB_KD='<%= IOI_DB_KD_T%>'
<%
			}

			if(! IOI_DB_IP_T.equals("")) {
%>
		 		IOI_DB_IP='<%= IOI_DB_IP_T%>'
<%
			}

			if(! IOI_DB_NM_T.equals("")) {
%>
		 		IOI_DB_NM='<%= IOI_DB_NM_T%>'
<%
			}

			if(! IOI_DB_ID_T.equals("")) {
%>
		 		IOI_DB_ID='<%= IOI_DB_ID_T%>'
<%
			}

			if(! IOI_DB_PW_T.equals("")) {
%>
		 		IOI_DB_PW='<%= IOI_DB_PW_T%>'
<%
			}

			if(! IOI_TBL_NM_T.equals("")) {
%>
		 		IOI_TBL_NM='<%= IOI_TBL_NM_T%>'
<%
			}

			if(! IOI_CHART_NO_T.equals("")) {
%>
		 		IOI_CHART_NO='<%= IOI_CHART_NO_T%>'
<%
			}

			if(! IOI_PSNL_ID_T.equals("")) {
%>
		 		IOI_PSNL_ID='<%= IOI_PSNL_ID_T%>'
<%
			}

			if(! IOI_PSNL_NM_T.equals("")) {
%>
		 		IOI_PSNL_NM='<%= IOI_PSNL_NM_T%>'
<%
			}

			if(! IOI_ZIP_CD_T.equals("")) {
%>
		 		IOI_ZIP_CD='<%= IOI_ZIP_CD_T%>'
<%
			}

			if(! IOI_ZIP_SQ_T.equals("")) {
%>
		 		IOI_ZIP_SQ='<%= IOI_ZIP_SQ_T%>'
<%
			}

			if(! IOI_ZIP_AR_T.equals("")) {
%>
		 		IOI_ZIP_AR='<%= IOI_ZIP_AR_T%>'
<%
			}

			if(! IOI_ROAD_AR_T.equals("")) {
%>
		 		IOI_ROAD_AR='<%= IOI_ROAD_AR_T%>'
<%
			}

			if(! IOI_BLDG_NO_T.equals("")) {
%>
		 		IOI_BLDG_NO='<%= IOI_BLDG_NO_T%>'
<%
			}

			if(! IOI_TEL_NO_T.equals("")) {
%>
		 		IOI_TEL_NO='<%= IOI_TEL_NO_T%>'
<%
			}

			if(! IOI_MOBL_NO_T.equals("")) {
%>
		 		IOI_MOBL_NO='<%= IOI_MOBL_NO_T%>'
<%
			}

			if(! IOI_EMAIL_AR_T.equals("")) {
%>
		 		IOI_EMAIL_AR='<%= IOI_EMAIL_AR_T%>'
<%
			}

			if(! IOI_LAST_DT_T.equals("")) {
%>
		 		IOI_LAST_DT='<%= IOI_LAST_DT_T%>'
<%
			}

			if(! IOI_ENCRT_KD_T.equals("")) {
%>
		 		IOI_ENCRT_KD='<%= IOI_ENCRT_KD_T%>'
<%
			}

			if(! IOI_BIRTH_DT_T.equals("")) {
%>
		 		IOI_BIRTH_DT='<%= IOI_BIRTH_DT_T%>'
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
