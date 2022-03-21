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

		String CK_RSVN_DT = htMethod.get("CK_RSVN_DT");
		String RSVN_DT = htMethod.get("RSVN_DT");
		String EXAM_SDT = htMethod.get("EXAM_SDT");
		String EXAM_EDT = htMethod.get("EXAM_EDT");
		String PSNL_NM = htMethod.get("PSNL_NM");
		String COMP_CD = htMethod.get("COMP_CD");
		String EXAM_CD = htMethod.get("EXAM_CD");
		String SCHED_STEP = htMethod.get("SCHED_STEP");
		String DOCTOR = htMethod.get("DOCTOR");
		String SORT = htMethod.get("SORT");

		//
		if(CK_RSVN_DT == null) { CK_RSVN_DT = ""; }
		if(RSVN_DT == null) { RSVN_DT = ""; }
		if(EXAM_SDT == null) { EXAM_SDT = ""; }
		if(EXAM_EDT == null) { EXAM_EDT = ""; }
		if(PSNL_NM == null) { PSNL_NM = ""; }
		if(COMP_CD == null) { COMP_CD = ""; }
		if(EXAM_CD == null) { EXAM_CD = ""; }
		if(SCHED_STEP == null) { SCHED_STEP = ""; }
		if(DOCTOR == null) { DOCTOR = ""; }
		if(SORT == null) { SORT = ""; }

		// DB객체
		stmtList = connect.createStatement();

		sql = " select EEA_EXAM_DT, EEA_EXAM_SQ, EEA_EXAM_CD, f_code_find('0401', substr(a.EEA_EXAM_CD || '001', 1, 5), '', '1') EXAM_NM ";
		sql += " , EEA_PSNL_NM, substr(ICR_PENL_ID,1,6) || '-' || substr(ICR_PENL_ID,7,1) ICR_PENL_ID, ICR_MOBL_NO, EEA_CUST_NO ";
		sql += " , F_COMP_FIND(a.EEA_COMP_CD) ICY_COMP_NM ";
		sql += " , F_DOCTOR_FIND('1',b.SSV_DOCTOR) SSV_DOCTOR_NM ";
		sql += " , SSV_RPT_DT ";
		sql += " , CAP_RSVN_DT, CAP_RSVN_TM, CAP_SCHED_STEP ";
		sql += " , F_DOCTOR_FIND('1',c.CAP_DOCTOR) CAP_DOCTOR_NM ";
		sql += " from Et_Exam_Acpt a ";
		sql += " left outer join ST_SYTH_VIEW b on a.EEA_EXAM_DT = b.SSV_EXAM_DT and a.EEA_EXAM_SQ = b.SSV_EXAM_SQ ";
		sql += " left outer join CR_ADVICE_PLAN c on a.EEA_EXAM_DT = c.CAP_EXAM_DT and a.EEA_EXAM_SQ = c.CAP_EXAM_SQ ";
		sql += " left outer join IT_CUSTOMER d on a.EEA_CUST_NO = d.ICR_CUST_NO ";

		if(CK_RSVN_DT.equals("1")){
			sql += " where CAP_RSVN_DT = '" + RSVN_DT + "' ";
		} else {
			sql += " where EEA_EXAM_DT between '" + EXAM_SDT + "' and '" + EXAM_EDT + "' ";

			if(!PSNL_NM.equals("")){
				sql += " AND EEA_PSNL_NM Like '%" + PSNL_NM + "%' ";
			}

			if(!COMP_CD.equals("")){
				sql += " AND EEA_COMP_CD = '" + COMP_CD + "' ";
			}

			if(!EXAM_CD.equals("")){
				sql += " AND EEA_EXAM_CD = '" + EXAM_CD + "' ";
			}

			if(!RSVN_DT.equals("")){
				sql += " AND CAP_RSVN_DT = '" + RSVN_DT + "' ";
			}

			if(!SCHED_STEP.equals("")){
				sql += " AND CAP_SCHED_STEP = '" + SCHED_STEP + "' ";
			}
			if(!DOCTOR.equals("")){
				sql += " AND CAP_DOCTOR = '" + DOCTOR + "' ";
			}
		}

		if(SORT.equals("0")){
			sql += " order by CAP_RSVN_DT, CAP_RSVN_TM ";
		} else if(SORT.equals("1")){
			sql += " order by CAP_DOCTOR ";
		} else if(SORT.equals("2")){
			sql += " order by EEA_EXAM_DT, EEA_EXAM_SQ ";
		} else if(SORT.equals("3")){
			sql += " order by EEA_PSNL_NM ";
		}



			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uSchedule_Customer_Search_UP_Main_GridDisplay_001 \n";
			G_INFO += "설명 : 수검자 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " CK_RSVN_DT : " + CK_RSVN_DT + " \n";
			G_INFO += " RSVN_DT : " + RSVN_DT + " \n";
			G_INFO += " EXAM_SDT : " + EXAM_SDT + " \n";
			G_INFO += " EXAM_EDT : " + EXAM_EDT + " \n";
			G_INFO += " PSNL_NM : " + PSNL_NM + " \n";
			G_INFO += " COMP_CD : " + COMP_CD + " \n";
			G_INFO += " EXAM_CD : " + EXAM_CD + " \n";
			G_INFO += " SCHED_STEP : " + SCHED_STEP + " \n";
			G_INFO += " DOCTOR : " + DOCTOR + " \n";
			G_INFO += " SORT : " + SORT + " \n";
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
