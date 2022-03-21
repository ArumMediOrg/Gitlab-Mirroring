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

		String COMP_CD = htMethod.get("COMP_CD");
		String MNGT_YR = htMethod.get("MNGT_YR");
		String CNRT_SQ = htMethod.get("CNRT_SQ");
		String PROF_SQ = htMethod.get("PROF_SQ");

		//
		if(COMP_CD == null) { COMP_CD = ""; }
		if(MNGT_YR == null) { MNGT_YR = ""; }
		if(CNRT_SQ == null) { CNRT_SQ = ""; }
		if(PROF_SQ == null) { PROF_SQ = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT GetCOMMON_LvCdToNm('0401',ECP_EXAM_CD,'2',5) ECP_EXAM_NM,
       GetCOMMON_LvCdToNm('0409',ECP_PYER_CD,'5',1) ECP_PYER_NM,
       GetCOMMON_LvCdToNm('0411',ECP_SEX_CD ,'5',1) ECP_SEX_NM,
       GetCOMMON_LvCdToNm('0407',ECP_CALC_CD,'5',1) ECP_CALC_NM,
       GetCOMMON_LvCdToNm('0402',ECP_HTPR_CD,'5',1) ECP_HTPR_NM,
       GetCOMMON_LvCdToNm('0403',ECP_SPPR_CD,'5',1) ECP_SPPR_NM,
       GetCOMMON_LvCdToNm('0403',ECP_CVPR_CD,'5',1) ECP_CVPR_NM,
       GetCOMMON_LvCdToNm('0403',ECP_ETPR_CD,'5',1) ECP_ETPR_NM,
       GetCOMMON_LvCdToNm('0403',ECP_EMPR_CD,'5',1) ECP_EMPR_NM,
       GetCOMMON_LvCdToNm('0405',ECP_CNCL_CD,'5',1) ECP_CNCL_NM,
       GetCOMMON_LvCdToNm('0913',ECP_CMPY_CD,'5',1) ECP_CMPY_NM,
       GetCOMMON_LvCdToNm('0410',ECP_ITKD_CD,'5',1) ECP_ITKD_NM,
       GetCOMMON_LvCdToNm('0914',ECP_PRPY_CD,'5',1) ECP_PRPY_NM, A.*
FROM ET_COMP_CNRT_PROF A
WHERE ECP_COMP_CD = :COMP_CD
  AND ECP_MNGT_YR = :MNGT_YR
  AND ECP_CNRT_SQ = :CNRT_SQ
  AND ECP_PROF_SQ = :PROF_SQ
		*/

		sql = " SELECT GETCOMMON_LVCDTONM('0401',ECP_EXAM_CD,'2',5) ECP_EXAM_NM, GETCOMMON_LVCDTONM('0409',ECP_PYER_CD,'5',1) ECP_PYER_NM, GETCOMMON_LVCDTONM('0411',ECP_SEX_CD ,'5',1) ECP_SEX_NM, GETCOMMON_LVCDTONM('0407',ECP_CALC_CD,'5',1) ECP_CALC_NM, GETCOMMON_LVCDTONM('0402',ECP_HTPR_CD,'5',1) ECP_HTPR_NM, GETCOMMON_LVCDTONM('0403',ECP_SPPR_CD,'5',1) ECP_SPPR_NM, GETCOMMON_LVCDTONM('0403',ECP_CVPR_CD,'5',1) ECP_CVPR_NM, GETCOMMON_LVCDTONM('0403',ECP_ETPR_CD,'5',1) ECP_ETPR_NM, GETCOMMON_LVCDTONM('0403',ECP_EMPR_CD,'5',1) ECP_EMPR_NM, GETCOMMON_LVCDTONM('0405',ECP_CNCL_CD,'5',1) ECP_CNCL_NM, GETCOMMON_LVCDTONM('0913',ECP_CMPY_CD,'5',1) ECP_CMPY_NM, GETCOMMON_LVCDTONM('0410',ECP_ITKD_CD,'5',1) ECP_ITKD_NM, GETCOMMON_LVCDTONM('0914',ECP_PRPY_CD,'5',1) ECP_PRPY_NM, A.*";
		sql += " FROM ET_COMP_CNRT_PROF A";
		sql += " WHERE ECP_COMP_CD = '" + COMP_CD + "'";
		sql += " AND ECP_MNGT_YR = '" + MNGT_YR + "'";
		sql += " AND ECP_CNRT_SQ = '" + CNRT_SQ + "'";
		sql += " AND ECP_PROF_SQ = '" + PROF_SQ + "'";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uCOMP_CNRT_Prt2_QRBand3BeforePrint_001 \n";
			G_INFO += "설명 : 게약 검진유형 정보 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " COMP_CD : " + COMP_CD + " \n";
			G_INFO += " MNGT_YR : " + MNGT_YR + " \n";
			G_INFO += " CNRT_SQ : " + CNRT_SQ + " \n";
			G_INFO += " PROF_SQ : " + PROF_SQ + " \n";
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
		<s:AttributeType name='ECP_EXAM_NM' rs:number='1' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='ECP_PYER_NM' rs:number='2' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='ECP_SEX_NM' rs:number='3' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='ECP_CALC_NM' rs:number='4' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='ECP_HTPR_NM' rs:number='5' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='ECP_SPPR_NM' rs:number='6' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='ECP_CVPR_NM' rs:number='7' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='ECP_ETPR_NM' rs:number='8' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='ECP_EMPR_NM' rs:number='9' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='ECP_CNCL_NM' rs:number='10' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='ECP_CMPY_NM' rs:number='11' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='ECP_ITKD_NM' rs:number='12' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='ECP_PRPY_NM' rs:number='13' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='ECP_COMP_CD' rs:number='14' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_PROF'
			 rs:basecolumn='ECP_COMP_CD'>
			<s:datatype dt:type='string' dt:maxLength='12' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ECP_MNGT_YR' rs:number='15' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_PROF'
			 rs:basecolumn='ECP_MNGT_YR'>
			<s:datatype dt:type='string' dt:maxLength='4' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ECP_CNRT_SQ' rs:number='16' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_PROF'
			 rs:basecolumn='ECP_CNRT_SQ'>
			<s:datatype dt:type='string' dt:maxLength='2' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ECP_PROF_SQ' rs:number='17' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_PROF'
			 rs:basecolumn='ECP_PROF_SQ'>
			<s:datatype dt:type='string' dt:maxLength='2' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ECP_SORT_SQ' rs:number='18' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_PROF'
			 rs:basecolumn='ECP_SORT_SQ'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='38' rs:fixedlength='true'
			 rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ECP_EXAM_CD' rs:number='19' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_PROF'
			 rs:basecolumn='ECP_EXAM_CD'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ECP_PROF_NM' rs:number='20' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_PROF'
			 rs:basecolumn='ECP_PROF_NM'>
			<s:datatype dt:type='string' dt:maxLength='100' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ECP_PROF_TL' rs:number='21' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_PROF'
			 rs:basecolumn='ECP_PROF_TL'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='ECP_SEX_CD' rs:number='22' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_PROF' rs:basecolumn='ECP_SEX_CD'>
			<s:datatype dt:type='string' dt:maxLength='1' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ECP_ITEM_LT' rs:number='23' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_PROF'
			 rs:basecolumn='ECP_ITEM_LT'>
			<s:datatype dt:type='string' dt:maxLength='2000'/>
		</s:AttributeType>
		<s:AttributeType name='ECP_CALC_CD' rs:number='24' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_PROF'
			 rs:basecolumn='ECP_CALC_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECP_ITKD_CD' rs:number='25' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_PROF'
			 rs:basecolumn='ECP_ITKD_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECP_CNRT_PR' rs:number='26' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_PROF'
			 rs:basecolumn='ECP_CNRT_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='38' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ECP_BIND_PR' rs:number='27' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_PROF'
			 rs:basecolumn='ECP_BIND_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='38' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ECP_OPTN_PR' rs:number='28' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_PROF'
			 rs:basecolumn='ECP_OPTN_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='38' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ECP_CALC_PR' rs:number='29' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_PROF'
			 rs:basecolumn='ECP_CALC_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='38' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ECP_CALC_RT' rs:number='30' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_PROF'
			 rs:basecolumn='ECP_CALC_RT'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='ECP_HTSB_YN' rs:number='31' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_PROF'
			 rs:basecolumn='ECP_HTSB_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECP_SPSB_YN' rs:number='32' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_PROF'
			 rs:basecolumn='ECP_SPSB_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECP_CVSB_YN' rs:number='33' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_PROF'
			 rs:basecolumn='ECP_CVSB_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECP_EMSB_YN' rs:number='34' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_PROF'
			 rs:basecolumn='ECP_EMSB_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECP_ETSB_YN' rs:number='35' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_PROF'
			 rs:basecolumn='ECP_ETSB_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECP_HTPR_CD' rs:number='36' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_PROF'
			 rs:basecolumn='ECP_HTPR_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ECP_SPPR_CD' rs:number='37' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_PROF'
			 rs:basecolumn='ECP_SPPR_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ECP_CVPR_CD' rs:number='38' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_PROF'
			 rs:basecolumn='ECP_CVPR_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ECP_EMPR_CD' rs:number='39' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_PROF'
			 rs:basecolumn='ECP_EMPR_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ECP_ETPR_CD' rs:number='40' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_PROF'
			 rs:basecolumn='ECP_ETPR_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ECP_CNCL_CD' rs:number='41' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_PROF'
			 rs:basecolumn='ECP_CNCL_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECP_PYER_CD' rs:number='42' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_PROF'
			 rs:basecolumn='ECP_PYER_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECP_SPRT_PR' rs:number='43' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_PROF'
			 rs:basecolumn='ECP_SPRT_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='38' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ECP_COMP_PR' rs:number='44' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_PROF'
			 rs:basecolumn='ECP_COMP_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='38' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ECP_PERS_PR' rs:number='45' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_PROF'
			 rs:basecolumn='ECP_PERS_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='38' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ECP_CMPY_CD' rs:number='46' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_PROF'
			 rs:basecolumn='ECP_CMPY_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ECP_PRPY_CD' rs:number='47' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_PROF'
			 rs:basecolumn='ECP_PRPY_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ECP_OPTN_YN' rs:number='48' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_PROF'
			 rs:basecolumn='ECP_OPTN_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECP_OPTN_CNT' rs:number='49' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_PROF'
			 rs:basecolumn='ECP_OPTN_CNT'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='38' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ECP_PROF_TX' rs:number='50' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_PROF'
			 rs:basecolumn='ECP_PROF_TX'>
			<s:datatype dt:type='string' dt:maxLength='1000'/>
		</s:AttributeType>
		<s:AttributeType name='ECP_USE_YN' rs:number='51' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_PROF' rs:basecolumn='ECP_USE_YN'>
			<s:datatype dt:type='string' dt:maxLength='1' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ECP_NUSE_ID' rs:number='52' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_PROF'
			 rs:basecolumn='ECP_NUSE_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ECP_NUSE_DTT' rs:number='53' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_PROF'
			 rs:basecolumn='ECP_NUSE_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ECP_INPT_ID' rs:number='54' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_PROF'
			 rs:basecolumn='ECP_INPT_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ECP_INPT_DTT' rs:number='55' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_PROF'
			 rs:basecolumn='ECP_INPT_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ECP_MODI_ID' rs:number='56' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_PROF'
			 rs:basecolumn='ECP_MODI_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ECP_MODI_DTT' rs:number='57' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_PROF'
			 rs:basecolumn='ECP_MODI_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ECP_TRNS_ID' rs:number='58' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_PROF'
			 rs:basecolumn='ECP_TRNS_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ECP_TRNS_DTT' rs:number='59' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_PROF'
			 rs:basecolumn='ECP_TRNS_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='60' rs:rowid='true' rs:basetable='ET_COMP_CNRT_PROF' rs:basecolumn='ROWID'
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

			String ECP_EXAM_NM_T = cRsList.getString("ECP_EXAM_NM");
			String ECP_PYER_NM_T = cRsList.getString("ECP_PYER_NM");
			String ECP_SEX_NM_T = cRsList.getString("ECP_SEX_NM");
			String ECP_CALC_NM_T = cRsList.getString("ECP_CALC_NM");
			String ECP_HTPR_NM_T = cRsList.getString("ECP_HTPR_NM");
			String ECP_SPPR_NM_T = cRsList.getString("ECP_SPPR_NM");
			String ECP_CVPR_NM_T = cRsList.getString("ECP_CVPR_NM");
			String ECP_ETPR_NM_T = cRsList.getString("ECP_ETPR_NM");
			String ECP_EMPR_NM_T = cRsList.getString("ECP_EMPR_NM");
			String ECP_CNCL_NM_T = cRsList.getString("ECP_CNCL_NM");
			String ECP_CMPY_NM_T = cRsList.getString("ECP_CMPY_NM");
			String ECP_ITKD_NM_T = cRsList.getString("ECP_ITKD_NM");
			String ECP_PRPY_NM_T = cRsList.getString("ECP_PRPY_NM");
			String ECP_COMP_CD_T = cRsList.getString("ECP_COMP_CD");
			String ECP_MNGT_YR_T = cRsList.getString("ECP_MNGT_YR");
			String ECP_CNRT_SQ_T = cRsList.getString("ECP_CNRT_SQ");
			String ECP_PROF_SQ_T = cRsList.getString("ECP_PROF_SQ");
			String ECP_SORT_SQ_T = cRsList.getString("ECP_SORT_SQ");
			String ECP_EXAM_CD_T = cRsList.getString("ECP_EXAM_CD");
			String ECP_PROF_NM_T = cRsList.getString("ECP_PROF_NM");
			String ECP_PROF_TL_T = cRsList.getString("ECP_PROF_TL");
			String ECP_SEX_CD_T = cRsList.getString("ECP_SEX_CD");
			String ECP_ITEM_LT_T = cRsList.getString("ECP_ITEM_LT");
			String ECP_CALC_CD_T = cRsList.getString("ECP_CALC_CD");
			String ECP_ITKD_CD_T = cRsList.getString("ECP_ITKD_CD");
			String ECP_CNRT_PR_T = cRsList.getString("ECP_CNRT_PR");
			String ECP_BIND_PR_T = cRsList.getString("ECP_BIND_PR");
			String ECP_OPTN_PR_T = cRsList.getString("ECP_OPTN_PR");
			String ECP_CALC_PR_T = cRsList.getString("ECP_CALC_PR");
			String ECP_CALC_RT_T = cRsList.getString("ECP_CALC_RT");
			String ECP_HTSB_YN_T = cRsList.getString("ECP_HTSB_YN");
			String ECP_SPSB_YN_T = cRsList.getString("ECP_SPSB_YN");
			String ECP_CVSB_YN_T = cRsList.getString("ECP_CVSB_YN");
			String ECP_EMSB_YN_T = cRsList.getString("ECP_EMSB_YN");
			String ECP_ETSB_YN_T = cRsList.getString("ECP_ETSB_YN");
			String ECP_HTPR_CD_T = cRsList.getString("ECP_HTPR_CD");
			String ECP_SPPR_CD_T = cRsList.getString("ECP_SPPR_CD");
			String ECP_CVPR_CD_T = cRsList.getString("ECP_CVPR_CD");
			String ECP_EMPR_CD_T = cRsList.getString("ECP_EMPR_CD");
			String ECP_ETPR_CD_T = cRsList.getString("ECP_ETPR_CD");
			String ECP_CNCL_CD_T = cRsList.getString("ECP_CNCL_CD");
			String ECP_PYER_CD_T = cRsList.getString("ECP_PYER_CD");
			String ECP_SPRT_PR_T = cRsList.getString("ECP_SPRT_PR");
			String ECP_COMP_PR_T = cRsList.getString("ECP_COMP_PR");
			String ECP_PERS_PR_T = cRsList.getString("ECP_PERS_PR");
			String ECP_CMPY_CD_T = cRsList.getString("ECP_CMPY_CD");
			String ECP_PRPY_CD_T = cRsList.getString("ECP_PRPY_CD");
			String ECP_OPTN_YN_T = cRsList.getString("ECP_OPTN_YN");
			String ECP_OPTN_CNT_T = cRsList.getString("ECP_OPTN_CNT");
			String ECP_PROF_TX_T = cRsList.getString("ECP_PROF_TX");
			String ECP_USE_YN_T = cRsList.getString("ECP_USE_YN");
			String ECP_NUSE_ID_T = cRsList.getString("ECP_NUSE_ID");
			String ECP_NUSE_DTT_T = cRsList.getDate2("ECP_NUSE_DTT");
			String ECP_INPT_ID_T = cRsList.getString("ECP_INPT_ID");
			String ECP_INPT_DTT_T = cRsList.getDate2("ECP_INPT_DTT");
			String ECP_MODI_ID_T = cRsList.getString("ECP_MODI_ID");
			String ECP_MODI_DTT_T = cRsList.getDate2("ECP_MODI_DTT");
			String ECP_TRNS_ID_T = cRsList.getString("ECP_TRNS_ID");
			String ECP_TRNS_DTT_T = cRsList.getDate2("ECP_TRNS_DTT");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! ECP_EXAM_NM_T.equals("")) {
%>
		 		ECP_EXAM_NM='<%= ECP_EXAM_NM_T%>'
<%
			}

			if(! ECP_PYER_NM_T.equals("")) {
%>
		 		ECP_PYER_NM='<%= ECP_PYER_NM_T%>'
<%
			}

			if(! ECP_SEX_NM_T.equals("")) {
%>
		 		ECP_SEX_NM='<%= ECP_SEX_NM_T%>'
<%
			}

			if(! ECP_CALC_NM_T.equals("")) {
%>
		 		ECP_CALC_NM='<%= ECP_CALC_NM_T%>'
<%
			}

			if(! ECP_HTPR_NM_T.equals("")) {
%>
		 		ECP_HTPR_NM='<%= ECP_HTPR_NM_T%>'
<%
			}

			if(! ECP_SPPR_NM_T.equals("")) {
%>
		 		ECP_SPPR_NM='<%= ECP_SPPR_NM_T%>'
<%
			}

			if(! ECP_CVPR_NM_T.equals("")) {
%>
		 		ECP_CVPR_NM='<%= ECP_CVPR_NM_T%>'
<%
			}

			if(! ECP_ETPR_NM_T.equals("")) {
%>
		 		ECP_ETPR_NM='<%= ECP_ETPR_NM_T%>'
<%
			}

			if(! ECP_EMPR_NM_T.equals("")) {
%>
		 		ECP_EMPR_NM='<%= ECP_EMPR_NM_T%>'
<%
			}

			if(! ECP_CNCL_NM_T.equals("")) {
%>
		 		ECP_CNCL_NM='<%= ECP_CNCL_NM_T%>'
<%
			}

			if(! ECP_CMPY_NM_T.equals("")) {
%>
		 		ECP_CMPY_NM='<%= ECP_CMPY_NM_T%>'
<%
			}

			if(! ECP_ITKD_NM_T.equals("")) {
%>
		 		ECP_ITKD_NM='<%= ECP_ITKD_NM_T%>'
<%
			}

			if(! ECP_PRPY_NM_T.equals("")) {
%>
		 		ECP_PRPY_NM='<%= ECP_PRPY_NM_T%>'
<%
			}

			if(! ECP_COMP_CD_T.equals("")) {
%>
		 		ECP_COMP_CD='<%= ECP_COMP_CD_T%>'
<%
			}

			if(! ECP_MNGT_YR_T.equals("")) {
%>
		 		ECP_MNGT_YR='<%= ECP_MNGT_YR_T%>'
<%
			}

			if(! ECP_CNRT_SQ_T.equals("")) {
%>
		 		ECP_CNRT_SQ='<%= ECP_CNRT_SQ_T%>'
<%
			}

			if(! ECP_PROF_SQ_T.equals("")) {
%>
		 		ECP_PROF_SQ='<%= ECP_PROF_SQ_T%>'
<%
			}

			if(! ECP_SORT_SQ_T.equals("")) {
%>
		 		ECP_SORT_SQ='<%= ECP_SORT_SQ_T%>'
<%
			}

			if(! ECP_EXAM_CD_T.equals("")) {
%>
		 		ECP_EXAM_CD='<%= ECP_EXAM_CD_T%>'
<%
			}

			if(! ECP_PROF_NM_T.equals("")) {
%>
		 		ECP_PROF_NM='<%= ECP_PROF_NM_T%>'
<%
			}

			if(! ECP_PROF_TL_T.equals("")) {
%>
		 		ECP_PROF_TL='<%= ECP_PROF_TL_T%>'
<%
			}

			if(! ECP_SEX_CD_T.equals("")) {
%>
		 		ECP_SEX_CD='<%= ECP_SEX_CD_T%>'
<%
			}

			if(! ECP_ITEM_LT_T.equals("")) {
%>
		 		ECP_ITEM_LT='<%= ECP_ITEM_LT_T%>'
<%
			}

			if(! ECP_CALC_CD_T.equals("")) {
%>
		 		ECP_CALC_CD='<%= ECP_CALC_CD_T%>'
<%
			}

			if(! ECP_ITKD_CD_T.equals("")) {
%>
		 		ECP_ITKD_CD='<%= ECP_ITKD_CD_T%>'
<%
			}

			if(! ECP_CNRT_PR_T.equals("")) {
%>
		 		ECP_CNRT_PR='<%= ECP_CNRT_PR_T%>'
<%
			}

			if(! ECP_BIND_PR_T.equals("")) {
%>
		 		ECP_BIND_PR='<%= ECP_BIND_PR_T%>'
<%
			}

			if(! ECP_OPTN_PR_T.equals("")) {
%>
		 		ECP_OPTN_PR='<%= ECP_OPTN_PR_T%>'
<%
			}

			if(! ECP_CALC_PR_T.equals("")) {
%>
		 		ECP_CALC_PR='<%= ECP_CALC_PR_T%>'
<%
			}

			if(! ECP_CALC_RT_T.equals("")) {
%>
		 		ECP_CALC_RT='<%= ECP_CALC_RT_T%>'
<%
			}

			if(! ECP_HTSB_YN_T.equals("")) {
%>
		 		ECP_HTSB_YN='<%= ECP_HTSB_YN_T%>'
<%
			}

			if(! ECP_SPSB_YN_T.equals("")) {
%>
		 		ECP_SPSB_YN='<%= ECP_SPSB_YN_T%>'
<%
			}

			if(! ECP_CVSB_YN_T.equals("")) {
%>
		 		ECP_CVSB_YN='<%= ECP_CVSB_YN_T%>'
<%
			}

			if(! ECP_EMSB_YN_T.equals("")) {
%>
		 		ECP_EMSB_YN='<%= ECP_EMSB_YN_T%>'
<%
			}

			if(! ECP_ETSB_YN_T.equals("")) {
%>
		 		ECP_ETSB_YN='<%= ECP_ETSB_YN_T%>'
<%
			}

			if(! ECP_HTPR_CD_T.equals("")) {
%>
		 		ECP_HTPR_CD='<%= ECP_HTPR_CD_T%>'
<%
			}

			if(! ECP_SPPR_CD_T.equals("")) {
%>
		 		ECP_SPPR_CD='<%= ECP_SPPR_CD_T%>'
<%
			}

			if(! ECP_CVPR_CD_T.equals("")) {
%>
		 		ECP_CVPR_CD='<%= ECP_CVPR_CD_T%>'
<%
			}

			if(! ECP_EMPR_CD_T.equals("")) {
%>
		 		ECP_EMPR_CD='<%= ECP_EMPR_CD_T%>'
<%
			}

			if(! ECP_ETPR_CD_T.equals("")) {
%>
		 		ECP_ETPR_CD='<%= ECP_ETPR_CD_T%>'
<%
			}

			if(! ECP_CNCL_CD_T.equals("")) {
%>
		 		ECP_CNCL_CD='<%= ECP_CNCL_CD_T%>'
<%
			}

			if(! ECP_PYER_CD_T.equals("")) {
%>
		 		ECP_PYER_CD='<%= ECP_PYER_CD_T%>'
<%
			}

			if(! ECP_SPRT_PR_T.equals("")) {
%>
		 		ECP_SPRT_PR='<%= ECP_SPRT_PR_T%>'
<%
			}

			if(! ECP_COMP_PR_T.equals("")) {
%>
		 		ECP_COMP_PR='<%= ECP_COMP_PR_T%>'
<%
			}

			if(! ECP_PERS_PR_T.equals("")) {
%>
		 		ECP_PERS_PR='<%= ECP_PERS_PR_T%>'
<%
			}

			if(! ECP_CMPY_CD_T.equals("")) {
%>
		 		ECP_CMPY_CD='<%= ECP_CMPY_CD_T%>'
<%
			}

			if(! ECP_PRPY_CD_T.equals("")) {
%>
		 		ECP_PRPY_CD='<%= ECP_PRPY_CD_T%>'
<%
			}

			if(! ECP_OPTN_YN_T.equals("")) {
%>
		 		ECP_OPTN_YN='<%= ECP_OPTN_YN_T%>'
<%
			}

			if(! ECP_OPTN_CNT_T.equals("")) {
%>
		 		ECP_OPTN_CNT='<%= ECP_OPTN_CNT_T%>'
<%
			}

			if(! ECP_PROF_TX_T.equals("")) {
%>
		 		ECP_PROF_TX='<%= ECP_PROF_TX_T%>'
<%
			}

			if(! ECP_USE_YN_T.equals("")) {
%>
		 		ECP_USE_YN='<%= ECP_USE_YN_T%>'
<%
			}

			if(! ECP_NUSE_ID_T.equals("")) {
%>
		 		ECP_NUSE_ID='<%= ECP_NUSE_ID_T%>'
<%
			}

			if(! ECP_NUSE_DTT_T.equals("")) {
%>
		 		ECP_NUSE_DTT='<%= ECP_NUSE_DTT_T%>'
<%
			}

			if(! ECP_INPT_ID_T.equals("")) {
%>
		 		ECP_INPT_ID='<%= ECP_INPT_ID_T%>'
<%
			}

			if(! ECP_INPT_DTT_T.equals("")) {
%>
		 		ECP_INPT_DTT='<%= ECP_INPT_DTT_T%>'
<%
			}

			if(! ECP_MODI_ID_T.equals("")) {
%>
		 		ECP_MODI_ID='<%= ECP_MODI_ID_T%>'
<%
			}

			if(! ECP_MODI_DTT_T.equals("")) {
%>
		 		ECP_MODI_DTT='<%= ECP_MODI_DTT_T%>'
<%
			}

			if(! ECP_TRNS_ID_T.equals("")) {
%>
		 		ECP_TRNS_ID='<%= ECP_TRNS_ID_T%>'
<%
			}

			if(! ECP_TRNS_DTT_T.equals("")) {
%>
		 		ECP_TRNS_DTT='<%= ECP_TRNS_DTT_T%>'
<%
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
