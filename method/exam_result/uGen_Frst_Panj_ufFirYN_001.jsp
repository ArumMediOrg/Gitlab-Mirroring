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

		String EXAM_DT = htMethod.get("EXAM_DT");
		String EXAM_SQ = htMethod.get("EXAM_SQ");

		//
		if(EXAM_DT == null) { EXAM_DT = ""; }
		if(EXAM_SQ == null) { EXAM_SQ = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT *
  FROM PT_FIR_PANJUNG
 WHERE PFP_EXAM_DT = :EXAM_DT
   AND PFP_EXAM_SQ = :EXAM_SQ
		*/

		sql = " SELECT *";
		sql += " FROM PT_FIR_PANJUNG";
		sql += " WHERE PFP_EXAM_DT = '" + EXAM_DT + "'";
		sql += " AND PFP_EXAM_SQ = '" + EXAM_SQ + "'";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uGen_Frst_Panj_ufFirYN_001 \n";
			G_INFO += "설명 : 1차 판정 조회(I,U 확인용도) \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " EXAM_DT : " + EXAM_DT + " \n";
			G_INFO += " EXAM_SQ : " + EXAM_SQ + " \n";
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
		<s:AttributeType name='PFP_EXAM_DT' rs:number='1' rs:writeunknown='true' rs:basetable='PT_FIR_PANJUNG' rs:basecolumn='PFP_EXAM_DT'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_EXAM_SQ' rs:number='2' rs:writeunknown='true' rs:basetable='PT_FIR_PANJUNG' rs:basecolumn='PFP_EXAM_SQ'>
			<s:datatype dt:type='string' dt:maxLength='6' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_HISJIN' rs:number='3' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_FIR_PANJUNG'
			 rs:basecolumn='PFP_HISJIN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_HISMED' rs:number='4' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_FIR_PANJUNG'
			 rs:basecolumn='PFP_HISMED'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_LIVEGBN' rs:number='5' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_FIR_PANJUNG'
			 rs:basecolumn='PFP_LIVEGBN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_LIVESMK' rs:number='6' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_FIR_PANJUNG'
			 rs:basecolumn='PFP_LIVESMK'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_LIVEDRK' rs:number='7' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_FIR_PANJUNG'
			 rs:basecolumn='PFP_LIVEDRK'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_LIVESPT' rs:number='8' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_FIR_PANJUNG'
			 rs:basecolumn='PFP_LIVESPT'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_LIVEWET' rs:number='9' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_FIR_PANJUNG'
			 rs:basecolumn='PFP_LIVEWET'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_SEDPLIST' rs:number='10' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_FIR_PANJUNG'
			 rs:basecolumn='PFP_SEDPLIST'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_EXINJUR' rs:number='11' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_FIR_PANJUNG'
			 rs:basecolumn='PFP_EXINJUR'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_DEPRESS' rs:number='12' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_FIR_PANJUNG'
			 rs:basecolumn='PFP_DEPRESS'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_CNDTION' rs:number='13' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_FIR_PANJUNG'
			 rs:basecolumn='PFP_CNDTION'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_CGNTION' rs:number='14' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_FIR_PANJUNG'
			 rs:basecolumn='PFP_CGNTION'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_RESULTB_1' rs:number='15' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_FIR_PANJUNG'
			 rs:basecolumn='PFP_RESULTB_1'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_RESULTB_2' rs:number='16' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_FIR_PANJUNG'
			 rs:basecolumn='PFP_RESULTB_2'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_RESULTB_3' rs:number='17' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_FIR_PANJUNG'
			 rs:basecolumn='PFP_RESULTB_3'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_RESULTB_4' rs:number='18' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_FIR_PANJUNG'
			 rs:basecolumn='PFP_RESULTB_4'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_RESULTB_5' rs:number='19' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_FIR_PANJUNG'
			 rs:basecolumn='PFP_RESULTB_5'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_RESULTB_6' rs:number='20' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_FIR_PANJUNG'
			 rs:basecolumn='PFP_RESULTB_6'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_RESULTB_7' rs:number='21' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_FIR_PANJUNG'
			 rs:basecolumn='PFP_RESULTB_7'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_RESULTB_8' rs:number='22' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_FIR_PANJUNG'
			 rs:basecolumn='PFP_RESULTB_8'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_RESULTB_9' rs:number='23' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_FIR_PANJUNG'
			 rs:basecolumn='PFP_RESULTB_9'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_RESULTR1_1' rs:number='24' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_FIR_PANJUNG'
			 rs:basecolumn='PFP_RESULTR1_1'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_RESULTR1_2' rs:number='25' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_FIR_PANJUNG'
			 rs:basecolumn='PFP_RESULTR1_2'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_RESULTR1_3' rs:number='26' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_FIR_PANJUNG'
			 rs:basecolumn='PFP_RESULTR1_3'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_RESULTR1_4' rs:number='27' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_FIR_PANJUNG'
			 rs:basecolumn='PFP_RESULTR1_4'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_RESULTR1_5' rs:number='28' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_FIR_PANJUNG'
			 rs:basecolumn='PFP_RESULTR1_5'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_RESULTR1_6' rs:number='29' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_FIR_PANJUNG'
			 rs:basecolumn='PFP_RESULTR1_6'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_RESULTR1_7' rs:number='30' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_FIR_PANJUNG'
			 rs:basecolumn='PFP_RESULTR1_7'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_RESULTR1_8' rs:number='31' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_FIR_PANJUNG'
			 rs:basecolumn='PFP_RESULTR1_8'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_RESULTR2_1' rs:number='32' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_FIR_PANJUNG'
			 rs:basecolumn='PFP_RESULTR2_1'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_RESULTR2_2' rs:number='33' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_FIR_PANJUNG'
			 rs:basecolumn='PFP_RESULTR2_2'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_RESULTRD_1' rs:number='34' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_FIR_PANJUNG'
			 rs:basecolumn='PFP_RESULTRD_1'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_RESULTRD_2' rs:number='35' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_FIR_PANJUNG'
			 rs:basecolumn='PFP_RESULTRD_2'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_RESULTRD_3' rs:number='36' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_FIR_PANJUNG'
			 rs:basecolumn='PFP_RESULTRD_3'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_RESULTRD_4' rs:number='37' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_FIR_PANJUNG'
			 rs:basecolumn='PFP_RESULTRD_4'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_TRANC_DATE' rs:number='38' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_FIR_PANJUNG'
			 rs:basecolumn='PFP_TRANC_DATE'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_RESULT_DATE' rs:number='39' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_FIR_PANJUNG'
			 rs:basecolumn='PFP_RESULT_DATE'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_DOCTORFIR' rs:number='40' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_FIR_PANJUNG'
			 rs:basecolumn='PFP_DOCTORFIR'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_PANRETA' rs:number='41' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_FIR_PANJUNG'
			 rs:basecolumn='PFP_PANRETA'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_PANRETB' rs:number='42' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_FIR_PANJUNG'
			 rs:basecolumn='PFP_PANRETB'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_PANRETR1' rs:number='43' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_FIR_PANJUNG'
			 rs:basecolumn='PFP_PANRETR1'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_PANRETR2' rs:number='44' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_FIR_PANJUNG'
			 rs:basecolumn='PFP_PANRETR2'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_PANRETRD' rs:number='45' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_FIR_PANJUNG'
			 rs:basecolumn='PFP_PANRETRD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_RVIEW' rs:number='46' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_FIR_PANJUNG'
			 rs:basecolumn='PFP_RVIEW'>
			<s:datatype dt:type='string' dt:maxLength='1000'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_BVIEW' rs:number='47' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_FIR_PANJUNG'
			 rs:basecolumn='PFP_BVIEW'>
			<s:datatype dt:type='string' dt:maxLength='1200'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_INPUT_ID' rs:number='48' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_FIR_PANJUNG'
			 rs:basecolumn='PFP_INPUT_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_INPUT_DTT' rs:number='49' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_FIR_PANJUNG'
			 rs:basecolumn='PFP_INPUT_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_MODI_DTT' rs:number='50' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_FIR_PANJUNG'
			 rs:basecolumn='PFP_MODI_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_MODI_ID' rs:number='51' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_FIR_PANJUNG'
			 rs:basecolumn='PFP_MODI_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_RESULT8_ETC' rs:number='52' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_FIR_PANJUNG'
			 rs:basecolumn='PFP_RESULT8_ETC'>
			<s:datatype dt:type='string' dt:maxLength='80'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_RESULTB_10' rs:number='53' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_FIR_PANJUNG'
			 rs:basecolumn='PFP_RESULTB_10'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_FIX_YN' rs:number='54' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_FIR_PANJUNG'
			 rs:basecolumn='PFP_FIX_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_EXAM_DT2' rs:number='55' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_FIR_PANJUNG'
			 rs:basecolumn='PFP_EXAM_DT2'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_EXAM_SQ2' rs:number='56' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_FIR_PANJUNG'
			 rs:basecolumn='PFP_EXAM_SQ2'>
			<s:datatype dt:type='string' dt:maxLength='6'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_FIR_INFO' rs:number='57' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_FIR_PANJUNG'
			 rs:basecolumn='PFP_FIR_INFO'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_SED_INFO' rs:number='58' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_FIR_PANJUNG'
			 rs:basecolumn='PFP_SED_INFO'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_OPIN1' rs:number='59' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_FIR_PANJUNG'
			 rs:basecolumn='PFP_OPIN1'>
			<s:datatype dt:type='string' dt:maxLength='600'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_OPIN2' rs:number='60' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_FIR_PANJUNG'
			 rs:basecolumn='PFP_OPIN2'>
			<s:datatype dt:type='string' dt:maxLength='600'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_OPIN3' rs:number='61' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_FIR_PANJUNG'
			 rs:basecolumn='PFP_OPIN3'>
			<s:datatype dt:type='string' dt:maxLength='600'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_OPIN4' rs:number='62' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_FIR_PANJUNG'
			 rs:basecolumn='PFP_OPIN4'>
			<s:datatype dt:type='string' dt:maxLength='600'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_RESULTRD_5' rs:number='63' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_FIR_PANJUNG'
			 rs:basecolumn='PFP_RESULTRD_5'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_RESULTRD_ETC' rs:number='64' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_FIR_PANJUNG'
			 rs:basecolumn='PFP_RESULTRD_ETC'>
			<s:datatype dt:type='string' dt:maxLength='80'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_DOCTORQQN' rs:number='65' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_FIR_PANJUNG'
			 rs:basecolumn='PFP_DOCTORQQN'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_RESULTB_11' rs:number='66' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_FIR_PANJUNG'
			 rs:basecolumn='PFP_RESULTB_11'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_RESULTR1_9' rs:number='67' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_FIR_PANJUNG'
			 rs:basecolumn='PFP_RESULTR1_9'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_RESULTR1_10' rs:number='68' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_FIR_PANJUNG'
			 rs:basecolumn='PFP_RESULTR1_10'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='69' rs:rowid='true' rs:writeunknown='true' rs:basetable='PT_FIR_PANJUNG'
			 rs:basecolumn='ROWID' rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
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

			String PFP_EXAM_DT_T = cRsList.getString("PFP_EXAM_DT");
			String PFP_EXAM_SQ_T = cRsList.getString("PFP_EXAM_SQ");
			String PFP_HISJIN_T = cRsList.getString("PFP_HISJIN");
			String PFP_HISMED_T = cRsList.getString("PFP_HISMED");
			String PFP_LIVEGBN_T = cRsList.getString("PFP_LIVEGBN");
			String PFP_LIVESMK_T = cRsList.getString("PFP_LIVESMK");
			String PFP_LIVEDRK_T = cRsList.getString("PFP_LIVEDRK");
			String PFP_LIVESPT_T = cRsList.getString("PFP_LIVESPT");
			String PFP_LIVEWET_T = cRsList.getString("PFP_LIVEWET");
			String PFP_SEDPLIST_T = cRsList.getString("PFP_SEDPLIST");
			String PFP_EXINJUR_T = cRsList.getString("PFP_EXINJUR");
			String PFP_DEPRESS_T = cRsList.getString("PFP_DEPRESS");
			String PFP_CNDTION_T = cRsList.getString("PFP_CNDTION");
			String PFP_CGNTION_T = cRsList.getString("PFP_CGNTION");
			String PFP_RESULTB_1_T = cRsList.getString("PFP_RESULTB_1");
			String PFP_RESULTB_2_T = cRsList.getString("PFP_RESULTB_2");
			String PFP_RESULTB_3_T = cRsList.getString("PFP_RESULTB_3");
			String PFP_RESULTB_4_T = cRsList.getString("PFP_RESULTB_4");
			String PFP_RESULTB_5_T = cRsList.getString("PFP_RESULTB_5");
			String PFP_RESULTB_6_T = cRsList.getString("PFP_RESULTB_6");
			String PFP_RESULTB_7_T = cRsList.getString("PFP_RESULTB_7");
			String PFP_RESULTB_8_T = cRsList.getString("PFP_RESULTB_8");
			String PFP_RESULTB_9_T = cRsList.getString("PFP_RESULTB_9");
			String PFP_RESULTR1_1_T = cRsList.getString("PFP_RESULTR1_1");
			String PFP_RESULTR1_2_T = cRsList.getString("PFP_RESULTR1_2");
			String PFP_RESULTR1_3_T = cRsList.getString("PFP_RESULTR1_3");
			String PFP_RESULTR1_4_T = cRsList.getString("PFP_RESULTR1_4");
			String PFP_RESULTR1_5_T = cRsList.getString("PFP_RESULTR1_5");
			String PFP_RESULTR1_6_T = cRsList.getString("PFP_RESULTR1_6");
			String PFP_RESULTR1_7_T = cRsList.getString("PFP_RESULTR1_7");
			String PFP_RESULTR1_8_T = cRsList.getString("PFP_RESULTR1_8");
			String PFP_RESULTR2_1_T = cRsList.getString("PFP_RESULTR2_1");
			String PFP_RESULTR2_2_T = cRsList.getString("PFP_RESULTR2_2");
			String PFP_RESULTRD_1_T = cRsList.getString("PFP_RESULTRD_1");
			String PFP_RESULTRD_2_T = cRsList.getString("PFP_RESULTRD_2");
			String PFP_RESULTRD_3_T = cRsList.getString("PFP_RESULTRD_3");
			String PFP_RESULTRD_4_T = cRsList.getString("PFP_RESULTRD_4");
			String PFP_TRANC_DATE_T = cRsList.getString("PFP_TRANC_DATE");
			String PFP_RESULT_DATE_T = cRsList.getString("PFP_RESULT_DATE");
			String PFP_DOCTORFIR_T = cRsList.getString("PFP_DOCTORFIR");
			String PFP_PANRETA_T = cRsList.getString("PFP_PANRETA");
			String PFP_PANRETB_T = cRsList.getString("PFP_PANRETB");
			String PFP_PANRETR1_T = cRsList.getString("PFP_PANRETR1");
			String PFP_PANRETR2_T = cRsList.getString("PFP_PANRETR2");
			String PFP_PANRETRD_T = cRsList.getString("PFP_PANRETRD");
			String PFP_RVIEW_T = cRsList.getString("PFP_RVIEW");
			String PFP_BVIEW_T = cRsList.getString("PFP_BVIEW");
			String PFP_INPUT_ID_T = cRsList.getString("PFP_INPUT_ID");
			String PFP_INPUT_DTT_T = cRsList.getDate2("PFP_INPUT_DTT");
			String PFP_MODI_DTT_T = cRsList.getDate2("PFP_MODI_DTT");
			String PFP_MODI_ID_T = cRsList.getString("PFP_MODI_ID");
			String PFP_RESULT8_ETC_T = cRsList.getString("PFP_RESULT8_ETC");
			String PFP_RESULTB_10_T = cRsList.getString("PFP_RESULTB_10");
			String PFP_FIX_YN_T = cRsList.getString("PFP_FIX_YN");
			String PFP_EXAM_DT2_T = cRsList.getString("PFP_EXAM_DT2");
			String PFP_EXAM_SQ2_T = cRsList.getString("PFP_EXAM_SQ2");
			String PFP_FIR_INFO_T = cRsList.getString("PFP_FIR_INFO");
			String PFP_SED_INFO_T = cRsList.getString("PFP_SED_INFO");
			String PFP_OPIN1_T = cRsList.getString("PFP_OPIN1");
			String PFP_OPIN2_T = cRsList.getString("PFP_OPIN2");
			String PFP_OPIN3_T = cRsList.getString("PFP_OPIN3");
			String PFP_OPIN4_T = cRsList.getString("PFP_OPIN4");
			String PFP_RESULTRD_5_T = cRsList.getString("PFP_RESULTRD_5");
			String PFP_RESULTRD_ETC_T = cRsList.getString("PFP_RESULTRD_ETC");
			String PFP_DOCTORQQN_T = cRsList.getString("PFP_DOCTORQQN");
			String PFP_RESULTB_11_T = cRsList.getString("PFP_RESULTB_11");
			String PFP_RESULTR1_9_T = cRsList.getString("PFP_RESULTR1_9");
			String PFP_RESULTR1_10_T = cRsList.getString("PFP_RESULTR1_10");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! PFP_EXAM_DT_T.equals("")) {
%>
		 		PFP_EXAM_DT='<%= PFP_EXAM_DT_T%>'
<%
			}

			if(! PFP_EXAM_SQ_T.equals("")) {
%>
		 		PFP_EXAM_SQ='<%= PFP_EXAM_SQ_T%>'
<%
			}

			if(! PFP_HISJIN_T.equals("")) {
%>
		 		PFP_HISJIN='<%= PFP_HISJIN_T%>'
<%
			}

			if(! PFP_HISMED_T.equals("")) {
%>
		 		PFP_HISMED='<%= PFP_HISMED_T%>'
<%
			}

			if(! PFP_LIVEGBN_T.equals("")) {
%>
		 		PFP_LIVEGBN='<%= PFP_LIVEGBN_T%>'
<%
			}

			if(! PFP_LIVESMK_T.equals("")) {
%>
		 		PFP_LIVESMK='<%= PFP_LIVESMK_T%>'
<%
			}

			if(! PFP_LIVEDRK_T.equals("")) {
%>
		 		PFP_LIVEDRK='<%= PFP_LIVEDRK_T%>'
<%
			}

			if(! PFP_LIVESPT_T.equals("")) {
%>
		 		PFP_LIVESPT='<%= PFP_LIVESPT_T%>'
<%
			}

			if(! PFP_LIVEWET_T.equals("")) {
%>
		 		PFP_LIVEWET='<%= PFP_LIVEWET_T%>'
<%
			}

			if(! PFP_SEDPLIST_T.equals("")) {
%>
		 		PFP_SEDPLIST='<%= PFP_SEDPLIST_T%>'
<%
			}

			if(! PFP_EXINJUR_T.equals("")) {
%>
		 		PFP_EXINJUR='<%= PFP_EXINJUR_T%>'
<%
			}

			if(! PFP_DEPRESS_T.equals("")) {
%>
		 		PFP_DEPRESS='<%= PFP_DEPRESS_T%>'
<%
			}

			if(! PFP_CNDTION_T.equals("")) {
%>
		 		PFP_CNDTION='<%= PFP_CNDTION_T%>'
<%
			}

			if(! PFP_CGNTION_T.equals("")) {
%>
		 		PFP_CGNTION='<%= PFP_CGNTION_T%>'
<%
			}

			if(! PFP_RESULTB_1_T.equals("")) {
%>
		 		PFP_RESULTB_1='<%= PFP_RESULTB_1_T%>'
<%
			}

			if(! PFP_RESULTB_2_T.equals("")) {
%>
		 		PFP_RESULTB_2='<%= PFP_RESULTB_2_T%>'
<%
			}

			if(! PFP_RESULTB_3_T.equals("")) {
%>
		 		PFP_RESULTB_3='<%= PFP_RESULTB_3_T%>'
<%
			}

			if(! PFP_RESULTB_4_T.equals("")) {
%>
		 		PFP_RESULTB_4='<%= PFP_RESULTB_4_T%>'
<%
			}

			if(! PFP_RESULTB_5_T.equals("")) {
%>
		 		PFP_RESULTB_5='<%= PFP_RESULTB_5_T%>'
<%
			}

			if(! PFP_RESULTB_6_T.equals("")) {
%>
		 		PFP_RESULTB_6='<%= PFP_RESULTB_6_T%>'
<%
			}

			if(! PFP_RESULTB_7_T.equals("")) {
%>
		 		PFP_RESULTB_7='<%= PFP_RESULTB_7_T%>'
<%
			}

			if(! PFP_RESULTB_8_T.equals("")) {
%>
		 		PFP_RESULTB_8='<%= PFP_RESULTB_8_T%>'
<%
			}

			if(! PFP_RESULTB_9_T.equals("")) {
%>
		 		PFP_RESULTB_9='<%= PFP_RESULTB_9_T%>'
<%
			}

			if(! PFP_RESULTR1_1_T.equals("")) {
%>
		 		PFP_RESULTR1_1='<%= PFP_RESULTR1_1_T%>'
<%
			}

			if(! PFP_RESULTR1_2_T.equals("")) {
%>
		 		PFP_RESULTR1_2='<%= PFP_RESULTR1_2_T%>'
<%
			}

			if(! PFP_RESULTR1_3_T.equals("")) {
%>
		 		PFP_RESULTR1_3='<%= PFP_RESULTR1_3_T%>'
<%
			}

			if(! PFP_RESULTR1_4_T.equals("")) {
%>
		 		PFP_RESULTR1_4='<%= PFP_RESULTR1_4_T%>'
<%
			}

			if(! PFP_RESULTR1_5_T.equals("")) {
%>
		 		PFP_RESULTR1_5='<%= PFP_RESULTR1_5_T%>'
<%
			}

			if(! PFP_RESULTR1_6_T.equals("")) {
%>
		 		PFP_RESULTR1_6='<%= PFP_RESULTR1_6_T%>'
<%
			}

			if(! PFP_RESULTR1_7_T.equals("")) {
%>
		 		PFP_RESULTR1_7='<%= PFP_RESULTR1_7_T%>'
<%
			}

			if(! PFP_RESULTR1_8_T.equals("")) {
%>
		 		PFP_RESULTR1_8='<%= PFP_RESULTR1_8_T%>'
<%
			}

			if(! PFP_RESULTR2_1_T.equals("")) {
%>
		 		PFP_RESULTR2_1='<%= PFP_RESULTR2_1_T%>'
<%
			}

			if(! PFP_RESULTR2_2_T.equals("")) {
%>
		 		PFP_RESULTR2_2='<%= PFP_RESULTR2_2_T%>'
<%
			}

			if(! PFP_RESULTRD_1_T.equals("")) {
%>
		 		PFP_RESULTRD_1='<%= PFP_RESULTRD_1_T%>'
<%
			}

			if(! PFP_RESULTRD_2_T.equals("")) {
%>
		 		PFP_RESULTRD_2='<%= PFP_RESULTRD_2_T%>'
<%
			}

			if(! PFP_RESULTRD_3_T.equals("")) {
%>
		 		PFP_RESULTRD_3='<%= PFP_RESULTRD_3_T%>'
<%
			}

			if(! PFP_RESULTRD_4_T.equals("")) {
%>
		 		PFP_RESULTRD_4='<%= PFP_RESULTRD_4_T%>'
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

			if(! PFP_PANRETA_T.equals("")) {
%>
		 		PFP_PANRETA='<%= PFP_PANRETA_T%>'
<%
			}

			if(! PFP_PANRETB_T.equals("")) {
%>
		 		PFP_PANRETB='<%= PFP_PANRETB_T%>'
<%
			}

			if(! PFP_PANRETR1_T.equals("")) {
%>
		 		PFP_PANRETR1='<%= PFP_PANRETR1_T%>'
<%
			}

			if(! PFP_PANRETR2_T.equals("")) {
%>
		 		PFP_PANRETR2='<%= PFP_PANRETR2_T%>'
<%
			}

			if(! PFP_PANRETRD_T.equals("")) {
%>
		 		PFP_PANRETRD='<%= PFP_PANRETRD_T%>'
<%
			}

			if(! PFP_RVIEW_T.equals("")) {
%>
		 		PFP_RVIEW='<%= PFP_RVIEW_T%>'
<%
			}

			if(! PFP_BVIEW_T.equals("")) {
%>
		 		PFP_BVIEW='<%= PFP_BVIEW_T%>'
<%
			}

			if(! PFP_INPUT_ID_T.equals("")) {
%>
		 		PFP_INPUT_ID='<%= PFP_INPUT_ID_T%>'
<%
			}

			if(! PFP_INPUT_DTT_T.equals("")) {
%>
		 		PFP_INPUT_DTT='<%= PFP_INPUT_DTT_T%>'
<%
			}

			if(! PFP_MODI_DTT_T.equals("")) {
%>
		 		PFP_MODI_DTT='<%= PFP_MODI_DTT_T%>'
<%
			}

			if(! PFP_MODI_ID_T.equals("")) {
%>
		 		PFP_MODI_ID='<%= PFP_MODI_ID_T%>'
<%
			}

			if(! PFP_RESULT8_ETC_T.equals("")) {
%>
		 		PFP_RESULT8_ETC='<%= PFP_RESULT8_ETC_T%>'
<%
			}

			if(! PFP_RESULTB_10_T.equals("")) {
%>
		 		PFP_RESULTB_10='<%= PFP_RESULTB_10_T%>'
<%
			}

			if(! PFP_FIX_YN_T.equals("")) {
%>
		 		PFP_FIX_YN='<%= PFP_FIX_YN_T%>'
<%
			}

			if(! PFP_EXAM_DT2_T.equals("")) {
%>
		 		PFP_EXAM_DT2='<%= PFP_EXAM_DT2_T%>'
<%
			}

			if(! PFP_EXAM_SQ2_T.equals("")) {
%>
		 		PFP_EXAM_SQ2='<%= PFP_EXAM_SQ2_T%>'
<%
			}

			if(! PFP_FIR_INFO_T.equals("")) {
%>
		 		PFP_FIR_INFO='<%= PFP_FIR_INFO_T%>'
<%
			}

			if(! PFP_SED_INFO_T.equals("")) {
%>
		 		PFP_SED_INFO='<%= PFP_SED_INFO_T%>'
<%
			}

			if(! PFP_OPIN1_T.equals("")) {
%>
		 		PFP_OPIN1='<%= PFP_OPIN1_T%>'
<%
			}

			if(! PFP_OPIN2_T.equals("")) {
%>
		 		PFP_OPIN2='<%= PFP_OPIN2_T%>'
<%
			}

			if(! PFP_OPIN3_T.equals("")) {
%>
		 		PFP_OPIN3='<%= PFP_OPIN3_T%>'
<%
			}

			if(! PFP_OPIN4_T.equals("")) {
%>
		 		PFP_OPIN4='<%= PFP_OPIN4_T%>'
<%
			}

			if(! PFP_RESULTRD_5_T.equals("")) {
%>
		 		PFP_RESULTRD_5='<%= PFP_RESULTRD_5_T%>'
<%
			}

			if(! PFP_RESULTRD_ETC_T.equals("")) {
%>
		 		PFP_RESULTRD_ETC='<%= PFP_RESULTRD_ETC_T%>'
<%
			}

			if(! PFP_DOCTORQQN_T.equals("")) {
%>
		 		PFP_DOCTORQQN='<%= PFP_DOCTORQQN_T%>'
<%
			}

			if(! PFP_RESULTB_11_T.equals("")) {
%>
		 		PFP_RESULTB_11='<%= PFP_RESULTB_11_T%>'
<%
			}

			if(! PFP_RESULTR1_9_T.equals("")) {
%>
		 		PFP_RESULTR1_9='<%= PFP_RESULTR1_9_T%>'
<%
			}

			if(! PFP_RESULTR1_10_T.equals("")) {
%>
		 		PFP_RESULTR1_10='<%= PFP_RESULTR1_10_T%>'
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
