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

		String DTEDTEXAM_SDT = htMethod.get("DTEDTEXAM_SDT");
		String DTEDTEXAM_EDT = htMethod.get("DTEDTEXAM_EDT");
		String MSKEDTCOMP_CD1 = htMethod.get("MSKEDTCOMP_CD1");
		String CHKBOXMAIN = htMethod.get("CHKBOXMAIN");
		String MSKEDTCOMP_CD2 = htMethod.get("MSKEDTCOMP_CD2");
		String RZCMBBOXPANJ = htMethod.get("RZCMBBOXPANJ");
		String EDTCUST_NO = htMethod.get("EDTCUST_NO");
		String EDTCHART_NO = htMethod.get("EDTCHART_NO");
		String EDTPSNL_NM = htMethod.get("EDTPSNL_NM");
		String CMBBOXPLCE_CD = htMethod.get("CMBBOXPLCE_CD");
		String CMBFAMYCD = htMethod.get("CMBFAMYCD");
		String CMBBOXSORT = htMethod.get("CMBBOXSORT");

		//
		if(DTEDTEXAM_SDT == null) { DTEDTEXAM_SDT = ""; }
		if(DTEDTEXAM_EDT == null) { DTEDTEXAM_EDT = ""; }
		if(MSKEDTCOMP_CD1 == null) { MSKEDTCOMP_CD1 = ""; }
		if(CHKBOXMAIN == null) { CHKBOXMAIN = ""; }
		if(MSKEDTCOMP_CD2 == null) { MSKEDTCOMP_CD2 = ""; }
		if(RZCMBBOXPANJ == null) { RZCMBBOXPANJ = ""; }
		if(EDTCUST_NO == null) { EDTCUST_NO = ""; }
		if(EDTCHART_NO == null) { EDTCHART_NO = ""; }
		if(EDTPSNL_NM == null) { EDTPSNL_NM = ""; }
		if(CMBBOXPLCE_CD == null) { CMBBOXPLCE_CD = ""; }
		if(CMBFAMYCD == null) { CMBFAMYCD = ""; }
		if(CMBBOXSORT == null) { CMBBOXSORT = ""; }

		// DB객체
		stmtList = connect.createStatement();

		sql = " SELECT A.EEA_EXAM_DT, A.EEA_EXAM_SQ, ICY_COMP_CD, ICY_COMP_NM, A.EEA_CUST_NO, A.EEA_PSNL_NM, A.EEA_CHART_NO, A.EEA_DEPT_NM, A.EEA_PSNL_AGE, CASE WHEN A.EEA_SEX_CD IS NULL";
		sql += " OR A.EEA_SEX_CD = '' THEN A.EEA_SEX_CD ELSE GETCOMMON_LVCDTONM('0411',A.EEA_SEX_CD,'5',1) END ICR_SEX_NM, SUBSTR(B.ICR_PENL_ID,1,6) ICR_BIRH_DT, CASE WHEN A.EEA_COMP_CD IS NULL";
		sql += " OR A.EEA_COMP_CD = '' THEN '' ELSE '[' || A.EEA_COMP_CD || ']' || C.ICY_COMP_NM END EEA_COMP_NM, D.*";
		sql += " FROM ET_EXAM_ACPT A INNER JOIN IT_CUSTOMER B";
		sql += " ON A.EEA_CUST_NO = B.ICR_CUST_NO INNER JOIN ET_JOBSTRESS_SIMPLE D";
		sql += " ON A.EEA_EXAM_DT = D.EJS_EXAM_DT";
		sql += " AND A.EEA_EXAM_SQ = D.EJS_EXAM_SQ LEFT OUTER JOIN IT_COMPANY C";
		sql += " ON A.EEA_COMP_CD = C.ICY_COMP_CD";
		sql += " WHERE A.EEA_EXAM_DT >= '" + DTEDTEXAM_SDT + "'";
		sql += " AND A.EEA_EXAM_DT <= '" + DTEDTEXAM_EDT + "'";
		sql += " AND A.EEA_ORDER_YN <> 'C'";

		if(!MSKEDTCOMP_CD1.equals("")) {
			if(CHKBOXMAIN.equals("1")) {
				sql += " AND A.EEA_COMP_CD IN '" + MSKEDTCOMP_CD2 + "'";
			}
			else {
				sql += " AND A.EEA_COMP_CD = '" + MSKEDTCOMP_CD2 + "'";
			}
		}

		if(RZCMBBOXPANJ.equals("1")) {
			sql += " AND D.EJS_PANJ_YN = 'Y'";
		}
		else if(RZCMBBOXPANJ.equals("2")) {
			sql += " AND D.EJS_PANJ_YN = 'N'";
		}

		if(!EDTCUST_NO.equals("")) {
			sql += " AND A.EEA_COMP_CD = '" + EDTCUST_NO + "'";
		}

		if(!EDTCHART_NO.equals("")) {
			sql += " AND A.EEA_CHART_NO = '" + EDTCHART_NO + "'";
		}

		if(!EDTPSNL_NM.equals("")) {
			sql += " AND A.EEA_PSNL_NM LIKE '%' || '" + EDTPSNL_NM + "' || '%'";
		}

		if(!CMBBOXPLCE_CD.equals("0")) {
			sql += " AND SUBSTR(A.EEA_PLCE_CD,1,1) = '" + CMBBOXPLCE_CD + "'";
		}

		if(!CMBFAMYCD.equals("00")) {
			sql += " AND A.EEA_FAMY_CD = '" + CMBFAMYCD + "'";
		}

		if(CMBBOXSORT.equals("0")) {
			sql += " ORDER BY A.EEA_EXAM_DT, C.ICY_COMP_NM, A.EEA_PSNL_NM";
		}
		else if(CMBBOXSORT.equals("1")) {
			sql += " ORDER BY C.ICY_COMP_NM, A.EEA_EXAM_DT, A.EEA_PSNL_NM";
		}
		else if(CMBBOXSORT.equals("2")) {
			sql += " ORDER BY C.ICY_COMP_NM, A.EEA_DEPT_NM, A.EEA_PSNL_NM";
		}
		else if(CMBBOXSORT.equals("3")) {
			sql += " ORDER BY C.ICY_COMP_NM, A.EEA_PSNL_NM";
		}
		else if(CMBBOXSORT.equals("4")) {
			sql += " ORDER BY A.EEA_PSNL_NM";
		}

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uJobStress_Simple_PM_UF_SqlSet_001 \n";
			G_INFO += "설명 : 직무스트레스(단축) 검사결과정보 로딩 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " DTEDTEXAM_SDT : " + DTEDTEXAM_SDT + " \n";
			G_INFO += " DTEDTEXAM_EDT : " + DTEDTEXAM_EDT + " \n";
			G_INFO += " MSKEDTCOMP_CD1 : " + MSKEDTCOMP_CD1 + " \n";
			G_INFO += " CHKBOXMAIN : " + CHKBOXMAIN + " \n";
			G_INFO += " MSKEDTCOMP_CD2 : " + MSKEDTCOMP_CD2 + " \n";
			G_INFO += " RZCMBBOXPANJ : " + RZCMBBOXPANJ + " \n";
			G_INFO += " EDTCUST_NO : " + EDTCUST_NO + " \n";
			G_INFO += " EDTCHART_NO : " + EDTCHART_NO + " \n";
			G_INFO += " EDTPSNL_NM : " + EDTPSNL_NM + " \n";
			G_INFO += " CMBBOXPLCE_CD : " + CMBBOXPLCE_CD + " \n";
			G_INFO += " CMBFAMYCD : " + CMBFAMYCD + " \n";
			G_INFO += " CMBBOXSORT : " + CMBBOXSORT + " \n";
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
		<s:AttributeType name='EEA_EXAM_DT' rs:number='1' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_EXAM_DT' rs:keycolumn='true'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_EXAM_SQ' rs:number='2' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_EXAM_SQ' rs:keycolumn='true'>
			<s:datatype dt:type='string' dt:maxLength='6' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_COMP_CD' rs:number='3' rs:nullable='true' rs:basetable='IT_COMPANY' rs:basecolumn='ICY_COMP_CD'
			 rs:keycolumn='true'>
			<s:datatype dt:type='string' dt:maxLength='12'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_COMP_NM' rs:number='4' rs:nullable='true' rs:basetable='IT_COMPANY' rs:basecolumn='ICY_COMP_NM'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_CUST_NO' rs:number='5' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_CUST_NO'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_PSNL_NM' rs:number='6' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_PSNL_NM'>
			<s:datatype dt:type='string' dt:maxLength='100' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_CHART_NO' rs:number='7' rs:nullable='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_CHART_NO'>
			<s:datatype dt:type='string' dt:maxLength='30'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_DEPT_NM' rs:number='8' rs:nullable='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_DEPT_NM'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_PSNL_AGE' rs:number='9' rs:nullable='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_PSNL_AGE'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='38' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_SEX_NM' rs:number='10' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_BIRH_DT' rs:number='11' rs:nullable='true' rs:basetable='IT_CUSTOMER' rs:basecolumn='ICR_BIRH_DT'>
			<s:datatype dt:type='string' dt:maxLength='12'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_COMP_NM' rs:number='12' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='114'/>
		</s:AttributeType>
		<s:AttributeType name='EJS_EXAM_DT' rs:number='13' rs:basetable='ET_JOBSTRESS_SIMPLE' rs:basecolumn='EJS_EXAM_DT'
			 rs:keycolumn='true'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EJS_EXAM_SQ' rs:number='14' rs:basetable='ET_JOBSTRESS_SIMPLE' rs:basecolumn='EJS_EXAM_SQ'
			 rs:keycolumn='true'>
			<s:datatype dt:type='string' dt:maxLength='6' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EJS_QST1_1VL' rs:number='15' rs:nullable='true' rs:basetable='ET_JOBSTRESS_SIMPLE' rs:basecolumn='EJS_QST1_1VL'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EJS_QST1_2VL' rs:number='16' rs:nullable='true' rs:basetable='ET_JOBSTRESS_SIMPLE' rs:basecolumn='EJS_QST1_2VL'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EJS_QST1_3VL' rs:number='17' rs:nullable='true' rs:basetable='ET_JOBSTRESS_SIMPLE' rs:basecolumn='EJS_QST1_3VL'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EJS_QST1_4VL' rs:number='18' rs:nullable='true' rs:basetable='ET_JOBSTRESS_SIMPLE' rs:basecolumn='EJS_QST1_4VL'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EJS_RST1_VL' rs:number='19' rs:nullable='true' rs:basetable='ET_JOBSTRESS_SIMPLE' rs:basecolumn='EJS_RST1_VL'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EJS_QST2_5VL' rs:number='20' rs:nullable='true' rs:basetable='ET_JOBSTRESS_SIMPLE' rs:basecolumn='EJS_QST2_5VL'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EJS_QST2_6VL' rs:number='21' rs:nullable='true' rs:basetable='ET_JOBSTRESS_SIMPLE' rs:basecolumn='EJS_QST2_6VL'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EJS_QST2_7VL' rs:number='22' rs:nullable='true' rs:basetable='ET_JOBSTRESS_SIMPLE' rs:basecolumn='EJS_QST2_7VL'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EJS_QST2_8VL' rs:number='23' rs:nullable='true' rs:basetable='ET_JOBSTRESS_SIMPLE' rs:basecolumn='EJS_QST2_8VL'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EJS_RST2_VL' rs:number='24' rs:nullable='true' rs:basetable='ET_JOBSTRESS_SIMPLE' rs:basecolumn='EJS_RST2_VL'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EJS_QST3_9VL' rs:number='25' rs:nullable='true' rs:basetable='ET_JOBSTRESS_SIMPLE' rs:basecolumn='EJS_QST3_9VL'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EJS_QST3_10VL' rs:number='26' rs:nullable='true' rs:basetable='ET_JOBSTRESS_SIMPLE'
			 rs:basecolumn='EJS_QST3_10VL'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EJS_QST3_11VL' rs:number='27' rs:nullable='true' rs:basetable='ET_JOBSTRESS_SIMPLE'
			 rs:basecolumn='EJS_QST3_11VL'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EJS_RST3_VL' rs:number='28' rs:nullable='true' rs:basetable='ET_JOBSTRESS_SIMPLE' rs:basecolumn='EJS_RST3_VL'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EJS_QST4_12VL' rs:number='29' rs:nullable='true' rs:basetable='ET_JOBSTRESS_SIMPLE'
			 rs:basecolumn='EJS_QST4_12VL'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EJS_QST4_13VL' rs:number='30' rs:nullable='true' rs:basetable='ET_JOBSTRESS_SIMPLE'
			 rs:basecolumn='EJS_QST4_13VL'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EJS_RST4_VL' rs:number='31' rs:nullable='true' rs:basetable='ET_JOBSTRESS_SIMPLE' rs:basecolumn='EJS_RST4_VL'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EJS_QST5_14VL' rs:number='32' rs:nullable='true' rs:basetable='ET_JOBSTRESS_SIMPLE'
			 rs:basecolumn='EJS_QST5_14VL'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EJS_QST5_15VL' rs:number='33' rs:nullable='true' rs:basetable='ET_JOBSTRESS_SIMPLE'
			 rs:basecolumn='EJS_QST5_15VL'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EJS_QST5_16VL' rs:number='34' rs:nullable='true' rs:basetable='ET_JOBSTRESS_SIMPLE'
			 rs:basecolumn='EJS_QST5_16VL'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EJS_QST5_17VL' rs:number='35' rs:nullable='true' rs:basetable='ET_JOBSTRESS_SIMPLE'
			 rs:basecolumn='EJS_QST5_17VL'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EJS_RST5_VL' rs:number='36' rs:nullable='true' rs:basetable='ET_JOBSTRESS_SIMPLE' rs:basecolumn='EJS_RST5_VL'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EJS_QST6_18VL' rs:number='37' rs:nullable='true' rs:basetable='ET_JOBSTRESS_SIMPLE'
			 rs:basecolumn='EJS_QST6_18VL'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EJS_QST6_19VL' rs:number='38' rs:nullable='true' rs:basetable='ET_JOBSTRESS_SIMPLE'
			 rs:basecolumn='EJS_QST6_19VL'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EJS_QST6_20VL' rs:number='39' rs:nullable='true' rs:basetable='ET_JOBSTRESS_SIMPLE'
			 rs:basecolumn='EJS_QST6_20VL'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EJS_RST6_VL' rs:number='40' rs:nullable='true' rs:basetable='ET_JOBSTRESS_SIMPLE' rs:basecolumn='EJS_RST6_VL'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EJS_QST7_21VL' rs:number='41' rs:nullable='true' rs:basetable='ET_JOBSTRESS_SIMPLE'
			 rs:basecolumn='EJS_QST7_21VL'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EJS_QST7_22VL' rs:number='42' rs:nullable='true' rs:basetable='ET_JOBSTRESS_SIMPLE'
			 rs:basecolumn='EJS_QST7_22VL'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EJS_QST7_23VL' rs:number='43' rs:nullable='true' rs:basetable='ET_JOBSTRESS_SIMPLE'
			 rs:basecolumn='EJS_QST7_23VL'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EJS_QST7_24VL' rs:number='44' rs:nullable='true' rs:basetable='ET_JOBSTRESS_SIMPLE'
			 rs:basecolumn='EJS_QST7_24VL'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EJS_RST7_VL' rs:number='45' rs:nullable='true' rs:basetable='ET_JOBSTRESS_SIMPLE' rs:basecolumn='EJS_RST7_VL'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EJS_RSTT_VL' rs:number='46' rs:nullable='true' rs:basetable='ET_JOBSTRESS_SIMPLE' rs:basecolumn='EJS_RSTT_VL'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EJS_RSLT_TX' rs:number='47' rs:nullable='true' rs:basetable='ET_JOBSTRESS_SIMPLE' rs:basecolumn='EJS_RSLT_TX'>
			<s:datatype dt:type='string' dt:maxLength='2000'/>
		</s:AttributeType>
		<s:AttributeType name='EJS_PANJ_DT' rs:number='48' rs:nullable='true' rs:basetable='ET_JOBSTRESS_SIMPLE' rs:basecolumn='EJS_PANJ_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EJS_DOCT_CD' rs:number='49' rs:nullable='true' rs:basetable='ET_JOBSTRESS_SIMPLE' rs:basecolumn='EJS_DOCT_CD'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='EJS_PANJ_YN' rs:number='50' rs:basetable='ET_JOBSTRESS_SIMPLE' rs:basecolumn='EJS_PANJ_YN'>
			<s:datatype dt:type='string' dt:maxLength='1' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EJS_INPT_ID' rs:number='51' rs:nullable='true' rs:basetable='ET_JOBSTRESS_SIMPLE' rs:basecolumn='EJS_INPT_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='EJS_INPT_DTT' rs:number='52' rs:nullable='true' rs:basetable='ET_JOBSTRESS_SIMPLE' rs:basecolumn='EJS_INPT_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EJS_MODI_ID' rs:number='53' rs:nullable='true' rs:basetable='ET_JOBSTRESS_SIMPLE' rs:basecolumn='EJS_MODI_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='EJS_MODI_DTT' rs:number='54' rs:nullable='true' rs:basetable='ET_JOBSTRESS_SIMPLE' rs:basecolumn='EJS_MODI_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:extends type='rs:rowbase'/>
	</s:ElementType>
