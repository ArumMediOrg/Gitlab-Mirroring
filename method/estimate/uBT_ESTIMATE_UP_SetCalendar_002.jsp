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

		String PRES_DT1 = htMethod.get("PRES_DT1");
		String PRES_DT2 = htMethod.get("PRES_DT2");
		String EDTBEE_ESTI_CD = htMethod.get("EDTBEE_ESTI_CD");
		String EDTIAU_EMP_NO = htMethod.get("EDTIAU_EMP_NO");
		String MSKEDT_ICY_COMP_CD = htMethod.get("MSKEDT_ICY_COMP_CD");

		//
		if(PRES_DT1 == null) { PRES_DT1 = ""; }
		if(PRES_DT2 == null) { PRES_DT2 = ""; }
		if(EDTBEE_ESTI_CD == null) { EDTBEE_ESTI_CD = ""; }
		if(EDTIAU_EMP_NO == null) { EDTIAU_EMP_NO = ""; }
		if(MSKEDT_ICY_COMP_CD == null) { MSKEDT_ICY_COMP_CD = ""; }

		// DB객체
		stmtList = connect.createStatement();


		sql += " SELECT BEE_MNGT_YR, BEE_ESTI_CD, BEE_ESTI_NM, BEE_PRES_DT, ";
		sql += " 		BEE_COMP_CD, F_COMP_FIND(BEE_COMP_CD) BEE_COMP_NM, ";
		sql += " 		BEE_SALE_CD, GetSale_idToNm(BEE_SALE_CD) BEE_SALE_NM ";
		sql += " FROM BT_ESTIMATE";
		sql += " WHERE BEE_PRES_DT >= '" + PRES_DT1 + "'";
		sql += " AND BEE_PRES_DT <= '" + PRES_DT2 + "'";

   		if(!EDTBEE_ESTI_CD.equals("")) {
   			sql += " AND BEE_ESTI_CD = '" + EDTIAU_EMP_NO + "'";
		}

   		if(!MSKEDT_ICY_COMP_CD.equals("")) {
  			sql += " AND BEE_COMP_CD = '" + MSKEDT_ICY_COMP_CD + "'";
		}

   		if(!EDTIAU_EMP_NO.equals("")) {
 			sql += " AND BEE_SALE_CD = '" + EDTIAU_EMP_NO + "'";
		}
			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uBT_ESTIMATE_UP_SetCalendar_002 \n";
			G_INFO += "설명 : 견적제출정보 로딩 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " PRES_DT1 : " + PRES_DT1 + " \n";
			G_INFO += " PRES_DT2 : " + PRES_DT2 + " \n";
			G_INFO += " EDTBEE_ESTI_CD : " + EDTBEE_ESTI_CD + " \n";
			G_INFO += " EDTIAU_EMP_NO : " + EDTIAU_EMP_NO + " \n";
			G_INFO += " MSKEDT_ICY_COMP_CD : " + MSKEDT_ICY_COMP_CD + " \n";
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
		<s:AttributeType name='BEE_MNGT_YR' rs:number='1' rs:writeunknown='true' rs:basetable='BT_ESTIMATE' rs:basecolumn='BEE_MNGT_YR'>
			<s:datatype dt:type='string' dt:maxLength='4' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='BEE_ESTI_CD' rs:number='2' rs:writeunknown='true' rs:basetable='BT_ESTIMATE' rs:basecolumn='BEE_ESTI_CD'>
			<s:datatype dt:type='string' dt:maxLength='8' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='BEE_ESTI_NM' rs:number='3' rs:writeunknown='true' rs:basetable='BT_ESTIMATE' rs:basecolumn='BEE_ESTI_NM'>
			<s:datatype dt:type='string' dt:maxLength='100' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='BEE_PRES_DT' rs:number='4' rs:writeunknown='true' rs:basetable='BT_ESTIMATE' rs:basecolumn='BEE_PRES_DT'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='BEE_COMP_CD' rs:number='5' rs:nullable='true' rs:writeunknown='true' rs:basetable='BT_ESTIMATE'
			 rs:basecolumn='BEE_COMP_CD'>
			<s:datatype dt:type='string' dt:maxLength='12'/>
		</s:AttributeType>
		<s:AttributeType name='BEE_COMP_NM' rs:number='6' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='BEE_SALE_CD' rs:number='7' rs:writeunknown='true' rs:basetable='BT_ESTIMATE' rs:basecolumn='BEE_SALE_CD'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='BEE_SALE_NM' rs:number='8' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='9' rs:rowid='true' rs:basetable='BT_ESTIMATE' rs:basecolumn='ROWID'
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

			String BEE_MNGT_YR_T = cRsList.getString("BEE_MNGT_YR");
			String BEE_ESTI_CD_T = cRsList.getString("BEE_ESTI_CD");
			String BEE_ESTI_NM_T = cRsList.getString("BEE_ESTI_NM");
			String BEE_PRES_DT_T = cRsList.getString("BEE_PRES_DT");
			String BEE_COMP_CD_T = cRsList.getString("BEE_COMP_CD");
			String BEE_COMP_NM_T = cRsList.getString("BEE_COMP_NM");
			String BEE_SALE_CD_T = cRsList.getString("BEE_SALE_CD");
			String BEE_SALE_NM_T = cRsList.getString("BEE_SALE_NM");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! BEE_MNGT_YR_T.equals("")) {
%>
		 		BEE_MNGT_YR='<%= BEE_MNGT_YR_T%>'
<%
			}

			if(! BEE_ESTI_CD_T.equals("")) {
%>
		 		BEE_ESTI_CD='<%= BEE_ESTI_CD_T%>'
<%
			}

			if(! BEE_ESTI_NM_T.equals("")) {
%>
		 		BEE_ESTI_NM='<%= BEE_ESTI_NM_T%>'
<%
			}

			if(! BEE_PRES_DT_T.equals("")) {
%>
		 		BEE_PRES_DT='<%= BEE_PRES_DT_T%>'
<%
			}

			if(! BEE_COMP_CD_T.equals("")) {
%>
		 		BEE_COMP_CD='<%= BEE_COMP_CD_T%>'
<%
			}

			if(! BEE_COMP_NM_T.equals("")) {
%>
		 		BEE_COMP_NM='<%= BEE_COMP_NM_T%>'
<%
			}

			if(! BEE_SALE_CD_T.equals("")) {
%>
		 		BEE_SALE_CD='<%= BEE_SALE_CD_T%>'
<%
			}

			if(! BEE_SALE_NM_T.equals("")) {
%>
		 		BEE_SALE_NM='<%= BEE_SALE_NM_T%>'
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
