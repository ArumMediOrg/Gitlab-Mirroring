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

		String CUST_NO = htMethod.get("CUST_NO");
		String EXAM_YR = htMethod.get("EXAM_YR");

		//
		if(CUST_NO == null) { CUST_NO = ""; }
		if(EXAM_YR == null) { EXAM_YR = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT EEA_EXAM_DT || '일 ' || EEA_EXAM_SQ || '번, ' ||
       F_COMP_FIND(EEA_COMP_CD) || 
       '(' || EEA_DIVI_CS || '학년 ' || EEA_CLSS_KD || '반 ' || EEA_DIVI_NO || '번)' AS SAME_NM 
  FROM ET_EXAM_ACPT 
 WHERE EEA_CUST_NO = :CUST_NO
   AND EEA_EXAM_DT LIKE :EXAM_YR || '%'
   AND EEA_EXAM_CD = '31001' 
   AND EEA_ORDER_YN <> 'C' 
 ORDER BY EEA_EXAM_DT DESC, EEA_EXAM_SQ DESC
		*/

		sql = " SELECT EEA_EXAM_DT || '일 ' || EEA_EXAM_SQ || '번, ' || F_COMP_FIND(EEA_COMP_CD) || '(' || EEA_DIVI_CS || '학년 ' || EEA_CLSS_KD || '반 ' || EEA_DIVI_NO || '번)' AS SAME_NM";
		sql += " FROM ET_EXAM_ACPT";
		sql += " WHERE EEA_CUST_NO = '" + CUST_NO + "'";
		sql += " AND EEA_EXAM_DT LIKE '" + EXAM_YR + "%'";
		sql += " AND EEA_EXAM_CD = '31001'";
		sql += " AND EEA_ORDER_YN <> 'C'";
		sql += " ORDER BY EEA_EXAM_DT DESC, EEA_EXAM_SQ DESC";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uStdt_Acpt_Up_FindHist_001 \n";
			G_INFO += "설명 : 당해연도에 학생검진 여부 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " CUST_NO : " + CUST_NO + " \n";
			G_INFO += " EXAM_YR : " + EXAM_YR + " \n";
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
		<s:AttributeType name='SAME_NM' rs:number='1' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='2' rs:rowid='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:extends type='rs:rowbase'/>
	</s:ElementType>
</s:Schema>		<rs:data>
<%
		int cnt = 0;
		while(cRsList.next()) {

			cnt++;

			String SAME_NM_T = cRsList.getString("SAME_NM");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! SAME_NM_T.equals("")) {
%>
		 		SAME_NM='<%= SAME_NM_T%>'
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
