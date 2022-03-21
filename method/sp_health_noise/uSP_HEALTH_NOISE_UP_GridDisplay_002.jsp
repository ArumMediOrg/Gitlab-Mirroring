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

		String MNGT_SPYM = htMethod.get("MNGT_SPYM");
		String SEXAM_DT = htMethod.get("SEXAM_DT");
		String EEXAM_DT = htMethod.get("EEXAM_DT");
		String SSQL_ADD = htMethod.get("SSQL_ADD");

		//
		if(MNGT_SPYM == null) { MNGT_SPYM = ""; }
		if(SEXAM_DT == null) { SEXAM_DT = ""; }
		if(EEXAM_DT == null) { EEXAM_DT = ""; }
		if(SSQL_ADD == null) { SSQL_ADD = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

select * from (
  Select A.SPG_EXAM_DT From ST_PANJUNG A
    Inner Join ET_EXAM_ACPT B On B.EEA_EXAM_DT = A.SPG_EXAM_DT
                             And B.EEA_EXAM_SQ = A.SPG_EXAM_SQ
                             And SUBSTRING(B.EEA_MNGT_SPYM,1,4) = :MNGT_SPYM
                             And B.EEA_ORDER_YN <> ''C''
  Where A.SPG_EXAM_DT Between :sEXAM_DT And :eEXAM_DT
  ||:sSQL_ADD
) WHERE ROWNUM = 1
		*/

		sql = " SELECT *";
		sql += " FROM ( SELECT A.SPG_EXAM_DT";
		sql += " FROM ST_PANJUNG A INNER JOIN ET_EXAM_ACPT B";
		sql += " ON B.EEA_EXAM_DT = A.SPG_EXAM_DT";
		sql += " AND B.EEA_EXAM_SQ = A.SPG_EXAM_SQ";
		sql += " AND SUBSTR(B.EEA_MNGT_SPYM,1,4) = '" + MNGT_SPYM + "'";
		sql += " AND B.EEA_ORDER_YN <> 'C'";
		sql += " WHERE A.SPG_EXAM_DT BETWEEN '" + SEXAM_DT + "'";
		sql += " AND '" + EEXAM_DT + "'";
		sql += SSQL_ADD;
		sql += " ) WHERE ROWNUM = 1";
			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uSP_HEALTH_NOISE_UP_GridDisplay_002 \n";
			G_INFO += "설명 : 소음특수건강진단 실시 완료일(사업장별) \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " MNGT_SPYM : " + MNGT_SPYM + " \n";
			G_INFO += " SEXAM_DT : " + SEXAM_DT + " \n";
			G_INFO += " EEXAM_DT : " + EEXAM_DT + " \n";
			G_INFO += " SSQL_ADD : " + SSQL_ADD + " \n";
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
		<s:AttributeType name='SPG_EXAM_DT' rs:number='1'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:extends type='rs:rowbase'/>
	</s:ElementType>
</s:Schema>
		<rs:data>
<%
		int cnt = 0;
		while(cRsList.next()) {

			cnt++;

			String SPG_EXAM_DT_T = cRsList.getString("SPG_EXAM_DT");
%>
			<z:row
<%
			if(! SPG_EXAM_DT_T.equals("")) {
%>
		 		SPG_EXAM_DT='<%= SPG_EXAM_DT_T%>'
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
