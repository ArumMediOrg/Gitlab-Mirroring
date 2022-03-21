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

Select
A.IIP_APLY_DT, A.IIP_ITEM_CD, A.IIP_SBSG_PR, A.IIP_TGSG_PR, B.IIM_SNME_NM
From IT_ITEM_PRICE A
Inner Join IT_ITEM B On B.IIM_SBCD_CD = '0602'
                    And B.IIM_USE_YN = 'Y'
Where IIP_USE_YN = 'Y'
 And A.IIP_ITEM_CD = B.IIM_ITEM_CD
Order By A.IIP_APLY_DT Desc
		*/

		sql = " SELECT A.IIP_APLY_DT, A.IIP_ITEM_CD, A.IIP_SBSG_PR, A.IIP_TGSG_PR, B.IIM_SNME_NM";
		sql += " FROM IT_ITEM_PRICE A INNER JOIN IT_ITEM B";
		sql += " ON B.IIM_SBCD_CD = '0602'";
		sql += " AND B.IIM_USE_YN = 'Y'";
		sql += " WHERE IIP_USE_YN = 'Y'";
		sql += " AND A.IIP_ITEM_CD = B.IIM_ITEM_CD";
		sql += " ORDER BY A.IIP_APLY_DT DESC";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uSP_Health_UF_SP2CHA_CREATE_003 \n";
			G_INFO += "설명 : 2차접수생성-수가정보조회(수가테이블)-야간작업심층면담 \n";
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
		<s:AttributeType name='IIP_APLY_DT' rs:number='1' rs:writeunknown='true' rs:basetable='IT_ITEM_PRICE' rs:basecolumn='IIP_APLY_DT'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='IIP_ITEM_CD' rs:number='2' rs:writeunknown='true' rs:basetable='IT_ITEM_PRICE' rs:basecolumn='IIP_ITEM_CD'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='IIP_SBSG_PR' rs:number='3' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_PRICE'
			 rs:basecolumn='IIP_SBSG_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='38' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='IIP_TGSG_PR' rs:number='4' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_PRICE'
			 rs:basecolumn='IIP_TGSG_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='38' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_SNME_NM' rs:number='5' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_SNME_NM'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='6' rs:rowid='true' rs:basetable='IT_ITEM_PRICE' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c6' rs:name='ROWID' rs:number='7' rs:rowid='true' rs:basetable='IT_ITEM' rs:basecolumn='ROWID'
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

			String IIP_APLY_DT_T = cRsList.getString("IIP_APLY_DT");
			String IIP_ITEM_CD_T = cRsList.getString("IIP_ITEM_CD");
			String IIP_SBSG_PR_T = cRsList.getString("IIP_SBSG_PR");
			String IIP_TGSG_PR_T = cRsList.getString("IIP_TGSG_PR");
			String IIM_SNME_NM_T = cRsList.getString("IIM_SNME_NM");
			String ROWID_T = cRsList.getString("ROWID");
			String c6_T = cRsList.getString("c6");
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

			if(! IIM_SNME_NM_T.equals("")) {
%>
		 		IIM_SNME_NM='<%= IIM_SNME_NM_T%>'
<%
			}
%>
				ROWID='<%= cnt%>'
				c6='<%= cnt%>'
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
