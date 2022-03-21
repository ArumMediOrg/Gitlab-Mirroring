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

	ResultSetMetaData rsmd = null;
	int colCnt = 0;

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


		if(CHBXPNT_GROUP.equals("Y")){
			sql = " SELECT RRM_RECE_NO, RRM_RECE_SEQ, RRM_PAY_KD, RRM_OCCU_KD, ";
		} else {
			sql = " SELECT RRM_RECE_NO, RRM_OCCU_KD, ";
		}

		sql += " CASE WHEN RRM_OCCU_KD = '20' ";;

		if(CHBXCUST_NO.equals("Y")){
			sql += " THEN MAX(EEA_CUST_NO)  ELSE MAX(RRM_CUST_NO) END RRM_CUST_NO, ";
		} else {
			sql += " THEN MAX(case when EEA_CHART_NO IS NULL OR EEA_CHART_NO = '' then EEA_CUST_NO else EEA_CHART_NO end) ELSE MAX(RRM_CUST_NO)  END RRM_CUST_NO, ";
		}

		sql += " (select MAX(BBC_BILL_DT) from BT_BILL_COMP where BBC_RECE_NO = RRM_RECE_NO) EEA_EXAM_DT, ";
		sql += " RRM_CUST_NM,   RRM_RECE_DT, MAX(IAU_PENL_NM) IAU_PENL_NM, ";
		sql += " MAX(RRM_CHARGE_PR) RRM_CHARGE_PR, SUM(SUM_AMT) SUM_AMT,     SUM(SALEAMT) SALEAMT, ";

		if(CHBXRETRUN_PR.equals("Y")){
			if(CHBXPNT_GROUP.equals("Y")){
				sql += " SUM(CARDAMT)  - NVL(CASE WHEN RRM_PAY_KD='01' THEN (select SUM(RRM_RETURN_PR) from RT_RECE_MEDICHK a where a.RRM_RECE_NO = FFF.RRM_RECE_NO and a.RRM_RETURN_RECE_SEQ = FFF.RRM_RECE_SEQ) else 0 END,0)  CARDAMT, ";
				sql += " SUM(CASHAMT)  - NVL(CASE WHEN RRM_PAY_KD='02' THEN (select SUM(RRM_RETURN_PR) from RT_RECE_MEDICHK a where a.RRM_RECE_NO = FFF.RRM_RECE_NO and a.RRM_RETURN_RECE_SEQ = FFF.RRM_RECE_SEQ) else 0 END,0)  CASHAMT, ";
				sql += " SUM(CASREAMT) - NVL(CASE WHEN RRM_PAY_KD='03' THEN (select SUM(RRM_RETURN_PR) from RT_RECE_MEDICHK a where a.RRM_RECE_NO = FFF.RRM_RECE_NO and a.RRM_RETURN_RECE_SEQ = FFF.RRM_RECE_SEQ) else 0 END,0)  CASREAMT, ";
			}
			else {
				sql += " sum(CARDAMT) CARDAMT,  sum(CASREAMT) CASREAMT, sum(CASHAMT) CASHAMT, ";
			}
		}
		else {
			sql += " SUM(CARDAMT) CARDAMT, SUM(CASREAMT) CASREAMT, SUM(CASHAMT) CASHAMT, ";
		}

		sql += " 	MAX(CARD_NM) CARD_NM, ";
		sql += " 	MAX(CARD_APPRNO) CARD_APPRNO, MAX(CARDNO) CARDNO, MAX(CASHNO) CASHNO, MAX(RRM_PRINT_CNT) RRM_PRINT_CNT ";
		sql += " FROM ";
		sql += " 	(SELECT RRM_RECE_NO, RRM_RECE_SEQ, RRM_PAY_KD, RRM_CUST_NO, RRM_OCCU_KD, RRM_CUST_NM, RRM_RECE_DT, RRM_CHARGE_PR, IAU_PENL_NM, ";
		sql += " 			CASE WHEN RRM_PAY_KD = '01' THEN RRM_RECE_PR ELSE 0 END CARDAMT, ";
		sql += " 			CASE WHEN RRM_PAY_KD in ('02','04') THEN RRM_RECE_PR ELSE 0 END CASHAMT, ";
		sql += " 			CASE WHEN RRM_PAY_KD = '03' THEN RRM_RECE_PR ELSE 0 END CASREAMT, ";
		sql += " 			CASE WHEN RRM_PAY_KD = '01' THEN CARD_NM END CARD_NM, ";
		sql += " 			CASE WHEN RRM_PAY_KD in ('01','03','04') THEN RRM_APPR_NO END CARD_APPRNO, ";
		sql += " 			CASE WHEN RRM_PAY_KD = '01' THEN RRM_CARD_NO END CARDNO, ";
		sql += " 			CASE WHEN RRM_PAY_KD in ('03','04') THEN RRM_CARD_NO END CASHNO, ";
		sql += " 			(RRM_SALE_PR||RRM_TRUNC_PR) SALEAMT, ";
		sql += " 			RRM_CHARGE_PR-(RRM_SALE_PR||RRM_TRUNC_PR) SUM_AMT, RRM_PRINT_CNT, EEA_CHART_NO, EEA_CUST_NO, RRM_RETURN_PR ";
		sql += " 		FROM (SELECT RRM_RECE_NO, RRM_RECE_SEQ, RRM_CUST_NO, RRM_OCCU_KD, RRM_CUST_NM, RRM_RECE_DT, RRM_CHARGE_PR, IAU_PENL_NM, RRM_PAY_KD, RRM_PRINT_CNT, ";
		sql += " 					(SELECT CCN_FULL_NM ";
		sql += " 						FROM CT_COMMON ";
		sql += " 					WHERE A.RRM_PAY_KD = CCN_SMALL ";
		sql += " 						AND CCN_LARGE = '0920' ";
		sql += " 					) RMH_PAYM_nm, ";
		sql += " 					(SELECT CCN_FULL_NM ";
		sql += " 						FROM CT_COMMON ";
		sql += " 					WHERE A.RRM_ISSUE_CD = CCN_SMALL ";
		sql += " 						AND CCN_LARGE = '0923' ";
		sql += " 					) CARD_NM, ";
		sql += " 					RRM_SALE_PR, RRM_TRUNC_PR, RRM_APPR_NO, RRM_ISSUE_CD,RRM_RECE_PR,RRM_CARD_NO, BBC_COMP_CD EEA_CHART_NO, BBC_COMP_CD EEA_CUST_NO, RRM_RETURN_PR ";
		sql += " 				FROM RT_RECE_MEDICHK a ";
		sql += "  					LEFT OUTER  JOIN BT_BILL_COMP B ON A.RRM_RECE_NO  = B.BBC_RECE_NO ";
		sql += " 					LEFT OUTER  JOIN IT_AUTH_USER C ON A.RRM_INPUT_ID = C.IAU_EMP_NO ";
		sql += " 			WHERE RRM_RECE_NO = '" + RECE_NO + "' ";

		if(CHBXPNT_GROUP.equals("Y")){
			sql += " AND RRM_RECE_SEQ = '" + RECE_SEQ + "' ";
		}

		sql += "				AND RRM_RECE_PR > 0 ";
		sql += "			) FF ";
		sql += "	) FFF ";

		if(CHBXPNT_GROUP.equals("Y")){
			sql += " GROUP BY RRM_RECE_NO, RRM_RECE_SEQ, RRM_PAY_KD, RRM_OCCU_KD, RRM_CUST_NM, RRM_RECE_DT, CARD_APPRNO ";
		} else {
			sql += " GROUP BY RRM_RECE_NO, RRM_OCCU_KD, RRM_CUST_NM, RRM_RECE_DT ";
		}


			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : ubT_Rece_RzBTN_RECEPRTClick_004 \n";
			G_INFO += "설명 : 영수증인쇄(출력정보조회)-사업장청구수납영수증 \n";
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
		<s:AttributeType name='ROWID' rs:number='<%= Integer.toString(colCnt)%>' rs:rowid='true' rs:writeunknown='true' rs:basetable='DUAL'
			 rs:basecolumn='ROWID' rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:extends type='rs:rowbase'/>
	</s:ElementType>
</s:Schema>		<rs:data>
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
