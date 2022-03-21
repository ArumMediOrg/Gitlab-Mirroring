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

		String EDSRCH_IT = htMethod.get("EDSRCH_IT");
		String SITEM_LT = htMethod.get("SITEM_LT");

		//
		if(EDSRCH_IT == null) { EDSRCH_IT = ""; }
		if(SITEM_LT == null) { SITEM_LT = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

select DISTINCT iim_item_cd item_cd, ltrim(rtrim(iim_knme_nm)) item_nm, ltrim(rtrim(iim_snme_nm)) prnt_nm,
       iim_oscd_cd ocs_cd, iim_exgn_cd, iim_nitem_cd old_item
from et_pack_item b, it_item a
where epi_exam_cd = '21001'
      and epi_pack_sq in (select epk_pack_sq from et_pack where epk_exam_cd = '21001' and epk_use_yn = 'Y')
      and iim_item_cd = epi_item_cd

if :edSrch_It <> '' then
begin
      and (UPPER(a.iim_knme_nm) like UPPER('%'||:edSrch_It||'%')
       or  UPPER(a.iim_enme_nm) like UPPER('%'||:edSrch_It||'%')
       or  UPPER(a.iim_snme_nm) like UPPER('%'||:edSrch_It||'%'))
end;

union
select DISTINCT iim_item_cd item_cd, ltrim(rtrim(iim_knme_nm)) item_nm, ltrim(rtrim(iim_snme_nm)) prnt_nm,
       iim_oscd_cd ocs_cd, iim_exgn_cd, iim_nitem_cd old_item
from it_item
where iim_item_cd in (:sItem_Lt)
if :edSrch_It <> '' then
begin
      and (UPPER(iim_knme_nm) like UPPER('%'||:edSrch_It||'%')
       or  UPPER(iim_enme_nm) like UPPER('%'||:edSrch_It||'%')
       or  UPPER(iim_snme_nm) like UPPER('%'||:edSrch_It||'%'))
end;

order by item_cd 
		*/

		sql = " SELECT DISTINCT IIM_ITEM_CD ITEM_CD, LTRIM(RTRIM(IIM_KNME_NM)) ITEM_NM, LTRIM(RTRIM(IIM_SNME_NM)) PRNT_NM, IIM_OSCD_CD OCS_CD, IIM_EXGN_CD, IIM_NITEM_CD OLD_ITEM";
		sql += " FROM ET_PACK_ITEM B, IT_ITEM A";
		sql += " WHERE EPI_EXAM_CD = '21001'";
		sql += " AND EPI_PACK_SQ IN (SELECT EPK_PACK_SQ";
		sql += " FROM ET_PACK";
		sql += " WHERE EPK_EXAM_CD = '21001'";
		sql += " AND EPK_USE_YN = 'Y')";
		sql += " AND IIM_ITEM_CD = EPI_ITEM_CD";

		if(!EDSRCH_IT.equals("")) {
			sql += " AND (";
			sql += "	UPPER(A.IIM_KNME_NM) LIKE UPPER('%" + EDSRCH_IT + "%')";
			sql += " 	OR UPPER(A.IIM_ENME_NM) LIKE UPPER('%" + EDSRCH_IT + "%')";
			sql += " 	OR UPPER(A.IIM_SNME_NM) LIKE UPPER('%" + EDSRCH_IT + "%')";
			sql += ")";
		}

		sql += " UNION";

		sql += " SELECT DISTINCT IIM_ITEM_CD ITEM_CD, LTRIM(RTRIM(IIM_KNME_NM)) ITEM_NM, LTRIM(RTRIM(IIM_SNME_NM)) PRNT_NM, IIM_OSCD_CD OCS_CD, IIM_EXGN_CD, IIM_NITEM_CD OLD_ITEM";
		sql += " FROM IT_ITEM";
		sql += " WHERE IIM_ITEM_CD IN ('" + SITEM_LT + "')";

		if(!EDSRCH_IT.equals("")) {
			sql += " AND (";
			sql += "	UPPER(IIM_KNME_NM) LIKE UPPER('%" + EDSRCH_IT + "%')";
			sql += " 	OR UPPER(IIM_ENME_NM) LIKE UPPER('%" + EDSRCH_IT + "%')";
			sql += " 	OR UPPER(IIM_SNME_NM) LIKE UPPER('%" + EDSRCH_IT + "%')";
			sql += ")";
		}

		sql += " ORDER BY ITEM_CD";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uPack_Mark_Up_ExamSetting_002 \n";
			G_INFO += "설명 : 묶음검사정보 로딩 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " EDSRCH_IT : " + EDSRCH_IT + " \n";
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
		<s:AttributeType name='ITEM_CD' rs:number='1' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ITEM_NM' rs:number='2' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='PRNT_NM' rs:number='3' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='OCS_CD' rs:number='4' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_EXGN_CD' rs:number='5' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='7'/>
		</s:AttributeType>
		<s:AttributeType name='OLD_ITEM' rs:number='6' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:extends type='rs:rowbase'/>
	</s:ElementType>
</s:Schema>		<rs:data>
<%
		int cnt = 0;
		while(cRsList.next()) {

			cnt++;

			String ITEM_CD_T = cRsList.getString("ITEM_CD");
			String ITEM_NM_T = cRsList.getString("ITEM_NM");
			String PRNT_NM_T = cRsList.getString("PRNT_NM");
			String OCS_CD_T = cRsList.getString("OCS_CD");
			String IIM_EXGN_CD_T = cRsList.getString("IIM_EXGN_CD");
			String OLD_ITEM_T = cRsList.getString("OLD_ITEM");
%>
			<z:row
<%
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

			if(! PRNT_NM_T.equals("")) {
%>
		 		PRNT_NM='<%= PRNT_NM_T%>'
<%
			}

			if(! OCS_CD_T.equals("")) {
%>
		 		OCS_CD='<%= OCS_CD_T%>'
<%
			}

			if(! IIM_EXGN_CD_T.equals("")) {
%>
		 		IIM_EXGN_CD='<%= IIM_EXGN_CD_T%>'
<%
			}

			if(! OLD_ITEM_T.equals("")) {
%>
		 		OLD_ITEM='<%= OLD_ITEM_T%>'
<%
			}
%>
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
