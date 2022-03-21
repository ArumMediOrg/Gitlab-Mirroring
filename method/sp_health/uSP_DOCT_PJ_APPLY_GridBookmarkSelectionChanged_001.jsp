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

		String BKMK_CD = htMethod.get("BKMK_CD");

		//
		if(BKMK_CD == null) { BKMK_CD = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT F_USER_FIND(SBP_INPT_ID) SBP_INPT_NM, A.* FROM ST_BOOKMARK_PANJ A
 WHERE SBP_BKMK_CD = :BKMK_CD
		*/

		sql = " SELECT F_USER_FIND(SBP_INPT_ID) SBP_INPT_NM, A.*";
		sql += " FROM ST_BOOKMARK_PANJ A";
		sql += " WHERE SBP_BKMK_CD = '" + BKMK_CD + "'";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uSP_DOCT_PJ_APPLY_GridBookmarkSelectionChanged_001 \n";
			G_INFO += "설명 : 자주쓰는 판정 대상 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " BKMK_CD : " + BKMK_CD + " \n";
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
		<s:AttributeType name='SBP_INPT_NM' rs:number='1' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='SBP_BKMK_CD' rs:number='2' rs:writeunknown='true' rs:basetable='ST_BOOKMARK_PANJ' rs:basecolumn='SBP_BKMK_CD'>
			<s:datatype dt:type='string' dt:maxLength='4' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='SBP_BKMK_NM' rs:number='3' rs:writeunknown='true' rs:basetable='ST_BOOKMARK_PANJ' rs:basecolumn='SBP_BKMK_NM'>
			<s:datatype dt:type='string' dt:maxLength='100' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='SBP_MATT_CD' rs:number='4' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_BOOKMARK_PANJ'
			 rs:basecolumn='SBP_MATT_CD'>
			<s:datatype dt:type='string' dt:maxLength='5'/>
		</s:AttributeType>
		<s:AttributeType name='SBP_ORGA_CD' rs:number='5' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_BOOKMARK_PANJ'
			 rs:basecolumn='SBP_ORGA_CD'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='SBP_ORSU_CD' rs:number='6' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_BOOKMARK_PANJ'
			 rs:basecolumn='SBP_ORSU_CD'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='SBP_PANJ_CD' rs:number='7' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_BOOKMARK_PANJ'
			 rs:basecolumn='SBP_PANJ_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='SBP_SOKY_CD' rs:number='8' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_BOOKMARK_PANJ'
			 rs:basecolumn='SBP_SOKY_CD'>
			<s:datatype dt:type='string' dt:maxLength='4'/>
		</s:AttributeType>
		<s:AttributeType name='SBP_SOKY_NM' rs:number='9' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_BOOKMARK_PANJ'
			 rs:basecolumn='SBP_SOKY_NM'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='SBP_SOKY_TX' rs:number='10' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_BOOKMARK_PANJ'
			 rs:basecolumn='SBP_SOKY_TX'>
			<s:datatype dt:type='string' dt:maxLength='1000'/>
		</s:AttributeType>
		<s:AttributeType name='SBP_JOCHI_CD' rs:number='11' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_BOOKMARK_PANJ'
			 rs:basecolumn='SBP_JOCHI_CD'>
			<s:datatype dt:type='string' dt:maxLength='4'/>
		</s:AttributeType>
		<s:AttributeType name='SBP_JOCHI_NM' rs:number='12' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_BOOKMARK_PANJ'
			 rs:basecolumn='SBP_JOCHI_NM'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='SBP_JILH_CD' rs:number='13' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_BOOKMARK_PANJ'
			 rs:basecolumn='SBP_JILH_CD'>
			<s:datatype dt:type='string' dt:maxLength='3'/>
		</s:AttributeType>
		<s:AttributeType name='SBP_POSM1_CD' rs:number='14' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_BOOKMARK_PANJ'
			 rs:basecolumn='SBP_POSM1_CD'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='SBP_POSM2_CD' rs:number='15' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_BOOKMARK_PANJ'
			 rs:basecolumn='SBP_POSM2_CD'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='SBP_POSM3_CD' rs:number='16' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_BOOKMARK_PANJ'
			 rs:basecolumn='SBP_POSM3_CD'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='SBP_POSM1_TX' rs:number='17' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_BOOKMARK_PANJ'
			 rs:basecolumn='SBP_POSM1_TX'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='SBP_POSM2_TX' rs:number='18' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_BOOKMARK_PANJ'
			 rs:basecolumn='SBP_POSM2_TX'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='SBP_POSM3_TX' rs:number='19' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_BOOKMARK_PANJ'
			 rs:basecolumn='SBP_POSM3_TX'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='SBP_POSM1_DT' rs:number='20' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_BOOKMARK_PANJ'
			 rs:basecolumn='SBP_POSM1_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='SBP_POSM2_DT' rs:number='21' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_BOOKMARK_PANJ'
			 rs:basecolumn='SBP_POSM2_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='SBP_POSM3_DT' rs:number='22' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_BOOKMARK_PANJ'
			 rs:basecolumn='SBP_POSM3_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='SBP_BUSI_CD' rs:number='23' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_BOOKMARK_PANJ'
			 rs:basecolumn='SBP_BUSI_CD'>
			<s:datatype dt:type='string' dt:maxLength='3'/>
		</s:AttributeType>
		<s:AttributeType name='SBP_INPT_ID' rs:number='24' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_BOOKMARK_PANJ'
			 rs:basecolumn='SBP_INPT_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='SBP_INPT_DTT' rs:number='25' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_BOOKMARK_PANJ'
			 rs:basecolumn='SBP_INPT_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='SBP_MODI_ID' rs:number='26' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_BOOKMARK_PANJ'
			 rs:basecolumn='SBP_MODI_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='SBP_MODI_DTT' rs:number='27' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_BOOKMARK_PANJ'
			 rs:basecolumn='SBP_MODI_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='28' rs:rowid='true' rs:basetable='ST_BOOKMARK_PANJ' rs:basecolumn='ROWID'
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

			String SBP_INPT_NM_T = cRsList.getString("SBP_INPT_NM");
			String SBP_BKMK_CD_T = cRsList.getString("SBP_BKMK_CD");
			String SBP_BKMK_NM_T = cRsList.getString("SBP_BKMK_NM");
			String SBP_MATT_CD_T = cRsList.getString("SBP_MATT_CD");
			String SBP_ORGA_CD_T = cRsList.getString("SBP_ORGA_CD");
			String SBP_ORSU_CD_T = cRsList.getString("SBP_ORSU_CD");
			String SBP_PANJ_CD_T = cRsList.getString("SBP_PANJ_CD");
			String SBP_SOKY_CD_T = cRsList.getString("SBP_SOKY_CD");
			String SBP_SOKY_NM_T = cRsList.getString("SBP_SOKY_NM");
			String SBP_SOKY_TX_T = cRsList.getString("SBP_SOKY_TX");
			String SBP_JOCHI_CD_T = cRsList.getString("SBP_JOCHI_CD");
			String SBP_JOCHI_NM_T = cRsList.getString("SBP_JOCHI_NM");
			String SBP_JILH_CD_T = cRsList.getString("SBP_JILH_CD");
			String SBP_POSM1_CD_T = cRsList.getString("SBP_POSM1_CD");
			String SBP_POSM2_CD_T = cRsList.getString("SBP_POSM2_CD");
			String SBP_POSM3_CD_T = cRsList.getString("SBP_POSM3_CD");
			String SBP_POSM1_TX_T = cRsList.getString("SBP_POSM1_TX");
			String SBP_POSM2_TX_T = cRsList.getString("SBP_POSM2_TX");
			String SBP_POSM3_TX_T = cRsList.getString("SBP_POSM3_TX");
			String SBP_POSM1_DT_T = cRsList.getString("SBP_POSM1_DT");
			String SBP_POSM2_DT_T = cRsList.getString("SBP_POSM2_DT");
			String SBP_POSM3_DT_T = cRsList.getString("SBP_POSM3_DT");
			String SBP_BUSI_CD_T = cRsList.getString("SBP_BUSI_CD");
			String SBP_INPT_ID_T = cRsList.getString("SBP_INPT_ID");
			String SBP_INPT_DTT_T = cRsList.getDate2("SBP_INPT_DTT");
			String SBP_MODI_ID_T = cRsList.getString("SBP_MODI_ID");
			String SBP_MODI_DTT_T = cRsList.getDate2("SBP_MODI_DTT");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! SBP_INPT_NM_T.equals("")) {
%>
		 		SBP_INPT_NM='<%= SBP_INPT_NM_T%>'
<%
			}

			if(! SBP_BKMK_CD_T.equals("")) {
%>
		 		SBP_BKMK_CD='<%= SBP_BKMK_CD_T%>'
<%
			}

			if(! SBP_BKMK_NM_T.equals("")) {
%>
		 		SBP_BKMK_NM='<%= SBP_BKMK_NM_T%>'
<%
			}

			if(! SBP_MATT_CD_T.equals("")) {
%>
		 		SBP_MATT_CD='<%= SBP_MATT_CD_T%>'
<%
			}

			if(! SBP_ORGA_CD_T.equals("")) {
%>
		 		SBP_ORGA_CD='<%= SBP_ORGA_CD_T%>'
<%
			}

			if(! SBP_ORSU_CD_T.equals("")) {
%>
		 		SBP_ORSU_CD='<%= SBP_ORSU_CD_T%>'
<%
			}

			if(! SBP_PANJ_CD_T.equals("")) {
%>
		 		SBP_PANJ_CD='<%= SBP_PANJ_CD_T%>'
<%
			}

			if(! SBP_SOKY_CD_T.equals("")) {
%>
		 		SBP_SOKY_CD='<%= SBP_SOKY_CD_T%>'
<%
			}

			if(! SBP_SOKY_NM_T.equals("")) {
%>
		 		SBP_SOKY_NM='<%= SBP_SOKY_NM_T%>'
<%
			}

			if(! SBP_SOKY_TX_T.equals("")) {
%>
		 		SBP_SOKY_TX='<%= SBP_SOKY_TX_T%>'
<%
			}

			if(! SBP_JOCHI_CD_T.equals("")) {
%>
		 		SBP_JOCHI_CD='<%= SBP_JOCHI_CD_T%>'
<%
			}

			if(! SBP_JOCHI_NM_T.equals("")) {
%>
		 		SBP_JOCHI_NM='<%= SBP_JOCHI_NM_T%>'
<%
			}

			if(! SBP_JILH_CD_T.equals("")) {
%>
		 		SBP_JILH_CD='<%= SBP_JILH_CD_T%>'
<%
			}

			if(! SBP_POSM1_CD_T.equals("")) {
%>
		 		SBP_POSM1_CD='<%= SBP_POSM1_CD_T%>'
<%
			}

			if(! SBP_POSM2_CD_T.equals("")) {
%>
		 		SBP_POSM2_CD='<%= SBP_POSM2_CD_T%>'
<%
			}

			if(! SBP_POSM3_CD_T.equals("")) {
%>
		 		SBP_POSM3_CD='<%= SBP_POSM3_CD_T%>'
<%
			}

			if(! SBP_POSM1_TX_T.equals("")) {
%>
		 		SBP_POSM1_TX='<%= SBP_POSM1_TX_T%>'
<%
			}

			if(! SBP_POSM2_TX_T.equals("")) {
%>
		 		SBP_POSM2_TX='<%= SBP_POSM2_TX_T%>'
<%
			}

			if(! SBP_POSM3_TX_T.equals("")) {
%>
		 		SBP_POSM3_TX='<%= SBP_POSM3_TX_T%>'
<%
			}

			if(! SBP_POSM1_DT_T.equals("")) {
%>
		 		SBP_POSM1_DT='<%= SBP_POSM1_DT_T%>'
<%
			}

			if(! SBP_POSM2_DT_T.equals("")) {
%>
		 		SBP_POSM2_DT='<%= SBP_POSM2_DT_T%>'
<%
			}

			if(! SBP_POSM3_DT_T.equals("")) {
%>
		 		SBP_POSM3_DT='<%= SBP_POSM3_DT_T%>'
<%
			}

			if(! SBP_BUSI_CD_T.equals("")) {
%>
		 		SBP_BUSI_CD='<%= SBP_BUSI_CD_T%>'
<%
			}

			if(! SBP_INPT_ID_T.equals("")) {
%>
		 		SBP_INPT_ID='<%= SBP_INPT_ID_T%>'
<%
			}

			if(! SBP_INPT_DTT_T.equals("")) {
%>
		 		SBP_INPT_DTT='<%= SBP_INPT_DTT_T%>'
<%
			}

			if(! SBP_MODI_ID_T.equals("")) {
%>
		 		SBP_MODI_ID='<%= SBP_MODI_ID_T%>'
<%
			}

			if(! SBP_MODI_DTT_T.equals("")) {
%>
		 		SBP_MODI_DTT='<%= SBP_MODI_DTT_T%>'
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
