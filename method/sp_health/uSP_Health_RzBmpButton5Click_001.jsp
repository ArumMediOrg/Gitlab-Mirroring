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

Select * from ST_PANJUNG
 Where SPG_EXAM_DT  = :EXAM_DT
   And SPG_EXAM_SQ  = :EXAM_SQ
   And SPG_MATT_CD In ('70001', '70002')
   And SPG_ORGA_CD = '05'
   And SPG_SOKY_CD = 'N01R'
		*/

		sql = " SELECT *";
		sql += " FROM ST_PANJUNG";
		sql += " WHERE SPG_EXAM_DT = '" + EXAM_DT + "'";
		sql += " AND SPG_EXAM_SQ = '" + EXAM_SQ + "'";
		sql += " AND SPG_MATT_CD IN ('70001', '70002')";
		sql += " AND SPG_ORGA_CD = '05'";
		sql += " AND SPG_SOKY_CD = 'N01R'";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uSP_Health_RzBmpButton5Click_001 \n";
			G_INFO += "설명 : 판정조회(야간2차 신경계 생성) \n";
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
		<s:AttributeType name='ROWID' rs:number='40' rs:rowid='true' rs:writeunknown='true' rs:basetable='ST_PANJUNG'
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
			String ROWID_T = cRsList.getString("ROWID");
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
