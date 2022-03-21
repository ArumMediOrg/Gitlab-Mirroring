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

		String SCB_NAME = htMethod.get("SCB_NAME");
		String STABLE = htMethod.get("STABLE");
		String SLARGE = htMethod.get("SLARGE");
		String SSMALL = htMethod.get("SSMALL");

		//
		if(SCB_NAME == null) { SCB_NAME = ""; }
		if(STABLE == null) { STABLE = ""; }
		if(SLARGE == null) { SLARGE = ""; }
		if(SSMALL == null) { SSMALL = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

      SELECT CKD_LV1, CKD_LV2, CKD_LV3, CKD_LV4, CKD_KSCD_CD, CKD_KNME_NM, CKD_SNME_NM, CKD_LEVL_KD 
                  FROM CT_KSCD 
                  WHERE 0=0 
    if (:sCb_Name = 'CmbQCKD_LV1') or (:sCb_Name = 'CmbCKD_LV1') then
    begin
       AND CKD_LEVL_KD = '1'
    end;
    if (:sCb_Name = 'CmbQCKD_LV2') or (:sCb_Name = 'CmbCKD_LV2') then
    begin
       AND CKD_LV1 = :sTable
       AND CKD_LEVL_KD = '2'
    end;
    if (:sCb_Name = 'CmbQCKD_LV3') or (:sCb_Name = 'CmbCKD_LV3') then
    begin
       AND CKD_LV1 = :sTable
       AND CKD_LV2 = :sLarge
       AND CKD_LEVL_KD = '3'
    end;
    if (:sCb_Name = 'CmbQCKD_LV4') or (:sCb_Name = 'CmbCKD_LV4') then
    begin
       AND CKD_LV1 = :sTable
       AND CKD_LV2 = :sLarge
       AND CKD_LV3 = :sSmall
       AND CKD_LEVL_KD = '4'
    end;
    ORDER BY CKD_KSCD_CD 

		*/

		sql = " SELECT CKD_LV1, CKD_LV2, CKD_LV3, CKD_LV4, CKD_KSCD_CD, CKD_KNME_NM, CKD_SNME_NM, CKD_LEVL_KD";
		sql += " FROM CT_KSCD";
		sql += " WHERE 0=0";

		if(SCB_NAME.equals("CmbQCKD_LV1") || SCB_NAME.equals("CmbCKD_LV1")) {
			sql += " AND CKD_LEVL_KD = '1'";
		}
		
		if(SCB_NAME.equals("CmbQCKD_LV2") || SCB_NAME.equals("CmbCKD_LV2")) {
			sql += " AND CKD_LV1 = '" + STABLE + "'";
			sql += " AND CKD_LEVL_KD = '2'";
		}
		
		if(SCB_NAME.equals("CmbQCKD_LV3") || SCB_NAME.equals("CmbCKD_LV3")) {
			sql += " AND CKD_LV1 = '" + STABLE + "'";
			sql += " AND CKD_LV2 = '" + SLARGE + "'";
			sql += " AND CKD_LEVL_KD = '3'";
		}

		if(SCB_NAME.equals("CmbQCKD_LV4") || SCB_NAME.equals("CmbCKD_LV4")) {
			sql += " AND CKD_LV1 = '" + STABLE + "'";
			sql += " AND CKD_LV2 = '" + SLARGE + "'";
			sql += " AND CKD_LV3 = '" + SSMALL + "'";
			sql += " AND CKD_LEVL_KD = '4'";
		}

		sql += " ORDER BY CKD_KSCD_CD";
			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : UFM_Common_GP_ComboSetting_001___14 \n";
			G_INFO += "설명 : 구분값에 따른 콤보박스 정보 로딩___14 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " SCB_NAME : " + SCB_NAME + " \n";
			G_INFO += " STABLE : " + STABLE + " \n";
			G_INFO += " SLARGE : " + SLARGE + " \n";
			G_INFO += " SSMALL : " + SSMALL + " \n";
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
		<s:AttributeType name='CKD_LV1' rs:number='1' rs:writeunknown='true' rs:basetable='CT_KSCD' rs:basecolumn='CKD_LV1'>
			<s:datatype dt:type='string' dt:maxLength='2' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='CKD_LV2' rs:number='2' rs:writeunknown='true' rs:basetable='CT_KSCD' rs:basecolumn='CKD_LV2'>
			<s:datatype dt:type='string' dt:maxLength='2' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='CKD_LV3' rs:number='3' rs:writeunknown='true' rs:basetable='CT_KSCD' rs:basecolumn='CKD_LV3'>
			<s:datatype dt:type='string' dt:maxLength='3' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='CKD_LV4' rs:number='4' rs:writeunknown='true' rs:basetable='CT_KSCD' rs:basecolumn='CKD_LV4'>
			<s:datatype dt:type='string' dt:maxLength='3' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='CKD_KSCD_CD' rs:number='5' rs:writeunknown='true' rs:basetable='CT_KSCD' rs:basecolumn='CKD_KSCD_CD'>
			<s:datatype dt:type='string' dt:maxLength='20' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='CKD_KNME_NM' rs:number='6' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_KSCD'
			 rs:basecolumn='CKD_KNME_NM'>
			<s:datatype dt:type='string' dt:maxLength='500'/>
		</s:AttributeType>
		<s:AttributeType name='CKD_SNME_NM' rs:number='7' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_KSCD'
			 rs:basecolumn='CKD_SNME_NM'>
			<s:datatype dt:type='string' dt:maxLength='500'/>
		</s:AttributeType>
		<s:AttributeType name='CKD_LEVL_KD' rs:number='8' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_KSCD'
			 rs:basecolumn='CKD_LEVL_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='9' rs:rowid='true' rs:basetable='CT_KSCD' rs:basecolumn='ROWID' rs:keycolumn='true'
			 rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:extends type='rs:rowbase'/>
	</s:ElementType>
</s:Schema>		<rs:data>
<%
		int cnt = 0;
		while(cRsList.next()) {

			cnt++;

			String CKD_LV1_T = cRsList.getString("CKD_LV1");
			String CKD_LV2_T = cRsList.getString("CKD_LV2");
			String CKD_LV3_T = cRsList.getString("CKD_LV3");
			String CKD_LV4_T = cRsList.getString("CKD_LV4");
			String CKD_KSCD_CD_T = cRsList.getString("CKD_KSCD_CD");
			String CKD_KNME_NM_T = cRsList.getString("CKD_KNME_NM");
			String CKD_SNME_NM_T = cRsList.getString("CKD_SNME_NM");
			String CKD_LEVL_KD_T = cRsList.getString("CKD_LEVL_KD");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! CKD_LV1_T.equals("")) {
%>
		 		CKD_LV1='<%= CKD_LV1_T%>'
<%
			}

			if(! CKD_LV2_T.equals("")) {
%>
		 		CKD_LV2='<%= CKD_LV2_T%>'
<%
			}

			if(! CKD_LV3_T.equals("")) {
%>
		 		CKD_LV3='<%= CKD_LV3_T%>'
<%
			}

			if(! CKD_LV4_T.equals("")) {
%>
		 		CKD_LV4='<%= CKD_LV4_T%>'
<%
			}

			if(! CKD_KSCD_CD_T.equals("")) {
%>
		 		CKD_KSCD_CD='<%= CKD_KSCD_CD_T%>'
<%
			}

			if(! CKD_KNME_NM_T.equals("")) {
%>
		 		CKD_KNME_NM='<%= CKD_KNME_NM_T%>'
<%
			}

			if(! CKD_SNME_NM_T.equals("")) {
%>
		 		CKD_SNME_NM='<%= CKD_SNME_NM_T%>'
<%
			}

			if(! CKD_LEVL_KD_T.equals("")) {
%>
		 		CKD_LEVL_KD='<%= CKD_LEVL_KD_T%>'
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
