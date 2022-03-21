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

		String CMBQCKD_LEVL_KD = htMethod.get("CMBQCKD_LEVL_KD");
		String CMBQCKD_LV1 = htMethod.get("CMBQCKD_LV1");
		String CMBQCKD_LV2 = htMethod.get("CMBQCKD_LV2");
		String CMBQCKD_LV3 = htMethod.get("CMBQCKD_LV3");
		String CMBQCKD_LV4 = htMethod.get("CMBQCKD_LV4");

		//
		if(CMBQCKD_LEVL_KD == null) { CMBQCKD_LEVL_KD = ""; }
		if(CMBQCKD_LV1 == null) { CMBQCKD_LV1 = ""; }
		if(CMBQCKD_LV2 == null) { CMBQCKD_LV2 = ""; }
		if(CMBQCKD_LV3 == null) { CMBQCKD_LV3 = ""; }
		if(CMBQCKD_LV4 == null) { CMBQCKD_LV4 = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT * FROM CT_KSCD 
WHERE 0 = 0 

if :CmbQCKD_LEVL_KD = '1' then
begin
  if :CmbQCKD_LV1 <> '00' then 
      AND CKD_LV1 = :CmbQCKD_LV1
end else if :CmbQCKD_LEVL_KD = '2' then
begin
      AND CKD_LV1 = :CmbQCKD_LV1
   if :CmbQCKD_LV2 <> '00' then 
      AND CKD_LV2 = :CmbQCKD_LV2
end else if :CmbQCKD_LEVL_KD = '3' then
begin
      AND CKD_LV1 = :CmbQCKD_LV1
      AND CKD_LV2 = :CmbQCKD_LV2
  if :CmbQCKD_LV3 <> '000' then 
      AND CKD_LV3 = :CmbQCKD_LV3
end else if :CmbQCKD_LEVL_KD = '4' then
begin
      AND CKD_LV1 = :CmbQCKD_LV1
      AND CKD_LV2 = :CmbQCKD_LV2
      AND CKD_LV3 = :CmbQCKD_LV3
  if :CmbQCKD_LV4 <> '000' then 
      AND CKD_LV4 = :CmbQCKD_LV4
end;
      AND CKD_LEVL_KD = :CmbQCKD_LEVL_KD.Text
		*/

		sql = " SELECT *";
		sql += " FROM CT_KSCD";
		sql += " WHERE 0 = 0";

		if(CMBQCKD_LEVL_KD.equals("1")) {
			if(!CMBQCKD_LV1.equals("00")) {
				sql += " AND CKD_LV1 = '" + CMBQCKD_LV1 + "'";
			}
		}
		else if(CMBQCKD_LEVL_KD.equals("2")) {
			sql += " AND CKD_LV1 = '" + CMBQCKD_LV1 + "'";

			if(!CMBQCKD_LV2.equals("00")) {
				sql += " AND CKD_LV2 = '" + CMBQCKD_LV2 + "'";
			}
		}
		else if(CMBQCKD_LEVL_KD.equals("3")) {
			sql += " AND CKD_LV1 = '" + CMBQCKD_LV1 + "'";
			sql += " AND CKD_LV2 = '" + CMBQCKD_LV2 + "'";

			if(!CMBQCKD_LV3.equals("000")) {
				sql += " AND CKD_LV3 = '" + CMBQCKD_LV3 + "'";
			}
		}
		else if(CMBQCKD_LEVL_KD.equals("4")) {
			sql += " AND CKD_LV1 = '" + CMBQCKD_LV1 + "'";
			sql += " AND CKD_LV2 = '" + CMBQCKD_LV2 + "'";
			sql += " AND CKD_LV3 = '" + CMBQCKD_LV3 + "'";

			if(!CMBQCKD_LV4.equals("000")) {
				sql += " AND CKD_LV4 = '" + CMBQCKD_LV4 + "'";
			}
		}		
			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uCT_KSCD_APPLY_btnFindClick_001 \n";
			G_INFO += "설명 : 질병분류정보 로딩 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " CMBQCKD_LEVL_KD : " + CMBQCKD_LEVL_KD + " \n";
			G_INFO += " CMBQCKD_LV1 : " + CMBQCKD_LV1 + " \n";
			G_INFO += " CMBQCKD_LV2 : " + CMBQCKD_LV2 + " \n";
			G_INFO += " CMBQCKD_LV3 : " + CMBQCKD_LV3 + " \n";
			G_INFO += " CMBQCKD_LV4 : " + CMBQCKD_LV4 + " \n";
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
		<s:AttributeType name='CKD_ENME_NM' rs:number='7' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_KSCD'
			 rs:basecolumn='CKD_ENME_NM'>
			<s:datatype dt:type='string' dt:maxLength='500'/>
		</s:AttributeType>
		<s:AttributeType name='CKD_SNME_NM' rs:number='8' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_KSCD'
			 rs:basecolumn='CKD_SNME_NM'>
			<s:datatype dt:type='string' dt:maxLength='500'/>
		</s:AttributeType>
		<s:AttributeType name='CKD_KCD_CD' rs:number='9' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_KSCD'
			 rs:basecolumn='CKD_KCD_CD'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='CKD_SUKN_CD' rs:number='10' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_KSCD'
			 rs:basecolumn='CKD_SUKN_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='CKD_LEVL_KD' rs:number='11' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_KSCD'
			 rs:basecolumn='CKD_LEVL_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='CKD_SYMP_YN' rs:number='12' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_KSCD'
			 rs:basecolumn='CKD_SYMP_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='CKD_USE_YN' rs:number='13' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_KSCD'
			 rs:basecolumn='CKD_USE_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='CKD_NUSE_ID' rs:number='14' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_KSCD'
			 rs:basecolumn='CKD_NUSE_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='CKD_NUSE_DTT' rs:number='15' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_KSCD'
			 rs:basecolumn='CKD_NUSE_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='CKD_INPT_ID' rs:number='16' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_KSCD'
			 rs:basecolumn='CKD_INPT_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='CKD_INPT_DTT' rs:number='17' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_KSCD'
			 rs:basecolumn='CKD_INPT_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='CKD_MODI_ID' rs:number='18' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_KSCD'
			 rs:basecolumn='CKD_MODI_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='CKD_MODI_DTT' rs:number='19' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_KSCD'
			 rs:basecolumn='CKD_MODI_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='20' rs:rowid='true' rs:writeunknown='true' rs:basetable='CT_KSCD'
			 rs:basecolumn='ROWID' rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
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
			String CKD_ENME_NM_T = cRsList.getString("CKD_ENME_NM");
			String CKD_SNME_NM_T = cRsList.getString("CKD_SNME_NM");
			String CKD_KCD_CD_T = cRsList.getString("CKD_KCD_CD");
			String CKD_SUKN_CD_T = cRsList.getString("CKD_SUKN_CD");
			String CKD_LEVL_KD_T = cRsList.getString("CKD_LEVL_KD");
			String CKD_SYMP_YN_T = cRsList.getString("CKD_SYMP_YN");
			String CKD_USE_YN_T = cRsList.getString("CKD_USE_YN");
			String CKD_NUSE_ID_T = cRsList.getString("CKD_NUSE_ID");
			String CKD_NUSE_DTT_T = cRsList.getDate2("CKD_NUSE_DTT");
			String CKD_INPT_ID_T = cRsList.getString("CKD_INPT_ID");
			String CKD_INPT_DTT_T = cRsList.getDate2("CKD_INPT_DTT");
			String CKD_MODI_ID_T = cRsList.getString("CKD_MODI_ID");
			String CKD_MODI_DTT_T = cRsList.getDate2("CKD_MODI_DTT");
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

			if(! CKD_ENME_NM_T.equals("")) {
%>
		 		CKD_ENME_NM='<%= CKD_ENME_NM_T%>'
<%
			}

			if(! CKD_SNME_NM_T.equals("")) {
%>
		 		CKD_SNME_NM='<%= CKD_SNME_NM_T%>'
<%
			}

			if(! CKD_KCD_CD_T.equals("")) {
%>
		 		CKD_KCD_CD='<%= CKD_KCD_CD_T%>'
<%
			}

			if(! CKD_SUKN_CD_T.equals("")) {
%>
		 		CKD_SUKN_CD='<%= CKD_SUKN_CD_T%>'
<%
			}

			if(! CKD_LEVL_KD_T.equals("")) {
%>
		 		CKD_LEVL_KD='<%= CKD_LEVL_KD_T%>'
<%
			}

			if(! CKD_SYMP_YN_T.equals("")) {
%>
		 		CKD_SYMP_YN='<%= CKD_SYMP_YN_T%>'
<%
			}

			if(! CKD_USE_YN_T.equals("")) {
%>
		 		CKD_USE_YN='<%= CKD_USE_YN_T%>'
<%
			}

			if(! CKD_NUSE_ID_T.equals("")) {
%>
		 		CKD_NUSE_ID='<%= CKD_NUSE_ID_T%>'
<%
			}

			if(! CKD_NUSE_DTT_T.equals("")) {
%>
		 		CKD_NUSE_DTT='<%= CKD_NUSE_DTT_T%>'
<%
			}

			if(! CKD_INPT_ID_T.equals("")) {
%>
		 		CKD_INPT_ID='<%= CKD_INPT_ID_T%>'
<%
			}

			if(! CKD_INPT_DTT_T.equals("")) {
%>
		 		CKD_INPT_DTT='<%= CKD_INPT_DTT_T%>'
<%
			}

			if(! CKD_MODI_ID_T.equals("")) {
%>
		 		CKD_MODI_ID='<%= CKD_MODI_ID_T%>'
<%
			}

			if(! CKD_MODI_DTT_T.equals("")) {
%>
		 		CKD_MODI_DTT='<%= CKD_MODI_DTT_T%>'
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
