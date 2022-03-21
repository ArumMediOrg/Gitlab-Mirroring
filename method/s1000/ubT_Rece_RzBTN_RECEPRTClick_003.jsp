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

		String CHBXPNT_GROUP = htMethod.get("CHBXPNT_GROUP");
		String CHBXCUST_NO = htMethod.get("CHBXCUST_NO");
		String CHBXRETRUN_PR = htMethod.get("CHBXRETRUN_PR");
		String RECE_NO = htMethod.get("RECE_NO");
		String RECE_SEQ = htMethod.get("RECE_SEQ");

		//
		if(CHBXPNT_GROUP == null) { CHBXPNT_GROUP = ""; }
		if(CHBXCUST_NO == null) { CHBXCUST_NO = ""; }
		if(CHBXRETRUN_PR == null) { CHBXRETRUN_PR = ""; }
		if(RECE_NO == null) { RECE_NO = ""; }
		if(RECE_SEQ == null) { RECE_SEQ = ""; }

		// DB객체
		stmtList = connect.createStatement();


		if(CHBXPNT_GROUP.equals("Y")) {		// 수납건별 영수증 출력
			sql = " SELECT RRM_RECE_NO, RRM_RECE_SEQ, RRM_PAY_KD, RRM_OCCU_KD,";
		} else {
			sql = " SELECT RRM_RECE_NO, RRM_OCCU_KD,";
		}

		sql += " CASE WHEN RRM_OCCU_KD = '20'";

		if(CHBXCUST_NO.equals("Y")) {		// 검진고객번호사용 체크시 <= 수납영수증 기본 고객번호에서 챠트번호로 출력되게 변경
			sql += " THEN MAX(EEA_CUST_NO) ELSE MAX(RRM_CUST_NO) END RRM_CUST_NO,";
		} else {
			sql += " THEN MAX(CASE WHEN EEA_CHART_NO IS NULL";
			sql += " OR EEA_CHART_NO = '' THEN EEA_CUST_NO ELSE EEA_CHART_NO END) ELSE MAX(RRM_CUST_NO) END RRM_CUST_NO,";
		}

		sql += " (SELECT MAX(EEA_EXAM_DT)";
		sql += " FROM ET_EXAM_ACPT";
		sql += " WHERE EEA_RECE_NO = RRM_RECE_NO) EEA_EXAM_DT, RRM_CUST_NM, RRM_RECE_DT, MAX(IAU_PENL_NM) IAU_PENL_NM, MAX(RRM_CHARGE_PR) RRM_CHARGE_PR, SUM(SUM_AMT) SUM_AMT, SUM(SALEAMT) SALEAMT,";

		if(CHBXRETRUN_PR.equals("Y")) {		// 환불금액 제외 수납금액 산출

			if(CHBXPNT_GROUP.equals("Y")) {

				sql += " SUM(CARDAMT) - NVL(CASE WHEN RRM_PAY_KD='01' THEN (SELECT SUM(RRM_RETURN_PR)";
				sql += " FROM RT_RECE_MEDICHK A";
				sql += " WHERE A.RRM_RECE_NO = FFF.RRM_RECE_NO";
				sql += " AND A.RRM_RETURN_RECE_SEQ = FFF.RRM_RECE_SEQ) ELSE 0 END,0) CARDAMT, SUM(CASHAMT) - NVL(CASE WHEN RRM_PAY_KD in ('02','04') THEN (SELECT SUM(RRM_RETURN_PR)";
				sql += " FROM RT_RECE_MEDICHK A";
				sql += " WHERE A.RRM_RECE_NO = FFF.RRM_RECE_NO";
				sql += " AND A.RRM_RETURN_RECE_SEQ = FFF.RRM_RECE_SEQ) ELSE 0 END,0) CASHAMT, SUM(CASREAMT) - NVL(CASE WHEN RRM_PAY_KD='03' THEN (SELECT SUM(RRM_RETURN_PR)";
				sql += " FROM RT_RECE_MEDICHK A";
				sql += " WHERE A.RRM_RECE_NO = FFF.RRM_RECE_NO";
				sql += " AND A.RRM_RETURN_RECE_SEQ = FFF.RRM_RECE_SEQ) ELSE 0 END,0) CASREAMT,";
				sql += " SUM(OTHERAMT) - NVL(CASE WHEN RRM_PAY_KD not in ('01','02','03','04')  THEN (select SUM(RRM_RETURN_PR) from RT_RECE_MEDICHK a where a.RRM_RECE_NO = FFF.RRM_RECE_NO and a.RRM_RETURN_RECE_SEQ = FFF.RRM_RECE_SEQ) else 0 END,0)  OTHERAMT, ";
			} else {
				sql += " SUM(CARDAMT) CARDAMT, SUM(CASREAMT) CASREAMT, SUM(CASHAMT) CASHAMT,";
			}
		} else {
			sql += " SUM(CARDAMT) CARDAMT, SUM(CASREAMT) CASREAMT, SUM(CASHAMT) CASHAMT,";
		}

		sql += " (select SUM(RRM_RESER_PR) from RT_RECE_MEDICHK a where a.RRM_RECE_NO = FFF.RRM_RECE_NO and a.RRM_OCCU_KD = '10')  SUM_RECE_PR, ";
     	sql += " (select SUM(RRM_RETURN_PR) from RT_RECE_MEDICHK a where a.RRM_RECE_NO = FFF.RRM_RECE_NO and a.RRM_OCCU_KD = '73')  SUM_RETURN_PR, ";
		sql += " MAX(CARD_NM) CARD_NM, MAX(CARD_APPRNO) CARD_APPRNO, MAX(CARDNO) CARDNO, MAX(CASHNO) CASHNO, MAX(RRM_PRINT_CNT) RRM_PRINT_CNT";
		sql += " FROM (SELECT RRM_RECE_NO, RRM_RECE_SEQ, RRM_PAY_KD, RRM_CUST_NO, RRM_OCCU_KD, RRM_CUST_NM, RRM_RECE_DT, RRM_CHARGE_PR, IAU_PENL_NM, ";
		sql += " CASE WHEN RRM_PAY_KD = '01' THEN RRM_RESER_PR ELSE 0 END CARDAMT, ";
		sql += " CASE WHEN RRM_PAY_KD IN ('02','04') THEN RRM_RESER_PR ELSE 0 END CASHAMT, ";
		sql += " CASE WHEN RRM_PAY_KD = '03' THEN RRM_RESER_PR ELSE 0 END CASREAMT, ";
		sql += " CASE WHEN RRM_PAY_KD not in ('01','02','03','04') THEN RRM_RESER_PR ELSE 0 END OTHERAMT, ";
		sql += " CASE WHEN RRM_PAY_KD = '01' THEN CARD_NM END CARD_NM, ";
		sql += " CASE WHEN RRM_PAY_KD in ('01','03') THEN RRM_APPR_NO END CARD_APPRNO, ";
		sql += " CASE WHEN RRM_PAY_KD = '01' THEN RRM_CARD_NO END CARDNO, ";
		sql += " CASE WHEN RRM_PAY_KD in ('03','04') THEN RRM_CARD_NO END CASHNO, ";
		sql += " (RRM_SALE_PR+RRM_TRUNC_PR) SALEAMT, ";
		sql += " RRM_CHARGE_PR-(RRM_SALE_PR + RRM_TRUNC_PR) SUM_AMT, RRM_PRINT_CNT, EEA_CHART_NO, EEA_CUST_NO, RRM_RETURN_PR";
		sql += " FROM (SELECT RRM_RECE_NO, RRM_RECE_SEQ, RRM_CUST_NO, RRM_OCCU_KD, RRM_CUST_NM, RRM_RECE_DT, RRM_CHARGE_PR, IAU_PENL_NM, RRM_PAY_KD, RRM_PRINT_CNT, (SELECT CCN_FULL_NM";
		sql += " FROM CT_COMMON";
		sql += " WHERE A.RRM_PAY_KD = CCN_SMALL";
		sql += " AND CCN_LARGE = '0920' ) RMH_PAYM_NM, (SELECT CCN_FULL_NM";
		sql += " FROM CT_COMMON";
		sql += " WHERE A.RRM_ISSUE_CD = CCN_SMALL";
		sql += " AND CCN_LARGE = '0923' ) CARD_NM, RRM_SALE_PR, RRM_TRUNC_PR, RRM_APPR_NO, RRM_ISSUE_CD,RRM_RESER_PR,RRM_CARD_NO, EEA_CHART_NO, EEA_CUST_NO, RRM_RETURN_PR";
		sql += " FROM RT_RECE_MEDICHK A LEFT OUTER JOIN ET_EXAM_ACPT B";
		sql += " ON A.RRM_RECE_NO = B.EEA_RECE_NO LEFT OUTER JOIN IT_AUTH_USER C";
		sql += " ON A.RRM_INPUT_ID = C.IAU_EMP_NO";
		sql += " WHERE RRM_RECE_NO = '" + RECE_NO + "'";
		sql += " AND RRM_RESER_PR > 0 ";

		if(CHBXPNT_GROUP.equals("Y")) {

			sql += " AND RRM_RECE_SEQ = '" + RECE_SEQ + "' ";
		}

		sql += "   ) FF ";
		sql += " ) FFF";

		if(CHBXPNT_GROUP.equals("Y")) {
			sql += " GROUP BY RRM_RECE_NO, RRM_RECE_SEQ, RRM_PAY_KD, RRM_OCCU_KD, RRM_CUST_NM, RRM_RECE_DT, CARD_APPRNO";
		} else {
			sql += " GROUP BY RRM_RECE_NO, RRM_OCCU_KD, RRM_CUST_NM, RRM_RECE_DT, CARD_APPRNO";
		}
			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : ubT_Rece_RzBTN_RECEPRTClick_003 \n";
			G_INFO += "설명 : 영수증인쇄(출력정보조회) \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " CHBXPNT_GROUP : " + CHBXPNT_GROUP + " \n";
			G_INFO += " CHBXCUST_NO : " + CHBXCUST_NO + " \n";
			G_INFO += " CHBXRETRUN_PR : " + CHBXRETRUN_PR + " \n";
			G_INFO += " RECE_NO : " + RECE_NO + " \n";
			G_INFO += " RECE_SEQ : " + RECE_SEQ + " \n";
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
		<s:AttributeType name='RRM_RECE_NO' rs:number='1'>
			<s:datatype dt:type='string' dt:maxLength='14' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='RRM_OCCU_KD' rs:number='2' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='RRM_CUST_NO' rs:number='3' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='12'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_EXAM_DT' rs:number='4' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='RRM_CUST_NM' rs:number='5' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='RRM_RECE_DT' rs:number='6' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_PENL_NM' rs:number='7' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='RRM_CHARGE_PR' rs:number='8' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='SUM_AMT' rs:number='9' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='SALEAMT' rs:number='10' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='CARDAMT' rs:number='11' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='CASREAMT' rs:number='12' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='CASHAMT' rs:number='13' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='CARD_NM' rs:number='14' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='300'/>
		</s:AttributeType>
		<s:AttributeType name='CARD_APPRNO' rs:number='15' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='CARDNO' rs:number='16' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='40'/>
		</s:AttributeType>
		<s:AttributeType name='CASHNO' rs:number='17' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='40'/>
		</s:AttributeType>
		<s:AttributeType name='RRM_PRINT_CNT' rs:number='18' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:extends type='rs:rowbase'/>
	</s:ElementType>
