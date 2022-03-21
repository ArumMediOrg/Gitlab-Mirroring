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

		String SDATE = htMethod.get("SDATE");
		String SENCT = htMethod.get("SENCT");
		String SPID = htMethod.get("SPID");

		//
		if(SDATE == null) { SDATE = ""; }
		if(SENCT == null) { SENCT = ""; }
		if(SPID == null) { SPID = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

Select QQN_EXAM_DT from QT_QUESTION A
Inner join ET_EXAM_ACPT B on B.EEA_EXAM_DT = A.QQN_EXAM_DT
                         And B.EEA_EXAM_SQ = A.QQN_EXAM_SQ
Inner Join IT_CUSTOMER C  on C.ICR_CUST_NO = B.EEA_CUST_NO
Where QQN_EXAM_DT < :SDATE
    And rownum = 1

        if (:SENCT = '1') then
          and icr_pid_en  = :SPID
        else if (:SENCT = '2') then
         and icr_pid_en  = ECHELONDB.dbo.ecl_encrypt(||:SPID||)
        else
          and icr_penl_id = :SPID

  And QQN_INPT_ID = 'WEQ'
Order by QQN_EXAM_DT desc  

		*/

		sql = " SELECT QQN_EXAM_DT";
		sql += " FROM QT_QUESTION A INNER JOIN ET_EXAM_ACPT B";
		sql += " ON B.EEA_EXAM_DT = A.QQN_EXAM_DT";
		sql += " AND B.EEA_EXAM_SQ = A.QQN_EXAM_SQ INNER JOIN IT_CUSTOMER C";
		sql += " ON C.ICR_CUST_NO = B.EEA_CUST_NO";
		sql += " WHERE QQN_EXAM_DT < '" + SDATE + "'";
		sql += " AND ROWNUM = 1";

		if(SENCT.equals("1")) {
			sql += " AND ICR_PID_EN = '" + SPID + "'";
		} else if(SENCT.equals("2")) {
			sql += " AND ICR_PID_EN = ECHELONDB.DBO.ECL_ENCRYPT('" + SPID + "')";
		} else {
			sql += " AND ICR_PENL_ID = '" + SPID + "'";
		}

		sql += " AND QQN_INPT_ID = 'WEQ'";
		sql += " ORDER BY QQN_EXAM_DT DESC";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : EQuestionaire_MunjinSave_001 \n";
			G_INFO += "설명 : 이전 문진 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " SDATE : " + SDATE + " \n";
			G_INFO += " SENCT : " + SENCT + " \n";
			G_INFO += " SPID : " + SPID + " \n";
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
		<s:AttributeType name='QQN_EXAM_DT' rs:number='1' rs:writeunknown='true' rs:basetable='QT_QUESTION' rs:basecolumn='QQN_EXAM_DT'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='2' rs:rowid='true' rs:basetable='QT_QUESTION' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c2' rs:name='ROWID' rs:number='3' rs:rowid='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='ROWID'
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

			String QQN_EXAM_DT_T = cRsList.getString("QQN_EXAM_DT");
			String ROWID_T = cRsList.getString("ROWID");
			String c2_T = cRsList.getString("c2");
			String c3_T = cRsList.getString("c3");
%>
			<z:row
<%
			if(! QQN_EXAM_DT_T.equals("")) {
%>
		 		QQN_EXAM_DT='<%= QQN_EXAM_DT_T%>'
<%
			}
%>
				ROWID='<%= cnt%>'
<%
			if(! c2_T.equals("")) {
%>
		 		c2='<%= c2_T%>'
<%
			}

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
