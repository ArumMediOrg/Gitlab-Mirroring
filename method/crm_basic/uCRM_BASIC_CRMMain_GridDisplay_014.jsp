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

		String SDATABASE = htMethod.get("SDATABASE");
		String SEXAM_SDT = htMethod.get("SEXAM_SDT");
		String SEXAM_EDT = htMethod.get("SEXAM_EDT");
		String SSQL_ADD1 = htMethod.get("SSQL_ADD1");

		//
		if(SDATABASE == null) { SDATABASE = ""; }
		if(SEXAM_SDT == null) { SEXAM_SDT = ""; }
		if(SEXAM_EDT == null) { SEXAM_EDT = ""; }
		if(SSQL_ADD1 == null) { SSQL_ADD1 = ""; }

		// DB객체
		stmtList = connect.createStatement();

		sql = " select a.*, b.icr_penl_id, b.icr_pid_en, b.icr_birh_dt, b.ICR_NTNA_CD, ";

		if (SDATABASE.equals("1") || SDATABASE.equals("2")){
			sql += " nvl((select EPM_MEMO_TX from et_psnl_memo where epm_cust_no = a.EEA_CUST_NO and rownum = 1), ' ') epm_memo_tx, ";
		} else {
			sql += " isnull((select top 1 EPM_MEMO_TX from et_psnl_memo where epm_cust_no = a.EEA_CUST_NO";
			sql += " order by epm_memo_sq desc), ' ') epm_memo_tx, ";
		}

		sql += " 	f_tel_format(a.EEA_MOBL_NO) EEA_MOBL_NO2,                                                                ";
		sql += " 	f_tel_format(a.EEA_TEL_NO)  EEA_TEL_NO2,                                                                 ";
		sql += " 	case when SUBSTR(a.EEA_EXAM_LT, 1, 3) in ('P00', 'E00') then f_pack_find(a.EEA_EXAM_LT, ' ')     ";
		sql += " 			when SUBSTR(a.EEA_EXAM_LT, 1, 3) = 'C03' then f_pack_find(a.EEA_EXAM_LT, a.EEA_COMP_CD)        ";
		sql += " 			else f_code_find('0401', SUBSTR(a.EEA_EXAM_CD||'001', 1, 5), ' ', '1') end as EEA_EXAM_NM, ";
		sql += " 	f_code_find('0401', SUBSTR(a.EEA_EXAM_CD||'001', 1, 5), ' ', '1') EEA_EXAM_NM2,                 ";
		sql += " 	F_COMP_FIND(a.EEA_COMP_CD) EEA_COMP_NM, f_user_find(a.EEA_INPT_ID) EEA_INPT_NM,                      ";
		sql += " 	F_CODE_FIND('0711', EEA_MMBR_CD, ' ', '1') EEA_MMBR_NM,                                             ";
		sql += " 	F_CODE_FIND('0703', ICR_NTNA_CD, ' ', '1') EEA_NATI_NM,                                             ";
		sql += " 	F_CODE_FIND('0712', EEA_SEND_CD, ' ', '1') EEA_SEND_NM,                                             ";
		sql += " 	F_CODE_FIND('0914', EEA_FAMY_CD, ' ', '1') EEA_FAMY_KD,                                             ";
		sql += " 	D.SAE_ADVI_DT, D.SAE_NEXT_DT, D.SAE_ADVI_TX,                                                                 ";
		sql += " 	c.RRT_EXAM_DT, E.HDP_EXAM_DT, E.HDP_ADVI_DT,                                                                 ";
		sql += " 	E.HDP_SOCK_TX1, E.HDP_SOCK_TX2, E.HDP_SOCK_TX3, E.HDP_SOCK_TX4,                                              ";
		sql += " 	E.HDP_SOCK_TX5, E.HDP_SOCK_TX6, E.HDP_SOCK_TX7, E.HDP_SOCK_TX8,                                              ";
		sql += " 	B.ICR_CUST_TX, F.ICY_COMP_NM,                                                                                 ";
		sql += "    c.rrt_blood_yn, c.rrt_aspl_yn,  c.rrt_smpl_yn,  c.rrt_quest_kd,                                               ";
        sql += "    c.rrt_stoma_yn, c.rrt_colon_yn, c.rrt_stool_yn, c.rrt_drug_yn,                                               ";
		sql += "    (Select IAU_PENL_NM From IT_AUTH_USER Where IAU_EMP_NO = D.SAE_NURSE_ID) As NURSE_NM,                        ";
      	sql += "    (Select IAU_PENL_NM From IT_AUTH_USER Where IAU_EMP_NO = D.SAE_DOCT_ID) As DOCT_NM,                       ";
		sql += "    E.HDP_ADVI_TM, G.CAP_RSVN_DT, G.CAP_RSVN_TM, H.SSV_PRNT_DT                                                       ";
		sql += " from ET_EXAM_ACPT a                                                                                                 ";
		sql += " left outer join it_customer b on b.icr_cust_no = a.EEA_CUST_NO                                                      ";
		sql += " left outer join RT_RSVT     c on a.EEA_RSVN_NO = c.RRT_RSVN_NO                                                      ";
		sql += " left outer join ST_ADVICE D on D.SAE_CUST_NO = A.EEA_CUST_NO                                                        ";
		sql += " 							and D.SAE_EXAM_DT = A.EEA_EXAM_DT                                                       ";
		sql += " 							and D.SAE_EXAM_SQ = A.EEA_EXAM_SQ                                                       ";
		sql += " 							and D.SAE_USE_YN = 'Y'                                                                ";
		sql += " left outer join HEALTH_DIETITIAN_PANJUNG E On E.HDP_EXAM_DT = A.EEA_EXAM_DT                                         ";
		sql += " 										And E.HDP_EXAM_SQ = A.EEA_EXAM_SQ                                         ";
		sql += " left outer join IT_COMPANY F on F.ICY_COMP_CD = A.EEA_COMP_CD                                     ";
		sql += " left outer join CR_ADVICE_PLAN G on G.CAP_EXAM_DT = A.EEA_EXAM_DT and G.CAP_EXAM_SQ = A.EEA_EXAM_SQ ";
		sql += " left outer join ST_SYTH_VIEW H On H.SSV_EXAM_DT = A.EEA_EXAM_DT and H.SSV_EXAM_SQ = A.EEA_EXAM_SQ ";
		sql += " where a.EEA_EXAM_DT >= '" + SEXAM_SDT + "'                                                        ";
		sql += " and a.EEA_EXAM_DT <= '" +  SEXAM_EDT + "'                                                         ";
		sql += " and SUBSTR(a.EEA_EXAM_CD, 1, 2) <> '31'                                                           ";
		sql += " And A.EEA_ORDER_YN <> 'C'   ";

		sql += SSQL_ADD1;


			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uCRM_BASIC_CRMMain_GridDisplay_014 \n";
			G_INFO += "설명 : 환자관리-접수조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";

			G_INFO += " SDATABASE : " + SDATABASE + " \n";
			G_INFO += " SEXAM_SDT : " + SEXAM_SDT + " \n";
			G_INFO += " SEXAM_EDT : " + SEXAM_EDT + " \n";
			G_INFO += " SSQL_ADD1 : " + SSQL_ADD1 + " \n";
			G_INFO += "\n\n";

			G_INFO += "질의문 : " + sql + " \n";



		rsList = stmtList.executeQuery(sql);
		cRsList = new CRs(rsList);

		rsmd = rsList.getMetaData();  //Select 결과의 Metadata 가져오기.

		/*for (colCnt = 1; colCnt <= rsmd.getColumnCount(); colCnt++){
			G_INFO += rsmd.getColumnName(colCnt) + "\n";
		}*/

		G_INFO += "-->";

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
