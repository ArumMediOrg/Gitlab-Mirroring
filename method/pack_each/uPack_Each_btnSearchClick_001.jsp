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

		String CBSRCH_KDYN = htMethod.get("CBSRCH_KDYN");
		String SSRCH_KD = htMethod.get("SSRCH_KD");
		String EDSRCH_NMYN = htMethod.get("EDSRCH_NMYN");
		String EDSRCH_NM = htMethod.get("EDSRCH_NM");
		String CBNOUSE = htMethod.get("CBNOUSE");

		//
		if(CBSRCH_KDYN == null) { CBSRCH_KDYN = ""; }
		if(SSRCH_KD == null) { SSRCH_KD = ""; }
		if(EDSRCH_NMYN == null) { EDSRCH_NMYN = ""; }
		if(EDSRCH_NM == null) { EDSRCH_NM = ""; }
		if(CBNOUSE == null) { CBNOUSE = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

    select epk_exam_cd, epk_pack_sq, epk_pack_nm, epk_use_yn, epk_inpt_id, epk_modi_id 
      from et_pack 
      where 1 = 1 
    if (:cbSrch_KdYN = 'Y') then
      and epk_exam_cd like :sSrch_Kd||'%'

    if (edSrch_NmYN = 'Y') then
      and epk_pack_nm like '%'||:edSrch_Nm||'%'

    if (:cbNoUse = 'Y') then
      and epk_use_yn = 'Y'

      order by epk_exam_cd, epk_pack_sq 
		*/

		sql = " SELECT EPK_EXAM_CD, EPK_PACK_SQ, EPK_PACK_NM, EPK_USE_YN, EPK_INPT_ID, EPK_MODI_ID";
		sql += " FROM ET_PACK";
		sql += " WHERE 1 = 1";

		if(CBSRCH_KDYN.equals("Y")) {
			sql += " AND EPK_EXAM_CD LIKE '" + SSRCH_KD + "%'";

		}

		if(EDSRCH_NMYN.equals("Y")) {
			sql += " AND EPK_PACK_NM LIKE '%" + EDSRCH_NM + "%' ";

		}

		if(CBNOUSE.equals("Y")) {
			sql += " AND EPK_USE_YN = 'Y'";

		}		
		sql += " ORDER BY EPK_EXAM_CD, EPK_PACK_SQ";
			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uPack_Each_btnSearchClick_001 \n";
			G_INFO += "설명 : 묶음 검색 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " CBSRCH_KDYN : " + CBSRCH_KDYN + " \n";
			G_INFO += " SSRCH_KD : " + SSRCH_KD + " \n";
			G_INFO += " EDSRCH_NMYN : " + EDSRCH_NMYN + " \n";
			G_INFO += " EDSRCH_NM : " + EDSRCH_NM + " \n";
			G_INFO += " CBNOUSE : " + CBNOUSE + " \n";
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
		<s:AttributeType name='EPK_EXAM_CD' rs:number='1' rs:writeunknown='true' rs:basetable='ET_PACK' rs:basecolumn='EPK_EXAM_CD'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EPK_PACK_SQ' rs:number='2' rs:writeunknown='true' rs:basetable='ET_PACK' rs:basecolumn='EPK_PACK_SQ'>
			<s:datatype dt:type='string' dt:maxLength='5' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EPK_PACK_NM' rs:number='3' rs:writeunknown='true' rs:basetable='ET_PACK' rs:basecolumn='EPK_PACK_NM'>
			<s:datatype dt:type='string' dt:maxLength='200' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EPK_USE_YN' rs:number='4' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_PACK'
			 rs:basecolumn='EPK_USE_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EPK_INPT_ID' rs:number='5' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_PACK'
			 rs:basecolumn='EPK_INPT_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='EPK_MODI_ID' rs:number='6' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_PACK'
			 rs:basecolumn='EPK_MODI_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='7' rs:rowid='true' rs:basetable='ET_PACK' rs:basecolumn='ROWID' rs:keycolumn='true'
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

			String EPK_EXAM_CD_T = cRsList.getString("EPK_EXAM_CD");
			String EPK_PACK_SQ_T = cRsList.getString("EPK_PACK_SQ");
			String EPK_PACK_NM_T = cRsList.getString("EPK_PACK_NM");
			String EPK_USE_YN_T = cRsList.getString("EPK_USE_YN");
			String EPK_INPT_ID_T = cRsList.getString("EPK_INPT_ID");
			String EPK_MODI_ID_T = cRsList.getString("EPK_MODI_ID");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! EPK_EXAM_CD_T.equals("")) {
%>
		 		EPK_EXAM_CD='<%= EPK_EXAM_CD_T%>'
<%
			}

			if(! EPK_PACK_SQ_T.equals("")) {
%>
		 		EPK_PACK_SQ='<%= EPK_PACK_SQ_T%>'
<%
			}

			if(! EPK_PACK_NM_T.equals("")) {
%>
		 		EPK_PACK_NM='<%= EPK_PACK_NM_T%>'
<%
			}

			if(! EPK_USE_YN_T.equals("")) {
%>
		 		EPK_USE_YN='<%= EPK_USE_YN_T%>'
<%
			}

			if(! EPK_INPT_ID_T.equals("")) {
%>
		 		EPK_INPT_ID='<%= EPK_INPT_ID_T%>'
<%
			}

			if(! EPK_MODI_ID_T.equals("")) {
%>
		 		EPK_MODI_ID='<%= EPK_MODI_ID_T%>'
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
