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

		String CMBSRCHTESTINDEX = htMethod.get("CMBSRCHTESTINDEX");
		String CMBSRCHTESTVALUE = htMethod.get("CMBSRCHTESTVALUE");
		String EDTPACKNM = htMethod.get("EDTPACKNM");

		//
		if(CMBSRCHTESTINDEX == null) { CMBSRCHTESTINDEX = ""; }
		if(CMBSRCHTESTVALUE == null) { CMBSRCHTESTVALUE = ""; }
		if(EDTPACKNM == null) { EDTPACKNM = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT epk_exam_cd||epk_pack_sq epk_pack_cd, epk_exam_cd, epk_pack_sq, epk_pack_nm
FROM et_pack
WHERE 1 = 1 
   AND epk_use_yn = 'Y' 
if :cmbSrchTestIndex = '1' then
   AND epk_exam_cd like :cmbSrchTestValue||'%'
		*/

		sql = " SELECT EPK_EXAM_CD||EPK_PACK_SQ EPK_PACK_CD, EPK_EXAM_CD, EPK_PACK_SQ, EPK_PACK_NM";
		sql += " FROM ET_PACK";
		sql += " WHERE 1 = 1";
		sql += " AND EPK_USE_YN = 'Y'";

		if(CMBSRCHTESTINDEX.equals("1")) {
			sql += " AND EPK_EXAM_CD LIKE '" + CMBSRCHTESTVALUE + "%' ";		
		}

		if (! EDTPACKNM.equals("")) {
			sql += " AND REPLACE(EPK_PACK_NM, ' ', '') LIKE '%" + EDTPACKNM + "%' ";
		}
  

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uMake_Excel_cmbSrchTestChange_001 \n";
			G_INFO += "설명 : 개별묶음정보 로딩 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " CMBSRCHTESTINDEX : " + CMBSRCHTESTINDEX + " \n";
			G_INFO += " CMBSRCHTESTVALUE : " + CMBSRCHTESTVALUE + " \n";
			G_INFO += " EDTPACKNM : " + EDTPACKNM + " \n"; 
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
		<s:AttributeType name='EPK_PACK_CD' rs:number='1' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='15'/>
		</s:AttributeType>
		<s:AttributeType name='EPK_EXAM_CD' rs:number='2' rs:writeunknown='true' rs:basetable='ET_PACK' rs:basecolumn='EPK_EXAM_CD'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EPK_PACK_SQ' rs:number='3' rs:writeunknown='true' rs:basetable='ET_PACK' rs:basecolumn='EPK_PACK_SQ'>
			<s:datatype dt:type='string' dt:maxLength='5' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EPK_PACK_NM' rs:number='4' rs:writeunknown='true' rs:basetable='ET_PACK' rs:basecolumn='EPK_PACK_NM'>
			<s:datatype dt:type='string' dt:maxLength='200' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='5' rs:rowid='true' rs:basetable='ET_PACK' rs:basecolumn='ROWID' rs:keycolumn='true'
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

			String EPK_PACK_CD_T = cRsList.getString("EPK_PACK_CD");
			String EPK_EXAM_CD_T = cRsList.getString("EPK_EXAM_CD");
			String EPK_PACK_SQ_T = cRsList.getString("EPK_PACK_SQ");
			String EPK_PACK_NM_T = cRsList.getString("EPK_PACK_NM");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! EPK_PACK_CD_T.equals("")) {
%>
		 		EPK_PACK_CD='<%= EPK_PACK_CD_T%>'
<%
			}

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
