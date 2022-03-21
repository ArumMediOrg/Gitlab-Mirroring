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

select RMG_INPUT_DTT, RMG_MAGAM_DT, RMG_MAGAM_TX, RMG_INPT_ID
      ,(select RMG_MAGAM_KD||'-'||CCN_FULL_NM FROM CT_COMMON where CCN_LARGE='0927' AND CCN_SMALL= RMG_MAGAM_KD) RMG_MAGAM_KD
from RT_RECE_MAGAM
where RMG_INPUT_DTT = (select Max(RMG_INPUT_DTT) from RT_RECE_MAGAM)

		*/

		sql = " SELECT RMG_INPUT_DTT, RMG_MAGAM_DT, RMG_MAGAM_TX, RMG_INPT_ID";
		sql += ",(";
		sql += "	SELECT RMG_MAGAM_KD||'-'||CCN_FULL_NM";
		sql += " 	FROM CT_COMMON";
		sql += " 	WHERE CCN_LARGE='0927'";
		sql += " 	AND CCN_SMALL= RMG_MAGAM_KD";
		sql += " ) RMG_MAGAM_KD";
		sql += " FROM RT_RECE_MAGAM";
		sql += " WHERE RMG_INPUT_DTT = (SELECT MAX(RMG_INPUT_DTT) FROM RT_RECE_MAGAM)";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uRT_ReceDayReport_UP_LastMagamSet_001 \n";
			G_INFO += "설명 : 마감현황정보 로딩 \n";
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
		<s:AttributeType name='RMG_INPUT_DTT' rs:number='1' rs:writeunknown='true' rs:basetable='RT_RECE_MAGAM' rs:basecolumn='RMG_INPUT_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'
			 rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='RMG_MAGAM_DT' rs:number='2' rs:writeunknown='true' rs:basetable='RT_RECE_MAGAM' rs:basecolumn='RMG_MAGAM_DT'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='RMG_MAGAM_TX' rs:number='3' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RECE_MAGAM'
			 rs:basecolumn='RMG_MAGAM_TX'>
			<s:datatype dt:type='string' dt:maxLength='1000'/>
		</s:AttributeType>
		<s:AttributeType name='RMG_INPT_ID' rs:number='4' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RECE_MAGAM'
			 rs:basecolumn='RMG_INPT_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='RMG_MAGAM_KD' rs:number='5' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='302'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='6' rs:rowid='true' rs:basetable='RT_RECE_MAGAM' rs:basecolumn='ROWID'
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

			String RMG_INPUT_DTT_T = cRsList.getDate2("RMG_INPUT_DTT");
			String RMG_MAGAM_DT_T = cRsList.getString("RMG_MAGAM_DT");
			String RMG_MAGAM_TX_T = cRsList.getString("RMG_MAGAM_TX");
			String RMG_INPT_ID_T = cRsList.getString("RMG_INPT_ID");
			String RMG_MAGAM_KD_T = cRsList.getString("RMG_MAGAM_KD");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! RMG_INPUT_DTT_T.equals("")) {
%>
		 		RMG_INPUT_DTT='<%= RMG_INPUT_DTT_T%>'
<%
			}

			if(! RMG_MAGAM_DT_T.equals("")) {
%>
		 		RMG_MAGAM_DT='<%= RMG_MAGAM_DT_T%>'
<%
			}

			if(! RMG_MAGAM_TX_T.equals("")) {
%>
		 		RMG_MAGAM_TX='<%= RMG_MAGAM_TX_T%>'
<%
			}

			if(! RMG_INPT_ID_T.equals("")) {
%>
		 		RMG_INPT_ID='<%= RMG_INPT_ID_T%>'
<%
			}

			if(! RMG_MAGAM_KD_T.equals("")) {
%>
		 		RMG_MAGAM_KD='<%= RMG_MAGAM_KD_T%>'
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
