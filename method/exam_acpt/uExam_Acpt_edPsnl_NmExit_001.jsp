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

		String EXAM_SQ = htMethod.get("EXAM_SQ");
		String ENCRT_KD = htMethod.get("ENCRT_KD");
		String EXAM_DT = htMethod.get("EXAM_DT");
		String RSVN_NO = htMethod.get("RSVN_NO");

		//
		if(EXAM_SQ == null) { EXAM_SQ = ""; }
		if(ENCRT_KD == null) { ENCRT_KD = ""; }
		if(EXAM_DT == null) { EXAM_DT = ""; }
		if(RSVN_NO == null) { RSVN_NO = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

if (:EXAM_SQ <> '') then
begin
  if (:ENCRT_KD = '1') then
    SELECT B.ICR_PID_EN AS PSNL_ID
  else if (:ENCRT_KD = '2') then
    SELECT ECHELONDB.ECL_DECRYPT(B.ICR_PID_EN) AS PSNL_ID
  else
    SELECT B.ICR_PENL_ID AS PSNL_ID;

          , A.EEA_PSNL_NM PSNL_NM 
    FROM ET_EXAM_ACPT A LEFT OUTER JOIN IT_CUSTOMER B 
      ON B.ICR_CUST_NO = A.EEA_CUST_NO 
   WHERE A.EEA_EXAM_DT = :EXAM_DT 
     AND A.EEA_EXAM_SQ = :EXAM_SQ
end
else
  SELECT RRT_PSNL_ID PSNL_ID, RRT_PSNL_NM AS PSNL_NM 
    FROM RT_RSVT 
   WHERE RRT_RSVN_NO = :RSVN_NO

		*/

		if(! EXAM_SQ.equals("")) {

			if(ENCRT_KD.equals("1")) {
				sql = " SELECT B.ICR_PID_EN AS PSNL_ID";
			} else if(ENCRT_KD.equals("2")) {
				sql = " SELECT ECL_DECRYPT(B.ICR_PID_EN) AS PSNL_ID";
			} else {
				sql = " SELECT B.ICR_PENL_ID AS PSNL_ID";
			}

			sql += " , A.EEA_PSNL_NM PSNL_NM";
			sql += " FROM ET_EXAM_ACPT A LEFT OUTER JOIN IT_CUSTOMER B";
			sql += " ON B.ICR_CUST_NO = A.EEA_CUST_NO";
			sql += " WHERE A.EEA_EXAM_DT = '" + EXAM_DT + "'";
			sql += " AND A.EEA_EXAM_SQ = '" + EXAM_SQ + "'";

		} else {

			sql = " SELECT RRT_PSNL_ID PSNL_ID, RRT_PSNL_NM AS PSNL_NM";
			sql += " FROM RT_RSVT";
			sql += " WHERE RRT_RSVN_NO = '" + RSVN_NO + "'";
		}
			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uExam_Acpt_edPsnl_NmExit_001 \n";
			G_INFO += "설명 : 접수 후 성명/주민번호 변경 여부 확인 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " EXAM_SQ : " + EXAM_SQ + " \n";
			G_INFO += " ENCRT_KD : " + ENCRT_KD + " \n";
			G_INFO += " EXAM_DT : " + EXAM_DT + " \n";
			G_INFO += " RSVN_NO : " + RSVN_NO + " \n";
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
		<s:AttributeType name='PSNL_ID' rs:number='1' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_PENL_ID'>
			<s:datatype dt:type='string' dt:maxLength='13'/>
		</s:AttributeType>
		<s:AttributeType name='PSNL_NM' rs:number='2' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_PSNL_NM'>
			<s:datatype dt:type='string' dt:maxLength='100' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='3' rs:rowid='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c3' rs:name='ROWID' rs:number='4' rs:rowid='true' rs:basetable='IT_CUSTOMER' rs:basecolumn='ROWID'
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

			String PSNL_ID_T = cRsList.getString("PSNL_ID");
			String PSNL_NM_T = cRsList.getString("PSNL_NM");
			String ROWID_T = cRsList.getString("ROWID");
			String c3_T = cRsList.getString("c3");
%>
			<z:row
<%
			if(! PSNL_ID_T.equals("")) {
%>
		 		PSNL_ID='<%= PSNL_ID_T%>'
<%
			}

			if(! PSNL_NM_T.equals("")) {
%>
		 		PSNL_NM='<%= PSNL_NM_T%>'
<%
			}
%>
				ROWID='<%= cnt%>'
<%
			if(! c3_T.equals("")) {
%>
		 		c3='<%= c3_T%>'
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
