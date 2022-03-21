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

		String SLT_KD = htMethod.get("SLT_KD");
		String SRCH_DTS = htMethod.get("SRCH_DTS");
		String SRCH_DTE = htMethod.get("SRCH_DTE");
		String SSQLADD = htMethod.get("SSQLADD");

		//

		if(SLT_KD == null) { SLT_KD = ""; }
		if(SRCH_DTS == null) { SRCH_DTS = ""; }
		if(SRCH_DTE == null) { SRCH_DTE = ""; }
		if(SSQLADD == null) { SSQLADD = ""; }

		// DB객체
		stmtList = connect.createStatement();

		sql = " select EEA_EXAM_DT, EEA_EXAM_SQ, EEA_EXAM_CD, (select CCN_FULL_NM FROM CT_COMMON where CCN_LARGE='0401'  AND CCN_SMALL= EEA_EXAM_CD) EXAM_NM ";
		sql += " , EEA_PSNL_NM, substr(ICR_PENL_ID,1,6)||'-'||substr(ICR_PENL_ID,7,1) ICR_PENL_ID, ICR_MOBL_NO, EEA_CUST_NO, EEA_CHART_NO ";
		sql += " , EEA_MOBL_NO, EEA_ZIP_CD, EEA_ZIP_AR || ' ' || EEA_ROAD_AR  EEA_ADDR ";
		sql += " , (select ICY_COMP_NM from IT_COMPANY where ICY_COMP_CD = EEA_COMP_CD) ICY_COMP_NM ";
		sql += " , (select IAU_PENL_NM from IT_AUTH_USER where IAU_EMP_NO = SSV_DOCTOR) SSV_DOCTOR_NM ";
		sql += " , SSV_RPT_DT ";
		sql += " , CAP_RSVN_DT, CAP_RSVN_TM, CAP_OCS_ACPTNO, CAP_PLAN_TX, CAP_DOCTOR  ";
		sql += " , SSV_CFRM_CD, case when EEA_SEX_CD = 1 then '남' else '여' end EEA_SEX_CD,  EEA_PSNL_AGE ";
		sql += " , (select ccn_full_nm from ct_common where ccn_large = '0302' and ccn_small = CAP_SCHED_STEP) CAP_SCHED_STEP ";
		sql += " , (select IAU_PENL_NM from IT_AUTH_USER where IAU_EMP_NO = CAP_DOCTOR) CAP_DOCTOR_NM ";
		sql += " , (select count(*) from CR_POST_MNG where EEA_EXAM_DT = CPM_EXAM_DT and EEA_EXAM_SQ = CPM_EXAM_SQ) POST_CNT ";
		sql += " , (select HDP_ADVI_YN from HEALTH_DIETITIAN_PANJUNG where EEA_EXAM_DT = HDP_EXAM_DT and EEA_EXAM_SQ = HDP_EXAM_SQ) HDP_ADVI_YN ";
		sql += " , (select ccn_rel from ct_common where ccn_large = '0312' and ccn_small = CAP_DOCTOR) CAP_DOCTOR_GWA ";

		if (SLT_KD.equals("Exam_Dt")) {
			sql += " from ET_EXAM_ACPT a ";
			sql += " left outer join ST_SYTH_VIEW b on a.EEA_EXAM_DT = b.SSV_EXAM_DT and a.EEA_EXAM_SQ = b.SSV_EXAM_SQ ";
			sql += " left outer join CR_ADVICE_PLAN c on a.EEA_EXAM_DT = c.CAP_EXAM_DT and a.EEA_EXAM_SQ = c.CAP_EXAM_SQ ";
			sql += " left outer join IT_CUSTOMER d on a.EEA_CUST_NO = d.ICR_CUST_NO ";
			sql += " where  1 = 1 ";
			sql += " and EEA_EXAM_DT between '" + SRCH_DTS + "' and '" + SRCH_DTE + "' ";
		} else if (SLT_KD.equals("Rsvn_Dt")) {
			sql += " from CR_ADVICE_PLAN   a ";
			sql += " 	left outer join ET_EXAM_ACPT   b on a.CAP_EXAM_DT = b.EEA_EXAM_DT and a.CAP_EXAM_SQ = b.EEA_EXAM_SQ ";
			sql += " 	left outer join ST_SYTH_VIEW   c on a.CAP_EXAM_DT = c.SSV_EXAM_DT and a.CAP_EXAM_SQ = c.SSV_EXAM_SQ ";
			sql += " 	left outer join IT_CUSTOMER   d on b.EEA_CUST_NO = d.ICR_CUST_NO ";
			sql += " where  1 = 1 ";
			sql += " and CAP_RSVN_DT between '" + SRCH_DTS + "' and '" + SRCH_DTE + "' ";
		}

		sql += SSQLADD;

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uCRM_BASIC_UP_S8Main_GridDisplay_001 \n";
			G_INFO += "설명 : 종검상담스케줄-메인조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";

			G_INFO += " SLT_KD : " + SLT_KD + " \n";
			G_INFO += " SRCH_DTS : " + SRCH_DTS + " \n";
			G_INFO += " SRCH_DTE : " + SRCH_DTE + " \n";
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
