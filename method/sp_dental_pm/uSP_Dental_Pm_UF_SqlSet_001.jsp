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

		String MNGT_SPYM = htMethod.get("MNGT_SPYM");
		String SEXAM_DT = htMethod.get("SEXAM_DT");
		String EEXAM_DT = htMethod.get("EEXAM_DT");
		String SSQL_ADD = htMethod.get("SSQL_ADD");

		//
		if(MNGT_SPYM == null) { MNGT_SPYM = ""; }
		if(SEXAM_DT == null) { SEXAM_DT = ""; }
		if(EEXAM_DT == null) { EEXAM_DT = ""; }
		if(SSQL_ADD == null) { SSQL_ADD = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT A.EEA_EXAM_DT, A.EEA_EXAM_SQ, A.EEA_CHART_NO, A.EEA_SEX_CD, A.EEA_PSNL_NM, B.ICR_PENL_ID, A.EEA_PSNL_AGE, A.EEA_COMP_CD, A.EEA_DEPT_NM,
       CASE WHEN A.EEA_SEX_CD  IS NULL OR A.EEA_SEX_CD  = '' THEN A.EEA_SEX_CD  else GetCOMMON_LvCdToNm('0411',A.EEA_SEX_CD ,'5',1) END EEA_SEX_NM,
       CASE WHEN A.EEA_SPCL_CD IS NULL OR A.EEA_SPCL_CD = '' THEN A.EEA_SPCL_CD else '[' || A.EEA_SPCL_CD || ']' || GetCOMMON_LvCdToNm('0910',A.EEA_SPCL_CD,'5',2) END EEA_SPCL_NM,
       CASE WHEN A.EEA_EXAM_CD = '41001' OR A.EEA_SPSB_YN = 'Y' THEN '1' ELSE '2' END EEA_SPCH_KD,
       C.ICY_COMP_NM, D.ERI_RSLT_VL, D.ERI_SPRT_CD, GetCOMMON_LvCdToNm('0212',SDP_HOSP_CD, '5',2) SDP_HOSP_NM, SBE_DDOC_CD, F_USER_FIND(SBE_DDOC_CD) SBE_DDOC_NM, E.*
  FROM ET_EXAM_ACPT A INNER JOIN IT_CUSTOMER     B ON A.EEA_CUST_NO = B.ICR_CUST_NO
                      INNER JOIN ET_RSLT_ITEM    D ON A.EEA_EXAM_DT = D.ERI_EXAM_DT AND A.EEA_EXAM_SQ = D.ERI_EXAM_SQ AND D.ERI_ITEM_CD = 'S0020' AND D.ERI_CNCL_YN = 'N'
                                   LEFT OUTER JOIN IT_COMPANY C ON A.EEA_COMP_CD = C.ICY_COMP_CD
                      LEFT OUTER JOIN ST_DENTAL  E ON A.EEA_EXAM_DT = E.SDP_EXAM_DT AND A.EEA_EXAM_SQ = E.SDP_EXAM_SQ
                      LEFT OUTER JOIN ST_BASE    F ON A.EEA_EXAM_DT = F.SBE_EXAM_DT AND A.EEA_EXAM_SQ = F.SBE_EXAM_SQ
 WHERE 0=0
 AND SUBSTR(A.EEA_MNGT_SPYM,1,4) = :MNGT_SPYM
 AND A.EEA_EXAM_DT >= :sEXAM_DT
 AND A.EEA_EXAM_DT <= :eEXAM_DT
 AND A.EEA_ORDER_YN <> 'C'
 || :sSQL_ADD
		*/

		sql = " SELECT A.EEA_EXAM_DT, A.EEA_EXAM_SQ, A.EEA_CHART_NO, A.EEA_SEX_CD, A.EEA_PSNL_NM, B.ICR_PENL_ID, A.EEA_PSNL_AGE, A.EEA_COMP_CD, A.EEA_DEPT_NM";
		sql += ", CASE WHEN A.EEA_SEX_CD IS NULL OR A.EEA_SEX_CD = '' THEN A.EEA_SEX_CD ELSE GETCOMMON_LVCDTONM('0411',A.EEA_SEX_CD ,'5',1) END EEA_SEX_NM";
		sql += ", CASE WHEN A.EEA_SPCL_CD IS NULL OR A.EEA_SPCL_CD = '' THEN A.EEA_SPCL_CD ELSE '[' || A.EEA_SPCL_CD || ']' || GETCOMMON_LVCDTONM('0910',A.EEA_SPCL_CD,'5',2) END EEA_SPCL_NM";
		sql += ", CASE WHEN A.EEA_EXAM_CD = '41001' OR A.EEA_SPSB_YN = 'Y' THEN '1' ELSE '2' END EEA_SPCH_KD";
		sql += ", C.ICY_COMP_NM, D.ERI_RSLT_VL, D.ERI_SPRT_CD, GETCOMMON_LVCDTONM('0212',SDP_HOSP_CD, '5',2) SDP_HOSP_NM, SBE_DDOC_CD, F_USER_FIND(SBE_DDOC_CD) SBE_DDOC_NM, E.*";

		sql += " FROM ET_EXAM_ACPT A INNER JOIN IT_CUSTOMER B";
		sql += " ON A.EEA_CUST_NO = B.ICR_CUST_NO";
		
		sql += " INNER JOIN ET_RSLT_ITEM D";
		sql += " ON A.EEA_EXAM_DT = D.ERI_EXAM_DT";
		sql += " AND A.EEA_EXAM_SQ = D.ERI_EXAM_SQ";
		sql += " AND D.ERI_ITEM_CD = 'S0020'";
		sql += " AND D.ERI_CNCL_YN = 'N'";
		
		sql += " LEFT OUTER JOIN IT_COMPANY C";
		sql += " ON A.EEA_COMP_CD = C.ICY_COMP_CD";
		
		sql += " LEFT OUTER JOIN ST_DENTAL E";
		sql += " ON A.EEA_EXAM_DT = E.SDP_EXAM_DT";
		sql += " AND A.EEA_EXAM_SQ = E.SDP_EXAM_SQ";
		
		sql += " LEFT OUTER JOIN ST_BASE F";
		sql += " ON A.EEA_EXAM_DT = F.SBE_EXAM_DT";
		sql += " AND A.EEA_EXAM_SQ = F.SBE_EXAM_SQ";

		sql += " WHERE 0=0";
		sql += " AND SUBSTR(A.EEA_MNGT_SPYM,1,4) = '" + MNGT_SPYM + "'";
		sql += " AND A.EEA_EXAM_DT >= '" + SEXAM_DT + "'";
		sql += " AND A.EEA_EXAM_DT <= '" + EEXAM_DT + "'";
		sql += " AND A.EEA_ORDER_YN <> 'C' ";

		sql += SSQL_ADD;
			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uSP_Dental_Pm_UF_SqlSet_001 \n";
			G_INFO += "설명 : 치아검사 대상자 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " MNGT_SPYM : " + MNGT_SPYM + " \n";
			G_INFO += " SEXAM_DT : " + SEXAM_DT + " \n";
			G_INFO += " EEXAM_DT : " + EEXAM_DT + " \n";
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
		<s:AttributeType name='EEA_EXAM_DT' rs:number='1' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_EXAM_DT'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_EXAM_SQ' rs:number='2' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_EXAM_SQ'>
			<s:datatype dt:type='string' dt:maxLength='6' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_CHART_NO' rs:number='3' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_CHART_NO'>
			<s:datatype dt:type='string' dt:maxLength='30'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SEX_CD' rs:number='4' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_SEX_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_PSNL_NM' rs:number='5' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_PSNL_NM'>
			<s:datatype dt:type='string' dt:maxLength='100' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_PENL_ID' rs:number='6' rs:writeunknown='true' rs:basetable='IT_CUSTOMER' rs:basecolumn='ICR_PENL_ID'>
			<s:datatype dt:type='string' dt:maxLength='13' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_PSNL_AGE' rs:number='7' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_PSNL_AGE'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='38' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_COMP_CD' rs:number='8' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_COMP_CD'>
			<s:datatype dt:type='string' dt:maxLength='12'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_DEPT_NM' rs:number='9' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_DEPT_NM'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SEX_NM' rs:number='10' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SPCL_NM' rs:number='11' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SPCH_KD' rs:number='12' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_COMP_NM' rs:number='13' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_RSLT_VL' rs:number='14' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_RSLT_ITEM'
			 rs:basecolumn='ERI_RSLT_VL'>
			<s:datatype dt:type='string' dt:maxLength='50'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_SPRT_CD' rs:number='15' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_RSLT_ITEM'
			 rs:basecolumn='ERI_SPRT_CD'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='SDP_HOSP_NM' rs:number='16' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='SBE_DDOC_CD' rs:number='17' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_BASE'
			 rs:basecolumn='SBE_DDOC_CD'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='SBE_DDOC_NM' rs:number='18' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='SDP_EXAM_DT' rs:number='19' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_DENTAL'
			 rs:basecolumn='SDP_EXAM_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='SDP_EXAM_SQ' rs:number='20' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_DENTAL'
			 rs:basecolumn='SDP_EXAM_SQ'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='SDP_EXAM_CHA' rs:number='21' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_DENTAL'
			 rs:basecolumn='SDP_EXAM_CHA'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='SDP_GUL7_YN' rs:number='22' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_DENTAL'
			 rs:basecolumn='SDP_GUL7_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='SDP_GUL6_YN' rs:number='23' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_DENTAL'
			 rs:basecolumn='SDP_GUL6_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='SDP_GUL5_YN' rs:number='24' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_DENTAL'
			 rs:basecolumn='SDP_GUL5_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='SDP_GUL4_YN' rs:number='25' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_DENTAL'
			 rs:basecolumn='SDP_GUL4_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='SDP_GUL3_YN' rs:number='26' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_DENTAL'
			 rs:basecolumn='SDP_GUL3_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='SDP_GUL2_YN' rs:number='27' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_DENTAL'
			 rs:basecolumn='SDP_GUL2_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='SDP_GUL1_YN' rs:number='28' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_DENTAL'
			 rs:basecolumn='SDP_GUL1_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='SDP_GUR1_YN' rs:number='29' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_DENTAL'
			 rs:basecolumn='SDP_GUR1_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='SDP_GUR2_YN' rs:number='30' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_DENTAL'
			 rs:basecolumn='SDP_GUR2_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='SDP_GUR3_YN' rs:number='31' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_DENTAL'
			 rs:basecolumn='SDP_GUR3_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='SDP_GUR4_YN' rs:number='32' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_DENTAL'
			 rs:basecolumn='SDP_GUR4_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='SDP_GUR5_YN' rs:number='33' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_DENTAL'
			 rs:basecolumn='SDP_GUR5_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='SDP_GUR6_YN' rs:number='34' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_DENTAL'
			 rs:basecolumn='SDP_GUR6_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='SDP_GUR7_YN' rs:number='35' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_DENTAL'
			 rs:basecolumn='SDP_GUR7_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='SDP_GUR8_YN' rs:number='36' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_DENTAL'
			 rs:basecolumn='SDP_GUR8_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='SDP_GDL7_YN' rs:number='37' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_DENTAL'
			 rs:basecolumn='SDP_GDL7_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='SDP_GDL6_YN' rs:number='38' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_DENTAL'
			 rs:basecolumn='SDP_GDL6_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='SDP_GDL5_YN' rs:number='39' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_DENTAL'
			 rs:basecolumn='SDP_GDL5_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='SDP_GDL4_YN' rs:number='40' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_DENTAL'
			 rs:basecolumn='SDP_GDL4_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='SDP_GDL3_YN' rs:number='41' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_DENTAL'
			 rs:basecolumn='SDP_GDL3_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='SDP_GDL2_YN' rs:number='42' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_DENTAL'
			 rs:basecolumn='SDP_GDL2_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='SDP_GDL1_YN' rs:number='43' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_DENTAL'
			 rs:basecolumn='SDP_GDL1_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='SDP_GDR1_YN' rs:number='44' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_DENTAL'
			 rs:basecolumn='SDP_GDR1_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='SDP_GDR2_YN' rs:number='45' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_DENTAL'
			 rs:basecolumn='SDP_GDR2_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='SDP_GDR3_YN' rs:number='46' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_DENTAL'
			 rs:basecolumn='SDP_GDR3_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='SDP_GDR4_YN' rs:number='47' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_DENTAL'
			 rs:basecolumn='SDP_GDR4_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='SDP_GDR5_YN' rs:number='48' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_DENTAL'
			 rs:basecolumn='SDP_GDR5_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='SDP_GDR6_YN' rs:number='49' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_DENTAL'
			 rs:basecolumn='SDP_GDR6_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='SDP_GDR7_YN' rs:number='50' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_DENTAL'
			 rs:basecolumn='SDP_GDR7_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='SDP_GDR8_YN' rs:number='51' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_DENTAL'
			 rs:basecolumn='SDP_GDR8_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='SDP_BUL_YN' rs:number='52' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_DENTAL'
			 rs:basecolumn='SDP_BUL_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='SDP_BUF_YN' rs:number='53' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_DENTAL'
			 rs:basecolumn='SDP_BUF_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='SDP_BUR_YN' rs:number='54' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_DENTAL'
			 rs:basecolumn='SDP_BUR_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='SDP_BDL_YN' rs:number='55' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_DENTAL'
			 rs:basecolumn='SDP_BDL_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='SDP_BDF_YN' rs:number='56' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_DENTAL'
			 rs:basecolumn='SDP_BDF_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='SDP_BDR_YN' rs:number='57' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_DENTAL'
			 rs:basecolumn='SDP_BDR_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='SDP_BRSLT_TX' rs:number='58' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_DENTAL'
			 rs:basecolumn='SDP_BRSLT_TX'>
			<s:datatype dt:type='string' dt:maxLength='500'/>
		</s:AttributeType>
		<s:AttributeType name='SDP_DE0_YN' rs:number='59' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_DENTAL'
			 rs:basecolumn='SDP_DE0_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='SDP_DE1_YN' rs:number='60' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_DENTAL'
			 rs:basecolumn='SDP_DE1_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='SDP_DE2_YN' rs:number='61' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_DENTAL'
			 rs:basecolumn='SDP_DE2_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='SDP_DE3_YN' rs:number='62' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_DENTAL'
			 rs:basecolumn='SDP_DE3_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='SDP_DE4_YN' rs:number='63' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_DENTAL'
			 rs:basecolumn='SDP_DE4_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='SDP_DE5_YN' rs:number='64' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_DENTAL'
			 rs:basecolumn='SDP_DE5_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='SDP_PT0_YN' rs:number='65' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_DENTAL'
			 rs:basecolumn='SDP_PT0_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='SDP_PT1_YN' rs:number='66' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_DENTAL'
			 rs:basecolumn='SDP_PT1_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='SDP_PT2_YN' rs:number='67' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_DENTAL'
			 rs:basecolumn='SDP_PT2_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='SDP_PT3_YN' rs:number='68' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_DENTAL'
			 rs:basecolumn='SDP_PT3_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='SDP_PT4_YN' rs:number='69' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_DENTAL'
			 rs:basecolumn='SDP_PT4_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='SDP_P0_YN' rs:number='70' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_DENTAL'
			 rs:basecolumn='SDP_P0_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='SDP_P1_YN' rs:number='71' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_DENTAL'
			 rs:basecolumn='SDP_P1_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='SDP_P2_YN' rs:number='72' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_DENTAL'
			 rs:basecolumn='SDP_P2_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='SDP_P3_YN' rs:number='73' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_DENTAL'
			 rs:basecolumn='SDP_P3_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='SDP_P4_YN' rs:number='74' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_DENTAL'
			 rs:basecolumn='SDP_P4_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='SDP_P5_YN' rs:number='75' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_DENTAL'
			 rs:basecolumn='SDP_P5_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='SDP_P5_ETC' rs:number='76' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_DENTAL'
			 rs:basecolumn='SDP_P5_ETC'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='SDP_DENT_DT' rs:number='77' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_DENTAL'
			 rs:basecolumn='SDP_DENT_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='SDP_HOSP_CD' rs:number='78' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_DENTAL'
			 rs:basecolumn='SDP_HOSP_CD'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='SDP_INPT_ID' rs:number='79' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_DENTAL'
			 rs:basecolumn='SDP_INPT_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='SDP_INPT_DTT' rs:number='80' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_DENTAL'
			 rs:basecolumn='SDP_INPT_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='SDP_MODI_ID' rs:number='81' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_DENTAL'
			 rs:basecolumn='SDP_MODI_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='SDP_MODI_DTT' rs:number='82' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_DENTAL'
			 rs:basecolumn='SDP_MODI_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='83' rs:rowid='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c83' rs:name='ROWID' rs:number='84' rs:rowid='true' rs:basetable='IT_CUSTOMER' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c84' rs:name='ROWID' rs:number='85' rs:rowid='true' rs:basetable='ET_RSLT_ITEM' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c85' rs:name='ROWID' rs:number='86' rs:rowid='true' rs:basetable='IT_COMPANY' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c86' rs:name='ROWID' rs:number='87' rs:rowid='true' rs:basetable='ST_DENTAL' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c87' rs:name='ROWID' rs:number='88' rs:rowid='true' rs:basetable='ST_BASE' rs:basecolumn='ROWID'
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

			String EEA_EXAM_DT_T = cRsList.getString("EEA_EXAM_DT");
			String EEA_EXAM_SQ_T = cRsList.getString("EEA_EXAM_SQ");
			String EEA_CHART_NO_T = cRsList.getString("EEA_CHART_NO");
			String EEA_SEX_CD_T = cRsList.getString("EEA_SEX_CD");
			String EEA_PSNL_NM_T = cRsList.getString("EEA_PSNL_NM");
			String ICR_PENL_ID_T = cRsList.getString("ICR_PENL_ID");
			String EEA_PSNL_AGE_T = cRsList.getString("EEA_PSNL_AGE");
			String EEA_COMP_CD_T = cRsList.getString("EEA_COMP_CD");
			String EEA_DEPT_NM_T = cRsList.getString("EEA_DEPT_NM");
			String EEA_SEX_NM_T = cRsList.getString("EEA_SEX_NM");
			String EEA_SPCL_NM_T = cRsList.getString("EEA_SPCL_NM");
			String EEA_SPCH_KD_T = cRsList.getString("EEA_SPCH_KD");
			String ICY_COMP_NM_T = cRsList.getString("ICY_COMP_NM");
			String ERI_RSLT_VL_T = cRsList.getString("ERI_RSLT_VL");
			String ERI_SPRT_CD_T = cRsList.getString("ERI_SPRT_CD");
			String SDP_HOSP_NM_T = cRsList.getString("SDP_HOSP_NM");
			String SBE_DDOC_CD_T = cRsList.getString("SBE_DDOC_CD");
			String SBE_DDOC_NM_T = cRsList.getString("SBE_DDOC_NM");
			String SDP_EXAM_DT_T = cRsList.getString("SDP_EXAM_DT");
			String SDP_EXAM_SQ_T = cRsList.getString("SDP_EXAM_SQ");
			String SDP_EXAM_CHA_T = cRsList.getString("SDP_EXAM_CHA");
			String SDP_GUL7_YN_T = cRsList.getString("SDP_GUL7_YN");
			String SDP_GUL6_YN_T = cRsList.getString("SDP_GUL6_YN");
			String SDP_GUL5_YN_T = cRsList.getString("SDP_GUL5_YN");
			String SDP_GUL4_YN_T = cRsList.getString("SDP_GUL4_YN");
			String SDP_GUL3_YN_T = cRsList.getString("SDP_GUL3_YN");
			String SDP_GUL2_YN_T = cRsList.getString("SDP_GUL2_YN");
			String SDP_GUL1_YN_T = cRsList.getString("SDP_GUL1_YN");
			String SDP_GUR1_YN_T = cRsList.getString("SDP_GUR1_YN");
			String SDP_GUR2_YN_T = cRsList.getString("SDP_GUR2_YN");
			String SDP_GUR3_YN_T = cRsList.getString("SDP_GUR3_YN");
			String SDP_GUR4_YN_T = cRsList.getString("SDP_GUR4_YN");
			String SDP_GUR5_YN_T = cRsList.getString("SDP_GUR5_YN");
			String SDP_GUR6_YN_T = cRsList.getString("SDP_GUR6_YN");
			String SDP_GUR7_YN_T = cRsList.getString("SDP_GUR7_YN");
			String SDP_GUR8_YN_T = cRsList.getString("SDP_GUR8_YN");
			String SDP_GDL7_YN_T = cRsList.getString("SDP_GDL7_YN");
			String SDP_GDL6_YN_T = cRsList.getString("SDP_GDL6_YN");
			String SDP_GDL5_YN_T = cRsList.getString("SDP_GDL5_YN");
			String SDP_GDL4_YN_T = cRsList.getString("SDP_GDL4_YN");
			String SDP_GDL3_YN_T = cRsList.getString("SDP_GDL3_YN");
			String SDP_GDL2_YN_T = cRsList.getString("SDP_GDL2_YN");
			String SDP_GDL1_YN_T = cRsList.getString("SDP_GDL1_YN");
			String SDP_GDR1_YN_T = cRsList.getString("SDP_GDR1_YN");
			String SDP_GDR2_YN_T = cRsList.getString("SDP_GDR2_YN");
			String SDP_GDR3_YN_T = cRsList.getString("SDP_GDR3_YN");
			String SDP_GDR4_YN_T = cRsList.getString("SDP_GDR4_YN");
			String SDP_GDR5_YN_T = cRsList.getString("SDP_GDR5_YN");
			String SDP_GDR6_YN_T = cRsList.getString("SDP_GDR6_YN");
			String SDP_GDR7_YN_T = cRsList.getString("SDP_GDR7_YN");
			String SDP_GDR8_YN_T = cRsList.getString("SDP_GDR8_YN");
			String SDP_BUL_YN_T = cRsList.getString("SDP_BUL_YN");
			String SDP_BUF_YN_T = cRsList.getString("SDP_BUF_YN");
			String SDP_BUR_YN_T = cRsList.getString("SDP_BUR_YN");
			String SDP_BDL_YN_T = cRsList.getString("SDP_BDL_YN");
			String SDP_BDF_YN_T = cRsList.getString("SDP_BDF_YN");
			String SDP_BDR_YN_T = cRsList.getString("SDP_BDR_YN");
			String SDP_BRSLT_TX_T = cRsList.getString("SDP_BRSLT_TX");
			String SDP_DE0_YN_T = cRsList.getString("SDP_DE0_YN");
			String SDP_DE1_YN_T = cRsList.getString("SDP_DE1_YN");
			String SDP_DE2_YN_T = cRsList.getString("SDP_DE2_YN");
			String SDP_DE3_YN_T = cRsList.getString("SDP_DE3_YN");
			String SDP_DE4_YN_T = cRsList.getString("SDP_DE4_YN");
			String SDP_DE5_YN_T = cRsList.getString("SDP_DE5_YN");
			String SDP_PT0_YN_T = cRsList.getString("SDP_PT0_YN");
			String SDP_PT1_YN_T = cRsList.getString("SDP_PT1_YN");
			String SDP_PT2_YN_T = cRsList.getString("SDP_PT2_YN");
			String SDP_PT3_YN_T = cRsList.getString("SDP_PT3_YN");
			String SDP_PT4_YN_T = cRsList.getString("SDP_PT4_YN");
			String SDP_P0_YN_T = cRsList.getString("SDP_P0_YN");
			String SDP_P1_YN_T = cRsList.getString("SDP_P1_YN");
			String SDP_P2_YN_T = cRsList.getString("SDP_P2_YN");
			String SDP_P3_YN_T = cRsList.getString("SDP_P3_YN");
			String SDP_P4_YN_T = cRsList.getString("SDP_P4_YN");
			String SDP_P5_YN_T = cRsList.getString("SDP_P5_YN");
			String SDP_P5_ETC_T = cRsList.getString("SDP_P5_ETC");
			String SDP_DENT_DT_T = cRsList.getString("SDP_DENT_DT");
			String SDP_HOSP_CD_T = cRsList.getString("SDP_HOSP_CD");
			String SDP_INPT_ID_T = cRsList.getString("SDP_INPT_ID");
			String SDP_INPT_DTT_T = cRsList.getDate2("SDP_INPT_DTT");
			String SDP_MODI_ID_T = cRsList.getString("SDP_MODI_ID");
			String SDP_MODI_DTT_T = cRsList.getDate2("SDP_MODI_DTT");
			String ROWID_T = cRsList.getString("ROWID");
			String c83_T = cRsList.getString("c83");
			String c84_T = cRsList.getString("c84");
			String c85_T = cRsList.getString("c85");
			String c86_T = cRsList.getString("c86");
			String c87_T = cRsList.getString("c87");
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

			if(! EEA_CHART_NO_T.equals("")) {
%>
		 		EEA_CHART_NO='<%= EEA_CHART_NO_T%>'
<%
			}

			if(! EEA_SEX_CD_T.equals("")) {
%>
		 		EEA_SEX_CD='<%= EEA_SEX_CD_T%>'
<%
			}

			if(! EEA_PSNL_NM_T.equals("")) {
%>
		 		EEA_PSNL_NM='<%= EEA_PSNL_NM_T%>'
<%
			}

			if(! ICR_PENL_ID_T.equals("")) {
%>
		 		ICR_PENL_ID='<%= ICR_PENL_ID_T%>'
<%
			}

			if(! EEA_PSNL_AGE_T.equals("")) {
%>
		 		EEA_PSNL_AGE='<%= EEA_PSNL_AGE_T%>'
<%
			}

			if(! EEA_COMP_CD_T.equals("")) {
%>
		 		EEA_COMP_CD='<%= EEA_COMP_CD_T%>'
<%
			}

			if(! EEA_DEPT_NM_T.equals("")) {
%>
		 		EEA_DEPT_NM='<%= EEA_DEPT_NM_T%>'
<%
			}

			if(! EEA_SEX_NM_T.equals("")) {
%>
		 		EEA_SEX_NM='<%= EEA_SEX_NM_T%>'
<%
			}

			if(! EEA_SPCL_NM_T.equals("")) {
%>
		 		EEA_SPCL_NM='<%= EEA_SPCL_NM_T%>'
<%
			}

			if(! EEA_SPCH_KD_T.equals("")) {
%>
		 		EEA_SPCH_KD='<%= EEA_SPCH_KD_T%>'
<%
			}

			if(! ICY_COMP_NM_T.equals("")) {
%>
		 		ICY_COMP_NM='<%= ICY_COMP_NM_T%>'
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

			if(! SDP_HOSP_NM_T.equals("")) {
%>
		 		SDP_HOSP_NM='<%= SDP_HOSP_NM_T%>'
<%
			}

			if(! SBE_DDOC_CD_T.equals("")) {
%>
		 		SBE_DDOC_CD='<%= SBE_DDOC_CD_T%>'
<%
			}

			if(! SBE_DDOC_NM_T.equals("")) {
%>
		 		SBE_DDOC_NM='<%= SBE_DDOC_NM_T%>'
<%
			}

			if(! SDP_EXAM_DT_T.equals("")) {
%>
		 		SDP_EXAM_DT='<%= SDP_EXAM_DT_T%>'
<%
			}

			if(! SDP_EXAM_SQ_T.equals("")) {
%>
		 		SDP_EXAM_SQ='<%= SDP_EXAM_SQ_T%>'
<%
			}

			if(! SDP_EXAM_CHA_T.equals("")) {
%>
		 		SDP_EXAM_CHA='<%= SDP_EXAM_CHA_T%>'
<%
			}

			if(! SDP_GUL7_YN_T.equals("")) {
%>
		 		SDP_GUL7_YN='<%= SDP_GUL7_YN_T%>'
<%
			}

			if(! SDP_GUL6_YN_T.equals("")) {
%>
		 		SDP_GUL6_YN='<%= SDP_GUL6_YN_T%>'
<%
			}

			if(! SDP_GUL5_YN_T.equals("")) {
%>
		 		SDP_GUL5_YN='<%= SDP_GUL5_YN_T%>'
<%
			}

			if(! SDP_GUL4_YN_T.equals("")) {
%>
		 		SDP_GUL4_YN='<%= SDP_GUL4_YN_T%>'
<%
			}

			if(! SDP_GUL3_YN_T.equals("")) {
%>
		 		SDP_GUL3_YN='<%= SDP_GUL3_YN_T%>'
<%
			}

			if(! SDP_GUL2_YN_T.equals("")) {
%>
		 		SDP_GUL2_YN='<%= SDP_GUL2_YN_T%>'
<%
			}

			if(! SDP_GUL1_YN_T.equals("")) {
%>
		 		SDP_GUL1_YN='<%= SDP_GUL1_YN_T%>'
<%
			}

			if(! SDP_GUR1_YN_T.equals("")) {
%>
		 		SDP_GUR1_YN='<%= SDP_GUR1_YN_T%>'
<%
			}

			if(! SDP_GUR2_YN_T.equals("")) {
%>
		 		SDP_GUR2_YN='<%= SDP_GUR2_YN_T%>'
<%
			}

			if(! SDP_GUR3_YN_T.equals("")) {
%>
		 		SDP_GUR3_YN='<%= SDP_GUR3_YN_T%>'
<%
			}

			if(! SDP_GUR4_YN_T.equals("")) {
%>
		 		SDP_GUR4_YN='<%= SDP_GUR4_YN_T%>'
<%
			}

			if(! SDP_GUR5_YN_T.equals("")) {
%>
		 		SDP_GUR5_YN='<%= SDP_GUR5_YN_T%>'
<%
			}

			if(! SDP_GUR6_YN_T.equals("")) {
%>
		 		SDP_GUR6_YN='<%= SDP_GUR6_YN_T%>'
<%
			}

			if(! SDP_GUR7_YN_T.equals("")) {
%>
		 		SDP_GUR7_YN='<%= SDP_GUR7_YN_T%>'
<%
			}

			if(! SDP_GUR8_YN_T.equals("")) {
%>
		 		SDP_GUR8_YN='<%= SDP_GUR8_YN_T%>'
<%
			}

			if(! SDP_GDL7_YN_T.equals("")) {
%>
		 		SDP_GDL7_YN='<%= SDP_GDL7_YN_T%>'
<%
			}

			if(! SDP_GDL6_YN_T.equals("")) {
%>
		 		SDP_GDL6_YN='<%= SDP_GDL6_YN_T%>'
<%
			}

			if(! SDP_GDL5_YN_T.equals("")) {
%>
		 		SDP_GDL5_YN='<%= SDP_GDL5_YN_T%>'
<%
			}

			if(! SDP_GDL4_YN_T.equals("")) {
%>
		 		SDP_GDL4_YN='<%= SDP_GDL4_YN_T%>'
<%
			}

			if(! SDP_GDL3_YN_T.equals("")) {
%>
		 		SDP_GDL3_YN='<%= SDP_GDL3_YN_T%>'
<%
			}

			if(! SDP_GDL2_YN_T.equals("")) {
%>
		 		SDP_GDL2_YN='<%= SDP_GDL2_YN_T%>'
<%
			}

			if(! SDP_GDL1_YN_T.equals("")) {
%>
		 		SDP_GDL1_YN='<%= SDP_GDL1_YN_T%>'
<%
			}

			if(! SDP_GDR1_YN_T.equals("")) {
%>
		 		SDP_GDR1_YN='<%= SDP_GDR1_YN_T%>'
<%
			}

			if(! SDP_GDR2_YN_T.equals("")) {
%>
		 		SDP_GDR2_YN='<%= SDP_GDR2_YN_T%>'
<%
			}

			if(! SDP_GDR3_YN_T.equals("")) {
%>
		 		SDP_GDR3_YN='<%= SDP_GDR3_YN_T%>'
<%
			}

			if(! SDP_GDR4_YN_T.equals("")) {
%>
		 		SDP_GDR4_YN='<%= SDP_GDR4_YN_T%>'
<%
			}

			if(! SDP_GDR5_YN_T.equals("")) {
%>
		 		SDP_GDR5_YN='<%= SDP_GDR5_YN_T%>'
<%
			}

			if(! SDP_GDR6_YN_T.equals("")) {
%>
		 		SDP_GDR6_YN='<%= SDP_GDR6_YN_T%>'
<%
			}

			if(! SDP_GDR7_YN_T.equals("")) {
%>
		 		SDP_GDR7_YN='<%= SDP_GDR7_YN_T%>'
<%
			}

			if(! SDP_GDR8_YN_T.equals("")) {
%>
		 		SDP_GDR8_YN='<%= SDP_GDR8_YN_T%>'
<%
			}

			if(! SDP_BUL_YN_T.equals("")) {
%>
		 		SDP_BUL_YN='<%= SDP_BUL_YN_T%>'
<%
			}

			if(! SDP_BUF_YN_T.equals("")) {
%>
		 		SDP_BUF_YN='<%= SDP_BUF_YN_T%>'
<%
			}

			if(! SDP_BUR_YN_T.equals("")) {
%>
		 		SDP_BUR_YN='<%= SDP_BUR_YN_T%>'
<%
			}

			if(! SDP_BDL_YN_T.equals("")) {
%>
		 		SDP_BDL_YN='<%= SDP_BDL_YN_T%>'
<%
			}

			if(! SDP_BDF_YN_T.equals("")) {
%>
		 		SDP_BDF_YN='<%= SDP_BDF_YN_T%>'
<%
			}

			if(! SDP_BDR_YN_T.equals("")) {
%>
		 		SDP_BDR_YN='<%= SDP_BDR_YN_T%>'
<%
			}

			if(! SDP_BRSLT_TX_T.equals("")) {
%>
		 		SDP_BRSLT_TX='<%= SDP_BRSLT_TX_T%>'
<%
			}

			if(! SDP_DE0_YN_T.equals("")) {
%>
		 		SDP_DE0_YN='<%= SDP_DE0_YN_T%>'
<%
			}

			if(! SDP_DE1_YN_T.equals("")) {
%>
		 		SDP_DE1_YN='<%= SDP_DE1_YN_T%>'
<%
			}

			if(! SDP_DE2_YN_T.equals("")) {
%>
		 		SDP_DE2_YN='<%= SDP_DE2_YN_T%>'
<%
			}

			if(! SDP_DE3_YN_T.equals("")) {
%>
		 		SDP_DE3_YN='<%= SDP_DE3_YN_T%>'
<%
			}

			if(! SDP_DE4_YN_T.equals("")) {
%>
		 		SDP_DE4_YN='<%= SDP_DE4_YN_T%>'
<%
			}

			if(! SDP_DE5_YN_T.equals("")) {
%>
		 		SDP_DE5_YN='<%= SDP_DE5_YN_T%>'
<%
			}

			if(! SDP_PT0_YN_T.equals("")) {
%>
		 		SDP_PT0_YN='<%= SDP_PT0_YN_T%>'
<%
			}

			if(! SDP_PT1_YN_T.equals("")) {
%>
		 		SDP_PT1_YN='<%= SDP_PT1_YN_T%>'
<%
			}

			if(! SDP_PT2_YN_T.equals("")) {
%>
		 		SDP_PT2_YN='<%= SDP_PT2_YN_T%>'
<%
			}

			if(! SDP_PT3_YN_T.equals("")) {
%>
		 		SDP_PT3_YN='<%= SDP_PT3_YN_T%>'
<%
			}

			if(! SDP_PT4_YN_T.equals("")) {
%>
		 		SDP_PT4_YN='<%= SDP_PT4_YN_T%>'
<%
			}

			if(! SDP_P0_YN_T.equals("")) {
%>
		 		SDP_P0_YN='<%= SDP_P0_YN_T%>'
<%
			}

			if(! SDP_P1_YN_T.equals("")) {
%>
		 		SDP_P1_YN='<%= SDP_P1_YN_T%>'
<%
			}

			if(! SDP_P2_YN_T.equals("")) {
%>
		 		SDP_P2_YN='<%= SDP_P2_YN_T%>'
<%
			}

			if(! SDP_P3_YN_T.equals("")) {
%>
		 		SDP_P3_YN='<%= SDP_P3_YN_T%>'
<%
			}

			if(! SDP_P4_YN_T.equals("")) {
%>
		 		SDP_P4_YN='<%= SDP_P4_YN_T%>'
<%
			}

			if(! SDP_P5_YN_T.equals("")) {
%>
		 		SDP_P5_YN='<%= SDP_P5_YN_T%>'
<%
			}

			if(! SDP_P5_ETC_T.equals("")) {
%>
		 		SDP_P5_ETC='<%= SDP_P5_ETC_T%>'
<%
			}

			if(! SDP_DENT_DT_T.equals("")) {
%>
		 		SDP_DENT_DT='<%= SDP_DENT_DT_T%>'
<%
			}

			if(! SDP_HOSP_CD_T.equals("")) {
%>
		 		SDP_HOSP_CD='<%= SDP_HOSP_CD_T%>'
<%
			}

			if(! SDP_INPT_ID_T.equals("")) {
%>
		 		SDP_INPT_ID='<%= SDP_INPT_ID_T%>'
<%
			}

			if(! SDP_INPT_DTT_T.equals("")) {
%>
		 		SDP_INPT_DTT='<%= SDP_INPT_DTT_T%>'
<%
			}

			if(! SDP_MODI_ID_T.equals("")) {
%>
		 		SDP_MODI_ID='<%= SDP_MODI_ID_T%>'
<%
			}

			if(! SDP_MODI_DTT_T.equals("")) {
%>
		 		SDP_MODI_DTT='<%= SDP_MODI_DTT_T%>'
<%
			}
%>
				ROWID='<%= cnt%>'
				c83='<%= cnt%>'
				c84='<%= cnt%>'
				c85='<%= cnt%>'
				c86='<%= cnt%>'
				c87='<%= cnt%>'
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
