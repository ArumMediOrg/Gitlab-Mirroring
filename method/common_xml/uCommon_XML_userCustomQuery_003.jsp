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

		String SSQL = htMethod.get("SSQL");

		//
		if(SSQL == null) { SSQL = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

select A.aliasField1, A.aliasField2, A.aliasField3, A.aliasField4, A.aliasField5, A.aliasField6, A.aliasField7, A.aliasField8, A.aliasField9, A.aliasField10, 
       A.aliasField11, A.aliasField12, A.aliasField13, A.aliasField14, A.aliasField15, A.aliasField16, A.aliasField17, A.aliasField18, A.aliasField19, A.aliasField20 from
(
  :sSql
) A  

		*/

		sql = " SELECT A.ALIASFIELD1, A.ALIASFIELD2, A.ALIASFIELD3, A.ALIASFIELD4, A.ALIASFIELD5, A.ALIASFIELD6, A.ALIASFIELD7, A.ALIASFIELD8, A.ALIASFIELD9, A.ALIASFIELD10, ";
		sql += " A.ALIASFIELD11, A.ALIASFIELD12, A.ALIASFIELD13, A.ALIASFIELD14, A.ALIASFIELD15, A.ALIASFIELD16, A.ALIASFIELD17, A.ALIASFIELD18, A.ALIASFIELD19, A.ALIASFIELD20";
		sql += " FROM (" + SSQL + ") A";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uCommon_XML_userCustomQuery_003 \n";
			G_INFO += "설명 : 알리아싱된 데이터 출력을 위한 쿼리 - maxlength를 크게 잡아주시기 바랍니다. \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " SSQL : " + SSQL + " \n";
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
		<s:AttributeType name='ALIASFIELD1' rs:number='1' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1000' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ALIASFIELD2' rs:number='2' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1000' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ALIASFIELD3' rs:number='3' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1000' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ALIASFIELD4' rs:number='4' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1000' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ALIASFIELD5' rs:number='5' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1000' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ALIASFIELD6' rs:number='6' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1000' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ALIASFIELD7' rs:number='7' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1000' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ALIASFIELD8' rs:number='8' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1000' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ALIASFIELD9' rs:number='9' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1000' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ALIASFIELD10' rs:number='10' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1000' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ALIASFIELD11' rs:number='11' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1000' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ALIASFIELD12' rs:number='12' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1000' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ALIASFIELD13' rs:number='13' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1000' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ALIASFIELD14' rs:number='14' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1000' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ALIASFIELD15' rs:number='15' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1000' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ALIASFIELD16' rs:number='16' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1000' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ALIASFIELD17' rs:number='17' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1000' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ALIASFIELD18' rs:number='18' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1000' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ALIASFIELD19' rs:number='19' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1000' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ALIASFIELD20' rs:number='20' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1000' rs:fixedlength='true'/>
		</s:AttributeType>

		<s:AttributeType name='ROWID' rs:number='21' rs:rowid='true' rs:basetable='DUAL' rs:basecolumn='ROWID' rs:keycolumn='true'
			 rs:hidden='true' rs:autoincrement='true'>
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

			String ALIASFIELD1_T = cRsList.getString("ALIASFIELD1");
			String ALIASFIELD2_T = cRsList.getString("ALIASFIELD2");
			String ALIASFIELD3_T = cRsList.getString("ALIASFIELD3");
			String ALIASFIELD4_T = cRsList.getString("ALIASFIELD4");
			String ALIASFIELD5_T = cRsList.getString("ALIASFIELD5");
			String ALIASFIELD6_T = cRsList.getString("ALIASFIELD6");
			String ALIASFIELD7_T = cRsList.getString("ALIASFIELD7");
			String ALIASFIELD8_T = cRsList.getString("ALIASFIELD8");
			String ALIASFIELD9_T = cRsList.getString("ALIASFIELD9");
			String ALIASFIELD10_T = cRsList.getString("ALIASFIELD10");
			String ALIASFIELD11_T = cRsList.getString("ALIASFIELD11");
			String ALIASFIELD12_T = cRsList.getString("ALIASFIELD12");
			String ALIASFIELD13_T = cRsList.getString("ALIASFIELD13");
			String ALIASFIELD14_T = cRsList.getString("ALIASFIELD14");
			String ALIASFIELD15_T = cRsList.getString("ALIASFIELD15");
			String ALIASFIELD16_T = cRsList.getString("ALIASFIELD16");
			String ALIASFIELD17_T = cRsList.getString("ALIASFIELD17");
			String ALIASFIELD18_T = cRsList.getString("ALIASFIELD18");
			String ALIASFIELD19_T = cRsList.getString("ALIASFIELD19");
			String ALIASFIELD20_T = cRsList.getString("ALIASFIELD20");

			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! ALIASFIELD1_T.equals("")) {
%>
		 		ALIASFIELD1='<%= ALIASFIELD1_T%>'
<%
			}

			if(! ALIASFIELD2_T.equals("")) {
%>
		 		ALIASFIELD2='<%= ALIASFIELD2_T%>'
<%
			}

			if(! ALIASFIELD3_T.equals("")) {
%>
		 		ALIASFIELD3='<%= ALIASFIELD3_T%>'
<%
			}

			if(! ALIASFIELD4_T.equals("")) {
%>
		 		ALIASFIELD4='<%= ALIASFIELD4_T%>'
<%
			}

			if(! ALIASFIELD5_T.equals("")) {
%>
		 		ALIASFIELD5='<%= ALIASFIELD5_T%>'
<%
			}

			if(! ALIASFIELD6_T.equals("")) {
%>
		 		ALIASFIELD6='<%= ALIASFIELD6_T%>'
<%
			}

			if(! ALIASFIELD7_T.equals("")) {
%>
		 		ALIASFIELD7='<%= ALIASFIELD7_T%>'
<%
			}

			if(! ALIASFIELD8_T.equals("")) {
%>
		 		ALIASFIELD8='<%= ALIASFIELD8_T%>'
<%
			}

			if(! ALIASFIELD9_T.equals("")) {
%>
		 		ALIASFIELD9='<%= ALIASFIELD9_T%>'
<%
			}

			if(! ALIASFIELD10_T.equals("")) {
%>
		 		ALIASFIELD10='<%= ALIASFIELD10_T%>'
<%
			}

			if(! ALIASFIELD11_T.equals("")) {
%>
		 		ALIASFIELD11='<%= ALIASFIELD11_T%>'
<%
			}

			if(! ALIASFIELD12_T.equals("")) {
%>
		 		ALIASFIELD12='<%= ALIASFIELD12_T%>'
<%
			}

			if(! ALIASFIELD13_T.equals("")) {
%>
		 		ALIASFIELD13='<%= ALIASFIELD13_T%>'
<%
			}

			if(! ALIASFIELD14_T.equals("")) {
%>
		 		ALIASFIELD14='<%= ALIASFIELD14_T%>'
<%
			}

			if(! ALIASFIELD15_T.equals("")) {
%>
		 		ALIASFIELD15='<%= ALIASFIELD15_T%>'
<%
			}

			if(! ALIASFIELD16_T.equals("")) {
%>
		 		ALIASFIELD16='<%= ALIASFIELD16_T%>'
<%
			}

			if(! ALIASFIELD17_T.equals("")) {
%>
		 		ALIASFIELD17='<%= ALIASFIELD17_T%>'
<%
			}

			if(! ALIASFIELD18_T.equals("")) {
%>
		 		ALIASFIELD18='<%= ALIASFIELD18_T%>'
<%
			}

			if(! ALIASFIELD19_T.equals("")) {
%>
		 		ALIASFIELD19='<%= ALIASFIELD19_T%>'
<%
			}

			if(! ALIASFIELD20_T.equals("")) {
%>
		 		ALIASFIELD20='<%= ALIASFIELD20_T%>'
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