</s:Schema>
		<rs:data>
<%
		int cnt = 0;
		while(cRsList.next()) {

			cnt++;

			String RRM_RECE_NO_T = cRsList.getString("RRM_RECE_NO");
			String RRM_OCCU_KD_T = cRsList.getString("RRM_OCCU_KD");
			String RRM_CUST_NO_T = cRsList.getString("RRM_CUST_NO");
			String EEA_EXAM_DT_T = cRsList.getString("EEA_EXAM_DT");
			String RRM_CUST_NM_T = cRsList.getString("RRM_CUST_NM");
			String RRM_RECE_DT_T = cRsList.getString("RRM_RECE_DT");
			String IAU_PENL_NM_T = cRsList.getString("IAU_PENL_NM");
			String RRM_CHARGE_PR_T = cRsList.getString("RRM_CHARGE_PR");
			String SUM_AMT_T = cRsList.getString("SUM_AMT");
			String SALEAMT_T = cRsList.getString("SALEAMT");
			String CARDAMT_T = cRsList.getString("CARDAMT");
			String CASREAMT_T = cRsList.getString("CASREAMT");
			String CASHAMT_T = cRsList.getString("CASHAMT");
			String CARD_NM_T = cRsList.getString("CARD_NM");
			String CARD_APPRNO_T = cRsList.getString("CARD_APPRNO");
			String CARDNO_T = cRsList.getString("CARDNO");
			String CASHNO_T = cRsList.getString("CASHNO");
			String RRM_PRINT_CNT_T = cRsList.getString("RRM_PRINT_CNT");
%>
			<z:row
<%
			if(! RRM_RECE_NO_T.equals("")) {
%>
		 		RRM_RECE_NO='<%= RRM_RECE_NO_T%>'
<%
			}

			if(! RRM_OCCU_KD_T.equals("")) {
%>
		 		RRM_OCCU_KD='<%= RRM_OCCU_KD_T%>'
<%
			}

			if(! RRM_CUST_NO_T.equals("")) {
%>
		 		RRM_CUST_NO='<%= RRM_CUST_NO_T%>'
<%
			}

			if(! EEA_EXAM_DT_T.equals("")) {
%>
		 		EEA_EXAM_DT='<%= EEA_EXAM_DT_T%>'
<%
			}

			if(! RRM_CUST_NM_T.equals("")) {
%>
		 		RRM_CUST_NM='<%= RRM_CUST_NM_T%>'
<%
			}

			if(! RRM_RECE_DT_T.equals("")) {
%>
		 		RRM_RECE_DT='<%= RRM_RECE_DT_T%>'
<%
			}

			if(! IAU_PENL_NM_T.equals("")) {
%>
		 		IAU_PENL_NM='<%= IAU_PENL_NM_T%>'
<%
			}

			if(! RRM_CHARGE_PR_T.equals("")) {
%>
		 		RRM_CHARGE_PR='<%= RRM_CHARGE_PR_T%>'
<%
			}

			if(! SUM_AMT_T.equals("")) {
%>
		 		SUM_AMT='<%= SUM_AMT_T%>'
<%
			}

			if(! SALEAMT_T.equals("")) {
%>
		 		SALEAMT='<%= SALEAMT_T%>'
<%
			}

			if(! CARDAMT_T.equals("")) {
%>
		 		CARDAMT='<%= CARDAMT_T%>'
<%
			}

			if(! CASREAMT_T.equals("")) {
%>
		 		CASREAMT='<%= CASREAMT_T%>'
<%
			}

			if(! CASHAMT_T.equals("")) {
%>
		 		CASHAMT='<%= CASHAMT_T%>'
<%
			}

			if(! CARD_NM_T.equals("")) {
%>
		 		CARD_NM='<%= CARD_NM_T%>'
<%
			}

			if(! CARD_APPRNO_T.equals("")) {
%>
		 		CARD_APPRNO='<%= CARD_APPRNO_T%>'
<%
			}

			if(! CARDNO_T.equals("")) {
%>
		 		CARDNO='<%= CARDNO_T%>'
<%
			}

			if(! CASHNO_T.equals("")) {
%>
		 		CASHNO='<%= CASHNO_T%>'
<%
			}

			if(! RRM_PRINT_CNT_T.equals("")) {
%>
		 		RRM_PRINT_CNT='<%= RRM_PRINT_CNT_T%>'
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
