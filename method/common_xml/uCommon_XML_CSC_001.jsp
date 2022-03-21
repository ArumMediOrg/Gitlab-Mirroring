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

		String CSC_LARGE = htMethod.get("CSC_LARGE");
		String CSC_LEVEL = htMethod.get("CSC_LEVEL");
		String CSC_USE_YN = htMethod.get("CSC_USE_YN");
		String CSC_SMALL = htMethod.get("CSC_SMALL");

		//
		if(CSC_LARGE == null) { CSC_LARGE = ""; }
		if(CSC_LEVEL == null) { CSC_LEVEL = ""; }
		if(CSC_USE_YN == null) { CSC_USE_YN = ""; }
		if(CSC_SMALL == null) { CSC_SMALL = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT *
  FROM CT_SP_COMMON
 WHERE 1 = 1
if :CSC_LARGE <> '' then
begin
   AND CSC_LARGE = :CSC_LARGE
end
if  :CSC_LEVEL <> '' then
begin
   AND CSC_LEVEL = :CSC_LEVEL 
end
if  :CSC_USE_YN <> '' then
begin
   AND CSC_USE_YN =  :CSC_USE_YN 
end;
if  :CSC_SMALL <> '' then
begin
   AND CSC_SMALL = :CSC_SMALL 
end;
 ORDER BY CSC_SMALL
		*/

		sql = " SELECT *";
		sql += " FROM CT_SP_COMMON";
		sql += " WHERE 1 = 1";
		if(CSC_LARGE != null && ! CSC_LARGE.equals("")) {
			sql += " AND CSC_LARGE = '" + CSC_LARGE + "'";
		}
		if(CSC_LEVEL != null && ! CSC_LEVEL.equals("")) {
			sql += " AND CSC_LEVEL = '" + CSC_LEVEL + "'";
		}
		if(CSC_USE_YN != null && ! CSC_USE_YN.equals("")) {
			sql += " AND CSC_USE_YN = '" + CSC_USE_YN + "'";
		}
		if(CSC_SMALL != null && ! CSC_SMALL.equals("")) {
			sql += " AND CSC_SMALL = '" + CSC_SMALL + "'";
		}
		sql += " ORDER BY CSC_SMALL";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uCommon_XML_CSC_001 \n";
			G_INFO += "설명 : 특검공통코드조회(전체항목) \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " CSC_LARGE : " + CSC_LARGE + " \n";
			G_INFO += " CSC_LEVEL : " + CSC_LEVEL + " \n";
			G_INFO += " CSC_USE_YN : " + CSC_USE_YN + " \n";
			G_INFO += " CSC_SMALL : " + CSC_SMALL + " \n";
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
		<s:AttributeType name='CSC_LARGE' rs:number='1' rs:writeunknown='true' rs:basetable='CT_SP_COMMON' rs:basecolumn='CSC_LARGE'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='CSC_SMALL' rs:number='2' rs:writeunknown='true' rs:basetable='CT_SP_COMMON' rs:basecolumn='CSC_SMALL'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='CSC_LEVEL' rs:number='3' rs:writeunknown='true' rs:basetable='CT_SP_COMMON' rs:basecolumn='CSC_LEVEL'>
			<s:datatype dt:type='string' dt:maxLength='1' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='CSC_FULL_NM' rs:number='4' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_SP_COMMON'
			 rs:basecolumn='CSC_FULL_NM'>
			<s:datatype dt:type='string' dt:maxLength='500'/>
		</s:AttributeType>
		<s:AttributeType name='CSC_CODE_EX' rs:number='5' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_SP_COMMON'
			 rs:basecolumn='CSC_CODE_EX'>
			<s:datatype dt:type='string' dt:maxLength='300'/>
		</s:AttributeType>
		<s:AttributeType name='CSC_ETC1_NM' rs:number='6' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_SP_COMMON'
			 rs:basecolumn='CSC_ETC1_NM'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='CSC_ETC1_CD' rs:number='7' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_SP_COMMON'
			 rs:basecolumn='CSC_ETC1_CD'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='CSC_ETC2_NM' rs:number='8' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_SP_COMMON'
			 rs:basecolumn='CSC_ETC2_NM'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='CSC_ETC2_CD' rs:number='9' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_SP_COMMON'
			 rs:basecolumn='CSC_ETC2_CD'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='CSC_ETC3_NM' rs:number='10' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_SP_COMMON'
			 rs:basecolumn='CSC_ETC3_NM'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='CSC_ETC3_CD' rs:number='11' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_SP_COMMON'
			 rs:basecolumn='CSC_ETC3_CD'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='CSC_ETC4_NM' rs:number='12' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_SP_COMMON'
			 rs:basecolumn='CSC_ETC4_NM'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='CSC_ETC4_CD' rs:number='13' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_SP_COMMON'
			 rs:basecolumn='CSC_ETC4_CD'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='CSC_ETC5_NM' rs:number='14' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_SP_COMMON'
			 rs:basecolumn='CSC_ETC5_NM'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='CSC_ETC5_CD' rs:number='15' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_SP_COMMON'
			 rs:basecolumn='CSC_ETC5_CD'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='CSC_CODE_ST' rs:number='16' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_SP_COMMON'
			 rs:basecolumn='CSC_CODE_ST'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='CSC_CODE_GR' rs:number='17' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_SP_COMMON'
			 rs:basecolumn='CSC_CODE_GR'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='CSC_USE_YN' rs:number='18' rs:writeunknown='true' rs:basetable='CT_SP_COMMON' rs:basecolumn='CSC_USE_YN'>
			<s:datatype dt:type='string' dt:maxLength='1' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='CSC_NUSE_ID' rs:number='19' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_SP_COMMON'
			 rs:basecolumn='CSC_NUSE_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='CSC_NUSE_DTT' rs:number='20' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_SP_COMMON'
			 rs:basecolumn='CSC_NUSE_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='CSC_INPT_ID' rs:number='21' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_SP_COMMON'
			 rs:basecolumn='CSC_INPT_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='CSC_INPT_DTT' rs:number='22' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_SP_COMMON'
			 rs:basecolumn='CSC_INPT_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='CSC_MODI_ID' rs:number='23' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_SP_COMMON'
			 rs:basecolumn='CSC_MODI_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='CSC_MODI_DTT' rs:number='24' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_SP_COMMON'
			 rs:basecolumn='CSC_MODI_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='25' rs:rowid='true' rs:writeunknown='true' rs:basetable='CT_SP_COMMON'
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

			String CSC_LARGE_T = cRsList.getString("CSC_LARGE");
			String CSC_SMALL_T = cRsList.getString("CSC_SMALL");
			String CSC_LEVEL_T = cRsList.getString("CSC_LEVEL");
			String CSC_FULL_NM_T = cRsList.getString("CSC_FULL_NM");
			String CSC_CODE_EX_T = cRsList.getString("CSC_CODE_EX");
			String CSC_ETC1_NM_T = cRsList.getString("CSC_ETC1_NM");
			String CSC_ETC1_CD_T = cRsList.getString("CSC_ETC1_CD");
			String CSC_ETC2_NM_T = cRsList.getString("CSC_ETC2_NM");
			String CSC_ETC2_CD_T = cRsList.getString("CSC_ETC2_CD");
			String CSC_ETC3_NM_T = cRsList.getString("CSC_ETC3_NM");
			String CSC_ETC3_CD_T = cRsList.getString("CSC_ETC3_CD");
			String CSC_ETC4_NM_T = cRsList.getString("CSC_ETC4_NM");
			String CSC_ETC4_CD_T = cRsList.getString("CSC_ETC4_CD");
			String CSC_ETC5_NM_T = cRsList.getString("CSC_ETC5_NM");
			String CSC_ETC5_CD_T = cRsList.getString("CSC_ETC5_CD");
			String CSC_CODE_ST_T = cRsList.getString("CSC_CODE_ST");
			String CSC_CODE_GR_T = cRsList.getString("CSC_CODE_GR");
			String CSC_USE_YN_T = cRsList.getString("CSC_USE_YN");
			String CSC_NUSE_ID_T = cRsList.getString("CSC_NUSE_ID");
			String CSC_NUSE_DTT_T = cRsList.getDate2("CSC_NUSE_DTT");
			String CSC_INPT_ID_T = cRsList.getString("CSC_INPT_ID");
			String CSC_INPT_DTT_T = cRsList.getDate2("CSC_INPT_DTT");
			String CSC_MODI_ID_T = cRsList.getString("CSC_MODI_ID");
			String CSC_MODI_DTT_T = cRsList.getDate2("CSC_MODI_DTT");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! CSC_LARGE_T.equals("")) {
%>
		 		CSC_LARGE='<%= CSC_LARGE_T%>'
<%
			}

			if(! CSC_SMALL_T.equals("")) {
%>
		 		CSC_SMALL='<%= CSC_SMALL_T%>'
<%
			}

			if(! CSC_LEVEL_T.equals("")) {
%>
		 		CSC_LEVEL='<%= CSC_LEVEL_T%>'
<%
			}

			if(! CSC_FULL_NM_T.equals("")) {
%>
		 		CSC_FULL_NM='<%= CSC_FULL_NM_T%>'
<%
			}

			if(! CSC_CODE_EX_T.equals("")) {
%>
		 		CSC_CODE_EX='<%= CSC_CODE_EX_T%>'
<%
			}

			if(! CSC_ETC1_NM_T.equals("")) {
%>
		 		CSC_ETC1_NM='<%= CSC_ETC1_NM_T%>'
<%
			}

			if(! CSC_ETC1_CD_T.equals("")) {
%>
		 		CSC_ETC1_CD='<%= CSC_ETC1_CD_T%>'
<%
			}

			if(! CSC_ETC2_NM_T.equals("")) {
%>
		 		CSC_ETC2_NM='<%= CSC_ETC2_NM_T%>'
<%
			}

			if(! CSC_ETC2_CD_T.equals("")) {
%>
		 		CSC_ETC2_CD='<%= CSC_ETC2_CD_T%>'
<%
			}

			if(! CSC_ETC3_NM_T.equals("")) {
%>
		 		CSC_ETC3_NM='<%= CSC_ETC3_NM_T%>'
<%
			}

			if(! CSC_ETC3_CD_T.equals("")) {
%>
		 		CSC_ETC3_CD='<%= CSC_ETC3_CD_T%>'
<%
			}

			if(! CSC_ETC4_NM_T.equals("")) {
%>
		 		CSC_ETC4_NM='<%= CSC_ETC4_NM_T%>'
<%
			}

			if(! CSC_ETC4_CD_T.equals("")) {
%>
		 		CSC_ETC4_CD='<%= CSC_ETC4_CD_T%>'
<%
			}

			if(! CSC_ETC5_NM_T.equals("")) {
%>
		 		CSC_ETC5_NM='<%= CSC_ETC5_NM_T%>'
<%
			}

			if(! CSC_ETC5_CD_T.equals("")) {
%>
		 		CSC_ETC5_CD='<%= CSC_ETC5_CD_T%>'
<%
			}

			if(! CSC_CODE_ST_T.equals("")) {
%>
		 		CSC_CODE_ST='<%= CSC_CODE_ST_T%>'
<%
			}

			if(! CSC_CODE_GR_T.equals("")) {
%>
		 		CSC_CODE_GR='<%= CSC_CODE_GR_T%>'
<%
			}

			if(! CSC_USE_YN_T.equals("")) {
%>
		 		CSC_USE_YN='<%= CSC_USE_YN_T%>'
<%
			}

			if(! CSC_NUSE_ID_T.equals("")) {
%>
		 		CSC_NUSE_ID='<%= CSC_NUSE_ID_T%>'
<%
			}

			if(! CSC_NUSE_DTT_T.equals("")) {
%>
		 		CSC_NUSE_DTT='<%= CSC_NUSE_DTT_T%>'
<%
			}

			if(! CSC_INPT_ID_T.equals("")) {
%>
		 		CSC_INPT_ID='<%= CSC_INPT_ID_T%>'
<%
			}

			if(! CSC_INPT_DTT_T.equals("")) {
%>
		 		CSC_INPT_DTT='<%= CSC_INPT_DTT_T%>'
<%
			}

			if(! CSC_MODI_ID_T.equals("")) {
%>
		 		CSC_MODI_ID='<%= CSC_MODI_ID_T%>'
<%
			}

			if(! CSC_MODI_DTT_T.equals("")) {
%>
		 		CSC_MODI_DTT='<%= CSC_MODI_DTT_T%>'
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
