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

Select * From HEALTH_DIETITIAN_PANJUNG
WHERE HDP_EXAM_DT= :EXAM_DT
AND   HDP_EXAM_SQ= :EXAM_SQ

		*/

		sql = " SELECT *";
		sql += " FROM HEALTH_DIETITIAN_PANJUNG";
		sql += " WHERE HDP_EXAM_DT= '" + EXAM_DT + "'";
		sql += " AND HDP_EXAM_SQ= '" + EXAM_SQ + "'";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uExam_Result_grdRcptListSelectionChanged_001 \n";
			G_INFO += "설명 : 영양평가 등록여부 조회(고대) \n";
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
		<s:AttributeType name='HDP_EXAM_DT' rs:number='1' rs:writeunknown='true' rs:basetable='HEALTH_DIETITIAN_PANJUNG'
			 rs:basecolumn='HDP_EXAM_DT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'
			 rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='HDP_EXAM_SQ' rs:number='2' rs:writeunknown='true' rs:basetable='HEALTH_DIETITIAN_PANJUNG'
			 rs:basecolumn='HDP_EXAM_SQ'>
			<s:datatype dt:type='string' dt:maxLength='6' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='HDP_ADVI_DT' rs:number='3' rs:nullable='true' rs:writeunknown='true' rs:basetable='HEALTH_DIETITIAN_PANJUNG'
			 rs:basecolumn='HDP_ADVI_DT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='HDP_ADVI_YN' rs:number='4' rs:nullable='true' rs:writeunknown='true' rs:basetable='HEALTH_DIETITIAN_PANJUNG'
			 rs:basecolumn='HDP_ADVI_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='HDP_ADVI_TM' rs:number='5' rs:nullable='true' rs:writeunknown='true' rs:basetable='HEALTH_DIETITIAN_PANJUNG'
			 rs:basecolumn='HDP_ADVI_TM'>
			<s:datatype dt:type='string' dt:maxLength='5'/>
		</s:AttributeType>
		<s:AttributeType name='HDP_BMI_NM' rs:number='6' rs:nullable='true' rs:writeunknown='true' rs:basetable='HEALTH_DIETITIAN_PANJUNG'
			 rs:basecolumn='HDP_BMI_NM'>
			<s:datatype dt:type='string' dt:maxLength='6'/>
		</s:AttributeType>
		<s:AttributeType name='HDP_KCAL_VL' rs:number='7' rs:nullable='true' rs:writeunknown='true' rs:basetable='HEALTH_DIETITIAN_PANJUNG'
			 rs:basecolumn='HDP_KCAL_VL'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='1' rs:precision='5' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='HDP_SOCK_TX1' rs:number='8' rs:nullable='true' rs:writeunknown='true' rs:basetable='HEALTH_DIETITIAN_PANJUNG'
			 rs:basecolumn='HDP_SOCK_TX1'>
			<s:datatype dt:type='string' dt:maxLength='2000'/>
		</s:AttributeType>
		<s:AttributeType name='HDP_SOCK_TX2' rs:number='9' rs:nullable='true' rs:writeunknown='true' rs:basetable='HEALTH_DIETITIAN_PANJUNG'
			 rs:basecolumn='HDP_SOCK_TX2'>
			<s:datatype dt:type='string' dt:maxLength='2000'/>
		</s:AttributeType>
		<s:AttributeType name='HDP_SOCK_TX3' rs:number='10' rs:nullable='true' rs:writeunknown='true' rs:basetable='HEALTH_DIETITIAN_PANJUNG'
			 rs:basecolumn='HDP_SOCK_TX3'>
			<s:datatype dt:type='string' dt:maxLength='2000'/>
		</s:AttributeType>
		<s:AttributeType name='HDP_SOCK_TX4' rs:number='11' rs:nullable='true' rs:writeunknown='true' rs:basetable='HEALTH_DIETITIAN_PANJUNG'
			 rs:basecolumn='HDP_SOCK_TX4'>
			<s:datatype dt:type='string' dt:maxLength='2000'/>
		</s:AttributeType>
		<s:AttributeType name='HDP_SOCK_TX5' rs:number='12' rs:nullable='true' rs:writeunknown='true' rs:basetable='HEALTH_DIETITIAN_PANJUNG'
			 rs:basecolumn='HDP_SOCK_TX5'>
			<s:datatype dt:type='string' dt:maxLength='2000'/>
		</s:AttributeType>
		<s:AttributeType name='HDP_SOCK_TX6' rs:number='13' rs:nullable='true' rs:writeunknown='true' rs:basetable='HEALTH_DIETITIAN_PANJUNG'
			 rs:basecolumn='HDP_SOCK_TX6'>
			<s:datatype dt:type='string' dt:maxLength='2000'/>
		</s:AttributeType>
		<s:AttributeType name='HDP_SOCK_TX7' rs:number='14' rs:nullable='true' rs:writeunknown='true' rs:basetable='HEALTH_DIETITIAN_PANJUNG'
			 rs:basecolumn='HDP_SOCK_TX7'>
			<s:datatype dt:type='string' dt:maxLength='2000'/>
		</s:AttributeType>
		<s:AttributeType name='HDP_SOCK_TX8' rs:number='15' rs:nullable='true' rs:writeunknown='true' rs:basetable='HEALTH_DIETITIAN_PANJUNG'
			 rs:basecolumn='HDP_SOCK_TX8'>
			<s:datatype dt:type='string' dt:maxLength='2000'/>
		</s:AttributeType>
		<s:AttributeType name='HDP_TRANC_DT' rs:number='16' rs:nullable='true' rs:writeunknown='true' rs:basetable='HEALTH_DIETITIAN_PANJUNG'
			 rs:basecolumn='HDP_TRANC_DT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='HDP_INPT_ID' rs:number='17' rs:nullable='true' rs:writeunknown='true' rs:basetable='HEALTH_DIETITIAN_PANJUNG'
			 rs:basecolumn='HDP_INPT_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='HDP_INPT_DTT' rs:number='18' rs:nullable='true' rs:writeunknown='true' rs:basetable='HEALTH_DIETITIAN_PANJUNG'
			 rs:basecolumn='HDP_INPT_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='HDP_MODI_ID' rs:number='19' rs:nullable='true' rs:writeunknown='true' rs:basetable='HEALTH_DIETITIAN_PANJUNG'
			 rs:basecolumn='HDP_MODI_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='HDP_MODI_DTT' rs:number='20' rs:nullable='true' rs:writeunknown='true' rs:basetable='HEALTH_DIETITIAN_PANJUNG'
			 rs:basecolumn='HDP_MODI_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='21' rs:rowid='true' rs:writeunknown='true' rs:basetable='HEALTH_DIETITIAN_PANJUNG'
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

			String HDP_EXAM_DT_T = cRsList.getDate2("HDP_EXAM_DT");
			String HDP_EXAM_SQ_T = cRsList.getString("HDP_EXAM_SQ");
			String HDP_ADVI_DT_T = cRsList.getDate2("HDP_ADVI_DT");
			String HDP_ADVI_YN_T = cRsList.getString("HDP_ADVI_YN");
			String HDP_ADVI_TM_T = cRsList.getString("HDP_ADVI_TM");
			String HDP_BMI_NM_T = cRsList.getString("HDP_BMI_NM");
			String HDP_KCAL_VL_T = cRsList.getString("HDP_KCAL_VL");
			String HDP_SOCK_TX1_T = cRsList.getString("HDP_SOCK_TX1");
			String HDP_SOCK_TX2_T = cRsList.getString("HDP_SOCK_TX2");
			String HDP_SOCK_TX3_T = cRsList.getString("HDP_SOCK_TX3");
			String HDP_SOCK_TX4_T = cRsList.getString("HDP_SOCK_TX4");
			String HDP_SOCK_TX5_T = cRsList.getString("HDP_SOCK_TX5");
			String HDP_SOCK_TX6_T = cRsList.getString("HDP_SOCK_TX6");
			String HDP_SOCK_TX7_T = cRsList.getString("HDP_SOCK_TX7");
			String HDP_SOCK_TX8_T = cRsList.getString("HDP_SOCK_TX8");
			String HDP_TRANC_DT_T = cRsList.getDate2("HDP_TRANC_DT");
			String HDP_INPT_ID_T = cRsList.getString("HDP_INPT_ID");
			String HDP_INPT_DTT_T = cRsList.getDate2("HDP_INPT_DTT");
			String HDP_MODI_ID_T = cRsList.getString("HDP_MODI_ID");
			String HDP_MODI_DTT_T = cRsList.getDate2("HDP_MODI_DTT");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! HDP_EXAM_DT_T.equals("")) {
%>
		 		HDP_EXAM_DT='<%= HDP_EXAM_DT_T%>'
<%
			}

			if(! HDP_EXAM_SQ_T.equals("")) {
%>
		 		HDP_EXAM_SQ='<%= HDP_EXAM_SQ_T%>'
<%
			}

			if(! HDP_ADVI_DT_T.equals("")) {
%>
		 		HDP_ADVI_DT='<%= HDP_ADVI_DT_T%>'
<%
			}

			if(! HDP_ADVI_YN_T.equals("")) {
%>
		 		HDP_ADVI_YN='<%= HDP_ADVI_YN_T%>'
<%
			}

			if(! HDP_ADVI_TM_T.equals("")) {
%>
		 		HDP_ADVI_TM='<%= HDP_ADVI_TM_T%>'
<%
			}

			if(! HDP_BMI_NM_T.equals("")) {
%>
		 		HDP_BMI_NM='<%= HDP_BMI_NM_T%>'
<%
			}

			if(! HDP_KCAL_VL_T.equals("")) {
%>
		 		HDP_KCAL_VL='<%= HDP_KCAL_VL_T%>'
<%
			}

			if(! HDP_SOCK_TX1_T.equals("")) {
%>
		 		HDP_SOCK_TX1='<%= HDP_SOCK_TX1_T%>'
<%
			}

			if(! HDP_SOCK_TX2_T.equals("")) {
%>
		 		HDP_SOCK_TX2='<%= HDP_SOCK_TX2_T%>'
<%
			}

			if(! HDP_SOCK_TX3_T.equals("")) {
%>
		 		HDP_SOCK_TX3='<%= HDP_SOCK_TX3_T%>'
<%
			}

			if(! HDP_SOCK_TX4_T.equals("")) {
%>
		 		HDP_SOCK_TX4='<%= HDP_SOCK_TX4_T%>'
<%
			}

			if(! HDP_SOCK_TX5_T.equals("")) {
%>
		 		HDP_SOCK_TX5='<%= HDP_SOCK_TX5_T%>'
<%
			}

			if(! HDP_SOCK_TX6_T.equals("")) {
%>
		 		HDP_SOCK_TX6='<%= HDP_SOCK_TX6_T%>'
<%
			}

			if(! HDP_SOCK_TX7_T.equals("")) {
%>
		 		HDP_SOCK_TX7='<%= HDP_SOCK_TX7_T%>'
<%
			}

			if(! HDP_SOCK_TX8_T.equals("")) {
%>
		 		HDP_SOCK_TX8='<%= HDP_SOCK_TX8_T%>'
<%
			}

			if(! HDP_TRANC_DT_T.equals("")) {
%>
		 		HDP_TRANC_DT='<%= HDP_TRANC_DT_T%>'
<%
			}

			if(! HDP_INPT_ID_T.equals("")) {
%>
		 		HDP_INPT_ID='<%= HDP_INPT_ID_T%>'
<%
			}

			if(! HDP_INPT_DTT_T.equals("")) {
%>
		 		HDP_INPT_DTT='<%= HDP_INPT_DTT_T%>'
<%
			}

			if(! HDP_MODI_ID_T.equals("")) {
%>
		 		HDP_MODI_ID='<%= HDP_MODI_ID_T%>'
<%
			}

			if(! HDP_MODI_DTT_T.equals("")) {
%>
		 		HDP_MODI_DTT='<%= HDP_MODI_DTT_T%>'
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
