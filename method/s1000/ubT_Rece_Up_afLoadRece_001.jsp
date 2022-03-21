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

		String RZRD_TDAF_KD = htMethod.get("RZRD_TDAF_KD");
		String SSQL_ADD = htMethod.get("SSQL_ADD");
		String SPLCE_CD = htMethod.get("SPLCE_CD");

		//
		if(RZRD_TDAF_KD == null) { RZRD_TDAF_KD = ""; }
		if(SSQL_ADD == null) { SSQL_ADD = ""; }
		if(SPLCE_CD == null) { SPLCE_CD = ""; }

		// DB객체
		stmtList = connect.createStatement();


		sql = " SELECT (SELECT B.ICY_COMP_NM";
		sql += " FROM IT_COMPANY B";
		sql += " WHERE ICY_COMP_CD = COMP_CD) AS ICY_COMP_NM, ";
		sql += " CASE WHEN aa.RRM_OCCU_KD = '20' THEN (SELECT max(EEA_CHART_NO) FROM ET_exam_acpt WHERE eea_rece_no = aa.rrm_rece_no) ELSE '' END EEA_CHART_NO, ";
		sql += " CASE WHEN aa.RRM_OCCU_KD = '20' THEN (SELECT max(FLOOR((EEA_COMPR_PR+EEA_PSNLR_PR+EEA_HLTHR_PR+EEA_SPCLR_PR)/10)*10) EEA_EXAM_PR  ";
        sql += "                                         FROM ET_EXAM_ACPT WHERE EEA_RECE_NO = aa.RRM_RECE_NO) ELSE 0 END EEA_EXAM_PR, ";
		sql += " NVL(CARD_CD_NM,' ') || NVL(RRM_CARD_NM,' ') CARD_NM, AA.*";
		sql += " FROM ( SELECT RRM_RECE_NO, RRM_RECE_SEQ ,RRM_MEMO, RRM_CUST_NO, RRM_OCCU_KD, F_PERID_FIND(RRM_CUST_NO,'0') PER_ID, RRM_CARD_NO, RRM_CARD_NM, (SELECT CCN_FULL_NM";
		sql += " FROM CT_COMMON";
		sql += " WHERE CCN_SMALL = RRM_OCCU_KD";
		sql += " AND CCN_LARGE = '0925' ) RMH_SUNAP_KD_NM, RRM_CUST_NM, RRM_RECE_DT,";

		if(RZRD_TDAF_KD.equals("0")) {			// 전체 //당일미수금 수납 구분
			sql += " RRM_RECE_PR, RRM_SALE_PR, RRM_TRUNC_PR,";
		} else if(RZRD_TDAF_KD.equals("1")) {	// 당일수납
			sql += " RRM_RECE_TD_PR RRM_RECE_PR, RRM_SALE_TD_PR RRM_SALE_PR, RRM_TRUNC_TD_PR RRM_TRUNC_PR,";
		} else if(RZRD_TDAF_KD.equals("2")) {	// 미수금(회수)수납
			sql += " RRM_RECE_AF_PR RRM_RECE_PR, RRM_SALE_AF_PR RRM_SALE_PR, RRM_TRUNC_AF_PR RRM_TRUNC_PR,";
		} else {								// 전체
			sql += " RRM_RECE_PR, RRM_SALE_PR, RRM_TRUNC_PR,";
		}

		sql += " CASE WHEN  RRM_OCCU_KD in ('10','73') THEN    ";
		sql += " 		nvl((select nvl(max(RRT_PSNL_PR),0) from rt_rsvt where rrt_rece_no = A.RRM_RECE_NO),0) ";
		sql += " 	WHEN  RRM_OCCU_KD = '20' THEN    ";
		sql += " 		nvl((select nvl(max(EEA_PSNLR_PR),0) from et_exam_acpt where eea_rece_no = A.RRM_RECE_NO),0) ";
		sql += " 	WHEN  Substr(RRM_OCCU_KD,1,1) = '3' THEN  ";
		sql += " 		nvl((select nvl(max(BBC_BILL_PR),0) from bt_bill_comp where bbc_rece_no = A.RRM_RECE_NO),0) ";
		sql += " 	WHEN  Substr(RRM_OCCU_KD,1,1) = '7' THEN      ";
		sql += " 		CASE WHEN Substr(RRM_RECE_NO,9,1) = '3' THEN    ";
		sql += " 		nvl((select nvl(max(BBC_BILL_PR),0) from bt_bill_comp where bbc_rece_no = A.RRM_RECE_NO),0) ";
		sql += " 		ELSE ";
		sql += " 		nvl((select nvl(max(EEA_PSNLR_PR),0) from et_exam_acpt where eea_rece_no = A.RRM_RECE_NO),0) ";
		sql += " 		END ";
		sql += " 	ELSE           ";
		sql += " 		nvl(RRM_CHARGE_PR,0) ";
		sql += " END  RRM_CHARGE_PR, ";
		sql += " CASE WHEN  RRM_OCCU_KD in ('10','73') THEN    ";
		sql += " 		nvl((select nvl(max(RRT_PSNL_PR),0) from rt_rsvt where rrt_rece_no = A.RRM_RECE_NO),0) ";
		sql += " 		- nvl(( select (nvl(SUM(RRM_SALE_PR),0) + nvl(SUM(RRM_TRUNC_PR),0)+nvl(SUM(RRM_RESER_PR),0) - nvl(SUM(RRM_RETURN_PR),0)) ";
		sql += " 			from RT_RECE_MEDICHK ";
		sql += " 			where RRM_RECE_NO=A.RRM_RECE_NO and RRM_OCCU_KD in ('10','73') ),0) ";
		sql += " 	WHEN  RRM_OCCU_KD = '20' THEN    ";
		sql += " 		nvl((select nvl(max(EEA_PSNLR_PR),0) from et_exam_acpt where eea_rece_no = A.RRM_RECE_NO),0) ";
		sql += " 		- nvl(( select (nvl(SUM(RRM_SALE_PR),0) + nvl(SUM(RRM_TRUNC_PR),0) + nvl(SUM(RRM_RECE_PR),0) - nvl(SUM(RRM_RETURN_PR),0)) ";
		sql += " 			from RT_RECE_MEDICHK ";
		sql += " 			where RRM_RECE_NO=A.RRM_RECE_NO and RRM_OCCU_KD not in ('10','73') ),0) ";
		sql += " 	WHEN  Substr(RRM_OCCU_KD,1,1) = '3' THEN  ";
		sql += " 		nvl((select nvl(max(BBC_BILL_PR),0) from bt_bill_comp where bbc_rece_no = A.RRM_RECE_NO),0) ";
		sql += " 		- nvl(( select (nvl(SUM(RRM_SALE_PR),0) + nvl(SUM(RRM_TRUNC_PR),0) + nvl(SUM(RRM_RECE_PR),0) - nvl(SUM(RRM_RETURN_PR),0)) ";
		sql += " 			from RT_RECE_MEDICHK ";
		sql += " 			where RRM_RECE_NO=A.RRM_RECE_NO),0) ";
		sql += " 	WHEN  Substr(RRM_OCCU_KD,1,1) = '7' THEN      ";
		sql += " 		CASE WHEN Substr(RRM_RECE_NO,9,1) = '3' THEN    ";
		sql += " 		nvl((select nvl(max(BBC_BILL_PR),0) from bt_bill_comp where bbc_rece_no = A.RRM_RECE_NO),0) ";
		sql += " 		- nvl(( select (nvl(SUM(RRM_SALE_PR),0) + nvl(SUM(RRM_TRUNC_PR),0) + nvl(SUM(RRM_RECE_PR),0) - nvl(SUM(RRM_RETURN_PR),0)) ";
		sql += " 					from RT_RECE_MEDICHK ";
		sql += " 					where RRM_RECE_NO=A.RRM_RECE_NO),0) ";
		sql += " 		ELSE ";
		sql += " 		nvl((select nvl(max(EEA_PSNLR_PR),0) from et_exam_acpt where eea_rece_no = A.RRM_RECE_NO),0) ";
		sql += " 		- nvl(( select (nvl(SUM(RRM_SALE_PR),0) + nvl(SUM(RRM_TRUNC_PR),0)+nvl(SUM(RRM_RECE_PR),0) - nvl(SUM(RRM_RETURN_PR),0)) ";
		sql += " 					from RT_RECE_MEDICHK ";
		sql += " 					where RRM_RECE_NO=A.RRM_RECE_NO and RRM_OCCU_KD not in ('10','73') ),0) ";
		sql += " 		END ";
		sql += " 	ELSE           ";
		sql += " 		nvl(RRM_CHARGE_PR,0) ";
		sql += " 		- nvl(( select (nvl(SUM(RRM_SALE_PR),0) + nvl(SUM(RRM_TRUNC_PR),0) + nvl(SUM(RRM_RECE_PR),0) - nvl(SUM(RRM_RETURN_PR),0)) ";
		sql += " 			from RT_RECE_MEDICHK ";
		sql += " 			where RRM_RECE_NO=A.RRM_RECE_NO),0) ";
		sql += " END  RMH_NOPAY_PR, ";



		sql += " NVL(( SELECT NVL(SUM(RRM_RECE_PR),0)";
		sql += " FROM RT_RECE_MEDICHK";
		sql += " WHERE RRM_RECE_NO=A.RRM_RECE_NO";
		sql += " AND RRM_OCCU_KD=A.RRM_OCCU_KD ),0) RMH_ALLRECE_PR, (SELECT CCN_FULL_NM";
		sql += " FROM CT_COMMON";
		sql += " WHERE RRM_PAY_KD=CCN_SMALL";
		sql += " AND CCN_LARGE='0920' ) RMH_PAYM_NM, (SELECT CCN_FULL_NM";
		sql += " FROM CT_COMMON";
		sql += " WHERE RRM_SALE_KD=CCN_SMALL";
		sql += " AND CCN_LARGE='0921' ) RMH_SALE_NM, (SELECT CCN_FULL_NM";
		sql += " FROM CT_COMMON";
		sql += " WHERE RRM_ISSUE_CD=CCN_SMALL";
		sql += " AND CCN_LARGE='0923' ) CARD_CD_NM , (SELECT MAX(EEA_EXAM_DT)";
		sql += " FROM ET_EXAM_ACPT";
		sql += " WHERE EEA_RECE_NO = A.RRM_RECE_NO ) EEA_EXAM_DT, (SELECT MAX(EEA_EXAM_SQ)";
		sql += " FROM ET_EXAM_ACPT";
		sql += " WHERE EEA_RECE_NO = A.RRM_RECE_NO ) EEA_EXAM_SQ, (SELECT MAX(EEA_SALES_ID)";
		sql += " FROM ET_EXAM_ACPT";
		sql += " WHERE EEA_RECE_NO = A.RRM_RECE_NO ) EEA_SALES_ID, ";
		if (!SPLCE_CD.equals("")){
			sql += " (SELECT EEA_PLCE_CD FROM ET_EXAM_ACPT WHERE EEA_RECE_NO = A.RRM_RECE_NO  ) EEA_PLCE_CD, ";
		}
		sql += " CASE SUBSTR(RRM_OCCU_KD,1,1) WHEN '7' THEN CASE RRM_OCCU_KD WHEN '73' THEN (SELECT MAX(RRT_COMP_CD)";
		sql += " FROM RT_RSVT";
		sql += " WHERE RRT_RSVN_NO = A.RRM_RECE_NO) ELSE CASE WHEN SUBSTR(RRM_RECE_NO,9,1) = '3' THEN RRM_CUST_NO ELSE (SELECT MAX(EEA_COMP_CD)";
		sql += " FROM ET_EXAM_ACPT";
		sql += " WHERE EEA_RECE_NO = A.RRM_RECE_NO ) END END ELSE CASE RRM_OCCU_KD WHEN '10' THEN (SELECT MAX(RRT_COMP_CD)";
		sql += " FROM RT_RSVT";
		sql += " WHERE RRT_RSVN_NO = A.RRM_RECE_NO ) WHEN '20' THEN (SELECT MAX(EEA_COMP_CD)";
		sql += " FROM ET_EXAM_ACPT";
		sql += " WHERE EEA_RECE_NO = A.RRM_RECE_NO ) ELSE RRM_CUST_NO END END COMP_CD, NVL(RRM_RETURN_PR, 0) RRM_RETURN_PR, RRM_APPR_DT,RRM_MODI_DTT, RRM_ISSUE_CD, RRM_APPR_NO, RRM_IMPAIR_PR,RRM_LOSS_PR,RRM_OVERPAY_PR, RRM_RESER_PR,RRM_RESEREPL_PR, RRM_CUT_PR,RRM_HRRECT_NO, RRM_BORECT_NO, BBC_BILL_FL";
		sql += " FROM RT_RECE_MEDICHK A";
		sql += " LEFT JOIN BT_BILL_COMP B ON A.RRM_RECE_NO = B.BBC_RECE_NO ";
		sql += " WHERE 1 = 1";

		sql += SSQL_ADD;


			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : ubT_Rece_Up_afLoadRece_001 \n";
			G_INFO += "설명 : 수납내역조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " RZRD_TDAF_KD : " + RZRD_TDAF_KD + " \n";
			G_INFO += " SSQL_ADD : " + SSQL_ADD + " \n";
			G_INFO += " SPLCE_CD : " + SPLCE_CD + " \n";
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

				if (rsmd.getColumnTypeName(colCnt).equals("BLOB")){
					byte[] buf_BLOB = rsList.getBytes(rsmd.getColumnName(colCnt));
					if(buf_BLOB != null) {
						tempData = new String(buf_BLOB);
					}
				}

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
