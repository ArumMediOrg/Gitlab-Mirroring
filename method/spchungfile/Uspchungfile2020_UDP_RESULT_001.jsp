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

		String EXAM_DT1 = htMethod.get("EXAM_DT1");
		String COMP_CD = htMethod.get("COMP_CD");
		String MNGT_SPYM = htMethod.get("MNGT_SPYM");
		String SSQL_ADD = htMethod.get("SSQL_ADD");

		//
		if(EXAM_DT1 == null) { EXAM_DT1 = ""; }
		if(COMP_CD == null) { COMP_CD = ""; }
		if(MNGT_SPYM == null) { MNGT_SPYM = ""; }
		if(SSQL_ADD == null) { SSQL_ADD = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT
  ERI_SPCL_KD,IIM_RSLT_KD,EEA_EXAM_DT,EEA_EXAM_SQ,F_PERID_FIND1(EEA_EXAM_DT,EEA_EXAM_SQ,'0') ID,
  case when SUBSTR(EEA_EXAM_CD,1,1) <>'4' Then EEA_SPSB_CD    else  EEA_EXAM_CD end firstgbn ,
  ERI_ITEM_CD,IIM_SBCD_CD,ERI_RSLT_VL,ERI_SPRT_CD,
  case when ERI_VLDT_LH in('L','H','*') then '2' else '1' end INSPCT_RESULT,
  ERI_VLDT_LH ,IIM_TRLT_CD,
  F_ITEM_VLDT_FIND(ERI_ITEM_CD,EEA_SEX_CD,'1','0',
                       SUBSTR(NVL(ERI_SPSB_PANJ, 'XX'),2,1),EEA_EXAM_DT) LOW,
  F_ITEM_VLDT_FIND(ERI_ITEM_CD,EEA_SEX_CD,'2','0',
                       SUBSTR(NVL(ERI_SPSB_PANJ, 'XX'),2,1),EEA_EXAM_DT) HIGH,
  CASE WHEN EEA_SPHT_CD='2' THEN IIP_SBSG_PR WHEN EEA_SPHT_CD='1' THEN
  CASE when (ERI_ITEM_CD='BA014') AND (ERI_HLTH_KD='1') THEN  IIP_SBSG_PR - IIP_GBSG_PR
       ELSE IIP_SBSG_PR  END
       ELSE IIP_SBSG_PR  END SLNS_MCCHRG  , ERI_HLTH_KD,  EEA_SPHT_CD,
  '' EXCEPT_FOR_CLAIM ,IIM_THPR_YN,SIH_HIPR_CD,
  SUBSTR(SIH_HIPR_LT,1,50) SIH_HIPR_LT ,SIC_CANC_LT,'' INSPCT_REMARK ,'' HM_PKTBUK_KND,
  '' REQUIRE_CHK,
  F_ITEM_VLDT_FIND(ERI_ITEM_CD,EEA_SEX_CD,'0','2',
                       SUBSTR(NVL(ERI_SPSB_PANJ, 'XX'),2,1),EEA_EXAM_DT) IIV_RSLT_UNIT,
  IIM_SANBO_KD , IIM_SANBO_CD , IIM_SANBO_CAL,
  CASE WHEN IIM_SUTK_YN = 'Y' THEN IIM_SUTK_CD ELSE '' END IIM_SUTK_CD
  FROM ET_EXAM_ACPT A
  LEFT OUTER JOIN ET_RSLT_ITEM      B ON A.EEA_EXAM_DT = B.ERI_EXAM_DT
                                     AND A.EEA_EXAM_SQ = B.ERI_EXAM_SQ
  LEFT OUTER JOIN ST_ITEM_HIGHPRICE D ON A.EEA_EXAM_DT = D.SIH_EXAM_DT
                                     AND A.EEA_EXAM_SQ = D.SIH_EXAM_SQ
                                     AND B.ERI_ITEM_CD = D.SIH_ITEM_CD
  LEFT OUTER JOIN IT_ITEM           C ON B.ERI_ITEM_CD = C.IIM_ITEM_CD
  LEFT OUTER JOIN IT_ITEM_PRICE     E ON E.IIP_APLY_DT = GetITEM_PRICE_ApplyDate(B.ERI_ITEM_CD, :EXAM_DT1 , 'ITEM_CD')
                                     AND B.ERI_ITEM_CD = E.IIP_ITEM_CD
  LEFT OUTER JOIN ST_ITEM_CANCEL    F ON A.EEA_EXAM_DT = F.SIC_EXAM_DT
                                     AND A.EEA_EXAM_SQ = F.SIC_EXAM_SQ
                                     AND B.ERI_ITEM_CD = F.SIC_ITEM_CD
  LEFT OUTER JOIN ST_BASE           H ON H.SBE_EXAM_DT = A.EEA_EXAM_DT
                                     AND H.SBE_EXAM_SQ = A.EEA_EXAM_SQ
  LEFT OUTER JOIN IT_COMPANY        I ON A.EEA_COMP_CD = I.ICY_COMP_CD
WHERE 0=0
  AND (A.EEA_EXAM_CD  IN ('41001','42001') OR  A.EEA_SPSB_CD IN ('41001','42001'))
  AND A.EEA_COMP_CD = :COMP_CD
  AND A.EEA_MNGT_SPYM  LIKE :MNGT_SPYM||'%'
  AND SBE_PANJ_YN = 'Y'
  AND IIM_TSND_YN = 'Y'
  AND IIM_TUSE_YN = 'Y'
  ||:sSQL_ADD


		*/

		sql = " SELECT ERI_SPCL_KD,IIM_RSLT_KD,EEA_EXAM_DT,EEA_EXAM_SQ,F_PERID_FIND1(EEA_EXAM_DT,EEA_EXAM_SQ,'0') ID, CASE WHEN SUBSTR(EEA_EXAM_CD,1,1) <>'4' THEN EEA_SPSB_CD ELSE EEA_EXAM_CD END FIRSTGBN , ERI_ITEM_CD,IIM_SBCD_CD,ERI_RSLT_VL,ERI_SPRT_CD, CASE WHEN ERI_VLDT_LH IN('L','H','*') THEN '2' ELSE '1' END INSPCT_RESULT, ERI_VLDT_LH ,IIM_TRLT_CD, F_ITEM_VLDT_FIND(ERI_ITEM_CD,EEA_SEX_CD,'1','0', SUBSTR(NVL(ERI_SPSB_PANJ, 'XX'),2,1),EEA_EXAM_DT) LOW, F_ITEM_VLDT_FIND(ERI_ITEM_CD,EEA_SEX_CD,'2','0', SUBSTR(NVL(ERI_SPSB_PANJ, 'XX'),2,1),EEA_EXAM_DT) HIGH, CASE WHEN EEA_SPHT_CD='2' THEN IIP_SBSG_PR WHEN EEA_SPHT_CD='1' THEN CASE WHEN (ERI_ITEM_CD='BA014')";
		sql += " AND (ERI_HLTH_KD='1') THEN IIP_SBSG_PR - IIP_GBSG_PR ELSE IIP_SBSG_PR END ELSE IIP_SBSG_PR END SLNS_MCCHRG , ERI_HLTH_KD, EEA_SPHT_CD, '' EXCEPT_FOR_CLAIM ,IIM_THPR_YN,SIH_HIPR_CD, SUBSTR(SIH_HIPR_LT,1,50) SIH_HIPR_LT ,SIC_CANC_LT,'' INSPCT_REMARK ,'' HM_PKTBUK_KND, '' REQUIRE_CHK, F_ITEM_VLDT_FIND(ERI_ITEM_CD,EEA_SEX_CD,'0','2', SUBSTR(NVL(ERI_SPSB_PANJ, 'XX'),2,1),EEA_EXAM_DT) IIV_RSLT_UNIT, IIM_SANBO_KD , IIM_SANBO_CD , IIM_SANBO_CAL, CASE WHEN IIM_SUTK_YN = 'Y' THEN IIM_SUTK_CD ELSE '' END IIM_SUTK_CD";
		sql += " FROM ET_EXAM_ACPT A LEFT OUTER JOIN ET_RSLT_ITEM B";
		sql += " ON A.EEA_EXAM_DT = B.ERI_EXAM_DT";
		sql += " AND A.EEA_EXAM_SQ = B.ERI_EXAM_SQ LEFT OUTER JOIN ST_ITEM_HIGHPRICE D";
		sql += " ON A.EEA_EXAM_DT = D.SIH_EXAM_DT";
		sql += " AND A.EEA_EXAM_SQ = D.SIH_EXAM_SQ";
		sql += " AND B.ERI_ITEM_CD = D.SIH_ITEM_CD LEFT OUTER JOIN IT_ITEM C";
		sql += " ON B.ERI_ITEM_CD = C.IIM_ITEM_CD LEFT OUTER JOIN IT_ITEM_PRICE E";
		sql += " ON E.IIP_APLY_DT = GETITEM_PRICE_APPLYDATE(B.ERI_ITEM_CD, '" + EXAM_DT1 + "' , 'ITEM_CD')";
		sql += " AND B.ERI_ITEM_CD = E.IIP_ITEM_CD LEFT OUTER JOIN ST_ITEM_CANCEL F";
		sql += " ON A.EEA_EXAM_DT = F.SIC_EXAM_DT";
		sql += " AND A.EEA_EXAM_SQ = F.SIC_EXAM_SQ";
		sql += " AND B.ERI_ITEM_CD = F.SIC_ITEM_CD LEFT OUTER JOIN ST_BASE H";
		sql += " ON H.SBE_EXAM_DT = A.EEA_EXAM_DT";
		sql += " AND H.SBE_EXAM_SQ = A.EEA_EXAM_SQ LEFT OUTER JOIN IT_COMPANY I";
		sql += " ON A.EEA_COMP_CD = I.ICY_COMP_CD";
		sql += " WHERE 0=0";
		sql += " AND (A.EEA_EXAM_CD IN ('41001','42001')";
		sql += " OR A.EEA_SPSB_CD IN ('41001','42001'))";
		sql += " AND A.EEA_COMP_CD = '" + COMP_CD + "'";
		sql += " AND A.EEA_MNGT_SPYM LIKE '" + MNGT_SPYM + "'||'%'";
		sql += " AND SBE_PANJ_YN = 'Y'";
		sql += " AND IIM_TSND_YN = 'Y'";
		sql += " AND IIM_TUSE_YN = 'Y'";
		sql += SSQL_ADD;
			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : Uspchungfile2020_UDP_RESULT_001 \n";
			G_INFO += "설명 : 특검청구 검진결과 조회(2차) \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " EXAM_DT1 : " + EXAM_DT1 + " \n";
			G_INFO += " COMP_CD : " + COMP_CD + " \n";
			G_INFO += " MNGT_SPYM : " + MNGT_SPYM + " \n";
			G_INFO += " SSQL_ADD : " + SSQL_ADD + " \n";
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
		<s:AttributeType name='ERI_SPCL_KD' rs:number='1' rs:nullable='true' rs:basetable='ET_RSLT_ITEM' rs:basecolumn='ERI_SPCL_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_RSLT_KD' rs:number='2' rs:nullable='true' rs:basetable='IT_ITEM' rs:basecolumn='IIM_RSLT_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_EXAM_DT' rs:number='3' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_EXAM_DT' rs:keycolumn='true'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_EXAM_SQ' rs:number='4' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_EXAM_SQ' rs:keycolumn='true'>
			<s:datatype dt:type='string' dt:maxLength='6' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ID' rs:number='5' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='FIRSTGBN' rs:number='6' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_ITEM_CD' rs:number='7' rs:nullable='true' rs:basetable='ET_RSLT_ITEM' rs:basecolumn='ERI_ITEM_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_SBCD_CD' rs:number='8' rs:nullable='true' rs:basetable='IT_ITEM' rs:basecolumn='IIM_SBCD_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_RSLT_VL' rs:number='9' rs:nullable='true' rs:basetable='ET_RSLT_ITEM' rs:basecolumn='ERI_RSLT_VL'>
			<s:datatype dt:type='string' dt:maxLength='50'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_SPRT_CD' rs:number='10' rs:nullable='true' rs:basetable='ET_RSLT_ITEM' rs:basecolumn='ERI_SPRT_CD'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='INSPCT_RESULT' rs:number='11' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_VLDT_LH' rs:number='12' rs:nullable='true' rs:basetable='ET_RSLT_ITEM' rs:basecolumn='ERI_VLDT_LH'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_TRLT_CD' rs:number='13' rs:nullable='true' rs:basetable='IT_ITEM' rs:basecolumn='IIM_TRLT_CD'>
			<s:datatype dt:type='string' dt:maxLength='3'/>
		</s:AttributeType>
		<s:AttributeType name='LOW' rs:number='14' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='HIGH' rs:number='15' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='SLNS_MCCHRG' rs:number='16' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_HLTH_KD' rs:number='17' rs:nullable='true' rs:basetable='ET_RSLT_ITEM' rs:basecolumn='ERI_HLTH_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SPHT_CD' rs:number='18' rs:nullable='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_SPHT_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EXCEPT_FOR_CLAIM' rs:number='19' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='2' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_THPR_YN' rs:number='20' rs:nullable='true' rs:basetable='IT_ITEM' rs:basecolumn='IIM_THPR_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='SIH_HIPR_CD' rs:number='21' rs:nullable='true' rs:basetable='ST_ITEM_HIGHPRICE' rs:basecolumn='SIH_HIPR_CD'>
			<s:datatype dt:type='string' dt:maxLength='3'/>
		</s:AttributeType>
		<s:AttributeType name='SIH_HIPR_LT' rs:number='22' rs:nullable='true' rs:basetable='ST_ITEM_HIGHPRICE' rs:basecolumn='SIH_HIPR_LT'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='SIC_CANC_LT' rs:number='23' rs:nullable='true' rs:basetable='ST_ITEM_CANCEL' rs:basecolumn='SIC_CANC_LT'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='INSPCT_REMARK' rs:number='24' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='2' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='HM_PKTBUK_KND' rs:number='25' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='2' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='REQUIRE_CHK' rs:number='26' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='2' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='IIV_RSLT_UNIT' rs:number='27' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_SANBO_KD' rs:number='28' rs:nullable='true' rs:basetable='IT_ITEM' rs:basecolumn='IIM_SANBO_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_SANBO_CD' rs:number='29' rs:nullable='true' rs:basetable='IT_ITEM' rs:basecolumn='IIM_SANBO_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_SANBO_CAL' rs:number='30' rs:nullable='true' rs:basetable='IT_ITEM' rs:basecolumn='IIM_SANBO_CAL'>
			<s:datatype dt:type='string' dt:maxLength='30'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_SUTK_CD' rs:number='31' rs:nullable='true' rs:basetable='IT_ITEM' rs:basecolumn='IIM_SUTK_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:extends type='rs:rowbase'/>
	</s:ElementType>
</s:Schema>
		<rs:data>
<%
		int cnt = 0;
		while(cRsList.next()) {

			cnt++;

			String ERI_SPCL_KD_T = cRsList.getString("ERI_SPCL_KD");
			String IIM_RSLT_KD_T = cRsList.getString("IIM_RSLT_KD");
			String EEA_EXAM_DT_T = cRsList.getString("EEA_EXAM_DT");
			String EEA_EXAM_SQ_T = cRsList.getString("EEA_EXAM_SQ");
			String ID_T = cRsList.getString("ID");
			String FIRSTGBN_T = cRsList.getString("FIRSTGBN");
			String ERI_ITEM_CD_T = cRsList.getString("ERI_ITEM_CD");
			String IIM_SBCD_CD_T = cRsList.getString("IIM_SBCD_CD");
			String ERI_RSLT_VL_T = cRsList.getString("ERI_RSLT_VL");
			String ERI_SPRT_CD_T = cRsList.getString("ERI_SPRT_CD");
			String INSPCT_RESULT_T = cRsList.getString("INSPCT_RESULT");
			String ERI_VLDT_LH_T = cRsList.getString("ERI_VLDT_LH");
			String IIM_TRLT_CD_T = cRsList.getString("IIM_TRLT_CD");
			String LOW_T = cRsList.getString("LOW");
			String HIGH_T = cRsList.getString("HIGH");
			String SLNS_MCCHRG_T = cRsList.getString("SLNS_MCCHRG");
			String ERI_HLTH_KD_T = cRsList.getString("ERI_HLTH_KD");
			String EEA_SPHT_CD_T = cRsList.getString("EEA_SPHT_CD");
			String EXCEPT_FOR_CLAIM_T = cRsList.getString("EXCEPT_FOR_CLAIM");
			String IIM_THPR_YN_T = cRsList.getString("IIM_THPR_YN");
			String SIH_HIPR_CD_T = cRsList.getString("SIH_HIPR_CD");
			String SIH_HIPR_LT_T = cRsList.getString("SIH_HIPR_LT");
			String SIC_CANC_LT_T = cRsList.getString("SIC_CANC_LT");
			String INSPCT_REMARK_T = cRsList.getString("INSPCT_REMARK");
			String HM_PKTBUK_KND_T = cRsList.getString("HM_PKTBUK_KND");
			String REQUIRE_CHK_T = cRsList.getString("REQUIRE_CHK");
			String IIV_RSLT_UNIT_T = cRsList.getString("IIV_RSLT_UNIT");
			String IIM_SANBO_KD_T = cRsList.getString("IIM_SANBO_KD");
			String IIM_SANBO_CD_T = cRsList.getString("IIM_SANBO_CD");
			String IIM_SANBO_CAL_T = cRsList.getString("IIM_SANBO_CAL");
			String IIM_SUTK_CD_T = cRsList.getString("IIM_SUTK_CD");
%>
			<z:row
<%
			if(! ERI_SPCL_KD_T.equals("")) {
%>
		 		ERI_SPCL_KD='<%= ERI_SPCL_KD_T%>'
<%
			}

			if(! IIM_RSLT_KD_T.equals("")) {
%>
		 		IIM_RSLT_KD='<%= IIM_RSLT_KD_T%>'
<%
			}

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

			if(! ID_T.equals("")) {
%>
		 		ID='<%= ID_T%>'
<%
			}

			if(! FIRSTGBN_T.equals("")) {
%>
		 		FIRSTGBN='<%= FIRSTGBN_T%>'
<%
			}

			if(! ERI_ITEM_CD_T.equals("")) {
%>
		 		ERI_ITEM_CD='<%= ERI_ITEM_CD_T%>'
<%
			}

			if(! IIM_SBCD_CD_T.equals("")) {
%>
		 		IIM_SBCD_CD='<%= IIM_SBCD_CD_T%>'
<%
			}

			if(! ERI_RSLT_VL_T.equals("")) {
%>
		 		ERI_RSLT_VL='<%= ERI_RSLT_VL_T%>'
<%
			}

			if(! ERI_SPRT_CD_T.equals("")) {
%>
		 		ERI_SPRT_CD='<%= ERI_SPRT_CD_T%>'
<%
			}

			if(! INSPCT_RESULT_T.equals("")) {
%>
		 		INSPCT_RESULT='<%= INSPCT_RESULT_T%>'
<%
			}

			if(! ERI_VLDT_LH_T.equals("")) {
%>
		 		ERI_VLDT_LH='<%= ERI_VLDT_LH_T%>'
<%
			}

			if(! IIM_TRLT_CD_T.equals("")) {
%>
		 		IIM_TRLT_CD='<%= IIM_TRLT_CD_T%>'
<%
			}

			if(! LOW_T.equals("")) {
%>
		 		LOW='<%= LOW_T%>'
<%
			}

			if(! HIGH_T.equals("")) {
%>
		 		HIGH='<%= HIGH_T%>'
<%
			}

			if(! SLNS_MCCHRG_T.equals("")) {
%>
		 		SLNS_MCCHRG='<%= SLNS_MCCHRG_T%>'
<%
			}

			if(! ERI_HLTH_KD_T.equals("")) {
%>
		 		ERI_HLTH_KD='<%= ERI_HLTH_KD_T%>'
<%
			}

			if(! EEA_SPHT_CD_T.equals("")) {
%>
		 		EEA_SPHT_CD='<%= EEA_SPHT_CD_T%>'
<%
			}

			if(! EXCEPT_FOR_CLAIM_T.equals("")) {
%>
		 		EXCEPT_FOR_CLAIM='<%= EXCEPT_FOR_CLAIM_T%>'
<%
			}

			if(! IIM_THPR_YN_T.equals("")) {
%>
		 		IIM_THPR_YN='<%= IIM_THPR_YN_T%>'
<%
			}

			if(! SIH_HIPR_CD_T.equals("")) {
%>
		 		SIH_HIPR_CD='<%= SIH_HIPR_CD_T%>'
<%
			}

			if(! SIH_HIPR_LT_T.equals("")) {
%>
		 		SIH_HIPR_LT='<%= SIH_HIPR_LT_T%>'
<%
			}

			if(! SIC_CANC_LT_T.equals("")) {
%>
		 		SIC_CANC_LT='<%= SIC_CANC_LT_T%>'
<%
			}

			if(! INSPCT_REMARK_T.equals("")) {
%>
		 		INSPCT_REMARK='<%= INSPCT_REMARK_T%>'
<%
			}

			if(! HM_PKTBUK_KND_T.equals("")) {
%>
		 		HM_PKTBUK_KND='<%= HM_PKTBUK_KND_T%>'
<%
			}

			if(! REQUIRE_CHK_T.equals("")) {
%>
		 		REQUIRE_CHK='<%= REQUIRE_CHK_T%>'
<%
			}

			if(! IIV_RSLT_UNIT_T.equals("")) {
%>
		 		IIV_RSLT_UNIT='<%= IIV_RSLT_UNIT_T%>'
<%
			}

			if(! IIM_SANBO_KD_T.equals("")) {
%>
		 		IIM_SANBO_KD='<%= IIM_SANBO_KD_T%>'
<%
			}

			if(! IIM_SANBO_CD_T.equals("")) {
%>
		 		IIM_SANBO_CD='<%= IIM_SANBO_CD_T%>'
<%
			}

			if(! IIM_SANBO_CAL_T.equals("")) {
%>
		 		IIM_SANBO_CAL='<%= IIM_SANBO_CAL_T%>'
<%
			}

			if(! IIM_SUTK_CD_T.equals("")) {
%>
		 		IIM_SUTK_CD='<%= IIM_SUTK_CD_T%>'
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
