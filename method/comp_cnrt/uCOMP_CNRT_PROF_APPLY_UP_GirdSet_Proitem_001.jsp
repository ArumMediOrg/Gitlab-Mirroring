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

		String EDTECP_CODE = htMethod.get("EDTECP_CODE");
		String EDTECP_SEX_CD = htMethod.get("EDTECP_SEX_CD");

		//
		if(EDTECP_CODE == null) { EDTECP_CODE = ""; }
		if(EDTECP_SEX_CD == null) { EDTECP_SEX_CD = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

Select (EPK_EXAM_CD || '-' || EPK_PACK_SQ) Exam_Cd, EPK_PACK_NM, EPK_PACK_SQ
 From ET_PACK
 Where EPK_USE_YN = 'Y'
   And EPK_EXAM_CD Like '91%'

if (:EdtECP_CODE <> '') then
begin
   And EPK_PACK_NM Like '%'||:EdtECP_CODE||'%'
end

if (:EdtECP_SEX_CD = '1') or (:EdtECP_SEX_CD = '2') then
begin
   And EPK_SEX_CD IN (:EdtECP_SEX_CD, '9')
end

Order By EPK_EXAM_CD, EPK_PACK_SQ
		*/

		sql = " SELECT (EPK_EXAM_CD || '-' || EPK_PACK_SQ) EXAM_CD, EPK_PACK_NM, EPK_PACK_SQ";
		sql += " FROM ET_PACK";
		sql += " WHERE EPK_USE_YN = 'Y'";
		sql += " AND EPK_EXAM_CD LIKE '91%'";

		if(!EDTECP_CODE.equals("")) {
			sql += " AND EPK_PACK_NM LIKE '%" + EDTECP_CODE + "%'";
		}
		
		if(EDTECP_SEX_CD.equals("1") || EDTECP_SEX_CD.equals("2")) {
			sql += " AND EPK_SEX_CD IN ('" + EDTECP_SEX_CD + "', '9')";
		}

		sql += " ORDER BY EPK_EXAM_CD, EPK_PACK_SQ";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uCOMP_CNRT_PROF_APPLY_UP_GirdSet_Proitem_001 \n";
			G_INFO += "설명 : 옵션용 기타묶음 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " EDTECP_CODE : " + EDTECP_CODE + " \n";
			G_INFO += " EDTECP_SEX_CD : " + EDTECP_SEX_CD + " \n";
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
		<s:AttributeType name='EXAM_CD' rs:number='1' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='16'/>
		</s:AttributeType>
		<s:AttributeType name='EPK_PACK_NM' rs:number='2' rs:writeunknown='true' rs:basetable='ET_PACK' rs:basecolumn='EPK_PACK_NM'>
			<s:datatype dt:type='string' dt:maxLength='200' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EPK_PACK_SQ' rs:number='3' rs:writeunknown='true' rs:basetable='ET_PACK' rs:basecolumn='EPK_PACK_SQ'>
			<s:datatype dt:type='string' dt:maxLength='5' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='4' rs:rowid='true' rs:basetable='ET_PACK' rs:basecolumn='ROWID' rs:keycolumn='true'
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

			String EXAM_CD_T = cRsList.getString("EXAM_CD");
			String EPK_PACK_NM_T = cRsList.getString("EPK_PACK_NM");
			String EPK_PACK_SQ_T = cRsList.getString("EPK_PACK_SQ");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! EXAM_CD_T.equals("")) {
%>
		 		EXAM_CD='<%= EXAM_CD_T%>'
<%
			}

			if(! EPK_PACK_NM_T.equals("")) {
%>
		 		EPK_PACK_NM='<%= EPK_PACK_NM_T%>'
<%
			}

			if(! EPK_PACK_SQ_T.equals("")) {
%>
		 		EPK_PACK_SQ='<%= EPK_PACK_SQ_T%>'
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
