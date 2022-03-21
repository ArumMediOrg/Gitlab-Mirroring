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

		String DTEFROMDT = htMethod.get("DTEFROMDT");
		String DTETODT = htMethod.get("DTETODT");
		String MNGT_HTYR = htMethod.get("MNGT_HTYR");
		String SSQL_ADD = htMethod.get("SSQL_ADD");

		//
		if(DTEFROMDT == null) { DTEFROMDT = ""; }
		if(DTETODT == null) { DTETODT = ""; }
		if(MNGT_HTYR == null) { MNGT_HTYR = ""; }
		if(SSQL_ADD == null) { SSQL_ADD = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

select EEA_MNGT_HTYR, EEA_EXAM_DT, EEA_EXAM_SQ, replace(EEA_EXAM_DT,'-','') REP_EXAM_DT, EEA_PSNL_NM, PFP_TRANC_DATE,
       PFP_RESULT_DATE, PFP_DOCTORFIR, PFP_FIX_YN, ICR_PID_EN, ICR_PENL_ID, EEA_CNTR_CD,
       case when PFP_RESULTR2_1 =  '1' and PFP_RESULTR2_2 <> '1' then 'A'
            when PFP_RESULTR2_1 <> '1' and PFP_RESULTR2_2  = '1' then 'B'
            else 'C'
       end DEFINCD
  from PT_FIR_PANJUNG A LEFT OUTER JOIN ET_EXAM_ACPT B ON A.PFP_EXAM_DT=B.EEA_EXAM_DT AND A.PFP_EXAM_SQ=B.EEA_EXAM_SQ
                        LEFT OUTER JOIN IT_CUSTOMER  C ON B.EEA_CUST_NO=C.ICR_CUST_NO
                                                      LEFT OUTER JOIN IT_AUTH_USER H ON A.PFP_DOCTORFIR =H.IAU_EMP_NO
                        LEFT OUTER JOIN BT_BILLHN_PR I ON B.EEA_EXAM_DT=I.BBP_EXAM_DT AND B.EEA_EXAM_SQ=I.BBP_EXAM_SQ AND BBP_CHUNG_KD='21'
 where EEA_EXAM_DT>= :dteFromDt  AND EEA_EXAM_DT<= :dteToDt
   and EEA_MNGT_HTYR = :MNGT_HTYR
   and EEA_ORDER_YN <> 'C'
   and NVL(EEA_RECE_NO, ' ') <> 'R'
   and EEA_HTSB_CD in('11001','12003')
   and (PFP_RESULTR2_1 = '1' or PFP_RESULTR2_2 = '1')
|| :sSQL_ADD
		*/

		sql = " SELECT EEA_MNGT_HTYR, EEA_EXAM_DT, EEA_EXAM_SQ, REPLACE(EEA_EXAM_DT,'-','') REP_EXAM_DT, EEA_PSNL_NM, PFP_TRANC_DATE, PFP_RESULT_DATE, PFP_DOCTORFIR, PFP_FIX_YN, ICR_PID_EN, ICR_PENL_ID, EEA_CNTR_CD";
		sql += ", CASE WHEN PFP_RESULTR2_1 = '1' AND PFP_RESULTR2_2 <> '1' THEN 'A' WHEN PFP_RESULTR2_1 <> '1' AND PFP_RESULTR2_2 = '1' THEN 'B' ELSE 'C' END DEFINCD";
		sql += " FROM PT_FIR_PANJUNG A LEFT OUTER JOIN ET_EXAM_ACPT B";
		sql += " ON A.PFP_EXAM_DT=B.EEA_EXAM_DT";
		sql += " AND A.PFP_EXAM_SQ=B.EEA_EXAM_SQ LEFT OUTER JOIN IT_CUSTOMER C";
		sql += " ON B.EEA_CUST_NO=C.ICR_CUST_NO LEFT OUTER JOIN IT_AUTH_USER H";
		sql += " ON A.PFP_DOCTORFIR =H.IAU_EMP_NO LEFT OUTER JOIN BT_BILLHN_PR I";
		sql += " ON B.EEA_EXAM_DT=I.BBP_EXAM_DT";
		sql += " AND B.EEA_EXAM_SQ=I.BBP_EXAM_SQ";
		sql += " AND BBP_CHUNG_KD='21'";
		sql += " WHERE EEA_EXAM_DT>= '" + DTEFROMDT + "'";
		sql += " AND EEA_EXAM_DT<= '" + DTETODT + "'";
		sql += " AND EEA_MNGT_HTYR = '" + MNGT_HTYR + "'";
		sql += " AND EEA_ORDER_YN <> 'C'";
		sql += " AND NVL(EEA_RECE_NO, ' ') <> 'R'";
		sql += " AND EEA_HTSB_CD IN('11001','12003')";
		sql += " AND (PFP_RESULTR2_1 = '1' OR PFP_RESULTR2_2 = '1')";
		sql += SSQL_ADD;

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uIT_ChungGU_2018_UDP_DEFIN_ERR_001 \n";
			G_INFO += "설명 : 확진대상자 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " DTEFROMDT : " + DTEFROMDT + " \n";
			G_INFO += " DTETODT : " + DTETODT + " \n";
			G_INFO += " MNGT_HTYR : " + MNGT_HTYR + " \n";
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
		<s:AttributeType name='EEA_MNGT_HTYR' rs:number='1' rs:nullable='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_MNGT_HTYR'>
			<s:datatype dt:type='string' dt:maxLength='4'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_EXAM_DT' rs:number='2' rs:nullable='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_EXAM_DT'
			 rs:keycolumn='true'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_EXAM_SQ' rs:number='3' rs:nullable='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_EXAM_SQ'
			 rs:keycolumn='true'>
			<s:datatype dt:type='string' dt:maxLength='6'/>
		</s:AttributeType>
		<s:AttributeType name='REP_EXAM_DT' rs:number='4' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_PSNL_NM' rs:number='5' rs:nullable='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_PSNL_NM'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_TRANC_DATE' rs:number='6' rs:nullable='true' rs:basetable='PT_FIR_PANJUNG' rs:basecolumn='PFP_TRANC_DATE'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_RESULT_DATE' rs:number='7' rs:nullable='true' rs:basetable='PT_FIR_PANJUNG' rs:basecolumn='PFP_RESULT_DATE'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_DOCTORFIR' rs:number='8' rs:nullable='true' rs:basetable='PT_FIR_PANJUNG' rs:basecolumn='PFP_DOCTORFIR'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_FIX_YN' rs:number='9' rs:nullable='true' rs:basetable='PT_FIR_PANJUNG' rs:basecolumn='PFP_FIX_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_PID_EN' rs:number='10' rs:nullable='true' rs:basetable='IT_CUSTOMER' rs:basecolumn='ICR_PID_EN'>
			<s:datatype dt:type='string' dt:maxLength='2000'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_PENL_ID' rs:number='11' rs:nullable='true' rs:basetable='IT_CUSTOMER' rs:basecolumn='ICR_PENL_ID'>
			<s:datatype dt:type='string' dt:maxLength='13'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_CNTR_CD' rs:number='12' rs:nullable='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_CNTR_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='DEFINCD' rs:number='13' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:extends type='rs:rowbase'/>
	</s:ElementType>
</s:Schema>
		<rs:data>
<%
		int cnt = 0;
		while(cRsList.next()) {

			cnt++;

			String EEA_MNGT_HTYR_T = cRsList.getString("EEA_MNGT_HTYR");
			String EEA_EXAM_DT_T = cRsList.getString("EEA_EXAM_DT");
			String EEA_EXAM_SQ_T = cRsList.getString("EEA_EXAM_SQ");
			String REP_EXAM_DT_T = cRsList.getString("REP_EXAM_DT");
			String EEA_PSNL_NM_T = cRsList.getString("EEA_PSNL_NM");
			String PFP_TRANC_DATE_T = cRsList.getString("PFP_TRANC_DATE");
			String PFP_RESULT_DATE_T = cRsList.getString("PFP_RESULT_DATE");
			String PFP_DOCTORFIR_T = cRsList.getString("PFP_DOCTORFIR");
			String PFP_FIX_YN_T = cRsList.getString("PFP_FIX_YN");
			String ICR_PID_EN_T = cRsList.getString("ICR_PID_EN");
			String ICR_PENL_ID_T = cRsList.getString("ICR_PENL_ID");
			String EEA_CNTR_CD_T = cRsList.getString("EEA_CNTR_CD");
			String DEFINCD_T = cRsList.getString("DEFINCD");
%>
			<z:row
<%
			if(! EEA_MNGT_HTYR_T.equals("")) {
%>
		 		EEA_MNGT_HTYR='<%= EEA_MNGT_HTYR_T%>'
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

			if(! REP_EXAM_DT_T.equals("")) {
%>
		 		REP_EXAM_DT='<%= REP_EXAM_DT_T%>'
<%
			}

			if(! EEA_PSNL_NM_T.equals("")) {
%>
		 		EEA_PSNL_NM='<%= EEA_PSNL_NM_T%>'
<%
			}

			if(! PFP_TRANC_DATE_T.equals("")) {
%>
		 		PFP_TRANC_DATE='<%= PFP_TRANC_DATE_T%>'
<%
			}

			if(! PFP_RESULT_DATE_T.equals("")) {
%>
		 		PFP_RESULT_DATE='<%= PFP_RESULT_DATE_T%>'
<%
			}

			if(! PFP_DOCTORFIR_T.equals("")) {
%>
		 		PFP_DOCTORFIR='<%= PFP_DOCTORFIR_T%>'
<%
			}

			if(! PFP_FIX_YN_T.equals("")) {
%>
		 		PFP_FIX_YN='<%= PFP_FIX_YN_T%>'
<%
			}

			if(! ICR_PID_EN_T.equals("")) {
%>
		 		ICR_PID_EN='<%= ICR_PID_EN_T%>'
<%
			}

			if(! ICR_PENL_ID_T.equals("")) {
%>
		 		ICR_PENL_ID='<%= ICR_PENL_ID_T%>'
<%
			}

			if(! EEA_CNTR_CD_T.equals("")) {
%>
		 		EEA_CNTR_CD='<%= EEA_CNTR_CD_T%>'
<%
			}

			if(! DEFINCD_T.equals("")) {
%>
		 		DEFINCD='<%= DEFINCD_T%>'
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
