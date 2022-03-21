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

		String PACK_NM = htMethod.get("PACK_NM");

		//
		if(PACK_NM == null) { PACK_NM = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

select epk_exam_cd||'-'||epk_pack_sq epk_pack_no, epk_pack_nm
from et_pack
where epk_exam_cd like '91100'
   and upper(epk_use_yn) = 'Y'
   And EPK_PACK_NM Like  '%'||:PACK_NM||'%'
 order by epk_exam_cd, epk_pack_sq
		*/

		sql = " SELECT EPK_EXAM_CD||'-'||EPK_PACK_SQ EPK_PACK_NO, EPK_PACK_NM";
		sql += " FROM ET_PACK";
		sql += " WHERE EPK_EXAM_CD LIKE '91100'";
		sql += " AND UPPER(EPK_USE_YN) = 'Y'";
		sql += " AND EPK_PACK_NM LIKE '%'||'" + PACK_NM + "'||'%'";
		sql += " ORDER BY EPK_EXAM_CD, EPK_PACK_SQ";
			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uSP_Health_Item_UP_ExamSearching_001 \n";
			G_INFO += "설명 : 2차검사항목 추가묶음 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " PACK_NM : " + PACK_NM + " \n";
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
		<s:AttributeType name='EPK_PACK_NO' rs:number='1' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='16'/>
		</s:AttributeType>
		<s:AttributeType name='EPK_PACK_NM' rs:number='2' rs:writeunknown='true' rs:basetable='ET_PACK' rs:basecolumn='EPK_PACK_NM'>
			<s:datatype dt:type='string' dt:maxLength='200' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='3' rs:rowid='true' rs:basetable='ET_PACK' rs:basecolumn='ROWID' rs:keycolumn='true'
			 rs:hidden='true' rs:autoincrement='true'>
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

			String EPK_PACK_NO_T = cRsList.getString("EPK_PACK_NO");
			String EPK_PACK_NM_T = cRsList.getString("EPK_PACK_NM");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! EPK_PACK_NO_T.equals("")) {
%>
		 		EPK_PACK_NO='<%= EPK_PACK_NO_T%>'
<%
			}

			if(! EPK_PACK_NM_T.equals("")) {
%>
		 		EPK_PACK_NM='<%= EPK_PACK_NM_T%>'
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
