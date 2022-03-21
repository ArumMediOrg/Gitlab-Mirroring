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

		String COMP_CD = htMethod.get("COMP_CD");
		String MNGT_YR = htMethod.get("MNGT_YR");
		String CUST_NM = htMethod.get("CUST_NM");
		String SRCH_KD = htMethod.get("SRCH_KD");
		String ADD_COND = htMethod.get("ADD_COND");

		//
		if(COMP_CD == null) { COMP_CD = ""; }
		if(MNGT_YR == null) { MNGT_YR = ""; }
		if(CUST_NM == null) { CUST_NM = ""; }
		if(SRCH_KD == null) { SRCH_KD = ""; }
		if(ADD_COND == null) { ADD_COND = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT ECT_CUST_NM, ECT_EXAM_DT, ECT_EXAM_SQ, ECT_RSVT_NO
  FROM ET_COMP_CNRT_CUST
 WHERE ECT_COMP_CD = :COMP_CD
   AND ECT_MNGT_YR = :MNGT_YR
   AND UPPER(ECT_USE_YN) = 'Y'
   AND ECT_CUST_NM LIKE :CUST_NM||'%'

if (:SRCH_KD = '3') then
begin
   AND ECT_CNRT_SQ = SUBSTR(:ADD_COND, 1, 2)
   AND ECT_PROF_SQ = SUBSTR(:ADD_COND, 3, 2)
end
else
begin
   AND ECT_HALF_CD = SUBSTR(:ADD_COND, 1, 1)
   AND ECT_DEPT_CD = SUBSTR(:ADD_COND, 2, 4)
end;

		*/

		sql = " SELECT ECT_CUST_NM, ECT_EXAM_DT, ECT_EXAM_SQ, ECT_RSVT_NO";
		sql += " FROM ET_COMP_CNRT_CUST";
		sql += " WHERE ECT_COMP_CD = '" + COMP_CD + "'";
		sql += " AND ECT_MNGT_YR = '" + MNGT_YR + "'";
		sql += " AND UPPER(ECT_USE_YN) = 'Y'";
		sql += " AND ECT_CUST_NM LIKE '" + CUST_NM + "%'";
		if(SRCH_KD.equals("3")) {
			sql += " AND ECT_CNRT_SQ = SUBSTR('" + ADD_COND + "', 1, 2)";
			sql += " AND ECT_PROF_SQ = SUBSTR('" + ADD_COND + "', 3, 2)";
		} else {
			sql += " AND ECT_HALF_CD = SUBSTR('" + ADD_COND + "', 1, 1)";
			sql += " AND ECT_DEPT_CD = SUBSTR('" + ADD_COND + "', 2, 4)";
		}

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uFM_AcptComm_GF_FindCnrtCust_001 \n";
			G_INFO += "설명 : 사업장 계약자 여부 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " COMP_CD : " + COMP_CD + " \n";
			G_INFO += " MNGT_YR : " + MNGT_YR + " \n";
			G_INFO += " CUST_NM : " + CUST_NM + " \n";
			G_INFO += " SRCH_KD : " + SRCH_KD + " \n";
			G_INFO += " ADD_COND : " + ADD_COND + " \n";
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
		<s:AttributeType name='ECT_CUST_NM' rs:number='1' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_CUST' rs:basecolumn='ECT_CUST_NM'>
			<s:datatype dt:type='string' dt:maxLength='100' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ECT_EXAM_DT' rs:number='2' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_CUST'
			 rs:basecolumn='ECT_EXAM_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ECT_EXAM_SQ' rs:number='3' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_CUST'
			 rs:basecolumn='ECT_EXAM_SQ'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ECT_RSVT_NO' rs:number='4' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_CUST'
			 rs:basecolumn='ECT_RSVT_NO'>
			<s:datatype dt:type='string' dt:maxLength='14'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='5' rs:rowid='true' rs:basetable='ET_COMP_CNRT_CUST' rs:basecolumn='ROWID'
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

			String ECT_CUST_NM_T = cRsList.getString("ECT_CUST_NM");
			String ECT_EXAM_DT_T = cRsList.getString("ECT_EXAM_DT");
			String ECT_EXAM_SQ_T = cRsList.getString("ECT_EXAM_SQ");
			String ECT_RSVT_NO_T = cRsList.getString("ECT_RSVT_NO");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! ECT_CUST_NM_T.equals("")) {
%>
		 		ECT_CUST_NM='<%= ECT_CUST_NM_T%>'
<%
			}

			if(! ECT_EXAM_DT_T.equals("")) {
%>
		 		ECT_EXAM_DT='<%= ECT_EXAM_DT_T%>'
<%
			}

			if(! ECT_EXAM_SQ_T.equals("")) {
%>
		 		ECT_EXAM_SQ='<%= ECT_EXAM_SQ_T%>'
<%
			}

			if(! ECT_RSVT_NO_T.equals("")) {
%>
		 		ECT_RSVT_NO='<%= ECT_RSVT_NO_T%>'
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
