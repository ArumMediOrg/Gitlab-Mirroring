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

		String RSVN_NO = htMethod.get("RSVN_NO");
		String CUST_NO = htMethod.get("CUST_NO");
		String PSNL_ID = htMethod.get("PSNL_ID");
		String PSNL_NM = htMethod.get("PSNL_NM");

		//
		if(RSVN_NO == null) { RSVN_NO = ""; }
		if(CUST_NO == null) { CUST_NO = ""; }
		if(PSNL_ID == null) { PSNL_ID = ""; }
		if(PSNL_NM == null) { PSNL_NM = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT SUBSTR(RRT_RSVN_NO, 1, 8) || '-' || SUBSTR(RRT_RSVN_NO, 9, 6) || ' : ' || RRT_PSNL_NM RSVN_NO,
       SUBSTR(RRT_PSNL_ID, 1, 6) || '-' || SUBSTR(RRT_PSNL_ID, 7, 1) || ' : ' || RRT_PSNL_NM || ' / HP : ' || F_TEL_FORMAT(RRT_MOBL_NO) RSVN_NM,
       RRT_EXAM_DT EXAM_DT
  FROM RT_RSVT
 WHERE RRT_EXAM_DT >= TO_CHAR(SYSDATE, 'YYYY-MM-DD')
   AND SUBSTR(RRT_EXAM_CD, 1, 2) <> '31'
   AND NVL(RRT_CNCL_YN, 'N') <> 'Y'

IF (:RSVN_NO <> '') THEN
   AND RRT_RSVN_NO <> :RSVN_NO

IF (:CUST_NO <> '') THEN
   AND RRT_CUST_NO = :CUST_NO
ELSE IF (:PSNL_ID <> '') THEN
   AND RRT_PSNL_ID LIKE :PSNL_ID||'%'
   AND RRT_PSNL_NM = :PSNL_NM
ELSE
   AND RRT_PSNL_NM = :PSNL_NM
		*/

		sql = " SELECT SUBSTR(RRT_RSVN_NO, 1, 8) || '-' || SUBSTR(RRT_RSVN_NO, 9, 6) || ' : ' || RRT_PSNL_NM RSVN_NO";
		sql += ", SUBSTR(RRT_PSNL_ID, 1, 6) || '-' || SUBSTR(RRT_PSNL_ID, 7, 1) || ' : ' || RRT_PSNL_NM || ' / HP : ' || F_TEL_FORMAT(RRT_MOBL_NO) RSVN_NM";
		sql += ", RRT_EXAM_DT EXAM_DT";
		sql += " FROM RT_RSVT";
		sql += " WHERE RRT_EXAM_DT >= TO_CHAR(SYSDATE, 'YYYY-MM-DD')";
		sql += " AND SUBSTR(RRT_EXAM_CD, 1, 2) <> '31'";
		sql += " AND NVL(RRT_EXAM_SQ, 'N')  = 'N' ";
		sql += " AND NVL(RRT_CNCL_YN, 'N') <> 'Y'";

		if(! RSVN_NO.equals("")) {
			sql += " AND RRT_RSVN_NO <> '" + RSVN_NO + "'";
		}
		if(! CUST_NO.equals("")) {
			sql += " AND RRT_CUST_NO = '" + CUST_NO + "'";
		} else if(! PSNL_ID.equals("")) {
			sql += " AND RRT_PSNL_ID LIKE '" + PSNL_ID + "%'";
			sql += " AND RRT_PSNL_NM = '" + PSNL_NM + "'";
		} else {
			sql += " AND RRT_PSNL_NM = '" + PSNL_NM + "'";
		}

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uRsvn_Acpt_UF_FindRsvn_001 \n";
			G_INFO += "설명 : 예약일 이후 예약 내역 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " RSVN_NO : " + RSVN_NO + " \n";
			G_INFO += " CUST_NO : " + CUST_NO + " \n";
			G_INFO += " PSNL_ID : " + PSNL_ID + " \n";
			G_INFO += " PSNL_NM : " + PSNL_NM + " \n";
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
		<s:AttributeType name='RSVN_NO' rs:number='1' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='132'/>
		</s:AttributeType>
		<s:AttributeType name='RSVN_NM' rs:number='2' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='EXAM_DT' rs:number='3' rs:writeunknown='true' rs:basetable='RT_RSVT' rs:basecolumn='RRT_EXAM_DT'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='4' rs:rowid='true' rs:basetable='RT_RSVT' rs:basecolumn='ROWID' rs:keycolumn='true'
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

			String RSVN_NO_T = cRsList.getString("RSVN_NO");
			String RSVN_NM_T = cRsList.getString("RSVN_NM");
			String EXAM_DT_T = cRsList.getString("EXAM_DT");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! RSVN_NO_T.equals("")) {
%>
		 		RSVN_NO='<%= RSVN_NO_T%>'
<%
			}

			if(! RSVN_NM_T.equals("")) {
%>
		 		RSVN_NM='<%= RSVN_NM_T%>'
<%
			}

			if(! EXAM_DT_T.equals("")) {
%>
		 		EXAM_DT='<%= EXAM_DT_T%>'
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
