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

SELECT * FROM ET_JOBSTRESS
 WHERE EJS_EXAM_DT = :EXAM_DT
   AND EJS_EXAM_SQ = :EXAM_SQ
		*/

		sql = " SELECT *";
		sql += " FROM ET_JOBSTRESS";
		sql += " WHERE EJS_EXAM_DT = '" + EXAM_DT + "'";
		sql += " AND EJS_EXAM_SQ = '" + EXAM_SQ + "'";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uJobStress_UF_Save_001 \n";
			G_INFO += "설명 : 직무스트레스 정보 로딩 \n";
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
		<s:AttributeType name='EJS_EXAM_DT' rs:number='1' rs:writeunknown='true' rs:basetable='ET_JOBSTRESS' rs:basecolumn='EJS_EXAM_DT'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EJS_EXAM_SQ' rs:number='2' rs:writeunknown='true' rs:basetable='ET_JOBSTRESS' rs:basecolumn='EJS_EXAM_SQ'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EJS_QST1_1VL' rs:number='3' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_JOBSTRESS'
			 rs:basecolumn='EJS_QST1_1VL'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EJS_QST1_2VL' rs:number='4' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_JOBSTRESS'
			 rs:basecolumn='EJS_QST1_2VL'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EJS_QST1_3VL' rs:number='5' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_JOBSTRESS'
			 rs:basecolumn='EJS_QST1_3VL'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EJS_RST1_VL' rs:number='6' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_JOBSTRESS'
			 rs:basecolumn='EJS_RST1_VL'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EJS_QST2_4VL' rs:number='7' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_JOBSTRESS'
			 rs:basecolumn='EJS_QST2_4VL'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EJS_QST2_5VL' rs:number='8' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_JOBSTRESS'
			 rs:basecolumn='EJS_QST2_5VL'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EJS_QST2_6VL' rs:number='9' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_JOBSTRESS'
			 rs:basecolumn='EJS_QST2_6VL'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EJS_QST2_7VL' rs:number='10' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_JOBSTRESS'
			 rs:basecolumn='EJS_QST2_7VL'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EJS_QST2_8VL' rs:number='11' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_JOBSTRESS'
			 rs:basecolumn='EJS_QST2_8VL'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EJS_QST2_9VL' rs:number='12' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_JOBSTRESS'
			 rs:basecolumn='EJS_QST2_9VL'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EJS_QST2_10VL' rs:number='13' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_JOBSTRESS'
			 rs:basecolumn='EJS_QST2_10VL'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EJS_QST2_11VL' rs:number='14' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_JOBSTRESS'
			 rs:basecolumn='EJS_QST2_11VL'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EJS_RST2_VL' rs:number='15' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_JOBSTRESS'
			 rs:basecolumn='EJS_RST2_VL'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EJS_QST3_12VL' rs:number='16' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_JOBSTRESS'
			 rs:basecolumn='EJS_QST3_12VL'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EJS_QST3_13VL' rs:number='17' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_JOBSTRESS'
			 rs:basecolumn='EJS_QST3_13VL'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EJS_QST3_14VL' rs:number='18' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_JOBSTRESS'
			 rs:basecolumn='EJS_QST3_14VL'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EJS_QST3_15VL' rs:number='19' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_JOBSTRESS'
			 rs:basecolumn='EJS_QST3_15VL'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EJS_QST3_16VL' rs:number='20' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_JOBSTRESS'
			 rs:basecolumn='EJS_QST3_16VL'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EJS_RST3_VL' rs:number='21' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_JOBSTRESS'
			 rs:basecolumn='EJS_RST3_VL'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EJS_QST4_17VL' rs:number='22' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_JOBSTRESS'
			 rs:basecolumn='EJS_QST4_17VL'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EJS_QST4_18VL' rs:number='23' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_JOBSTRESS'
			 rs:basecolumn='EJS_QST4_18VL'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EJS_QST4_19VL' rs:number='24' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_JOBSTRESS'
			 rs:basecolumn='EJS_QST4_19VL'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EJS_QST4_20VL' rs:number='25' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_JOBSTRESS'
			 rs:basecolumn='EJS_QST4_20VL'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EJS_RST4_VL' rs:number='26' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_JOBSTRESS'
			 rs:basecolumn='EJS_RST4_VL'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EJS_QST5_21VL' rs:number='27' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_JOBSTRESS'
			 rs:basecolumn='EJS_QST5_21VL'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EJS_QST5_22VL' rs:number='28' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_JOBSTRESS'
			 rs:basecolumn='EJS_QST5_22VL'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EJS_QST5_23VL' rs:number='29' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_JOBSTRESS'
			 rs:basecolumn='EJS_QST5_23VL'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EJS_QST5_24VL' rs:number='30' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_JOBSTRESS'
			 rs:basecolumn='EJS_QST5_24VL'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EJS_QST5_25VL' rs:number='31' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_JOBSTRESS'
			 rs:basecolumn='EJS_QST5_25VL'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EJS_QST5_26VL' rs:number='32' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_JOBSTRESS'
			 rs:basecolumn='EJS_QST5_26VL'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EJS_RST5_VL' rs:number='33' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_JOBSTRESS'
			 rs:basecolumn='EJS_RST5_VL'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EJS_QST6_27VL' rs:number='34' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_JOBSTRESS'
			 rs:basecolumn='EJS_QST6_27VL'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EJS_QST6_28VL' rs:number='35' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_JOBSTRESS'
			 rs:basecolumn='EJS_QST6_28VL'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EJS_QST6_29VL' rs:number='36' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_JOBSTRESS'
			 rs:basecolumn='EJS_QST6_29VL'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EJS_QST6_30VL' rs:number='37' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_JOBSTRESS'
			 rs:basecolumn='EJS_QST6_30VL'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EJS_QST6_31VL' rs:number='38' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_JOBSTRESS'
			 rs:basecolumn='EJS_QST6_31VL'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EJS_QST6_32VL' rs:number='39' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_JOBSTRESS'
			 rs:basecolumn='EJS_QST6_32VL'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EJS_QST6_33VL' rs:number='40' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_JOBSTRESS'
			 rs:basecolumn='EJS_QST6_33VL'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EJS_RST6_VL' rs:number='41' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_JOBSTRESS'
			 rs:basecolumn='EJS_RST6_VL'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EJS_QST7_34VL' rs:number='42' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_JOBSTRESS'
			 rs:basecolumn='EJS_QST7_34VL'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EJS_QST7_35VL' rs:number='43' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_JOBSTRESS'
			 rs:basecolumn='EJS_QST7_35VL'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EJS_QST7_36VL' rs:number='44' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_JOBSTRESS'
			 rs:basecolumn='EJS_QST7_36VL'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EJS_QST7_37VL' rs:number='45' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_JOBSTRESS'
			 rs:basecolumn='EJS_QST7_37VL'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EJS_QST7_38VL' rs:number='46' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_JOBSTRESS'
			 rs:basecolumn='EJS_QST7_38VL'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EJS_QST7_39VL' rs:number='47' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_JOBSTRESS'
			 rs:basecolumn='EJS_QST7_39VL'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EJS_RST7_VL' rs:number='48' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_JOBSTRESS'
			 rs:basecolumn='EJS_RST7_VL'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EJS_QST8_40VL' rs:number='49' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_JOBSTRESS'
			 rs:basecolumn='EJS_QST8_40VL'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EJS_QST8_41VL' rs:number='50' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_JOBSTRESS'
			 rs:basecolumn='EJS_QST8_41VL'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EJS_QST8_42VL' rs:number='51' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_JOBSTRESS'
			 rs:basecolumn='EJS_QST8_42VL'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EJS_QST8_43VL' rs:number='52' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_JOBSTRESS'
			 rs:basecolumn='EJS_QST8_43VL'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EJS_RST8_VL' rs:number='53' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_JOBSTRESS'
			 rs:basecolumn='EJS_RST8_VL'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EJS_RSTT_VL' rs:number='54' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_JOBSTRESS'
			 rs:basecolumn='EJS_RSTT_VL'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EJS_RSLT_TX' rs:number='55' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_JOBSTRESS'
			 rs:basecolumn='EJS_RSLT_TX'>
			<s:datatype dt:type='string' dt:maxLength='2000'/>
		</s:AttributeType>
		<s:AttributeType name='EJS_PANJ_DT' rs:number='56' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_JOBSTRESS'
			 rs:basecolumn='EJS_PANJ_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EJS_DOCT_CD' rs:number='57' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_JOBSTRESS'
			 rs:basecolumn='EJS_DOCT_CD'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='EJS_PANJ_YN' rs:number='58' rs:writeunknown='true' rs:basetable='ET_JOBSTRESS' rs:basecolumn='EJS_PANJ_YN'>
			<s:datatype dt:type='string' dt:maxLength='1' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EJS_INPT_ID' rs:number='59' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_JOBSTRESS'
			 rs:basecolumn='EJS_INPT_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='EJS_INPT_DTT' rs:number='60' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_JOBSTRESS'
			 rs:basecolumn='EJS_INPT_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EJS_MODI_ID' rs:number='61' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_JOBSTRESS'
			 rs:basecolumn='EJS_MODI_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='EJS_MODI_DTT' rs:number='62' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_JOBSTRESS'
			 rs:basecolumn='EJS_MODI_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='63' rs:rowid='true' rs:writeunknown='true' rs:basetable='ET_JOBSTRESS'
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

			String EJS_EXAM_DT_T = cRsList.getString("EJS_EXAM_DT");
			String EJS_EXAM_SQ_T = cRsList.getString("EJS_EXAM_SQ");
			String EJS_QST1_1VL_T = cRsList.getString("EJS_QST1_1VL");
			String EJS_QST1_2VL_T = cRsList.getString("EJS_QST1_2VL");
			String EJS_QST1_3VL_T = cRsList.getString("EJS_QST1_3VL");
			String EJS_RST1_VL_T = cRsList.getString("EJS_RST1_VL");
			String EJS_QST2_4VL_T = cRsList.getString("EJS_QST2_4VL");
			String EJS_QST2_5VL_T = cRsList.getString("EJS_QST2_5VL");
			String EJS_QST2_6VL_T = cRsList.getString("EJS_QST2_6VL");
			String EJS_QST2_7VL_T = cRsList.getString("EJS_QST2_7VL");
			String EJS_QST2_8VL_T = cRsList.getString("EJS_QST2_8VL");
			String EJS_QST2_9VL_T = cRsList.getString("EJS_QST2_9VL");
			String EJS_QST2_10VL_T = cRsList.getString("EJS_QST2_10VL");
			String EJS_QST2_11VL_T = cRsList.getString("EJS_QST2_11VL");
			String EJS_RST2_VL_T = cRsList.getString("EJS_RST2_VL");
			String EJS_QST3_12VL_T = cRsList.getString("EJS_QST3_12VL");
			String EJS_QST3_13VL_T = cRsList.getString("EJS_QST3_13VL");
			String EJS_QST3_14VL_T = cRsList.getString("EJS_QST3_14VL");
			String EJS_QST3_15VL_T = cRsList.getString("EJS_QST3_15VL");
			String EJS_QST3_16VL_T = cRsList.getString("EJS_QST3_16VL");
			String EJS_RST3_VL_T = cRsList.getString("EJS_RST3_VL");
			String EJS_QST4_17VL_T = cRsList.getString("EJS_QST4_17VL");
			String EJS_QST4_18VL_T = cRsList.getString("EJS_QST4_18VL");
			String EJS_QST4_19VL_T = cRsList.getString("EJS_QST4_19VL");
			String EJS_QST4_20VL_T = cRsList.getString("EJS_QST4_20VL");
			String EJS_RST4_VL_T = cRsList.getString("EJS_RST4_VL");
			String EJS_QST5_21VL_T = cRsList.getString("EJS_QST5_21VL");
			String EJS_QST5_22VL_T = cRsList.getString("EJS_QST5_22VL");
			String EJS_QST5_23VL_T = cRsList.getString("EJS_QST5_23VL");
			String EJS_QST5_24VL_T = cRsList.getString("EJS_QST5_24VL");
			String EJS_QST5_25VL_T = cRsList.getString("EJS_QST5_25VL");
			String EJS_QST5_26VL_T = cRsList.getString("EJS_QST5_26VL");
			String EJS_RST5_VL_T = cRsList.getString("EJS_RST5_VL");
			String EJS_QST6_27VL_T = cRsList.getString("EJS_QST6_27VL");
			String EJS_QST6_28VL_T = cRsList.getString("EJS_QST6_28VL");
			String EJS_QST6_29VL_T = cRsList.getString("EJS_QST6_29VL");
			String EJS_QST6_30VL_T = cRsList.getString("EJS_QST6_30VL");
			String EJS_QST6_31VL_T = cRsList.getString("EJS_QST6_31VL");
			String EJS_QST6_32VL_T = cRsList.getString("EJS_QST6_32VL");
			String EJS_QST6_33VL_T = cRsList.getString("EJS_QST6_33VL");
			String EJS_RST6_VL_T = cRsList.getString("EJS_RST6_VL");
			String EJS_QST7_34VL_T = cRsList.getString("EJS_QST7_34VL");
			String EJS_QST7_35VL_T = cRsList.getString("EJS_QST7_35VL");
			String EJS_QST7_36VL_T = cRsList.getString("EJS_QST7_36VL");
			String EJS_QST7_37VL_T = cRsList.getString("EJS_QST7_37VL");
			String EJS_QST7_38VL_T = cRsList.getString("EJS_QST7_38VL");
			String EJS_QST7_39VL_T = cRsList.getString("EJS_QST7_39VL");
			String EJS_RST7_VL_T = cRsList.getString("EJS_RST7_VL");
			String EJS_QST8_40VL_T = cRsList.getString("EJS_QST8_40VL");
			String EJS_QST8_41VL_T = cRsList.getString("EJS_QST8_41VL");
			String EJS_QST8_42VL_T = cRsList.getString("EJS_QST8_42VL");
			String EJS_QST8_43VL_T = cRsList.getString("EJS_QST8_43VL");
			String EJS_RST8_VL_T = cRsList.getString("EJS_RST8_VL");
			String EJS_RSTT_VL_T = cRsList.getString("EJS_RSTT_VL");
			String EJS_RSLT_TX_T = cRsList.getString("EJS_RSLT_TX");
			String EJS_PANJ_DT_T = cRsList.getString("EJS_PANJ_DT");
			String EJS_DOCT_CD_T = cRsList.getString("EJS_DOCT_CD");
			String EJS_PANJ_YN_T = cRsList.getString("EJS_PANJ_YN");
			String EJS_INPT_ID_T = cRsList.getString("EJS_INPT_ID");
			String EJS_INPT_DTT_T = cRsList.getDate2("EJS_INPT_DTT");
			String EJS_MODI_ID_T = cRsList.getString("EJS_MODI_ID");
			String EJS_MODI_DTT_T = cRsList.getDate2("EJS_MODI_DTT");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! EJS_EXAM_DT_T.equals("")) {
%>
		 		EJS_EXAM_DT='<%= EJS_EXAM_DT_T%>'
<%
			}

			if(! EJS_EXAM_SQ_T.equals("")) {
%>
		 		EJS_EXAM_SQ='<%= EJS_EXAM_SQ_T%>'
<%
			}

			if(! EJS_QST1_1VL_T.equals("")) {
%>
		 		EJS_QST1_1VL='<%= EJS_QST1_1VL_T%>'
<%
			}

			if(! EJS_QST1_2VL_T.equals("")) {
%>
		 		EJS_QST1_2VL='<%= EJS_QST1_2VL_T%>'
<%
			}

			if(! EJS_QST1_3VL_T.equals("")) {
%>
		 		EJS_QST1_3VL='<%= EJS_QST1_3VL_T%>'
<%
			}

			if(! EJS_RST1_VL_T.equals("")) {
%>
		 		EJS_RST1_VL='<%= EJS_RST1_VL_T%>'
<%
			}

			if(! EJS_QST2_4VL_T.equals("")) {
%>
		 		EJS_QST2_4VL='<%= EJS_QST2_4VL_T%>'
<%
			}

			if(! EJS_QST2_5VL_T.equals("")) {
%>
		 		EJS_QST2_5VL='<%= EJS_QST2_5VL_T%>'
<%
			}

			if(! EJS_QST2_6VL_T.equals("")) {
%>
		 		EJS_QST2_6VL='<%= EJS_QST2_6VL_T%>'
<%
			}

			if(! EJS_QST2_7VL_T.equals("")) {
%>
		 		EJS_QST2_7VL='<%= EJS_QST2_7VL_T%>'
<%
			}

			if(! EJS_QST2_8VL_T.equals("")) {
%>
		 		EJS_QST2_8VL='<%= EJS_QST2_8VL_T%>'
<%
			}

			if(! EJS_QST2_9VL_T.equals("")) {
%>
		 		EJS_QST2_9VL='<%= EJS_QST2_9VL_T%>'
<%
			}

			if(! EJS_QST2_10VL_T.equals("")) {
%>
		 		EJS_QST2_10VL='<%= EJS_QST2_10VL_T%>'
<%
			}

			if(! EJS_QST2_11VL_T.equals("")) {
%>
		 		EJS_QST2_11VL='<%= EJS_QST2_11VL_T%>'
<%
			}

			if(! EJS_RST2_VL_T.equals("")) {
%>
		 		EJS_RST2_VL='<%= EJS_RST2_VL_T%>'
<%
			}

			if(! EJS_QST3_12VL_T.equals("")) {
%>
		 		EJS_QST3_12VL='<%= EJS_QST3_12VL_T%>'
<%
			}

			if(! EJS_QST3_13VL_T.equals("")) {
%>
		 		EJS_QST3_13VL='<%= EJS_QST3_13VL_T%>'
<%
			}

			if(! EJS_QST3_14VL_T.equals("")) {
%>
		 		EJS_QST3_14VL='<%= EJS_QST3_14VL_T%>'
<%
			}

			if(! EJS_QST3_15VL_T.equals("")) {
%>
		 		EJS_QST3_15VL='<%= EJS_QST3_15VL_T%>'
<%
			}

			if(! EJS_QST3_16VL_T.equals("")) {
%>
		 		EJS_QST3_16VL='<%= EJS_QST3_16VL_T%>'
<%
			}

			if(! EJS_RST3_VL_T.equals("")) {
%>
		 		EJS_RST3_VL='<%= EJS_RST3_VL_T%>'
<%
			}

			if(! EJS_QST4_17VL_T.equals("")) {
%>
		 		EJS_QST4_17VL='<%= EJS_QST4_17VL_T%>'
<%
			}

			if(! EJS_QST4_18VL_T.equals("")) {
%>
		 		EJS_QST4_18VL='<%= EJS_QST4_18VL_T%>'
<%
			}

			if(! EJS_QST4_19VL_T.equals("")) {
%>
		 		EJS_QST4_19VL='<%= EJS_QST4_19VL_T%>'
<%
			}

			if(! EJS_QST4_20VL_T.equals("")) {
%>
		 		EJS_QST4_20VL='<%= EJS_QST4_20VL_T%>'
<%
			}

			if(! EJS_RST4_VL_T.equals("")) {
%>
		 		EJS_RST4_VL='<%= EJS_RST4_VL_T%>'
<%
			}

			if(! EJS_QST5_21VL_T.equals("")) {
%>
		 		EJS_QST5_21VL='<%= EJS_QST5_21VL_T%>'
<%
			}

			if(! EJS_QST5_22VL_T.equals("")) {
%>
		 		EJS_QST5_22VL='<%= EJS_QST5_22VL_T%>'
<%
			}

			if(! EJS_QST5_23VL_T.equals("")) {
%>
		 		EJS_QST5_23VL='<%= EJS_QST5_23VL_T%>'
<%
			}

			if(! EJS_QST5_24VL_T.equals("")) {
%>
		 		EJS_QST5_24VL='<%= EJS_QST5_24VL_T%>'
<%
			}

			if(! EJS_QST5_25VL_T.equals("")) {
%>
		 		EJS_QST5_25VL='<%= EJS_QST5_25VL_T%>'
<%
			}

			if(! EJS_QST5_26VL_T.equals("")) {
%>
		 		EJS_QST5_26VL='<%= EJS_QST5_26VL_T%>'
<%
			}

			if(! EJS_RST5_VL_T.equals("")) {
%>
		 		EJS_RST5_VL='<%= EJS_RST5_VL_T%>'
<%
			}

			if(! EJS_QST6_27VL_T.equals("")) {
%>
		 		EJS_QST6_27VL='<%= EJS_QST6_27VL_T%>'
<%
			}

			if(! EJS_QST6_28VL_T.equals("")) {
%>
		 		EJS_QST6_28VL='<%= EJS_QST6_28VL_T%>'
<%
			}

			if(! EJS_QST6_29VL_T.equals("")) {
%>
		 		EJS_QST6_29VL='<%= EJS_QST6_29VL_T%>'
<%
			}

			if(! EJS_QST6_30VL_T.equals("")) {
%>
		 		EJS_QST6_30VL='<%= EJS_QST6_30VL_T%>'
<%
			}

			if(! EJS_QST6_31VL_T.equals("")) {
%>
		 		EJS_QST6_31VL='<%= EJS_QST6_31VL_T%>'
<%
			}

			if(! EJS_QST6_32VL_T.equals("")) {
%>
		 		EJS_QST6_32VL='<%= EJS_QST6_32VL_T%>'
<%
			}

			if(! EJS_QST6_33VL_T.equals("")) {
%>
		 		EJS_QST6_33VL='<%= EJS_QST6_33VL_T%>'
<%
			}

			if(! EJS_RST6_VL_T.equals("")) {
%>
		 		EJS_RST6_VL='<%= EJS_RST6_VL_T%>'
<%
			}

			if(! EJS_QST7_34VL_T.equals("")) {
%>
		 		EJS_QST7_34VL='<%= EJS_QST7_34VL_T%>'
<%
			}

			if(! EJS_QST7_35VL_T.equals("")) {
%>
		 		EJS_QST7_35VL='<%= EJS_QST7_35VL_T%>'
<%
			}

			if(! EJS_QST7_36VL_T.equals("")) {
%>
		 		EJS_QST7_36VL='<%= EJS_QST7_36VL_T%>'
<%
			}

			if(! EJS_QST7_37VL_T.equals("")) {
%>
		 		EJS_QST7_37VL='<%= EJS_QST7_37VL_T%>'
<%
			}

			if(! EJS_QST7_38VL_T.equals("")) {
%>
		 		EJS_QST7_38VL='<%= EJS_QST7_38VL_T%>'
<%
			}

			if(! EJS_QST7_39VL_T.equals("")) {
%>
		 		EJS_QST7_39VL='<%= EJS_QST7_39VL_T%>'
<%
			}

			if(! EJS_RST7_VL_T.equals("")) {
%>
		 		EJS_RST7_VL='<%= EJS_RST7_VL_T%>'
<%
			}

			if(! EJS_QST8_40VL_T.equals("")) {
%>
		 		EJS_QST8_40VL='<%= EJS_QST8_40VL_T%>'
<%
			}

			if(! EJS_QST8_41VL_T.equals("")) {
%>
		 		EJS_QST8_41VL='<%= EJS_QST8_41VL_T%>'
<%
			}

			if(! EJS_QST8_42VL_T.equals("")) {
%>
		 		EJS_QST8_42VL='<%= EJS_QST8_42VL_T%>'
<%
			}

			if(! EJS_QST8_43VL_T.equals("")) {
%>
		 		EJS_QST8_43VL='<%= EJS_QST8_43VL_T%>'
<%
			}

			if(! EJS_RST8_VL_T.equals("")) {
%>
		 		EJS_RST8_VL='<%= EJS_RST8_VL_T%>'
<%
			}

			if(! EJS_RSTT_VL_T.equals("")) {
%>
		 		EJS_RSTT_VL='<%= EJS_RSTT_VL_T%>'
<%
			}

			if(! EJS_RSLT_TX_T.equals("")) {
%>
		 		EJS_RSLT_TX='<%= EJS_RSLT_TX_T%>'
<%
			}

			if(! EJS_PANJ_DT_T.equals("")) {
%>
		 		EJS_PANJ_DT='<%= EJS_PANJ_DT_T%>'
<%
			}

			if(! EJS_DOCT_CD_T.equals("")) {
%>
		 		EJS_DOCT_CD='<%= EJS_DOCT_CD_T%>'
<%
			}

			if(! EJS_PANJ_YN_T.equals("")) {
%>
		 		EJS_PANJ_YN='<%= EJS_PANJ_YN_T%>'
<%
			}

			if(! EJS_INPT_ID_T.equals("")) {
%>
		 		EJS_INPT_ID='<%= EJS_INPT_ID_T%>'
<%
			}

			if(! EJS_INPT_DTT_T.equals("")) {
%>
		 		EJS_INPT_DTT='<%= EJS_INPT_DTT_T%>'
<%
			}

			if(! EJS_MODI_ID_T.equals("")) {
%>
		 		EJS_MODI_ID='<%= EJS_MODI_ID_T%>'
<%
			}

			if(! EJS_MODI_DTT_T.equals("")) {
%>
		 		EJS_MODI_DTT='<%= EJS_MODI_DTT_T%>'
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
