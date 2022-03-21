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

		String PENL_NM = htMethod.get("PENL_NM");
		String G_ENCRT_KD = htMethod.get("G_ENCRT_KD");
		String NPSNL_ID = htMethod.get("NPSNL_ID");

		//
		if(PENL_NM == null) { PENL_NM = ""; }
		if(G_ENCRT_KD == null) { G_ENCRT_KD = ""; }
		if(NPSNL_ID == null) { NPSNL_ID = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

select icr_cust_no
from it_customer
where icr_penl_nm = :penl_nm

if (:g_Encrt_Kd = '1') or (:g_Encrt_Kd = '2') then
      and icr_pid_en  = :nPsnl_Id
else
      and icr_penl_id = :nPsnl_Id

      and NVL(icr_use_yn, 'Y') <> 'N' 

		*/

		sql = " SELECT ICR_CUST_NO";
		sql += " FROM IT_CUSTOMER";
		sql += " WHERE ICR_PENL_NM = '" + PENL_NM + "'";

		if(G_ENCRT_KD.equals("1") || G_ENCRT_KD.equals("2")) {
			sql += " AND ICR_PID_EN = '" + NPSNL_ID + "'";
		}
		else {
			sql += " AND ICR_PENL_ID = '" + NPSNL_ID + "'";
		}

		sql += " AND NVL(ICR_USE_YN, 'Y') <> 'N'";
			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uBusinessTrip_btnUpLoadClick_003 \n";
			G_INFO += "설명 : 고객정보 로딩 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " PENL_NM : " + PENL_NM + " \n";
			G_INFO += " G_ENCRT_KD : " + G_ENCRT_KD + " \n";
			G_INFO += " NPSNL_ID : " + NPSNL_ID + " \n";
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
		<s:AttributeType name='ICR_CUST_NO' rs:number='1' rs:writeunknown='true' rs:basetable='IT_CUSTOMER' rs:basecolumn='ICR_CUST_NO'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='2' rs:rowid='true' rs:basetable='IT_CUSTOMER' rs:basecolumn='ROWID'
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

			String ICR_CUST_NO_T = cRsList.getString("ICR_CUST_NO");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! ICR_CUST_NO_T.equals("")) {
%>
		 		ICR_CUST_NO='<%= ICR_CUST_NO_T%>'
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
