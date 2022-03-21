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

		String MNGT_YR = htMethod.get("MNGT_YR");
		String ESTI_CD = htMethod.get("ESTI_CD");
		String DEPT_SQ = htMethod.get("DEPT_SQ");

		//
		if(MNGT_YR == null) { MNGT_YR = ""; }
		if(ESTI_CD == null) { ESTI_CD = ""; }
		if(DEPT_SQ == null) { DEPT_SQ = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT * FROM BT_ESTI_DEPT WHERE 0 = 0 
   AND BED_MNGT_YR = :MNGT_YR
   AND BED_ESTI_CD = :ESTI_CD
   AND BED_DEPT_SQ = :DEPT_SQ
		*/

		sql = " SELECT *";
		sql += " FROM BT_ESTI_DEPT";
		sql += " WHERE 0 = 0";
		sql += " AND BED_MNGT_YR = '" + MNGT_YR + "'";
		sql += " AND BED_ESTI_CD = '" + ESTI_CD + "'";
		sql += " AND BED_DEPT_SQ = '" + DEPT_SQ + "'";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uBT_ESTI_DEPT_APPLY_FormShow_003 \n";
			G_INFO += "설명 : 부서별 특검유형정보 로딩 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " MNGT_YR : " + MNGT_YR + " \n";
			G_INFO += " ESTI_CD : " + ESTI_CD + " \n";
			G_INFO += " DEPT_SQ : " + DEPT_SQ + " \n";
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
		<s:AttributeType name='BED_MNGT_YR' rs:number='1' rs:writeunknown='true' rs:basetable='BT_ESTI_DEPT' rs:basecolumn='BED_MNGT_YR'>
			<s:datatype dt:type='string' dt:maxLength='4' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='BED_ESTI_CD' rs:number='2' rs:writeunknown='true' rs:basetable='BT_ESTI_DEPT' rs:basecolumn='BED_ESTI_CD'>
			<s:datatype dt:type='string' dt:maxLength='8' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='BED_DEPT_SQ' rs:number='3' rs:writeunknown='true' rs:basetable='BT_ESTI_DEPT' rs:basecolumn='BED_DEPT_SQ'>
			<s:datatype dt:type='string' dt:maxLength='4' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='BED_HALF_CD' rs:number='4' rs:writeunknown='true' rs:basetable='BT_ESTI_DEPT' rs:basecolumn='BED_HALF_CD'>
			<s:datatype dt:type='string' dt:maxLength='1' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='BED_DEPT_NM' rs:number='5' rs:writeunknown='true' rs:basetable='BT_ESTI_DEPT' rs:basecolumn='BED_DEPT_NM'>
			<s:datatype dt:type='string' dt:maxLength='100' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='BED_SUBD_NM' rs:number='6' rs:nullable='true' rs:writeunknown='true' rs:basetable='BT_ESTI_DEPT'
			 rs:basecolumn='BED_SUBD_NM'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='BED_MATT_LT' rs:number='7' rs:nullable='true' rs:writeunknown='true' rs:basetable='BT_ESTI_DEPT'
			 rs:basecolumn='BED_MATT_LT'>
			<s:datatype dt:type='string' dt:maxLength='1000'/>
		</s:AttributeType>
		<s:AttributeType name='BED_MTJG_LT' rs:number='8' rs:nullable='true' rs:writeunknown='true' rs:basetable='BT_ESTI_DEPT'
			 rs:basecolumn='BED_MTJG_LT'>
			<s:datatype dt:type='string' dt:maxLength='2000'/>
		</s:AttributeType>
		<s:AttributeType name='BED_BSBS_PR' rs:number='9' rs:nullable='true' rs:writeunknown='true' rs:basetable='BT_ESTI_DEPT'
			 rs:basecolumn='BED_BSBS_PR'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='BED_BTGS_PR' rs:number='10' rs:nullable='true' rs:writeunknown='true' rs:basetable='BT_ESTI_DEPT'
			 rs:basecolumn='BED_BTGS_PR'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='BED_BCAS_PR' rs:number='11' rs:nullable='true' rs:writeunknown='true' rs:basetable='BT_ESTI_DEPT'
			 rs:basecolumn='BED_BCAS_PR'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='BED_JSBS_PR' rs:number='12' rs:nullable='true' rs:writeunknown='true' rs:basetable='BT_ESTI_DEPT'
			 rs:basecolumn='BED_JSBS_PR'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='BED_JTGS_PR' rs:number='13' rs:nullable='true' rs:writeunknown='true' rs:basetable='BT_ESTI_DEPT'
			 rs:basecolumn='BED_JTGS_PR'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='BED_JCAS_PR' rs:number='14' rs:nullable='true' rs:writeunknown='true' rs:basetable='BT_ESTI_DEPT'
			 rs:basecolumn='BED_JCAS_PR'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='BED_BSBS_RT' rs:number='15' rs:nullable='true' rs:writeunknown='true' rs:basetable='BT_ESTI_DEPT'
			 rs:basecolumn='BED_BSBS_RT'>
			<s:datatype dt:type='float' dt:maxLength='8' rs:precision='15' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='BED_BTGS_RT' rs:number='16' rs:nullable='true' rs:writeunknown='true' rs:basetable='BT_ESTI_DEPT'
			 rs:basecolumn='BED_BTGS_RT'>
			<s:datatype dt:type='float' dt:maxLength='8' rs:precision='15' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='BED_BCAS_RT' rs:number='17' rs:nullable='true' rs:writeunknown='true' rs:basetable='BT_ESTI_DEPT'
			 rs:basecolumn='BED_BCAS_RT'>
			<s:datatype dt:type='float' dt:maxLength='8' rs:precision='15' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='BED_JSBS_RT' rs:number='18' rs:nullable='true' rs:writeunknown='true' rs:basetable='BT_ESTI_DEPT'
			 rs:basecolumn='BED_JSBS_RT'>
			<s:datatype dt:type='float' dt:maxLength='8' rs:precision='15' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='BED_JTGS_RT' rs:number='19' rs:nullable='true' rs:writeunknown='true' rs:basetable='BT_ESTI_DEPT'
			 rs:basecolumn='BED_JTGS_RT'>
			<s:datatype dt:type='float' dt:maxLength='8' rs:precision='15' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='BED_JCAS_RT' rs:number='20' rs:nullable='true' rs:writeunknown='true' rs:basetable='BT_ESTI_DEPT'
			 rs:basecolumn='BED_JCAS_RT'>
			<s:datatype dt:type='float' dt:maxLength='8' rs:precision='15' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='BED_JBSBS_PR' rs:number='21' rs:nullable='true' rs:writeunknown='true' rs:basetable='BT_ESTI_DEPT'
			 rs:basecolumn='BED_JBSBS_PR'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='BED_JBTGS_PR' rs:number='22' rs:nullable='true' rs:writeunknown='true' rs:basetable='BT_ESTI_DEPT'
			 rs:basecolumn='BED_JBTGS_PR'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='BED_JBCAS_PR' rs:number='23' rs:nullable='true' rs:writeunknown='true' rs:basetable='BT_ESTI_DEPT'
			 rs:basecolumn='BED_JBCAS_PR'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='BED_JJSBS_PR' rs:number='24' rs:nullable='true' rs:writeunknown='true' rs:basetable='BT_ESTI_DEPT'
			 rs:basecolumn='BED_JJSBS_PR'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='BED_JJTGS_PR' rs:number='25' rs:nullable='true' rs:writeunknown='true' rs:basetable='BT_ESTI_DEPT'
			 rs:basecolumn='BED_JJTGS_PR'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='BED_JJCAS_PR' rs:number='26' rs:nullable='true' rs:writeunknown='true' rs:basetable='BT_ESTI_DEPT'
			 rs:basecolumn='BED_JJCAS_PR'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='BED_BCUST_CNT' rs:number='27' rs:nullable='true' rs:writeunknown='true' rs:basetable='BT_ESTI_DEPT'
			 rs:basecolumn='BED_BCUST_CNT'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='BED_BSALE_PR' rs:number='28' rs:nullable='true' rs:writeunknown='true' rs:basetable='BT_ESTI_DEPT'
			 rs:basecolumn='BED_BSALE_PR'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='BED_JCUST_CNT' rs:number='29' rs:nullable='true' rs:writeunknown='true' rs:basetable='BT_ESTI_DEPT'
			 rs:basecolumn='BED_JCUST_CNT'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='BED_JSALE_PR' rs:number='30' rs:nullable='true' rs:writeunknown='true' rs:basetable='BT_ESTI_DEPT'
			 rs:basecolumn='BED_JSALE_PR'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='BED_TAGR_TM' rs:number='31' rs:nullable='true' rs:writeunknown='true' rs:basetable='BT_ESTI_DEPT'
			 rs:basecolumn='BED_TAGR_TM'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='BED_USE_YN' rs:number='32' rs:writeunknown='true' rs:basetable='BT_ESTI_DEPT' rs:basecolumn='BED_USE_YN'>
			<s:datatype dt:type='string' dt:maxLength='1' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='BED_NUSE_ID' rs:number='33' rs:nullable='true' rs:writeunknown='true' rs:basetable='BT_ESTI_DEPT'
			 rs:basecolumn='BED_NUSE_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='BED_NUSE_DTT' rs:number='34' rs:nullable='true' rs:writeunknown='true' rs:basetable='BT_ESTI_DEPT'
			 rs:basecolumn='BED_NUSE_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='BED_INPT_ID' rs:number='35' rs:nullable='true' rs:writeunknown='true' rs:basetable='BT_ESTI_DEPT'
			 rs:basecolumn='BED_INPT_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='BED_INPT_DTT' rs:number='36' rs:nullable='true' rs:writeunknown='true' rs:basetable='BT_ESTI_DEPT'
			 rs:basecolumn='BED_INPT_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='BED_MODI_ID' rs:number='37' rs:nullable='true' rs:writeunknown='true' rs:basetable='BT_ESTI_DEPT'
			 rs:basecolumn='BED_MODI_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='BED_MODI_DTT' rs:number='38' rs:nullable='true' rs:writeunknown='true' rs:basetable='BT_ESTI_DEPT'
			 rs:basecolumn='BED_MODI_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='BED_TRNS_ID' rs:number='39' rs:nullable='true' rs:writeunknown='true' rs:basetable='BT_ESTI_DEPT'
			 rs:basecolumn='BED_TRNS_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='BED_TRNS_DTT' rs:number='40' rs:nullable='true' rs:writeunknown='true' rs:basetable='BT_ESTI_DEPT'
			 rs:basecolumn='BED_TRNS_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='BED_SPCL_CD' rs:number='41' rs:nullable='true' rs:writeunknown='true' rs:basetable='BT_ESTI_DEPT'
			 rs:basecolumn='BED_SPCL_CD'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='BED_MCAS_PR' rs:number='42' rs:nullable='true' rs:writeunknown='true' rs:basetable='BT_ESTI_DEPT'
			 rs:basecolumn='BED_MCAS_PR'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='BED_MSALE_PR' rs:number='43' rs:nullable='true' rs:writeunknown='true' rs:basetable='BT_ESTI_DEPT'
			 rs:basecolumn='BED_MSALE_PR'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='44' rs:rowid='true' rs:writeunknown='true' rs:basetable='BT_ESTI_DEPT'
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

			String BED_MNGT_YR_T = cRsList.getString("BED_MNGT_YR");
			String BED_ESTI_CD_T = cRsList.getString("BED_ESTI_CD");
			String BED_DEPT_SQ_T = cRsList.getString("BED_DEPT_SQ");
			String BED_HALF_CD_T = cRsList.getString("BED_HALF_CD");
			String BED_DEPT_NM_T = cRsList.getString("BED_DEPT_NM");
			String BED_SUBD_NM_T = cRsList.getString("BED_SUBD_NM");
			String BED_MATT_LT_T = cRsList.getString("BED_MATT_LT");
			String BED_MTJG_LT_T = cRsList.getString("BED_MTJG_LT");
			String BED_BSBS_PR_T = cRsList.getString("BED_BSBS_PR");
			String BED_BTGS_PR_T = cRsList.getString("BED_BTGS_PR");
			String BED_BCAS_PR_T = cRsList.getString("BED_BCAS_PR");
			String BED_JSBS_PR_T = cRsList.getString("BED_JSBS_PR");
			String BED_JTGS_PR_T = cRsList.getString("BED_JTGS_PR");
			String BED_JCAS_PR_T = cRsList.getString("BED_JCAS_PR");
			String BED_BSBS_RT_T = cRsList.getString("BED_BSBS_RT");
			String BED_BTGS_RT_T = cRsList.getString("BED_BTGS_RT");
			String BED_BCAS_RT_T = cRsList.getString("BED_BCAS_RT");
			String BED_JSBS_RT_T = cRsList.getString("BED_JSBS_RT");
			String BED_JTGS_RT_T = cRsList.getString("BED_JTGS_RT");
			String BED_JCAS_RT_T = cRsList.getString("BED_JCAS_RT");
			String BED_JBSBS_PR_T = cRsList.getString("BED_JBSBS_PR");
			String BED_JBTGS_PR_T = cRsList.getString("BED_JBTGS_PR");
			String BED_JBCAS_PR_T = cRsList.getString("BED_JBCAS_PR");
			String BED_JJSBS_PR_T = cRsList.getString("BED_JJSBS_PR");
			String BED_JJTGS_PR_T = cRsList.getString("BED_JJTGS_PR");
			String BED_JJCAS_PR_T = cRsList.getString("BED_JJCAS_PR");
			String BED_BCUST_CNT_T = cRsList.getString("BED_BCUST_CNT");
			String BED_BSALE_PR_T = cRsList.getString("BED_BSALE_PR");
			String BED_JCUST_CNT_T = cRsList.getString("BED_JCUST_CNT");
			String BED_JSALE_PR_T = cRsList.getString("BED_JSALE_PR");
			String BED_TAGR_TM_T = cRsList.getString("BED_TAGR_TM");
			String BED_USE_YN_T = cRsList.getString("BED_USE_YN");
			String BED_NUSE_ID_T = cRsList.getString("BED_NUSE_ID");
			String BED_NUSE_DTT_T = cRsList.getDate2("BED_NUSE_DTT");
			String BED_INPT_ID_T = cRsList.getString("BED_INPT_ID");
			String BED_INPT_DTT_T = cRsList.getDate2("BED_INPT_DTT");
			String BED_MODI_ID_T = cRsList.getString("BED_MODI_ID");
			String BED_MODI_DTT_T = cRsList.getDate2("BED_MODI_DTT");
			String BED_TRNS_ID_T = cRsList.getString("BED_TRNS_ID");
			String BED_TRNS_DTT_T = cRsList.getDate2("BED_TRNS_DTT");
			String BED_SPCL_CD_T = cRsList.getString("BED_SPCL_CD");
			String BED_MCAS_PR_T = cRsList.getString("BED_MCAS_PR");
			String BED_MSALE_PR_T = cRsList.getString("BED_MSALE_PR");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! BED_MNGT_YR_T.equals("")) {
%>
		 		BED_MNGT_YR='<%= BED_MNGT_YR_T%>'
<%
			}

			if(! BED_ESTI_CD_T.equals("")) {
%>
		 		BED_ESTI_CD='<%= BED_ESTI_CD_T%>'
<%
			}

			if(! BED_DEPT_SQ_T.equals("")) {
%>
		 		BED_DEPT_SQ='<%= BED_DEPT_SQ_T%>'
<%
			}

			if(! BED_HALF_CD_T.equals("")) {
%>
		 		BED_HALF_CD='<%= BED_HALF_CD_T%>'
<%
			}

			if(! BED_DEPT_NM_T.equals("")) {
%>
		 		BED_DEPT_NM='<%= BED_DEPT_NM_T%>'
<%
			}

			if(! BED_SUBD_NM_T.equals("")) {
%>
		 		BED_SUBD_NM='<%= BED_SUBD_NM_T%>'
<%
			}

			if(! BED_MATT_LT_T.equals("")) {
%>
		 		BED_MATT_LT='<%= BED_MATT_LT_T%>'
<%
			}

			if(! BED_MTJG_LT_T.equals("")) {
%>
		 		BED_MTJG_LT='<%= BED_MTJG_LT_T%>'
<%
			}

			if(! BED_BSBS_PR_T.equals("")) {
%>
		 		BED_BSBS_PR='<%= BED_BSBS_PR_T%>'
<%
			}

			if(! BED_BTGS_PR_T.equals("")) {
%>
		 		BED_BTGS_PR='<%= BED_BTGS_PR_T%>'
<%
			}

			if(! BED_BCAS_PR_T.equals("")) {
%>
		 		BED_BCAS_PR='<%= BED_BCAS_PR_T%>'
<%
			}

			if(! BED_JSBS_PR_T.equals("")) {
%>
		 		BED_JSBS_PR='<%= BED_JSBS_PR_T%>'
<%
			}

			if(! BED_JTGS_PR_T.equals("")) {
%>
		 		BED_JTGS_PR='<%= BED_JTGS_PR_T%>'
<%
			}

			if(! BED_JCAS_PR_T.equals("")) {
%>
		 		BED_JCAS_PR='<%= BED_JCAS_PR_T%>'
<%
			}

			if(! BED_BSBS_RT_T.equals("")) {
%>
		 		BED_BSBS_RT='<%= BED_BSBS_RT_T%>'
<%
			}

			if(! BED_BTGS_RT_T.equals("")) {
%>
		 		BED_BTGS_RT='<%= BED_BTGS_RT_T%>'
<%
			}

			if(! BED_BCAS_RT_T.equals("")) {
%>
		 		BED_BCAS_RT='<%= BED_BCAS_RT_T%>'
<%
			}

			if(! BED_JSBS_RT_T.equals("")) {
%>
		 		BED_JSBS_RT='<%= BED_JSBS_RT_T%>'
<%
			}

			if(! BED_JTGS_RT_T.equals("")) {
%>
		 		BED_JTGS_RT='<%= BED_JTGS_RT_T%>'
<%
			}

			if(! BED_JCAS_RT_T.equals("")) {
%>
		 		BED_JCAS_RT='<%= BED_JCAS_RT_T%>'
<%
			}

			if(! BED_JBSBS_PR_T.equals("")) {
%>
		 		BED_JBSBS_PR='<%= BED_JBSBS_PR_T%>'
<%
			}

			if(! BED_JBTGS_PR_T.equals("")) {
%>
		 		BED_JBTGS_PR='<%= BED_JBTGS_PR_T%>'
<%
			}

			if(! BED_JBCAS_PR_T.equals("")) {
%>
		 		BED_JBCAS_PR='<%= BED_JBCAS_PR_T%>'
<%
			}

			if(! BED_JJSBS_PR_T.equals("")) {
%>
		 		BED_JJSBS_PR='<%= BED_JJSBS_PR_T%>'
<%
			}

			if(! BED_JJTGS_PR_T.equals("")) {
%>
		 		BED_JJTGS_PR='<%= BED_JJTGS_PR_T%>'
<%
			}

			if(! BED_JJCAS_PR_T.equals("")) {
%>
		 		BED_JJCAS_PR='<%= BED_JJCAS_PR_T%>'
<%
			}

			if(! BED_BCUST_CNT_T.equals("")) {
%>
		 		BED_BCUST_CNT='<%= BED_BCUST_CNT_T%>'
<%
			}

			if(! BED_BSALE_PR_T.equals("")) {
%>
		 		BED_BSALE_PR='<%= BED_BSALE_PR_T%>'
<%
			}

			if(! BED_JCUST_CNT_T.equals("")) {
%>
		 		BED_JCUST_CNT='<%= BED_JCUST_CNT_T%>'
<%
			}

			if(! BED_JSALE_PR_T.equals("")) {
%>
		 		BED_JSALE_PR='<%= BED_JSALE_PR_T%>'
<%
			}

			if(! BED_TAGR_TM_T.equals("")) {
%>
		 		BED_TAGR_TM='<%= BED_TAGR_TM_T%>'
<%
			}

			if(! BED_USE_YN_T.equals("")) {
%>
		 		BED_USE_YN='<%= BED_USE_YN_T%>'
<%
			}

			if(! BED_NUSE_ID_T.equals("")) {
%>
		 		BED_NUSE_ID='<%= BED_NUSE_ID_T%>'
<%
			}

			if(! BED_NUSE_DTT_T.equals("")) {
%>
		 		BED_NUSE_DTT='<%= BED_NUSE_DTT_T%>'
<%
			}

			if(! BED_INPT_ID_T.equals("")) {
%>
		 		BED_INPT_ID='<%= BED_INPT_ID_T%>'
<%
			}

			if(! BED_INPT_DTT_T.equals("")) {
%>
		 		BED_INPT_DTT='<%= BED_INPT_DTT_T%>'
<%
			}

			if(! BED_MODI_ID_T.equals("")) {
%>
		 		BED_MODI_ID='<%= BED_MODI_ID_T%>'
<%
			}

			if(! BED_MODI_DTT_T.equals("")) {
%>
		 		BED_MODI_DTT='<%= BED_MODI_DTT_T%>'
<%
			}

			if(! BED_TRNS_ID_T.equals("")) {
%>
		 		BED_TRNS_ID='<%= BED_TRNS_ID_T%>'
<%
			}

			if(! BED_TRNS_DTT_T.equals("")) {
%>
		 		BED_TRNS_DTT='<%= BED_TRNS_DTT_T%>'
<%
			}

			if(! BED_SPCL_CD_T.equals("")) {
%>
		 		BED_SPCL_CD='<%= BED_SPCL_CD_T%>'
<%
			}

			if(! BED_MCAS_PR_T.equals("")) {
%>
		 		BED_MCAS_PR='<%= BED_MCAS_PR_T%>'
<%
			}

			if(! BED_MSALE_PR_T.equals("")) {
%>
		 		BED_MSALE_PR='<%= BED_MSALE_PR_T%>'
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
