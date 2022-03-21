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

		String ITEM_CD = htMethod.get("ITEM_CD");
		String SITEM_LT = htMethod.get("SITEM_LT");

		//
		if(ITEM_CD == null) { ITEM_CD = ""; }
		if(SITEM_LT == null) { SITEM_LT = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

select a.cms_item_cd item_cd, a.cms_heig_kd up_down, a.cms_kscd_cd kscd_cd,
       GetKSCD_cdToNm(a.cms_kscd_cd, b.ckd_sukn_cd) kscd_nm
  from ct_mark_sick a, ct_kscd b
 where a.cms_item_cd = :item_cd
   and a.cms_kscd_cd in (:sItem_Lt)
   and upper(a.cms_use_yn) = 'Y'
   and b.ckd_kscd_cd = a.cms_kscd_cd
   and upper(b.ckd_use_yn) = 'Y'
 order by a.cms_heig_kd, a.cms_kscd_cd

		*/

		sql = " SELECT A.CMS_ITEM_CD ITEM_CD, A.CMS_HEIG_KD UP_DOWN, A.CMS_KSCD_CD KSCD_CD, GETKSCD_CDTONM(A.CMS_KSCD_CD, B.CKD_SUKN_CD) KSCD_NM";
		sql += " FROM CT_MARK_SICK A, CT_KSCD B";
		sql += " WHERE A.CMS_ITEM_CD = '" + ITEM_CD + "'";
		sql += " AND A.CMS_KSCD_CD IN ('" + SITEM_LT + "')";
		sql += " AND UPPER(A.CMS_USE_YN) = 'Y'";
		sql += " AND B.CKD_KSCD_CD = A.CMS_KSCD_CD";
		sql += " AND UPPER(B.CKD_USE_YN) = 'Y'";
		sql += " ORDER BY A.CMS_HEIG_KD, A.CMS_KSCD_CD";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uPack_Mark_Up_SickDisplay_001 \n";
			G_INFO += "설명 : 질병검사정보 로딩 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " ITEM_CD : " + ITEM_CD + " \n";
			G_INFO += " SITEM_LT : " + SITEM_LT + " \n";
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
		<s:AttributeType name='ITEM_CD' rs:number='1' rs:writeunknown='true' rs:basetable='CT_MARK_SICK' rs:basecolumn='CMS_ITEM_CD'>
			<s:datatype dt:type='string' dt:maxLength='20' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='UP_DOWN' rs:number='2' rs:writeunknown='true' rs:basetable='CT_MARK_SICK' rs:basecolumn='CMS_HEIG_KD'>
			<s:datatype dt:type='string' dt:maxLength='2' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='KSCD_CD' rs:number='3' rs:writeunknown='true' rs:basetable='CT_MARK_SICK' rs:basecolumn='CMS_KSCD_CD'>
			<s:datatype dt:type='string' dt:maxLength='20' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='KSCD_NM' rs:number='4' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='8000'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='5' rs:rowid='true' rs:basetable='CT_MARK_SICK' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c5' rs:name='ROWID' rs:number='6' rs:rowid='true' rs:basetable='CT_KSCD' rs:basecolumn='ROWID'
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

			String ITEM_CD_T = cRsList.getString("ITEM_CD");
			String UP_DOWN_T = cRsList.getString("UP_DOWN");
			String KSCD_CD_T = cRsList.getString("KSCD_CD");
			String KSCD_NM_T = cRsList.getString("KSCD_NM");
			String ROWID_T = cRsList.getString("ROWID");
			String c5_T = cRsList.getString("c5");
%>
			<z:row
<%
			if(! ITEM_CD_T.equals("")) {
%>
		 		ITEM_CD='<%= ITEM_CD_T%>'
<%
			}

			if(! UP_DOWN_T.equals("")) {
%>
		 		UP_DOWN='<%= UP_DOWN_T%>'
<%
			}

			if(! KSCD_CD_T.equals("")) {
%>
		 		KSCD_CD='<%= KSCD_CD_T%>'
<%
			}

			if(! KSCD_NM_T.equals("")) {
%>
		 		KSCD_NM='<%= KSCD_NM_T%>'
<%
			}
%>
				ROWID='<%= cnt%>'
				c5='<%= cnt%>'
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
