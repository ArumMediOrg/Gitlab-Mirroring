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

		String CMBKIND1 = htMethod.get("CMBKIND1");
		String CMBKIND2 = htMethod.get("CMBKIND2");
		String EDTCMS_ITEM_NM = htMethod.get("EDTCMS_ITEM_NM");
		String CHKBOXUSE = htMethod.get("CHKBOXUSE");

		//
		if(CMBKIND1 == null) { CMBKIND1 = ""; }
		if(CMBKIND2 == null) { CMBKIND2 = ""; }
		if(EDTCMS_ITEM_NM == null) { EDTCMS_ITEM_NM = ""; }
		if(CHKBOXUSE == null) { CHKBOXUSE = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT A.CMS_ITEM_CD, C.IIM_KNME_NM CMS_ITEM_NM, A.CMS_HEIG_KD, A.CMS_KSCD_CD,
       GetKSCD_cdToNm(A.CMS_KSCD_CD,B.CKD_SUKN_CD) CMS_KSCD_NM, A.CMS_USE_YN
FROM CT_MARK_SICK A INNER JOIN CT_KSCD B ON A.CMS_KSCD_CD = B.CKD_KSCD_CD
                    INNER JOIN IT_ITEM C ON A.CMS_ITEM_CD = C.IIM_ITEM_CD
WHERE 0 = 0

if :CmbKind1 <> '0000' then
      AND A.CMS_ITEM_CD = :CmbKind2

if :EdtCMS_ITEM_NM <> '' then
      AND C.IIM_KNME_NM like '%' || :EdtCMS_ITEM_NM || '%'

if :ChkBoxUSE = '0' then
      AND A.CMS_USE_YN = 'Y'

ORDER BY A.CMS_ITEM_CD, A.CMS_HEIG_KD, A.CMS_KSCD_CD
		*/

		sql = " SELECT A.CMS_ITEM_CD, C.IIM_KNME_NM CMS_ITEM_NM, A.CMS_HEIG_KD, A.CMS_KSCD_CD, GETKSCD_CDTONM(A.CMS_KSCD_CD,B.CKD_SUKN_CD) CMS_KSCD_NM, A.CMS_USE_YN";
		sql += " FROM CT_MARK_SICK A INNER JOIN CT_KSCD B";
		sql += " ON A.CMS_KSCD_CD = B.CKD_KSCD_CD INNER JOIN IT_ITEM C";
		sql += " ON A.CMS_ITEM_CD = C.IIM_ITEM_CD";
		sql += " WHERE 0 = 0";

		if(!CMBKIND1.equals("0000")) {
		sql += " AND A.CMS_ITEM_CD = '" + CMBKIND2 + "'";

		}
		if(!EDTCMS_ITEM_NM.equals("")) {
		sql += " AND C.IIM_KNME_NM LIKE '%" + EDTCMS_ITEM_NM + "%'";

		}
		if(CHKBOXUSE.equals("0")) {
		sql += " AND A.CMS_USE_YN = 'Y'";

		}		
		sql += " ORDER BY A.CMS_ITEM_CD, A.CMS_HEIG_KD, A.CMS_KSCD_CD";
			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uCT_MARK_SICK_SBtnQueryClick_001 \n";
			G_INFO += "설명 : 표적질환 정보 로딩 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " CMBKIND1 : " + CMBKIND1 + " \n";
			G_INFO += " CMBKIND2 : " + CMBKIND2 + " \n";
			G_INFO += " EDTCMS_ITEM_NM : " + EDTCMS_ITEM_NM + " \n";
			G_INFO += " CHKBOXUSE : " + CHKBOXUSE + " \n";
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
		<s:AttributeType name='CMS_ITEM_CD' rs:number='1' rs:writeunknown='true' rs:basetable='CT_MARK_SICK' rs:basecolumn='CMS_ITEM_CD'>
			<s:datatype dt:type='string' dt:maxLength='20' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='CMS_ITEM_NM' rs:number='2' rs:writeunknown='true' rs:basetable='IT_ITEM' rs:basecolumn='IIM_KNME_NM'>
			<s:datatype dt:type='string' dt:maxLength='200' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='CMS_HEIG_KD' rs:number='3' rs:writeunknown='true' rs:basetable='CT_MARK_SICK' rs:basecolumn='CMS_HEIG_KD'>
			<s:datatype dt:type='string' dt:maxLength='2' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='CMS_KSCD_CD' rs:number='4' rs:writeunknown='true' rs:basetable='CT_MARK_SICK' rs:basecolumn='CMS_KSCD_CD'>
			<s:datatype dt:type='string' dt:maxLength='20' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='CMS_KSCD_NM' rs:number='5' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='8000'/>
		</s:AttributeType>
		<s:AttributeType name='CMS_USE_YN' rs:number='6' rs:writeunknown='true' rs:basetable='CT_MARK_SICK' rs:basecolumn='CMS_USE_YN'>
			<s:datatype dt:type='string' dt:maxLength='1' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='7' rs:rowid='true' rs:basetable='CT_MARK_SICK' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c7' rs:name='ROWID' rs:number='8' rs:rowid='true' rs:basetable='CT_KSCD' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c8' rs:name='ROWID' rs:number='9' rs:rowid='true' rs:basetable='IT_ITEM' rs:basecolumn='ROWID'
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

			String CMS_ITEM_CD_T = cRsList.getString("CMS_ITEM_CD");
			String CMS_ITEM_NM_T = cRsList.getString("CMS_ITEM_NM");
			String CMS_HEIG_KD_T = cRsList.getString("CMS_HEIG_KD");
			String CMS_KSCD_CD_T = cRsList.getString("CMS_KSCD_CD");
			String CMS_KSCD_NM_T = cRsList.getString("CMS_KSCD_NM");
			String CMS_USE_YN_T = cRsList.getString("CMS_USE_YN");
			String ROWID_T = cRsList.getString("ROWID");
			String c7_T = cRsList.getString("c7");
			String c8_T = cRsList.getString("c8");
%>
			<z:row
<%
			if(! CMS_ITEM_CD_T.equals("")) {
%>
		 		CMS_ITEM_CD='<%= CMS_ITEM_CD_T%>'
<%
			}

			if(! CMS_ITEM_NM_T.equals("")) {
%>
		 		CMS_ITEM_NM='<%= CMS_ITEM_NM_T%>'
<%
			}

			if(! CMS_HEIG_KD_T.equals("")) {
%>
		 		CMS_HEIG_KD='<%= CMS_HEIG_KD_T%>'
<%
			}

			if(! CMS_KSCD_CD_T.equals("")) {
%>
		 		CMS_KSCD_CD='<%= CMS_KSCD_CD_T%>'
<%
			}

			if(! CMS_KSCD_NM_T.equals("")) {
%>
		 		CMS_KSCD_NM='<%= CMS_KSCD_NM_T%>'
<%
			}

			if(! CMS_USE_YN_T.equals("")) {
%>
		 		CMS_USE_YN='<%= CMS_USE_YN_T%>'
<%
			}
%>
				ROWID='<%= cnt%>'
				c7='<%= cnt%>'
				c8='<%= cnt%>'
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
