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

		String CBSRCH_VW = htMethod.get("CBSRCH_VW");
		String SSRCH_KD = htMethod.get("SSRCH_KD");

		//
		if(CBSRCH_VW == null) { CBSRCH_VW = ""; }
		if(SSRCH_KD == null) { SSRCH_KD = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

select epm_mark_cd, epm_mark_sq, epm_use_yn, epm_inpt_id, epm_modi_id,
       F_CODE_FIND('0905', epm_mark_cd, '', '1') as epm_mark_nm
from et_pack_mark
where epm_mark_kd = '1'

if (:cbSrch_Vw <> '전체') then
      and epm_mark_cd = :sSrch_Kd

if cbNoUse_Vw = '1' then
      and epm_use_yn = 'Y' 

order by epm_mark_cd, epm_mark_sq

		*/

		sql = " SELECT EPM_MARK_CD, EPM_MARK_SQ, EPM_USE_YN, EPM_INPT_ID, EPM_MODI_ID, F_CODE_FIND('0905', EPM_MARK_CD, '', '1') AS EPM_MARK_NM";
		sql += " FROM ET_PACK_MARK";
		sql += " WHERE EPM_MARK_KD = '1'";

		if(! CBSRCH_VW.equals("전체")) {
			sql += " AND EPM_MARK_CD = '" + SSRCH_KD + "'";
		}
		if(SSRCH_KD.equals("1")) {
			sql += " AND EPM_USE_YN = 'Y'";
		}

		sql += " ORDER BY EPM_MARK_CD, EPM_MARK_SQ";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uPack_Mark_btnSearchClick_001 \n";
			G_INFO += "설명 : 표적묶음정보 로딩 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " CBSRCH_VW : " + CBSRCH_VW + " \n";
			G_INFO += " SSRCH_KD : " + SSRCH_KD + " \n";
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
		<s:AttributeType name='EPM_MARK_CD' rs:number='1' rs:writeunknown='true' rs:basetable='ET_PACK_MARK' rs:basecolumn='EPM_MARK_CD'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EPM_MARK_SQ' rs:number='2' rs:writeunknown='true' rs:basetable='ET_PACK_MARK' rs:basecolumn='EPM_MARK_SQ'>
			<s:datatype dt:type='string' dt:maxLength='3' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EPM_USE_YN' rs:number='3' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_PACK_MARK'
			 rs:basecolumn='EPM_USE_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EPM_INPT_ID' rs:number='4' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_PACK_MARK'
			 rs:basecolumn='EPM_INPT_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='EPM_MODI_ID' rs:number='5' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_PACK_MARK'
			 rs:basecolumn='EPM_MODI_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='EPM_MARK_NM' rs:number='6' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='7' rs:rowid='true' rs:basetable='ET_PACK_MARK' rs:basecolumn='ROWID'
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

			String EPM_MARK_CD_T = cRsList.getString("EPM_MARK_CD");
			String EPM_MARK_SQ_T = cRsList.getString("EPM_MARK_SQ");
			String EPM_USE_YN_T = cRsList.getString("EPM_USE_YN");
			String EPM_INPT_ID_T = cRsList.getString("EPM_INPT_ID");
			String EPM_MODI_ID_T = cRsList.getString("EPM_MODI_ID");
			String EPM_MARK_NM_T = cRsList.getString("EPM_MARK_NM");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! EPM_MARK_CD_T.equals("")) {
%>
		 		EPM_MARK_CD='<%= EPM_MARK_CD_T%>'
<%
			}

			if(! EPM_MARK_SQ_T.equals("")) {
%>
		 		EPM_MARK_SQ='<%= EPM_MARK_SQ_T%>'
<%
			}

			if(! EPM_USE_YN_T.equals("")) {
%>
		 		EPM_USE_YN='<%= EPM_USE_YN_T%>'
<%
			}

			if(! EPM_INPT_ID_T.equals("")) {
%>
		 		EPM_INPT_ID='<%= EPM_INPT_ID_T%>'
<%
			}

			if(! EPM_MODI_ID_T.equals("")) {
%>
		 		EPM_MODI_ID='<%= EPM_MODI_ID_T%>'
<%
			}

			if(! EPM_MARK_NM_T.equals("")) {
%>
		 		EPM_MARK_NM='<%= EPM_MARK_NM_T%>'
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
