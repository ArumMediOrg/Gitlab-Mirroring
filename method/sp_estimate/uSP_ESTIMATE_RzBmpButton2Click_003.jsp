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

SELECT * FROM (Select  * From IT_ITEM_PRICE
 Where IIP_ITEM_CD = 'M0020'   
Order By IIP_APLY_DT Desc        
) WHERE ROWNUM = 1            
		*/

		sql = " SELECT *";
		sql += " FROM (SELECT *";
		sql += " FROM IT_ITEM_PRICE";
		sql += " WHERE IIP_ITEM_CD = 'M0020'";
		sql += " ORDER BY IIP_APLY_DT DESC )";
		sql += " WHERE ROWNUM = 1";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uSP_ESTIMATE_RzBmpButton2Click_003 \n";
			G_INFO += "설명 : 수가정보 로딩 \n";
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
		<s:AttributeType name='IIP_APLY_DT' rs:number='1'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='IIP_ITEM_CD' rs:number='2'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='IIP_JCSG_PR' rs:number='3' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='38' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='IIP_HESG_PR' rs:number='4' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='38' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='IIP_GBSG_PR' rs:number='5' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='38' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='IIP_SBSG_PR' rs:number='6' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='38' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='IIP_TGSG_PR' rs:number='7' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='38' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='IIP_STSG_PR' rs:number='8' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='38' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='IIP_GASN_PR' rs:number='9' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='38' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='IIP_USE_YN' rs:number='10' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='IIP_NUSE_ID' rs:number='11' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='IIP_NUSE_DTT' rs:number='12' rs:nullable='true'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='IIP_INPT_ID' rs:number='13' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='IIP_INPT_DTT' rs:number='14' rs:nullable='true'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='IIP_MODI_ID' rs:number='15' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='IIP_MODI_DTT' rs:number='16' rs:nullable='true'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='IIP_PRSN_PR' rs:number='17' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='38' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='IIP_SBGB_PR' rs:number='18' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='38' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='IIP_SBSG_ORG' rs:number='19' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='38' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:extends type='rs:rowbase'/>
	</s:ElementType>
</s:Schema>
		<rs:data>
<%
		int cnt = 0;
		while(cRsList.next()) {

			cnt++;

			String IIP_APLY_DT_T = cRsList.getString("IIP_APLY_DT");
			String IIP_ITEM_CD_T = cRsList.getString("IIP_ITEM_CD");
			String IIP_JCSG_PR_T = cRsList.getString("IIP_JCSG_PR");
			String IIP_HESG_PR_T = cRsList.getString("IIP_HESG_PR");
			String IIP_GBSG_PR_T = cRsList.getString("IIP_GBSG_PR");
			String IIP_SBSG_PR_T = cRsList.getString("IIP_SBSG_PR");
			String IIP_TGSG_PR_T = cRsList.getString("IIP_TGSG_PR");
			String IIP_STSG_PR_T = cRsList.getString("IIP_STSG_PR");
			String IIP_GASN_PR_T = cRsList.getString("IIP_GASN_PR");
			String IIP_USE_YN_T = cRsList.getString("IIP_USE_YN");
			String IIP_NUSE_ID_T = cRsList.getString("IIP_NUSE_ID");
			String IIP_NUSE_DTT_T = cRsList.getDate2("IIP_NUSE_DTT");
			String IIP_INPT_ID_T = cRsList.getString("IIP_INPT_ID");
			String IIP_INPT_DTT_T = cRsList.getDate2("IIP_INPT_DTT");
			String IIP_MODI_ID_T = cRsList.getString("IIP_MODI_ID");
			String IIP_MODI_DTT_T = cRsList.getDate2("IIP_MODI_DTT");
			String IIP_PRSN_PR_T = cRsList.getString("IIP_PRSN_PR");
			String IIP_SBGB_PR_T = cRsList.getString("IIP_SBGB_PR");
			String IIP_SBSG_ORG_T = cRsList.getString("IIP_SBSG_ORG");
%>
			<z:row
<%
			if(! IIP_APLY_DT_T.equals("")) {
%>
		 		IIP_APLY_DT='<%= IIP_APLY_DT_T%>'
<%
			}

			if(! IIP_ITEM_CD_T.equals("")) {
%>
		 		IIP_ITEM_CD='<%= IIP_ITEM_CD_T%>'
<%
			}

			if(! IIP_JCSG_PR_T.equals("")) {
%>
		 		IIP_JCSG_PR='<%= IIP_JCSG_PR_T%>'
<%
			}

			if(! IIP_HESG_PR_T.equals("")) {
%>
		 		IIP_HESG_PR='<%= IIP_HESG_PR_T%>'
<%
			}

			if(! IIP_GBSG_PR_T.equals("")) {
%>
		 		IIP_GBSG_PR='<%= IIP_GBSG_PR_T%>'
<%
			}

			if(! IIP_SBSG_PR_T.equals("")) {
%>
		 		IIP_SBSG_PR='<%= IIP_SBSG_PR_T%>'
<%
			}

			if(! IIP_TGSG_PR_T.equals("")) {
%>
		 		IIP_TGSG_PR='<%= IIP_TGSG_PR_T%>'
<%
			}

			if(! IIP_STSG_PR_T.equals("")) {
%>
		 		IIP_STSG_PR='<%= IIP_STSG_PR_T%>'
<%
			}

			if(! IIP_GASN_PR_T.equals("")) {
%>
		 		IIP_GASN_PR='<%= IIP_GASN_PR_T%>'
<%
			}

			if(! IIP_USE_YN_T.equals("")) {
%>
		 		IIP_USE_YN='<%= IIP_USE_YN_T%>'
<%
			}

			if(! IIP_NUSE_ID_T.equals("")) {
%>
		 		IIP_NUSE_ID='<%= IIP_NUSE_ID_T%>'
<%
			}

			if(! IIP_NUSE_DTT_T.equals("")) {
%>
		 		IIP_NUSE_DTT='<%= IIP_NUSE_DTT_T%>'
<%
			}

			if(! IIP_INPT_ID_T.equals("")) {
%>
		 		IIP_INPT_ID='<%= IIP_INPT_ID_T%>'
<%
			}

			if(! IIP_INPT_DTT_T.equals("")) {
%>
		 		IIP_INPT_DTT='<%= IIP_INPT_DTT_T%>'
<%
			}

			if(! IIP_MODI_ID_T.equals("")) {
%>
		 		IIP_MODI_ID='<%= IIP_MODI_ID_T%>'
<%
			}

			if(! IIP_MODI_DTT_T.equals("")) {
%>
		 		IIP_MODI_DTT='<%= IIP_MODI_DTT_T%>'
<%
			}

			if(! IIP_PRSN_PR_T.equals("")) {
%>
		 		IIP_PRSN_PR='<%= IIP_PRSN_PR_T%>'
<%
			}

			if(! IIP_SBGB_PR_T.equals("")) {
%>
		 		IIP_SBGB_PR='<%= IIP_SBGB_PR_T%>'
<%
			}

			if(! IIP_SBSG_ORG_T.equals("")) {
%>
		 		IIP_SBSG_ORG='<%= IIP_SBSG_ORG_T%>'
<%
			}
%>
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
