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

		String CBSPCL_ITEM = htMethod.get("CBSPCL_ITEM");
		String CBEXGN_CDINDEX = htMethod.get("CBEXGN_CDINDEX");
		String CBEXGN_CD = htMethod.get("CBEXGN_CD");
		String CBBLPT_CDINDEX = htMethod.get("CBBLPT_CDINDEX");
		String CBBLPT_CD = htMethod.get("CBBLPT_CD");
		String EDSRCH_IT = htMethod.get("EDSRCH_IT");

		//
		if(CBSPCL_ITEM == null) { CBSPCL_ITEM = ""; }
		if(CBEXGN_CDINDEX == null) { CBEXGN_CDINDEX = ""; }
		if(CBEXGN_CD == null) { CBEXGN_CD = ""; }
		if(CBBLPT_CDINDEX == null) { CBBLPT_CDINDEX = ""; }
		if(CBBLPT_CD == null) { CBBLPT_CD = ""; }
		if(EDSRCH_IT == null) { EDSRCH_IT = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

select ltrim(rtrim(a.iim_item_cd)) item_cd, ltrim(rtrim(a.iim_knme_nm)) item_nm, ltrim(rtrim(a.iim_snme_nm)) prnt_nm,
       a.iim_oscd_cd ocs_cd, a.iim_exgn_cd, a.iim_nitem_cd old_item
from it_item a
where upper(a.iim_use_yn) = 'Y'

if :CbSpcl_Item = '1' then
begin
      and (a.IIM_TUSE_YN = 'Y' or a.IIM_TSND_YN = 'Y')
      and NVL(a.IIM_SBCD_CD, ' ') <> ' '
end else
begin
  if :cbExgn_CdIndex <> '0' then
      and a.iim_exgn_cd = :cbExgn_Cd

  if (:cbExgn_Cd = 'B') and (:cbBlpt_CdIndex <> '0') then
      and a.iim_blpt_cd = :cbBlpt_Cd
end;

if :edSrch_It <> '' then
      and (UPPER(a.iim_knme_nm) like UPPER('%'||:edSrch_It||'%')
       or  UPPER(a.iim_enme_nm) like UPPER('%'||:edSrch_It||'%')
       or  UPPER(a.iim_snme_nm) like UPPER('%'||:edSrch_It||'%'))

order by a.iim_item_cd
		*/

		sql = " SELECT LTRIM(RTRIM(A.IIM_ITEM_CD)) ITEM_CD, LTRIM(RTRIM(A.IIM_KNME_NM)) ITEM_NM, LTRIM(RTRIM(A.IIM_SNME_NM)) PRNT_NM, A.IIM_OSCD_CD OCS_CD, A.IIM_EXGN_CD, A.IIM_NITEM_CD OLD_ITEM";
		sql += " FROM IT_ITEM A";
		sql += " WHERE UPPER(A.IIM_USE_YN) = 'Y'";

		if(CBSPCL_ITEM.equals("1")) {
			sql += " AND (A.IIM_TUSE_YN = 'Y' OR A.IIM_TSND_YN = 'Y')";
			sql += " AND NVL(A.IIM_SBCD_CD, ' ') <> ' '";
		}
		else {
			if(!CBEXGN_CDINDEX.equals("0")) {
				sql += " AND A.IIM_EXGN_CD = '" + CBEXGN_CD + "'";
			}
			
			if(CBEXGN_CD.equals("B") && !CBBLPT_CDINDEX.equals("0")) {
				sql += " AND A.IIM_BLPT_CD = '" + CBBLPT_CD + "'";
			}
		}
		
		if(!EDSRCH_IT.equals("")) {
			sql += " AND (";
			sql += "	UPPER(A.IIM_KNME_NM) LIKE UPPER('%" + EDSRCH_IT + "%')";
			sql += " 	OR UPPER(A.IIM_ENME_NM) LIKE UPPER('%" + EDSRCH_IT + "%')";
			sql += " 	OR UPPER(A.IIM_SNME_NM) LIKE UPPER('%" + EDSRCH_IT + "%')";
			sql += ")";
		}

		sql += " ORDER BY A.IIM_ITEM_CD";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uPack_Mark_Up_ExamSetting_003 \n";
			G_INFO += "설명 : 묶음검사정보 로딩 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " CBSPCL_ITEM : " + CBSPCL_ITEM + " \n";
			G_INFO += " CBEXGN_CDINDEX : " + CBEXGN_CDINDEX + " \n";
			G_INFO += " CBEXGN_CD : " + CBEXGN_CD + " \n";
			G_INFO += " CBBLPT_CDINDEX : " + CBBLPT_CDINDEX + " \n";
			G_INFO += " CBBLPT_CD : " + CBBLPT_CD + " \n";
			G_INFO += " EDSRCH_IT : " + EDSRCH_IT + " \n";
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
		<s:AttributeType name='OCS_CD' rs:number='4' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_OSCD_CD'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_EXGN_CD' rs:number='5' rs:writeunknown='true' rs:basetable='IT_ITEM' rs:basecolumn='IIM_EXGN_CD'>
			<s:datatype dt:type='string' dt:maxLength='7' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='OLD_ITEM' rs:number='6' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_NITEM_CD'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='7' rs:rowid='true' rs:basetable='IT_ITEM' rs:basecolumn='ROWID' rs:keycolumn='true'
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

			String ITEM_CD_T = cRsList.getString("ITEM_CD");
			String ITEM_NM_T = cRsList.getString("ITEM_NM");
			String PRNT_NM_T = cRsList.getString("PRNT_NM");
			String OCS_CD_T = cRsList.getString("OCS_CD");
			String IIM_EXGN_CD_T = cRsList.getString("IIM_EXGN_CD");
			String OLD_ITEM_T = cRsList.getString("OLD_ITEM");
			String ROWID_T = cRsList.getString("ROWID");
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
