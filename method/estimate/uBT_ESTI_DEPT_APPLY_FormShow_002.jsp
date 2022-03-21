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

SELECT dbo.GetSP_COMMON_cdToNm('HM99G','1') VIP_ITKD_NM, A.* FROM VIEW_IT_ITEM_PRICE A ORDER BY VIP_APLY_DT DESC
		*/

		sql = " SELECT GetSP_COMMON_cdToNm('HM99G','1') VIP_ITKD_NM, A.*";
		sql += " FROM VIEW_IT_ITEM_PRICE A";
		sql += " ORDER BY VIP_APLY_DT DESC";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uBT_ESTI_DEPT_APPLY_FormShow_002 \n";
			G_INFO += "설명 : 특검 금액관련 정보 로딩 \n";
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
		<s:AttributeType name='VIP_ITKD_NM' rs:number='1' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='VIP_APLY_DT' rs:number='2' rs:writeunknown='true' rs:basetable='VIEW_IT_ITEM_PRICE'
			 rs:basecolumn='VIP_APLY_DT'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='VIP_ITEM_CD' rs:number='3' rs:writeunknown='true' rs:basetable='VIEW_IT_ITEM_PRICE'
			 rs:basecolumn='VIP_ITEM_CD'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='VIP_KNME_NM' rs:number='4' rs:writeunknown='true' rs:basetable='VIEW_IT_ITEM_PRICE'
			 rs:basecolumn='VIP_KNME_NM'>
			<s:datatype dt:type='string' dt:maxLength='200' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='VIP_JCSG_PR' rs:number='5' rs:nullable='true' rs:writeunknown='true' rs:basetable='VIEW_IT_ITEM_PRICE'
			 rs:basecolumn='VIP_JCSG_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='38' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='VIP_HESG_PR' rs:number='6' rs:nullable='true' rs:writeunknown='true' rs:basetable='VIEW_IT_ITEM_PRICE'
			 rs:basecolumn='VIP_HESG_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='38' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='VIP_GBSG_PR' rs:number='7' rs:nullable='true' rs:writeunknown='true' rs:basetable='VIEW_IT_ITEM_PRICE'
			 rs:basecolumn='VIP_GBSG_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='38' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='VIP_SBSG_PR' rs:number='8' rs:nullable='true' rs:writeunknown='true' rs:basetable='VIEW_IT_ITEM_PRICE'
			 rs:basecolumn='VIP_SBSG_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='38' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='VIP_TGSG_PR' rs:number='9' rs:nullable='true' rs:writeunknown='true' rs:basetable='VIEW_IT_ITEM_PRICE'
			 rs:basecolumn='VIP_TGSG_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='38' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='VIP_GBSB_PR' rs:number='10' rs:nullable='true' rs:writeunknown='true' rs:basetable='VIEW_IT_ITEM_PRICE'
			 rs:basecolumn='VIP_GBSB_PR'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='VIP_GBTG_PR' rs:number='11' rs:nullable='true' rs:writeunknown='true' rs:basetable='VIEW_IT_ITEM_PRICE'
			 rs:basecolumn='VIP_GBTG_PR'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='VIP_ENME_NM' rs:number='12' rs:nullable='true' rs:writeunknown='true' rs:basetable='VIEW_IT_ITEM_PRICE'
			 rs:basecolumn='VIP_ENME_NM'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='VIP_CNME_NM' rs:number='13' rs:nullable='true' rs:writeunknown='true' rs:basetable='VIEW_IT_ITEM_PRICE'
			 rs:basecolumn='VIP_CNME_NM'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='VIP_JNME_NM' rs:number='14' rs:nullable='true' rs:writeunknown='true' rs:basetable='VIEW_IT_ITEM_PRICE'
			 rs:basecolumn='VIP_JNME_NM'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='VIP_SNME_NM' rs:number='15' rs:nullable='true' rs:writeunknown='true' rs:basetable='VIEW_IT_ITEM_PRICE'
			 rs:basecolumn='VIP_SNME_NM'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='VIP_OSCD_CD' rs:number='16' rs:nullable='true' rs:writeunknown='true' rs:basetable='VIEW_IT_ITEM_PRICE'
			 rs:basecolumn='VIP_OSCD_CD'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='VIP_GBCD_CD' rs:number='17' rs:nullable='true' rs:writeunknown='true' rs:basetable='VIEW_IT_ITEM_PRICE'
			 rs:basecolumn='VIP_GBCD_CD'>
			<s:datatype dt:type='string' dt:maxLength='12'/>
		</s:AttributeType>
		<s:AttributeType name='VIP_SBCD_CD' rs:number='18' rs:nullable='true' rs:writeunknown='true' rs:basetable='VIEW_IT_ITEM_PRICE'
			 rs:basecolumn='VIP_SBCD_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='VIP_EXGN_CD' rs:number='19' rs:writeunknown='true' rs:basetable='VIEW_IT_ITEM_PRICE'
			 rs:basecolumn='VIP_EXGN_CD'>
			<s:datatype dt:type='string' dt:maxLength='7' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='VIP_USE_YN' rs:number='20' rs:nullable='true' rs:writeunknown='true' rs:basetable='VIEW_IT_ITEM_PRICE'
			 rs:basecolumn='VIP_USE_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='VIP_TSND_YN' rs:number='21' rs:nullable='true' rs:writeunknown='true' rs:basetable='VIEW_IT_ITEM_PRICE'
			 rs:basecolumn='VIP_TSND_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='22' rs:rowid='true' rs:basetable='VIEW_IT_ITEM_PRICE' rs:basecolumn='ROWID'
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

			String VIP_ITKD_NM_T = cRsList.getString("VIP_ITKD_NM");
			String VIP_APLY_DT_T = cRsList.getString("VIP_APLY_DT");
			String VIP_ITEM_CD_T = cRsList.getString("VIP_ITEM_CD");
			String VIP_KNME_NM_T = cRsList.getString("VIP_KNME_NM");
			String VIP_JCSG_PR_T = cRsList.getString("VIP_JCSG_PR");
			String VIP_HESG_PR_T = cRsList.getString("VIP_HESG_PR");
			String VIP_GBSG_PR_T = cRsList.getString("VIP_GBSG_PR");
			String VIP_SBSG_PR_T = cRsList.getString("VIP_SBSG_PR");
			String VIP_TGSG_PR_T = cRsList.getString("VIP_TGSG_PR");
			String VIP_GBSB_PR_T = cRsList.getString("VIP_GBSB_PR");
			String VIP_GBTG_PR_T = cRsList.getString("VIP_GBTG_PR");
			String VIP_ENME_NM_T = cRsList.getString("VIP_ENME_NM");
			String VIP_CNME_NM_T = cRsList.getString("VIP_CNME_NM");
			String VIP_JNME_NM_T = cRsList.getString("VIP_JNME_NM");
			String VIP_SNME_NM_T = cRsList.getString("VIP_SNME_NM");
			String VIP_OSCD_CD_T = cRsList.getString("VIP_OSCD_CD");
			String VIP_GBCD_CD_T = cRsList.getString("VIP_GBCD_CD");
			String VIP_SBCD_CD_T = cRsList.getString("VIP_SBCD_CD");
			String VIP_EXGN_CD_T = cRsList.getString("VIP_EXGN_CD");
			String VIP_USE_YN_T = cRsList.getString("VIP_USE_YN");
			String VIP_TSND_YN_T = cRsList.getString("VIP_TSND_YN");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! VIP_ITKD_NM_T.equals("")) {
%>
		 		VIP_ITKD_NM='<%= VIP_ITKD_NM_T%>'
<%
			}

			if(! VIP_APLY_DT_T.equals("")) {
%>
		 		VIP_APLY_DT='<%= VIP_APLY_DT_T%>'
<%
			}

			if(! VIP_ITEM_CD_T.equals("")) {
%>
		 		VIP_ITEM_CD='<%= VIP_ITEM_CD_T%>'
<%
			}

			if(! VIP_KNME_NM_T.equals("")) {
%>
		 		VIP_KNME_NM='<%= VIP_KNME_NM_T%>'
<%
			}

			if(! VIP_JCSG_PR_T.equals("")) {
%>
		 		VIP_JCSG_PR='<%= VIP_JCSG_PR_T%>'
<%
			}

			if(! VIP_HESG_PR_T.equals("")) {
%>
		 		VIP_HESG_PR='<%= VIP_HESG_PR_T%>'
<%
			}

			if(! VIP_GBSG_PR_T.equals("")) {
%>
		 		VIP_GBSG_PR='<%= VIP_GBSG_PR_T%>'
<%
			}

			if(! VIP_SBSG_PR_T.equals("")) {
%>
		 		VIP_SBSG_PR='<%= VIP_SBSG_PR_T%>'
<%
			}

			if(! VIP_TGSG_PR_T.equals("")) {
%>
		 		VIP_TGSG_PR='<%= VIP_TGSG_PR_T%>'
<%
			}

			if(! VIP_GBSB_PR_T.equals("")) {
%>
		 		VIP_GBSB_PR='<%= VIP_GBSB_PR_T%>'
<%
			}

			if(! VIP_GBTG_PR_T.equals("")) {
%>
		 		VIP_GBTG_PR='<%= VIP_GBTG_PR_T%>'
<%
			}

			if(! VIP_ENME_NM_T.equals("")) {
%>
		 		VIP_ENME_NM='<%= VIP_ENME_NM_T%>'
<%
			}

			if(! VIP_CNME_NM_T.equals("")) {
%>
		 		VIP_CNME_NM='<%= VIP_CNME_NM_T%>'
<%
			}

			if(! VIP_JNME_NM_T.equals("")) {
%>
		 		VIP_JNME_NM='<%= VIP_JNME_NM_T%>'
<%
			}

			if(! VIP_SNME_NM_T.equals("")) {
%>
		 		VIP_SNME_NM='<%= VIP_SNME_NM_T%>'
<%
			}

			if(! VIP_OSCD_CD_T.equals("")) {
%>
		 		VIP_OSCD_CD='<%= VIP_OSCD_CD_T%>'
<%
			}

			if(! VIP_GBCD_CD_T.equals("")) {
%>
		 		VIP_GBCD_CD='<%= VIP_GBCD_CD_T%>'
<%
			}

			if(! VIP_SBCD_CD_T.equals("")) {
%>
		 		VIP_SBCD_CD='<%= VIP_SBCD_CD_T%>'
<%
			}

			if(! VIP_EXGN_CD_T.equals("")) {
%>
		 		VIP_EXGN_CD='<%= VIP_EXGN_CD_T%>'
<%
			}

			if(! VIP_USE_YN_T.equals("")) {
%>
		 		VIP_USE_YN='<%= VIP_USE_YN_T%>'
<%
			}

			if(! VIP_TSND_YN_T.equals("")) {
%>
		 		VIP_TSND_YN='<%= VIP_TSND_YN_T%>'
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
