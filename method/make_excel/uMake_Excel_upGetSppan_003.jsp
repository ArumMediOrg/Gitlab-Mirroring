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

		String STROUTPUTS = htMethod.get("STROUTPUTS");
		String EXAM_DT = htMethod.get("EXAM_DT");
		String EXAM_SQ = htMethod.get("EXAM_SQ");

		//
		if(STROUTPUTS == null) { STROUTPUTS = ""; }
		if(EXAM_DT == null) { EXAM_DT = ""; }
		if(EXAM_SQ == null) { EXAM_SQ = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

Select
:strOutputs
From ST_PANJUNG A                                              
Left Outer Join CT_SP_MATTER B On B.CSM_MATT_CD = A.SPG_MATT_CD
                              And B.CSM_USE_YN = 'Y'         
Left Outer Join CT_SP_COMMON C On C.CSC_LARGE = 'HM90E'      
                              And C.CSC_ETC1_CD = A.SPG_ORGA_CD
                              And C.CSC_LEVEL = '5'          
                              And C.CSC_USE_YN = 'Y'         
                              And A.SPG_ORGA_CD <> '00'      
                              And C.CSC_ETC2_CD = A.SPG_ORSU_CD
 Where A.SPG_EXAM_DT = :EXAM_DT
  And A.SPG_EXAM_SQ  = :EXAM_SQ

		*/

		sql = " SELECT '" + STROUTPUTS + "'";
		sql += " FROM ST_PANJUNG A LEFT OUTER JOIN CT_SP_MATTER B";
		sql += " ON B.CSM_MATT_CD = A.SPG_MATT_CD";
		sql += " AND B.CSM_USE_YN = 'Y' LEFT OUTER JOIN CT_SP_COMMON C";
		sql += " ON C.CSC_LARGE = 'HM90E'";
		sql += " AND C.CSC_ETC1_CD = A.SPG_ORGA_CD";
		sql += " AND C.CSC_LEVEL = '5'";
		sql += " AND C.CSC_USE_YN = 'Y'";
		sql += " AND A.SPG_ORGA_CD <> '00'";
		sql += " AND C.CSC_ETC2_CD = A.SPG_ORSU_CD";
		sql += " WHERE A.SPG_EXAM_DT = '" + EXAM_DT + "'";
		sql += " AND A.SPG_EXAM_SQ = '" + EXAM_SQ + "'";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uMake_Excel_upGetSppan_003 \n";
			G_INFO += "설명 : 출력용 데이터 로딩 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " STROUTPUTS : " + STROUTPUTS + " \n";
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
		<s:AttributeType name='SPG_EXAM_DT' rs:number='1' rs:writeunknown='true' rs:basetable='ST_PANJUNG' rs:basecolumn='SPG_EXAM_DT'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='SPG_EXAM_SQ' rs:number='2' rs:writeunknown='true' rs:basetable='ST_PANJUNG' rs:basecolumn='SPG_EXAM_SQ'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='SPG_EXAM_CHA' rs:number='3' rs:writeunknown='true' rs:basetable='ST_PANJUNG' rs:basecolumn='SPG_EXAM_CHA'>
			<s:datatype dt:type='string' dt:maxLength='1' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='SPG_MATT_CD' rs:number='4' rs:writeunknown='true' rs:basetable='ST_PANJUNG' rs:basecolumn='SPG_MATT_CD'>
			<s:datatype dt:type='string' dt:maxLength='5' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='SPG_MATT_SQ' rs:number='5' rs:writeunknown='true' rs:basetable='ST_PANJUNG' rs:basecolumn='SPG_MATT_SQ'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'
			 rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='SPG_ORGA_CD' rs:number='6' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_PANJUNG'
			 rs:basecolumn='SPG_ORGA_CD'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='SPG_SWING_CD' rs:number='7' rs:writeunknown='true' rs:basetable='ST_PANJUNG' rs:basecolumn='SPG_SWING_CD'>
			<s:datatype dt:type='string' dt:maxLength='1' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='SPG_SLNS_KD' rs:number='8' rs:writeunknown='true' rs:basetable='ST_PANJUNG' rs:basecolumn='SPG_SLNS_KD'>
			<s:datatype dt:type='string' dt:maxLength='1' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='SPG_SOKY_CD' rs:number='9' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_PANJUNG'
			 rs:basecolumn='SPG_SOKY_CD'>
			<s:datatype dt:type='string' dt:maxLength='4'/>
		</s:AttributeType>
		<s:AttributeType name='SPG_SOKY_NM' rs:number='10' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_PANJUNG'
			 rs:basecolumn='SPG_SOKY_NM'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='SPG_PANJ_CD' rs:number='11' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_PANJUNG'
			 rs:basecolumn='SPG_PANJ_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='SPG_JOCHI_CD' rs:number='12' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_PANJUNG'
			 rs:basecolumn='SPG_JOCHI_CD'>
			<s:datatype dt:type='string' dt:maxLength='4'/>
		</s:AttributeType>
		<s:AttributeType name='SPG_JOCHI_NM' rs:number='13' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_PANJUNG'
			 rs:basecolumn='SPG_JOCHI_NM'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='SPG_JILH_CD' rs:number='14' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_PANJUNG'
			 rs:basecolumn='SPG_JILH_CD'>
			<s:datatype dt:type='string' dt:maxLength='3'/>
		</s:AttributeType>
		<s:AttributeType name='SPG_POSM1_CD' rs:number='15' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_PANJUNG'
			 rs:basecolumn='SPG_POSM1_CD'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='SPG_POSM2_CD' rs:number='16' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_PANJUNG'
			 rs:basecolumn='SPG_POSM2_CD'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='SPG_POSM3_CD' rs:number='17' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_PANJUNG'
			 rs:basecolumn='SPG_POSM3_CD'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='SPG_POSM1_TX' rs:number='18' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_PANJUNG'
			 rs:basecolumn='SPG_POSM1_TX'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='SPG_POSM2_TX' rs:number='19' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_PANJUNG'
			 rs:basecolumn='SPG_POSM2_TX'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='SPG_POSM3_TX' rs:number='20' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_PANJUNG'
			 rs:basecolumn='SPG_POSM3_TX'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='SPG_POSM1_DT' rs:number='21' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_PANJUNG'
			 rs:basecolumn='SPG_POSM1_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='SPG_POSM2_DT' rs:number='22' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_PANJUNG'
			 rs:basecolumn='SPG_POSM2_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='SPG_POSM3_DT' rs:number='23' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_PANJUNG'
			 rs:basecolumn='SPG_POSM3_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='SPG_BUSI_CD' rs:number='24' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_PANJUNG'
			 rs:basecolumn='SPG_BUSI_CD'>
			<s:datatype dt:type='string' dt:maxLength='3'/>
		</s:AttributeType>
		<s:AttributeType name='SPG_REMARK' rs:number='25' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_PANJUNG'
			 rs:basecolumn='SPG_REMARK'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='SPG_ETC_TX' rs:number='26' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_PANJUNG'
			 rs:basecolumn='SPG_ETC_TX'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='SPG_ORSU_CD' rs:number='27' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_PANJUNG'
			 rs:basecolumn='SPG_ORSU_CD'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='SPG_CYCLE_CD' rs:number='28' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_PANJUNG'
			 rs:basecolumn='SPG_CYCLE_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='SPG_CYCLE_TX' rs:number='29' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_PANJUNG'
			 rs:basecolumn='SPG_CYCLE_TX'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='SPG_CYCLE_DT' rs:number='30' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_PANJUNG'
			 rs:basecolumn='SPG_CYCLE_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='SPG_PANJ_DT' rs:number='31' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_PANJUNG'
			 rs:basecolumn='SPG_PANJ_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='SPG_DOCT_CD' rs:number='32' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_PANJUNG'
			 rs:basecolumn='SPG_DOCT_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='SPG_INPT_ID' rs:number='33' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_PANJUNG'
			 rs:basecolumn='SPG_INPT_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='SPG_INPT_DTT' rs:number='34' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_PANJUNG'
			 rs:basecolumn='SPG_INPT_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='SPG_MODI_ID' rs:number='35' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_PANJUNG'
			 rs:basecolumn='SPG_MODI_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='SPG_MODI_DTT' rs:number='36' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_PANJUNG'
			 rs:basecolumn='SPG_MODI_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='SPG_SOKY_TX' rs:number='37' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_PANJUNG'
			 rs:basecolumn='SPG_SOKY_TX'>
			<s:datatype dt:type='string' dt:maxLength='1000'/>
		</s:AttributeType>
		<s:AttributeType name='SPG_PAN_CHECK' rs:number='38' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_PANJUNG'
			 rs:basecolumn='SPG_PAN_CHECK'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='SPG_ORGA_ETC' rs:number='39' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_PANJUNG'
			 rs:basecolumn='SPG_ORGA_ETC'>
			<s:datatype dt:type='string' dt:maxLength='500'/>
		</s:AttributeType>
		<s:AttributeType name='CSM_LARGE' rs:number='40' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_SP_MATTER'
			 rs:basecolumn='CSM_LARGE'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='CSM_MATT_CD' rs:number='41' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_SP_MATTER'
			 rs:basecolumn='CSM_MATT_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='CSM_MATT_NM' rs:number='42' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_SP_MATTER'
			 rs:basecolumn='CSM_MATT_NM'>
			<s:datatype dt:type='string' dt:maxLength='300'/>
		</s:AttributeType>
		<s:AttributeType name='CSM_JIB_CD' rs:number='43' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_SP_MATTER'
			 rs:basecolumn='CSM_JIB_CD'>
			<s:datatype dt:type='string' dt:maxLength='4'/>
		</s:AttributeType>
		<s:AttributeType name='CSM_INJA_CD' rs:number='44' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_SP_MATTER'
			 rs:basecolumn='CSM_INJA_CD'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='CSM_PERIOD_TM' rs:number='45' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_SP_MATTER'
			 rs:basecolumn='CSM_PERIOD_TM'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='CSM_AFTER_TM' rs:number='46' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_SP_MATTER'
			 rs:basecolumn='CSM_AFTER_TM'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='CSM_COMM_CD' rs:number='47' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_SP_MATTER'
			 rs:basecolumn='CSM_COMM_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='CSM_STAT_YR' rs:number='48' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_SP_MATTER'
			 rs:basecolumn='CSM_STAT_YR'>
			<s:datatype dt:type='string' dt:maxLength='4'/>
		</s:AttributeType>
		<s:AttributeType name='CSM_USE_YN' rs:number='49' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_SP_MATTER'
			 rs:basecolumn='CSM_USE_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='CSM_NUSE_ID' rs:number='50' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_SP_MATTER'
			 rs:basecolumn='CSM_NUSE_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='CSM_NUSE_DTT' rs:number='51' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_SP_MATTER'
			 rs:basecolumn='CSM_NUSE_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='CSM_INPT_ID' rs:number='52' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_SP_MATTER'
			 rs:basecolumn='CSM_INPT_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='CSM_INPT_DTT' rs:number='53' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_SP_MATTER'
			 rs:basecolumn='CSM_INPT_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='CSM_MODI_ID' rs:number='54' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_SP_MATTER'
			 rs:basecolumn='CSM_MODI_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='CSM_MODI_DTT' rs:number='55' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_SP_MATTER'
			 rs:basecolumn='CSM_MODI_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='CSC_LARGE' rs:number='56' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_SP_COMMON'
			 rs:basecolumn='CSC_LARGE'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='CSC_SMALL' rs:number='57' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_SP_COMMON'
			 rs:basecolumn='CSC_SMALL'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='CSC_LEVEL' rs:number='58' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_SP_COMMON'
			 rs:basecolumn='CSC_LEVEL'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='CSC_FULL_NM' rs:number='59' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_SP_COMMON'
			 rs:basecolumn='CSC_FULL_NM'>
			<s:datatype dt:type='string' dt:maxLength='500'/>
		</s:AttributeType>
		<s:AttributeType name='CSC_CODE_EX' rs:number='60' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_SP_COMMON'
			 rs:basecolumn='CSC_CODE_EX'>
			<s:datatype dt:type='string' dt:maxLength='300'/>
		</s:AttributeType>
		<s:AttributeType name='CSC_ETC1_NM' rs:number='61' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_SP_COMMON'
			 rs:basecolumn='CSC_ETC1_NM'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='CSC_ETC1_CD' rs:number='62' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_SP_COMMON'
			 rs:basecolumn='CSC_ETC1_CD'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='CSC_ETC2_NM' rs:number='63' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_SP_COMMON'
			 rs:basecolumn='CSC_ETC2_NM'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='CSC_ETC2_CD' rs:number='64' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_SP_COMMON'
			 rs:basecolumn='CSC_ETC2_CD'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='CSC_ETC3_NM' rs:number='65' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_SP_COMMON'
			 rs:basecolumn='CSC_ETC3_NM'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='CSC_ETC3_CD' rs:number='66' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_SP_COMMON'
			 rs:basecolumn='CSC_ETC3_CD'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='CSC_ETC4_NM' rs:number='67' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_SP_COMMON'
			 rs:basecolumn='CSC_ETC4_NM'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='CSC_ETC4_CD' rs:number='68' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_SP_COMMON'
			 rs:basecolumn='CSC_ETC4_CD'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='CSC_ETC5_NM' rs:number='69' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_SP_COMMON'
			 rs:basecolumn='CSC_ETC5_NM'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='CSC_ETC5_CD' rs:number='70' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_SP_COMMON'
			 rs:basecolumn='CSC_ETC5_CD'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='CSC_CODE_ST' rs:number='71' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_SP_COMMON'
			 rs:basecolumn='CSC_CODE_ST'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='CSC_CODE_GR' rs:number='72' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_SP_COMMON'
			 rs:basecolumn='CSC_CODE_GR'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='CSC_USE_YN' rs:number='73' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_SP_COMMON'
			 rs:basecolumn='CSC_USE_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='CSC_NUSE_ID' rs:number='74' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_SP_COMMON'
			 rs:basecolumn='CSC_NUSE_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='CSC_NUSE_DTT' rs:number='75' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_SP_COMMON'
			 rs:basecolumn='CSC_NUSE_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='CSC_INPT_ID' rs:number='76' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_SP_COMMON'
			 rs:basecolumn='CSC_INPT_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='CSC_INPT_DTT' rs:number='77' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_SP_COMMON'
			 rs:basecolumn='CSC_INPT_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='CSC_MODI_ID' rs:number='78' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_SP_COMMON'
			 rs:basecolumn='CSC_MODI_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='CSC_MODI_DTT' rs:number='79' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_SP_COMMON'
			 rs:basecolumn='CSC_MODI_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='80' rs:rowid='true' rs:basetable='ST_PANJUNG' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c80' rs:name='ROWID' rs:number='81' rs:rowid='true' rs:basetable='CT_SP_MATTER' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c81' rs:name='ROWID' rs:number='82' rs:rowid='true' rs:basetable='CT_SP_COMMON' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:extends type='rs:rowbase'/>
	</s:ElementType>
</s:Schema>		<rs:data>
<%
		int cnt = 0;
		while(cRsList.next()) {

			cnt++;

			String SPG_EXAM_DT_T = cRsList.getString("SPG_EXAM_DT");
			String SPG_EXAM_SQ_T = cRsList.getString("SPG_EXAM_SQ");
			String SPG_EXAM_CHA_T = cRsList.getString("SPG_EXAM_CHA");
			String SPG_MATT_CD_T = cRsList.getString("SPG_MATT_CD");
			String SPG_MATT_SQ_T = cRsList.getString("SPG_MATT_SQ");
			String SPG_ORGA_CD_T = cRsList.getString("SPG_ORGA_CD");
			String SPG_SWING_CD_T = cRsList.getString("SPG_SWING_CD");
			String SPG_SLNS_KD_T = cRsList.getString("SPG_SLNS_KD");
			String SPG_SOKY_CD_T = cRsList.getString("SPG_SOKY_CD");
			String SPG_SOKY_NM_T = cRsList.getString("SPG_SOKY_NM");
			String SPG_PANJ_CD_T = cRsList.getString("SPG_PANJ_CD");
			String SPG_JOCHI_CD_T = cRsList.getString("SPG_JOCHI_CD");
			String SPG_JOCHI_NM_T = cRsList.getString("SPG_JOCHI_NM");
			String SPG_JILH_CD_T = cRsList.getString("SPG_JILH_CD");
			String SPG_POSM1_CD_T = cRsList.getString("SPG_POSM1_CD");
			String SPG_POSM2_CD_T = cRsList.getString("SPG_POSM2_CD");
			String SPG_POSM3_CD_T = cRsList.getString("SPG_POSM3_CD");
			String SPG_POSM1_TX_T = cRsList.getString("SPG_POSM1_TX");
			String SPG_POSM2_TX_T = cRsList.getString("SPG_POSM2_TX");
			String SPG_POSM3_TX_T = cRsList.getString("SPG_POSM3_TX");
			String SPG_POSM1_DT_T = cRsList.getString("SPG_POSM1_DT");
			String SPG_POSM2_DT_T = cRsList.getString("SPG_POSM2_DT");
			String SPG_POSM3_DT_T = cRsList.getString("SPG_POSM3_DT");
			String SPG_BUSI_CD_T = cRsList.getString("SPG_BUSI_CD");
			String SPG_REMARK_T = cRsList.getString("SPG_REMARK");
			String SPG_ETC_TX_T = cRsList.getString("SPG_ETC_TX");
			String SPG_ORSU_CD_T = cRsList.getString("SPG_ORSU_CD");
			String SPG_CYCLE_CD_T = cRsList.getString("SPG_CYCLE_CD");
			String SPG_CYCLE_TX_T = cRsList.getString("SPG_CYCLE_TX");
			String SPG_CYCLE_DT_T = cRsList.getString("SPG_CYCLE_DT");
			String SPG_PANJ_DT_T = cRsList.getString("SPG_PANJ_DT");
			String SPG_DOCT_CD_T = cRsList.getString("SPG_DOCT_CD");
			String SPG_INPT_ID_T = cRsList.getString("SPG_INPT_ID");
			String SPG_INPT_DTT_T = cRsList.getDate2("SPG_INPT_DTT");
			String SPG_MODI_ID_T = cRsList.getString("SPG_MODI_ID");
			String SPG_MODI_DTT_T = cRsList.getDate2("SPG_MODI_DTT");
			String SPG_SOKY_TX_T = cRsList.getString("SPG_SOKY_TX");
			String SPG_PAN_CHECK_T = cRsList.getString("SPG_PAN_CHECK");
			String SPG_ORGA_ETC_T = cRsList.getString("SPG_ORGA_ETC");
			String CSM_LARGE_T = cRsList.getString("CSM_LARGE");
			String CSM_MATT_CD_T = cRsList.getString("CSM_MATT_CD");
			String CSM_MATT_NM_T = cRsList.getString("CSM_MATT_NM");
			String CSM_JIB_CD_T = cRsList.getString("CSM_JIB_CD");
			String CSM_INJA_CD_T = cRsList.getString("CSM_INJA_CD");
			String CSM_PERIOD_TM_T = cRsList.getString("CSM_PERIOD_TM");
			String CSM_AFTER_TM_T = cRsList.getString("CSM_AFTER_TM");
			String CSM_COMM_CD_T = cRsList.getString("CSM_COMM_CD");
			String CSM_STAT_YR_T = cRsList.getString("CSM_STAT_YR");
			String CSM_USE_YN_T = cRsList.getString("CSM_USE_YN");
			String CSM_NUSE_ID_T = cRsList.getString("CSM_NUSE_ID");
			String CSM_NUSE_DTT_T = cRsList.getDate2("CSM_NUSE_DTT");
			String CSM_INPT_ID_T = cRsList.getString("CSM_INPT_ID");
			String CSM_INPT_DTT_T = cRsList.getDate2("CSM_INPT_DTT");
			String CSM_MODI_ID_T = cRsList.getString("CSM_MODI_ID");
			String CSM_MODI_DTT_T = cRsList.getDate2("CSM_MODI_DTT");
			String CSC_LARGE_T = cRsList.getString("CSC_LARGE");
			String CSC_SMALL_T = cRsList.getString("CSC_SMALL");
			String CSC_LEVEL_T = cRsList.getString("CSC_LEVEL");
			String CSC_FULL_NM_T = cRsList.getString("CSC_FULL_NM");
			String CSC_CODE_EX_T = cRsList.getString("CSC_CODE_EX");
			String CSC_ETC1_NM_T = cRsList.getString("CSC_ETC1_NM");
			String CSC_ETC1_CD_T = cRsList.getString("CSC_ETC1_CD");
			String CSC_ETC2_NM_T = cRsList.getString("CSC_ETC2_NM");
			String CSC_ETC2_CD_T = cRsList.getString("CSC_ETC2_CD");
			String CSC_ETC3_NM_T = cRsList.getString("CSC_ETC3_NM");
			String CSC_ETC3_CD_T = cRsList.getString("CSC_ETC3_CD");
			String CSC_ETC4_NM_T = cRsList.getString("CSC_ETC4_NM");
			String CSC_ETC4_CD_T = cRsList.getString("CSC_ETC4_CD");
			String CSC_ETC5_NM_T = cRsList.getString("CSC_ETC5_NM");
			String CSC_ETC5_CD_T = cRsList.getString("CSC_ETC5_CD");
			String CSC_CODE_ST_T = cRsList.getString("CSC_CODE_ST");
			String CSC_CODE_GR_T = cRsList.getString("CSC_CODE_GR");
			String CSC_USE_YN_T = cRsList.getString("CSC_USE_YN");
			String CSC_NUSE_ID_T = cRsList.getString("CSC_NUSE_ID");
			String CSC_NUSE_DTT_T = cRsList.getDate2("CSC_NUSE_DTT");
			String CSC_INPT_ID_T = cRsList.getString("CSC_INPT_ID");
			String CSC_INPT_DTT_T = cRsList.getDate2("CSC_INPT_DTT");
			String CSC_MODI_ID_T = cRsList.getString("CSC_MODI_ID");
			String CSC_MODI_DTT_T = cRsList.getDate2("CSC_MODI_DTT");
			String ROWID_T = cRsList.getString("ROWID");
			String c80_T = cRsList.getString("c80");
			String c81_T = cRsList.getString("c81");
%>
			<z:row
<%
			if(! SPG_EXAM_DT_T.equals("")) {
%>
		 		SPG_EXAM_DT='<%= SPG_EXAM_DT_T%>'
<%
			}

			if(! SPG_EXAM_SQ_T.equals("")) {
%>
		 		SPG_EXAM_SQ='<%= SPG_EXAM_SQ_T%>'
<%
			}

			if(! SPG_EXAM_CHA_T.equals("")) {
%>
		 		SPG_EXAM_CHA='<%= SPG_EXAM_CHA_T%>'
<%
			}

			if(! SPG_MATT_CD_T.equals("")) {
%>
		 		SPG_MATT_CD='<%= SPG_MATT_CD_T%>'
<%
			}

			if(! SPG_MATT_SQ_T.equals("")) {
%>
		 		SPG_MATT_SQ='<%= SPG_MATT_SQ_T%>'
<%
			}

			if(! SPG_ORGA_CD_T.equals("")) {
%>
		 		SPG_ORGA_CD='<%= SPG_ORGA_CD_T%>'
<%
			}

			if(! SPG_SWING_CD_T.equals("")) {
%>
		 		SPG_SWING_CD='<%= SPG_SWING_CD_T%>'
<%
			}

			if(! SPG_SLNS_KD_T.equals("")) {
%>
		 		SPG_SLNS_KD='<%= SPG_SLNS_KD_T%>'
<%
			}

			if(! SPG_SOKY_CD_T.equals("")) {
%>
		 		SPG_SOKY_CD='<%= SPG_SOKY_CD_T%>'
<%
			}

			if(! SPG_SOKY_NM_T.equals("")) {
%>
		 		SPG_SOKY_NM='<%= SPG_SOKY_NM_T%>'
<%
			}

			if(! SPG_PANJ_CD_T.equals("")) {
%>
		 		SPG_PANJ_CD='<%= SPG_PANJ_CD_T%>'
<%
			}

			if(! SPG_JOCHI_CD_T.equals("")) {
%>
		 		SPG_JOCHI_CD='<%= SPG_JOCHI_CD_T%>'
<%
			}

			if(! SPG_JOCHI_NM_T.equals("")) {
%>
		 		SPG_JOCHI_NM='<%= SPG_JOCHI_NM_T%>'
<%
			}

			if(! SPG_JILH_CD_T.equals("")) {
%>
		 		SPG_JILH_CD='<%= SPG_JILH_CD_T%>'
<%
			}

			if(! SPG_POSM1_CD_T.equals("")) {
%>
		 		SPG_POSM1_CD='<%= SPG_POSM1_CD_T%>'
<%
			}

			if(! SPG_POSM2_CD_T.equals("")) {
%>
		 		SPG_POSM2_CD='<%= SPG_POSM2_CD_T%>'
<%
			}

			if(! SPG_POSM3_CD_T.equals("")) {
%>
		 		SPG_POSM3_CD='<%= SPG_POSM3_CD_T%>'
<%
			}

			if(! SPG_POSM1_TX_T.equals("")) {
%>
		 		SPG_POSM1_TX='<%= SPG_POSM1_TX_T%>'
<%
			}

			if(! SPG_POSM2_TX_T.equals("")) {
%>
		 		SPG_POSM2_TX='<%= SPG_POSM2_TX_T%>'
<%
			}

			if(! SPG_POSM3_TX_T.equals("")) {
%>
		 		SPG_POSM3_TX='<%= SPG_POSM3_TX_T%>'
<%
			}

			if(! SPG_POSM1_DT_T.equals("")) {
%>
		 		SPG_POSM1_DT='<%= SPG_POSM1_DT_T%>'
<%
			}

			if(! SPG_POSM2_DT_T.equals("")) {
%>
		 		SPG_POSM2_DT='<%= SPG_POSM2_DT_T%>'
<%
			}

			if(! SPG_POSM3_DT_T.equals("")) {
%>
		 		SPG_POSM3_DT='<%= SPG_POSM3_DT_T%>'
<%
			}

			if(! SPG_BUSI_CD_T.equals("")) {
%>
		 		SPG_BUSI_CD='<%= SPG_BUSI_CD_T%>'
<%
			}

			if(! SPG_REMARK_T.equals("")) {
%>
		 		SPG_REMARK='<%= SPG_REMARK_T%>'
<%
			}

			if(! SPG_ETC_TX_T.equals("")) {
%>
		 		SPG_ETC_TX='<%= SPG_ETC_TX_T%>'
<%
			}

			if(! SPG_ORSU_CD_T.equals("")) {
%>
		 		SPG_ORSU_CD='<%= SPG_ORSU_CD_T%>'
<%
			}

			if(! SPG_CYCLE_CD_T.equals("")) {
%>
		 		SPG_CYCLE_CD='<%= SPG_CYCLE_CD_T%>'
<%
			}

			if(! SPG_CYCLE_TX_T.equals("")) {
%>
		 		SPG_CYCLE_TX='<%= SPG_CYCLE_TX_T%>'
<%
			}

			if(! SPG_CYCLE_DT_T.equals("")) {
%>
		 		SPG_CYCLE_DT='<%= SPG_CYCLE_DT_T%>'
<%
			}

			if(! SPG_PANJ_DT_T.equals("")) {
%>
		 		SPG_PANJ_DT='<%= SPG_PANJ_DT_T%>'
<%
			}

			if(! SPG_DOCT_CD_T.equals("")) {
%>
		 		SPG_DOCT_CD='<%= SPG_DOCT_CD_T%>'
<%
			}

			if(! SPG_INPT_ID_T.equals("")) {
%>
		 		SPG_INPT_ID='<%= SPG_INPT_ID_T%>'
<%
			}

			if(! SPG_INPT_DTT_T.equals("")) {
%>
		 		SPG_INPT_DTT='<%= SPG_INPT_DTT_T%>'
<%
			}

			if(! SPG_MODI_ID_T.equals("")) {
%>
		 		SPG_MODI_ID='<%= SPG_MODI_ID_T%>'
<%
			}

			if(! SPG_MODI_DTT_T.equals("")) {
%>
		 		SPG_MODI_DTT='<%= SPG_MODI_DTT_T%>'
<%
			}

			if(! SPG_SOKY_TX_T.equals("")) {
%>
		 		SPG_SOKY_TX='<%= SPG_SOKY_TX_T%>'
<%
			}

			if(! SPG_PAN_CHECK_T.equals("")) {
%>
		 		SPG_PAN_CHECK='<%= SPG_PAN_CHECK_T%>'
<%
			}

			if(! SPG_ORGA_ETC_T.equals("")) {
%>
		 		SPG_ORGA_ETC='<%= SPG_ORGA_ETC_T%>'
<%
			}

			if(! CSM_LARGE_T.equals("")) {
%>
		 		CSM_LARGE='<%= CSM_LARGE_T%>'
<%
			}

			if(! CSM_MATT_CD_T.equals("")) {
%>
		 		CSM_MATT_CD='<%= CSM_MATT_CD_T%>'
<%
			}

			if(! CSM_MATT_NM_T.equals("")) {
%>
		 		CSM_MATT_NM='<%= CSM_MATT_NM_T%>'
<%
			}

			if(! CSM_JIB_CD_T.equals("")) {
%>
		 		CSM_JIB_CD='<%= CSM_JIB_CD_T%>'
<%
			}

			if(! CSM_INJA_CD_T.equals("")) {
%>
		 		CSM_INJA_CD='<%= CSM_INJA_CD_T%>'
<%
			}

			if(! CSM_PERIOD_TM_T.equals("")) {
%>
		 		CSM_PERIOD_TM='<%= CSM_PERIOD_TM_T%>'
<%
			}

			if(! CSM_AFTER_TM_T.equals("")) {
%>
		 		CSM_AFTER_TM='<%= CSM_AFTER_TM_T%>'
<%
			}

			if(! CSM_COMM_CD_T.equals("")) {
%>
		 		CSM_COMM_CD='<%= CSM_COMM_CD_T%>'
<%
			}

			if(! CSM_STAT_YR_T.equals("")) {
%>
		 		CSM_STAT_YR='<%= CSM_STAT_YR_T%>'
<%
			}

			if(! CSM_USE_YN_T.equals("")) {
%>
		 		CSM_USE_YN='<%= CSM_USE_YN_T%>'
<%
			}

			if(! CSM_NUSE_ID_T.equals("")) {
%>
		 		CSM_NUSE_ID='<%= CSM_NUSE_ID_T%>'
<%
			}

			if(! CSM_NUSE_DTT_T.equals("")) {
%>
		 		CSM_NUSE_DTT='<%= CSM_NUSE_DTT_T%>'
<%
			}

			if(! CSM_INPT_ID_T.equals("")) {
%>
		 		CSM_INPT_ID='<%= CSM_INPT_ID_T%>'
<%
			}

			if(! CSM_INPT_DTT_T.equals("")) {
%>
		 		CSM_INPT_DTT='<%= CSM_INPT_DTT_T%>'
<%
			}

			if(! CSM_MODI_ID_T.equals("")) {
%>
		 		CSM_MODI_ID='<%= CSM_MODI_ID_T%>'
<%
			}

			if(! CSM_MODI_DTT_T.equals("")) {
%>
		 		CSM_MODI_DTT='<%= CSM_MODI_DTT_T%>'
<%
			}

			if(! CSC_LARGE_T.equals("")) {
%>
		 		CSC_LARGE='<%= CSC_LARGE_T%>'
<%
			}

			if(! CSC_SMALL_T.equals("")) {
%>
		 		CSC_SMALL='<%= CSC_SMALL_T%>'
<%
			}

			if(! CSC_LEVEL_T.equals("")) {
%>
		 		CSC_LEVEL='<%= CSC_LEVEL_T%>'
<%
			}

			if(! CSC_FULL_NM_T.equals("")) {
%>
		 		CSC_FULL_NM='<%= CSC_FULL_NM_T%>'
<%
			}

			if(! CSC_CODE_EX_T.equals("")) {
%>
		 		CSC_CODE_EX='<%= CSC_CODE_EX_T%>'
<%
			}

			if(! CSC_ETC1_NM_T.equals("")) {
%>
		 		CSC_ETC1_NM='<%= CSC_ETC1_NM_T%>'
<%
			}

			if(! CSC_ETC1_CD_T.equals("")) {
%>
		 		CSC_ETC1_CD='<%= CSC_ETC1_CD_T%>'
<%
			}

			if(! CSC_ETC2_NM_T.equals("")) {
%>
		 		CSC_ETC2_NM='<%= CSC_ETC2_NM_T%>'
<%
			}

			if(! CSC_ETC2_CD_T.equals("")) {
%>
		 		CSC_ETC2_CD='<%= CSC_ETC2_CD_T%>'
<%
			}

			if(! CSC_ETC3_NM_T.equals("")) {
%>
		 		CSC_ETC3_NM='<%= CSC_ETC3_NM_T%>'
<%
			}

			if(! CSC_ETC3_CD_T.equals("")) {
%>
		 		CSC_ETC3_CD='<%= CSC_ETC3_CD_T%>'
<%
			}

			if(! CSC_ETC4_NM_T.equals("")) {
%>
		 		CSC_ETC4_NM='<%= CSC_ETC4_NM_T%>'
<%
			}

			if(! CSC_ETC4_CD_T.equals("")) {
%>
		 		CSC_ETC4_CD='<%= CSC_ETC4_CD_T%>'
<%
			}

			if(! CSC_ETC5_NM_T.equals("")) {
%>
		 		CSC_ETC5_NM='<%= CSC_ETC5_NM_T%>'
<%
			}

			if(! CSC_ETC5_CD_T.equals("")) {
%>
		 		CSC_ETC5_CD='<%= CSC_ETC5_CD_T%>'
<%
			}

			if(! CSC_CODE_ST_T.equals("")) {
%>
		 		CSC_CODE_ST='<%= CSC_CODE_ST_T%>'
<%
			}

			if(! CSC_CODE_GR_T.equals("")) {
%>
		 		CSC_CODE_GR='<%= CSC_CODE_GR_T%>'
<%
			}

			if(! CSC_USE_YN_T.equals("")) {
%>
		 		CSC_USE_YN='<%= CSC_USE_YN_T%>'
<%
			}

			if(! CSC_NUSE_ID_T.equals("")) {
%>
		 		CSC_NUSE_ID='<%= CSC_NUSE_ID_T%>'
<%
			}

			if(! CSC_NUSE_DTT_T.equals("")) {
%>
		 		CSC_NUSE_DTT='<%= CSC_NUSE_DTT_T%>'
<%
			}

			if(! CSC_INPT_ID_T.equals("")) {
%>
		 		CSC_INPT_ID='<%= CSC_INPT_ID_T%>'
<%
			}

			if(! CSC_INPT_DTT_T.equals("")) {
%>
		 		CSC_INPT_DTT='<%= CSC_INPT_DTT_T%>'
<%
			}

			if(! CSC_MODI_ID_T.equals("")) {
%>
		 		CSC_MODI_ID='<%= CSC_MODI_ID_T%>'
<%
			}

			if(! CSC_MODI_DTT_T.equals("")) {
%>
		 		CSC_MODI_DTT='<%= CSC_MODI_DTT_T%>'
<%
			}
%>
				ROWID='<%= cnt%>'
				c80='<%= cnt%>'
				c81='<%= cnt%>'
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
