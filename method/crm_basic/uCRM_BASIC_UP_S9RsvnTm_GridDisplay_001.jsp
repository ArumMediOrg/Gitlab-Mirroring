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

		//

		if(RSVN_DT == null) { RSVN_DT = ""; }

		// DB객체
		stmtList = connect.createStatement();

		sql = " select CDP_EMP_NO, CCN_FULL_NM ";
		sql += " 	,nvl(time_08, 0) time_08, nvl(time_09, 0) time_09 ,nvl(time_10, 0) time_10 ,nvl(time_11, 0) time_11 ";
		sql += " 	,nvl(time_12, 0) time_12, nvl(time_13, 0) time_13 ,nvl(time_14, 0) time_14 ,nvl(time_15, 0) time_15 ";
		sql += " 	,nvl(time_16, 0) time_16, nvl(time_17, 0) time_17 ";
		sql += " from ";
		sql += " (select CDP_EMP_NO, nvl(CCN_FULL_NM,' -기타') CCN_FULL_NM from CR_DOCTOR_PLAN a ";
		sql += " 		left outer join (select * from CT_COMMON where ccn_large = '0312' and ccn_level = '5') b ";
		sql += " 				on a.CDP_EMP_NO = b.ccn_small ";
		sql += " 	where CDP_PLAN_DT = '" + RSVN_DT + "' ) aa ";
		sql += " 	left outer join ";
		sql += " (select CAP_DOCTOR, ";
		sql += " 		sum(case when substring(CAP_RSVN_TM,1,2) <= '08' then 1 else 0 end) time_08, ";
		sql += " 		sum(case when substring(CAP_RSVN_TM,1,2)  = '09' then 1 else 0 end) time_09, ";
		sql += " 		sum(case when substring(CAP_RSVN_TM,1,2)  = '10' then 1 else 0 end) time_10, ";
		sql += " 		sum(case when substring(CAP_RSVN_TM,1,2)  = '11' then 1 else 0 end) time_11, ";
		sql += " 		sum(case when substring(CAP_RSVN_TM,1,2)  = '12' then 1 else 0 end) time_12, ";
		sql += " 		sum(case when substring(CAP_RSVN_TM,1,2)  = '13' then 1 else 0 end) time_13, ";
		sql += " 		sum(case when substring(CAP_RSVN_TM,1,2)  = '14' then 1 else 0 end) time_14, ";
		sql += " 		sum(case when substring(CAP_RSVN_TM,1,2)  = '15' then 1 else 0 end) time_15, ";
		sql += " 		sum(case when substring(CAP_RSVN_TM,1,2)  = '16' then 1 else 0 end) time_16, ";
		sql += " 		sum(case when substring(CAP_RSVN_TM,1,2) >= '17' then 1 else 0 end) time_17 ";
		sql += " from CR_ADVICE_PLAN ";
		sql += " where CAP_RSVN_DT = '" + RSVN_DT + "' ";
		sql += " group by CAP_DOCTOR) bb on aa.CDP_EMP_NO = bb.CAP_DOCTOR ";
		sql += " union all ";
		sql += " select CAP_DOCTOR CDP_EMP_NO, ' +기타' CCN_FULL_NM, ";
		sql += " 		sum(case when substring(CAP_RSVN_TM,1,2) <= '08' then 1 else 0 end) time_08, ";
		sql += " 		sum(case when substring(CAP_RSVN_TM,1,2)  = '09' then 1 else 0 end) time_09, ";
		sql += " 		sum(case when substring(CAP_RSVN_TM,1,2)  = '10' then 1 else 0 end) time_10, ";
		sql += " 		sum(case when substring(CAP_RSVN_TM,1,2)  = '11' then 1 else 0 end) time_11, ";
		sql += " 		sum(case when substring(CAP_RSVN_TM,1,2)  = '12' then 1 else 0 end) time_12, ";
		sql += " 		sum(case when substring(CAP_RSVN_TM,1,2)  = '13' then 1 else 0 end) time_13, ";
		sql += " 		sum(case when substring(CAP_RSVN_TM,1,2)  = '14' then 1 else 0 end) time_14, ";
		sql += " 		sum(case when substring(CAP_RSVN_TM,1,2)  = '15' then 1 else 0 end) time_15, ";
		sql += " 		sum(case when substring(CAP_RSVN_TM,1,2)  = '16' then 1 else 0 end) time_16, ";
		sql += " 		sum(case when substring(CAP_RSVN_TM,1,2) >= '17' then 1 else 0 end) time_17 ";
		sql += " from CR_ADVICE_PLAN ";
		sql += " where CAP_RSVN_DT = '" + RSVN_DT + "' ";
		sql += " and CAP_DOCTOR not in (select CDP_EMP_NO from CR_DOCTOR_PLAN where CDP_PLAN_DT = '" + RSVN_DT + "' ) ";
		sql += " group by CAP_DOCTOR ";
		sql += " order by CCN_FULL_NM desc ";


			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uCRM_BASIC_UP_S9RsvnTm_GridDisplay_001 \n";
			G_INFO += "설명 : 종검상담스케줄-시간대별상담예약통계 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";

			G_INFO += " RSVN_DT : " + RSVN_DT + " \n";
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
