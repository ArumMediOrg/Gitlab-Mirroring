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

		String COMP_CD1 = htMethod.get("COMP_CD1");
		String MNGT_YR1 = htMethod.get("MNGT_YR1");
		String CNRT_SQ1 = htMethod.get("CNRT_SQ1");
		String PROF_SQ1 = htMethod.get("PROF_SQ1");
		String COMP_CD2 = htMethod.get("COMP_CD2");
		String MNGT_YR2 = htMethod.get("MNGT_YR2");
		String CNRT_SQ2 = htMethod.get("CNRT_SQ2");
		String PROF_SQ2 = htMethod.get("PROF_SQ2");

		//
		if(COMP_CD1 == null) { COMP_CD1 = ""; }
		if(MNGT_YR1 == null) { MNGT_YR1 = ""; }
		if(CNRT_SQ1 == null) { CNRT_SQ1 = ""; }
		if(PROF_SQ1 == null) { PROF_SQ1 = ""; }
		if(COMP_CD2 == null) { COMP_CD2 = ""; }
		if(MNGT_YR2 == null) { MNGT_YR2 = ""; }
		if(CNRT_SQ2 == null) { CNRT_SQ2 = ""; }
		if(PROF_SQ2 == null) { PROF_SQ2 = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT '1' AS YH, ECO_OPTN_SQ, ECO_OPTN_LT FROM ET_COMP_CNRT_OPTN
WHERE ECO_COMP_CD = :COMP_CD1
  AND ECO_MNGT_YR = :MNGT_YR1
  AND ECO_CNRT_SQ = :CNRT_SQ1
  AND ECO_PROF_SQ = :PROF_SQ1
UNION
SELECT '2' AS YH, ECO_OPTN_SQ, ECO_OPTN_LT FROM ET_COMP_CNRT_OPTN
WHERE ECO_COMP_CD = :COMP_CD2
  AND ECO_MNGT_YR = :MNGT_YR2
  AND ECO_CNRT_SQ = :CNRT_SQ2
  AND ECO_PROF_SQ = :PROF_SQ2
		*/

		sql = " SELECT '1' AS YH, ECO_OPTN_SQ, ECO_OPTN_LT";
		sql += " FROM ET_COMP_CNRT_OPTN";
		sql += " WHERE ECO_COMP_CD = '" + COMP_CD1 + "'";
		sql += " AND ECO_MNGT_YR = '" + MNGT_YR1 + "'";
		sql += " AND ECO_CNRT_SQ = '" + CNRT_SQ1 + "'";
		sql += " AND ECO_PROF_SQ = '" + PROF_SQ1 + "'";

		sql += " UNION";

		sql += " SELECT '2' AS YH, ECO_OPTN_SQ, ECO_OPTN_LT";
		sql += " FROM ET_COMP_CNRT_OPTN";
		sql += " WHERE ECO_COMP_CD = '" + COMP_CD2 + "'";
		sql += " AND ECO_MNGT_YR = '" + MNGT_YR2 + "'";
		sql += " AND ECO_CNRT_SQ = '" + CNRT_SQ2 + "'";
		sql += " AND ECO_PROF_SQ = '" + PROF_SQ2 + "'";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uCOMP_CNRT_PROF_CMPR_UP_GridDisplay_002 \n";
			G_INFO += "설명 : 검진유형별 옵션항목리스트 조회(비교대상1,2) \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " COMP_CD1 : " + COMP_CD1 + " \n";
			G_INFO += " MNGT_YR1 : " + MNGT_YR1 + " \n";
			G_INFO += " CNRT_SQ1 : " + CNRT_SQ1 + " \n";
			G_INFO += " PROF_SQ1 : " + PROF_SQ1 + " \n";
			G_INFO += " COMP_CD2 : " + COMP_CD2 + " \n";
			G_INFO += " MNGT_YR2 : " + MNGT_YR2 + " \n";
			G_INFO += " CNRT_SQ2 : " + CNRT_SQ2 + " \n";
			G_INFO += " PROF_SQ2 : " + PROF_SQ2 + " \n";
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
		<s:AttributeType name='YH' rs:number='1' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ECO_OPTN_SQ' rs:number='2' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_OPTN'
			 rs:basecolumn='ECO_OPTN_SQ'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='ECO_OPTN_LT' rs:number='3' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_OPTN'
			 rs:basecolumn='ECO_OPTN_LT'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:extends type='rs:rowbase'/>
	</s:ElementType>
</s:Schema>		<rs:data>
<%
		int cnt = 0;
		while(cRsList.next()) {

			cnt++;

			String YH_T = cRsList.getString("YH");
			String ECO_OPTN_SQ_T = cRsList.getString("ECO_OPTN_SQ");
			String ECO_OPTN_LT_T = cRsList.getString("ECO_OPTN_LT");
%>
			<z:row
<%
			if(! YH_T.equals("")) {
%>
		 		YH='<%= YH_T%>'
<%
			}

			if(! ECO_OPTN_SQ_T.equals("")) {
%>
		 		ECO_OPTN_SQ='<%= ECO_OPTN_SQ_T%>'
<%
			}

			if(! ECO_OPTN_LT_T.equals("")) {
%>
		 		ECO_OPTN_LT='<%= ECO_OPTN_LT_T%>'
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
