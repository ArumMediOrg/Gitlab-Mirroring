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

		String OPTN_LT = htMethod.get("OPTN_LT");

		//
		if(OPTN_LT == null) { OPTN_LT = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

select epo_exam_cd||'-'||epo_pack_sq||':'||epk_pack_nm||' / 옵션번호:'||epo_optn_sq as optn_nm
  from et_pack_optn a, et_pack b 
 where a.epo_optn_lt  like '%'||:optn_lt||'%'
   and a.epo_use_yn   = 'Y'
   and b.epk_exam_cd  = a.epo_exam_cd 
   and b.epk_pack_sq  = a.epo_pack_sq 
   and b.epk_use_yn   = 'Y'
   and b.epk_pack_edt >= TO_CHAR(TO_DATE(SYSDATE), 'YYYY-MM-DD')
 order by epo_exam_cd, epo_pack_sq 
		*/

		sql = " SELECT EPO_EXAM_CD||'-'||EPO_PACK_SQ||':'||EPK_PACK_NM||' / 옵션번호:'||EPO_OPTN_SQ AS OPTN_NM";
		sql += " FROM ET_PACK_OPTN A, ET_PACK B";
		sql += " WHERE A.EPO_OPTN_LT LIKE '%" + OPTN_LT + "%'";
		sql += " AND A.EPO_USE_YN = 'Y'";
		sql += " AND B.EPK_EXAM_CD = A.EPO_EXAM_CD";
		sql += " AND B.EPK_PACK_SQ = A.EPO_PACK_SQ";
		sql += " AND B.EPK_USE_YN = 'Y'";
		sql += " AND B.EPK_PACK_EDT >= TO_CHAR(TO_DATE(SYSDATE), 'YYYY-MM-DD')";
		sql += " ORDER BY EPO_EXAM_CD, EPO_PACK_SQ";
			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uPack_Each_btnUseClick_001 \n";
			G_INFO += "설명 : 묶음정보 로딩 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " OPTN_LT : " + OPTN_LT + " \n";
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
		<s:AttributeType name='OPTN_NM' rs:number='1' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='231'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='2' rs:rowid='true' rs:basetable='ET_PACK_OPTN' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c2' rs:name='ROWID' rs:number='3' rs:rowid='true' rs:basetable='ET_PACK' rs:basecolumn='ROWID'
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

			String OPTN_NM_T = cRsList.getString("OPTN_NM");
			String ROWID_T = cRsList.getString("ROWID");
			String c2_T = cRsList.getString("c2");
%>
			<z:row
<%
			if(! OPTN_NM_T.equals("")) {
%>
		 		OPTN_NM='<%= OPTN_NM_T%>'
<%
			}
%>
				ROWID='<%= cnt%>'
				c2='<%= cnt%>'
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
