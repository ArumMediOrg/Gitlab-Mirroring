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

	ResultSetMetaData rsmd = null;

	CRs cRsList = null;

	//
	String G_INFO = "";
	int colCnt = 0;

	try {
%>
<%@ include file="/inc_prg/connect.jsp"%>
<%
		// 전달자료
		htData = (HashMap<String, Object>)request.getAttribute("htData");
		htMethod = (HashMap<String, String>)request.getAttribute("htMethod_1");

		String RSVN_DT = htMethod.get("RSVN_DT");
		String SSQLADD = htMethod.get("SSQLADD");

		//

		if(RSVN_DT == null) { RSVN_DT = ""; }
		if(SSQLADD == null) { SSQLADD = ""; }

		// DB객체
		stmtList = connect.createStatement();


		sql = " select CAP_EXAM_DT, CAP_EXAM_SQ, CAP_RSVN_DT, CAP_RSVN_TM, CAP_SCHED_STEP, CAP_PLAN_TX, EEA_PSNL_NM, ICR_MOBL_NO, EEA_MOBL_NO ";
		sql += " 	,IAU_PENL_NM CAP_DOCTOR_NM ";
		sql += " 	,(select count(*) from CR_DOCTOR_TIME ";
        sql += " 	     where  CDT_PLAN_DT = CAP_RSVN_DT ";
        sql += " 	           and  CDT_PLAN_TM = CAP_RSVN_TM ";
        sql += " 	           and  CDT_EMP_NO = CAP_DOCTOR) PLAN_CNT ";
		sql += " from CR_ADVICE_PLAN a ";
		sql += " 	left outer join Et_Exam_Acpt b on a.CAP_EXAM_DT = b.EEA_EXAM_DT and a.CAP_EXAM_SQ = b.EEA_EXAM_SQ ";
		sql += " 		left outer join IT_CUSTOMER c on b.EEA_CUST_NO = c.ICR_CUST_NO ";
		sql += " 		left outer join IT_AUTH_USER d on a.CAP_DOCTOR = d.IAU_EMP_NO ";
		sql += " where CAP_RSVN_DT = '" + RSVN_DT + "' ";

		sql += SSQLADD;

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uCRM_BASIC_stgrdS9_RsvnTmClickCell_001 \n";
			G_INFO += "설명 : 종검상담스케줄-시간대별상담예약내역조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";

			G_INFO += " RSVN_DT : " + RSVN_DT + " \n";
			G_INFO += " SSQLADD : " + SSQLADD + " \n";
			G_INFO += "\n\n";

			G_INFO += "질의문 : " + sql + " \n";
			G_INFO += "-->";

		rsList = stmtList.executeQuery(sql);
		cRsList = new CRs(rsList);

		rsmd = rsList.getMetaData();  //Select 결과의 Metadata 가져오기.

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
<%
		for (colCnt = 1; colCnt <= rsmd.getColumnCount(); colCnt++){
			String dataType = "string";
			String maxLength = "4000";

			if (rsmd.getColumnTypeName(colCnt).equals("BLOB")){
				dataType = "bin.hex";
				maxLength = "2147483647";
				//<s:datatype dt:type='bin.hex' dt:maxLength='2147483647' rs:long='true'/>
			} else if (rsmd.getColumnTypeName(colCnt).equals("CLOB")){
				maxLength = "1073741823";
				//<s:datatype dt:type='string' dt:maxLength='1073741823' rs:long='true'/>
			}
%>
		<s:AttributeType name='<%= rsmd.getColumnName(colCnt)%>' rs:number='<%= Integer.toString(colCnt)%>' rs:writeunknown='true' rs:basetable='DUAL' rs:basecolumn='<%= rsmd.getColumnName(colCnt)%>'>
			<s:datatype dt:type='<%= dataType%>' dt:maxLength='<%= maxLength%>' <% if (! maxLength.equals("4000")) { %> rs:long='true' <% } %>/>
		</s:AttributeType>
<%
		}
%>
		<s:AttributeType name='ROWID' rs:number='<%= Integer.toString(colCnt)%>' rs:rowid='true' rs:basetable='DUAL' rs:basecolumn='ROWID'
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

			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			for (colCnt = 1; colCnt <= rsmd.getColumnCount(); colCnt++){
				String tempData = cRsList.getString(rsmd.getColumnName(colCnt));
				if(! tempData.equals("")) {
%>
		 			<%= rsmd.getColumnName(colCnt)%>='<%= tempData%>'
<%
				}
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
