<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="/inc_prg/common.jsp"%>
<%
	// 전달자료
	HashMap<String, Object> htData = null;
	HashMap<String, String> htMethod = null;

	// DB객체
	Statement stmtList = null;
	CallableStatement CallStmtExec = null;

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

		String SVALUE1 = htMethod.get("SVALUE1");
		String SVALUE2 = htMethod.get("SVALUE2");
		String SVALUE3 = htMethod.get("SVALUE3");
		String SVALUE4 = htMethod.get("SVALUE4");
		String SVALUE5 = htMethod.get("SVALUE5");

		//
		if(SVALUE1 == null) { SVALUE1 = ""; }
		if(SVALUE2 == null) { SVALUE2 = ""; }
		if(SVALUE3 == null) { SVALUE3 = ""; }
		if(SVALUE4 == null) { SVALUE4 = ""; }
		if(SVALUE5 == null) { SVALUE5 = ""; }

		// DB객체
		stmtList = connect.createStatement();

		// SP사용
		sql = "{call SP_GetGumginToHangmok(?, ?, ?, ?, ?)}";
		CallStmtExec = connect.prepareCall(sql);


		/*

      EXEC SP_GetGumginToHangmok 
                :sValue1, :sValue2, :sValue3, :sValue4, :sValue5

		*/

				CallStmtExec.setString(1,  SVALUE1);
				CallStmtExec.setString(2,  SVALUE2);
				CallStmtExec.setString(3,  SVALUE3);
				CallStmtExec.setString(4,  SVALUE4);
				CallStmtExec.setString(5,  SVALUE5);

				rsList = CallStmtExec.executeQuery();

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : UFM_Common_GP_ITEMGridDisPlay_001___2 \n";
			G_INFO += "설명 : 구분값에 따른 그리드 정보 로딩___2 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " SVALUE1 : " + SVALUE1 + " \n";
			G_INFO += " SVALUE2 : " + SVALUE2 + " \n";
			G_INFO += " SVALUE3 : " + SVALUE3 + " \n";
			G_INFO += " SVALUE4 : " + SVALUE4 + " \n";
			G_INFO += " SVALUE5 : " + SVALUE5 + " \n";
			G_INFO += "\n\n";

			G_INFO += "질의문 : " + sql + " \n";
			G_INFO += "-->";

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
		<s:AttributeType name='APLY_DT' rs:number='1' rs:writeunknown='true' rs:basetable='IT_ITEM_PRICE' rs:basecolumn='IIP_APLY_DT'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ITEM_CD' rs:number='2' rs:writeunknown='true' rs:basetable='IT_ITEM' rs:basecolumn='IIM_ITEM_CD'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ITEM_NM' rs:number='3' rs:writeunknown='true' rs:basetable='IT_ITEM' rs:basecolumn='IIM_KNME_NM'>
			<s:datatype dt:type='string' dt:maxLength='200' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='HC_KD' rs:number='4' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_HYHC_KD'>
			<s:datatype dt:type='string' dt:maxLength='11'/>
		</s:AttributeType>
		<s:AttributeType name='ITEM_JC' rs:number='5' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='ITEM_GB' rs:number='6' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='ITEM_HE' rs:number='7' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='ITEM_SB' rs:number='8' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='ITEM_TG' rs:number='9' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='10' rs:rowid='true' rs:basetable='IT_ITEM' rs:basecolumn='ROWID' rs:keycolumn='true'
			 rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c10' rs:name='ROWID' rs:number='11' rs:rowid='true' rs:basetable='IT_ITEM_PRICE' rs:basecolumn='ROWID'
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

			String APLY_DT_T = cRsList.getString("APLY_DT");
			String ITEM_CD_T = cRsList.getString("ITEM_CD");
			String ITEM_NM_T = cRsList.getString("ITEM_NM");
			String HC_KD_T = cRsList.getString("HC_KD");
			String ITEM_JC_T = cRsList.getString("ITEM_JC");
			String ITEM_GB_T = cRsList.getString("ITEM_GB");
			String ITEM_HE_T = cRsList.getString("ITEM_HE");
			String ITEM_SB_T = cRsList.getString("ITEM_SB");
			String ITEM_TG_T = cRsList.getString("ITEM_TG");
			String ROWID_T = cRsList.getString("ROWID");
			String c10_T = cRsList.getString("c10");
%>
			<z:row
<%
			if(! APLY_DT_T.equals("")) {
%>
		 		APLY_DT='<%= APLY_DT_T%>'
<%
			}

			if(! ITEM_CD_T.equals("")) {
%>
		 		ITEM_CD='<%= ITEM_CD_T%>'
<%
			}

			if(! ITEM_NM_T.equals("")) {
%>
		 		ITEM_NM='<%= ITEM_NM_T%>'
<%
			}

			if(! HC_KD_T.equals("")) {
%>
		 		HC_KD='<%= HC_KD_T%>'
<%
			}

			if(! ITEM_JC_T.equals("")) {
%>
		 		ITEM_JC='<%= ITEM_JC_T%>'
<%
			}

			if(! ITEM_GB_T.equals("")) {
%>
		 		ITEM_GB='<%= ITEM_GB_T%>'
<%
			}

			if(! ITEM_HE_T.equals("")) {
%>
		 		ITEM_HE='<%= ITEM_HE_T%>'
<%
			}

			if(! ITEM_SB_T.equals("")) {
%>
		 		ITEM_SB='<%= ITEM_SB_T%>'
<%
			}

			if(! ITEM_TG_T.equals("")) {
%>
		 		ITEM_TG='<%= ITEM_TG_T%>'
<%
			}
%>
				ROWID='<%= cnt%>'
				c10='<%= cnt%>'
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

		if(CallStmtExec != null) {
			CallStmtExec.close();
			CallStmtExec = null;
		}
%>
<%@ include file="/inc_prg/disconnect.jsp"%>
<%
	}
%>