</s:Schema>
		<rs:data>
<%
		int cnt = 0;
		while(cRsList.next()) {

			cnt++;

			String EEA_EXAM_DT_T = cRsList.getString("EEA_EXAM_DT");
			String EEA_EXAM_SQ_T = cRsList.getString("EEA_EXAM_SQ");
			String ICY_COMP_CD_T = cRsList.getString("ICY_COMP_CD");
			String ICY_COMP_NM_T = cRsList.getString("ICY_COMP_NM");
			String EEA_CUST_NO_T = cRsList.getString("EEA_CUST_NO");
			String EEA_PSNL_NM_T = cRsList.getString("EEA_PSNL_NM");
			String EEA_CHART_NO_T = cRsList.getString("EEA_CHART_NO");
			String EEA_DEPT_NM_T = cRsList.getString("EEA_DEPT_NM");
			String EEA_PSNL_AGE_T = cRsList.getString("EEA_PSNL_AGE");
			String ICR_SEX_NM_T = cRsList.getString("ICR_SEX_NM");
			String ICR_BIRH_DT_T = cRsList.getString("ICR_BIRH_DT");
			String EEA_COMP_NM_T = cRsList.getString("EEA_COMP_NM");
			String EJS_EXAM_DT_T = cRsList.getString("EJS_EXAM_DT");
			String EJS_EXAM_SQ_T = cRsList.getString("EJS_EXAM_SQ");
			String EJS_QST1_1VL_T = cRsList.getString("EJS_QST1_1VL");
			String EJS_QST1_2VL_T = cRsList.getString("EJS_QST1_2VL");
			String EJS_QST1_3VL_T = cRsList.getString("EJS_QST1_3VL");
			String EJS_QST1_4VL_T = cRsList.getString("EJS_QST1_4VL");
			String EJS_RST1_VL_T = cRsList.getString("EJS_RST1_VL");
			String EJS_QST2_5VL_T = cRsList.getString("EJS_QST2_5VL");
			String EJS_QST2_6VL_T = cRsList.getString("EJS_QST2_6VL");
			String EJS_QST2_7VL_T = cRsList.getString("EJS_QST2_7VL");
			String EJS_QST2_8VL_T = cRsList.getString("EJS_QST2_8VL");
			String EJS_RST2_VL_T = cRsList.getString("EJS_RST2_VL");
			String EJS_QST3_9VL_T = cRsList.getString("EJS_QST3_9VL");
			String EJS_QST3_10VL_T = cRsList.getString("EJS_QST3_10VL");
			String EJS_QST3_11VL_T = cRsList.getString("EJS_QST3_11VL");
			String EJS_RST3_VL_T = cRsList.getString("EJS_RST3_VL");
			String EJS_QST4_12VL_T = cRsList.getString("EJS_QST4_12VL");
			String EJS_QST4_13VL_T = cRsList.getString("EJS_QST4_13VL");
			String EJS_RST4_VL_T = cRsList.getString("EJS_RST4_VL");
			String EJS_QST5_14VL_T = cRsList.getString("EJS_QST5_14VL");
			String EJS_QST5_15VL_T = cRsList.getString("EJS_QST5_15VL");
			String EJS_QST5_16VL_T = cRsList.getString("EJS_QST5_16VL");
			String EJS_QST5_17VL_T = cRsList.getString("EJS_QST5_17VL");
			String EJS_RST5_VL_T = cRsList.getString("EJS_RST5_VL");
			String EJS_QST6_18VL_T = cRsList.getString("EJS_QST6_18VL");
			String EJS_QST6_19VL_T = cRsList.getString("EJS_QST6_19VL");
			String EJS_QST6_20VL_T = cRsList.getString("EJS_QST6_20VL");
			String EJS_RST6_VL_T = cRsList.getString("EJS_RST6_VL");
			String EJS_QST7_21VL_T = cRsList.getString("EJS_QST7_21VL");
			String EJS_QST7_22VL_T = cRsList.getString("EJS_QST7_22VL");
			String EJS_QST7_23VL_T = cRsList.getString("EJS_QST7_23VL");
			String EJS_QST7_24VL_T = cRsList.getString("EJS_QST7_24VL");
			String EJS_RST7_VL_T = cRsList.getString("EJS_RST7_VL");
			String EJS_RSTT_VL_T = cRsList.getString("EJS_RSTT_VL");
			String EJS_RSLT_TX_T = cRsList.getString("EJS_RSLT_TX");
			String EJS_PANJ_DT_T = cRsList.getString("EJS_PANJ_DT");
			String EJS_DOCT_CD_T = cRsList.getString("EJS_DOCT_CD");
			String EJS_PANJ_YN_T = cRsList.getString("EJS_PANJ_YN");
			String EJS_INPT_ID_T = cRsList.getString("EJS_INPT_ID");
			String EJS_INPT_DTT_T = cRsList.getDate2("EJS_INPT_DTT");
			String EJS_MODI_ID_T = cRsList.getString("EJS_MODI_ID");
			String EJS_MODI_DTT_T = cRsList.getDate2("EJS_MODI_DTT");
%>
			<z:row
<%
			if(! EEA_EXAM_DT_T.equals("")) {
%>
		 		EEA_EXAM_DT='<%= EEA_EXAM_DT_T%>'
<%
			}

			if(! EEA_EXAM_SQ_T.equals("")) {
%>
		 		EEA_EXAM_SQ='<%= EEA_EXAM_SQ_T%>'
<%
			}

			if(! ICY_COMP_CD_T.equals("")) {
%>
		 		ICY_COMP_CD='<%= ICY_COMP_CD_T%>'
<%
			}

			if(! ICY_COMP_NM_T.equals("")) {
%>
		 		ICY_COMP_NM='<%= ICY_COMP_NM_T%>'
<%
			}

			if(! EEA_CUST_NO_T.equals("")) {
%>
		 		EEA_CUST_NO='<%= EEA_CUST_NO_T%>'
<%
			}

			if(! EEA_PSNL_NM_T.equals("")) {
%>
		 		EEA_PSNL_NM='<%= EEA_PSNL_NM_T%>'
<%
			}

			if(! EEA_CHART_NO_T.equals("")) {
%>
		 		EEA_CHART_NO='<%= EEA_CHART_NO_T%>'
<%
			}

			if(! EEA_DEPT_NM_T.equals("")) {
%>
		 		EEA_DEPT_NM='<%= EEA_DEPT_NM_T%>'
<%
			}

			if(! EEA_PSNL_AGE_T.equals("")) {
%>
		 		EEA_PSNL_AGE='<%= EEA_PSNL_AGE_T%>'
<%
			}

			if(! ICR_SEX_NM_T.equals("")) {
%>
		 		ICR_SEX_NM='<%= ICR_SEX_NM_T%>'
<%
			}

			if(! ICR_BIRH_DT_T.equals("")) {
%>
		 		ICR_BIRH_DT='<%= ICR_BIRH_DT_T%>'
<%
			}

			if(! EEA_COMP_NM_T.equals("")) {
%>
		 		EEA_COMP_NM='<%= EEA_COMP_NM_T%>'
<%
			}

			if(! EJS_EXAM_DT_T.equals("")) {
%>
		 		EJS_EXAM_DT='<%= EJS_EXAM_DT_T%>'
<%
			}

			if(! EJS_EXAM_SQ_T.equals("")) {
%>
		 		EJS_EXAM_SQ='<%= EJS_EXAM_SQ_T%>'
<%
			}

			if(! EJS_QST1_1VL_T.equals("")) {
%>
		 		EJS_QST1_1VL='<%= EJS_QST1_1VL_T%>'
<%
			}

			if(! EJS_QST1_2VL_T.equals("")) {
%>
		 		EJS_QST1_2VL='<%= EJS_QST1_2VL_T%>'
<%
			}

			if(! EJS_QST1_3VL_T.equals("")) {
%>
		 		EJS_QST1_3VL='<%= EJS_QST1_3VL_T%>'
<%
			}

			if(! EJS_QST1_4VL_T.equals("")) {
%>
		 		EJS_QST1_4VL='<%= EJS_QST1_4VL_T%>'
<%
			}

			if(! EJS_RST1_VL_T.equals("")) {
%>
		 		EJS_RST1_VL='<%= EJS_RST1_VL_T%>'
<%
			}

			if(! EJS_QST2_5VL_T.equals("")) {
%>
		 		EJS_QST2_5VL='<%= EJS_QST2_5VL_T%>'
<%
			}

			if(! EJS_QST2_6VL_T.equals("")) {
%>
		 		EJS_QST2_6VL='<%= EJS_QST2_6VL_T%>'
<%
			}

			if(! EJS_QST2_7VL_T.equals("")) {
%>
		 		EJS_QST2_7VL='<%= EJS_QST2_7VL_T%>'
<%
			}

			if(! EJS_QST2_8VL_T.equals("")) {
%>
		 		EJS_QST2_8VL='<%= EJS_QST2_8VL_T%>'
<%
			}

			if(! EJS_RST2_VL_T.equals("")) {
%>
		 		EJS_RST2_VL='<%= EJS_RST2_VL_T%>'
<%
			}

			if(! EJS_QST3_9VL_T.equals("")) {
%>
		 		EJS_QST3_9VL='<%= EJS_QST3_9VL_T%>'
<%
			}

			if(! EJS_QST3_10VL_T.equals("")) {
%>
		 		EJS_QST3_10VL='<%= EJS_QST3_10VL_T%>'
<%
			}

			if(! EJS_QST3_11VL_T.equals("")) {
%>
		 		EJS_QST3_11VL='<%= EJS_QST3_11VL_T%>'
<%
			}

			if(! EJS_RST3_VL_T.equals("")) {
%>
		 		EJS_RST3_VL='<%= EJS_RST3_VL_T%>'
<%
			}

			if(! EJS_QST4_12VL_T.equals("")) {
%>
		 		EJS_QST4_12VL='<%= EJS_QST4_12VL_T%>'
<%
			}

			if(! EJS_QST4_13VL_T.equals("")) {
%>
		 		EJS_QST4_13VL='<%= EJS_QST4_13VL_T%>'
<%
			}

			if(! EJS_RST4_VL_T.equals("")) {
%>
		 		EJS_RST4_VL='<%= EJS_RST4_VL_T%>'
<%
			}

			if(! EJS_QST5_14VL_T.equals("")) {
%>
		 		EJS_QST5_14VL='<%= EJS_QST5_14VL_T%>'
<%
			}

			if(! EJS_QST5_15VL_T.equals("")) {
%>
		 		EJS_QST5_15VL='<%= EJS_QST5_15VL_T%>'
<%
			}

			if(! EJS_QST5_16VL_T.equals("")) {
%>
		 		EJS_QST5_16VL='<%= EJS_QST5_16VL_T%>'
<%
			}

			if(! EJS_QST5_17VL_T.equals("")) {
%>
		 		EJS_QST5_17VL='<%= EJS_QST5_17VL_T%>'
<%
			}

			if(! EJS_RST5_VL_T.equals("")) {
%>
		 		EJS_RST5_VL='<%= EJS_RST5_VL_T%>'
<%
			}

			if(! EJS_QST6_18VL_T.equals("")) {
%>
		 		EJS_QST6_18VL='<%= EJS_QST6_18VL_T%>'
<%
			}

			if(! EJS_QST6_19VL_T.equals("")) {
%>
		 		EJS_QST6_19VL='<%= EJS_QST6_19VL_T%>'
<%
			}

			if(! EJS_QST6_20VL_T.equals("")) {
%>
		 		EJS_QST6_20VL='<%= EJS_QST6_20VL_T%>'
<%
			}

			if(! EJS_RST6_VL_T.equals("")) {
%>
		 		EJS_RST6_VL='<%= EJS_RST6_VL_T%>'
<%
			}

			if(! EJS_QST7_21VL_T.equals("")) {
%>
		 		EJS_QST7_21VL='<%= EJS_QST7_21VL_T%>'
<%
			}

			if(! EJS_QST7_22VL_T.equals("")) {
%>
		 		EJS_QST7_22VL='<%= EJS_QST7_22VL_T%>'
<%
			}

			if(! EJS_QST7_23VL_T.equals("")) {
%>
		 		EJS_QST7_23VL='<%= EJS_QST7_23VL_T%>'
<%
			}

			if(! EJS_QST7_24VL_T.equals("")) {
%>
		 		EJS_QST7_24VL='<%= EJS_QST7_24VL_T%>'
<%
			}

			if(! EJS_RST7_VL_T.equals("")) {
%>
		 		EJS_RST7_VL='<%= EJS_RST7_VL_T%>'
<%
			}

			if(! EJS_RSTT_VL_T.equals("")) {
%>
		 		EJS_RSTT_VL='<%= EJS_RSTT_VL_T%>'
<%
			}

			if(! EJS_RSLT_TX_T.equals("")) {
%>
		 		EJS_RSLT_TX='<%= EJS_RSLT_TX_T%>'
<%
			}

			if(! EJS_PANJ_DT_T.equals("")) {
%>
		 		EJS_PANJ_DT='<%= EJS_PANJ_DT_T%>'
<%
			}

			if(! EJS_DOCT_CD_T.equals("")) {
%>
		 		EJS_DOCT_CD='<%= EJS_DOCT_CD_T%>'
<%
			}

			if(! EJS_PANJ_YN_T.equals("")) {
%>
		 		EJS_PANJ_YN='<%= EJS_PANJ_YN_T%>'
<%
			}

			if(! EJS_INPT_ID_T.equals("")) {
%>
		 		EJS_INPT_ID='<%= EJS_INPT_ID_T%>'
<%
			}

			if(! EJS_INPT_DTT_T.equals("")) {
%>
		 		EJS_INPT_DTT='<%= EJS_INPT_DTT_T%>'
<%
			}

			if(! EJS_MODI_ID_T.equals("")) {
%>
		 		EJS_MODI_ID='<%= EJS_MODI_ID_T%>'
<%
			}

			if(! EJS_MODI_DTT_T.equals("")) {
%>
		 		EJS_MODI_DTT='<%= EJS_MODI_DTT_T%>'
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
