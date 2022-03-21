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
		String CHUNG_KD = htMethod.get("CHUNG_KD");

		//
		if(EXAM_DT == null) { EXAM_DT = ""; }
		if(EXAM_SQ == null) { EXAM_SQ = ""; }
		if(CHUNG_KD == null) { CHUNG_KD = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT * FROM BT_BILLHN_PR
 WHERE BBP_EXAM_DT = :EXAM_DT
   AND BBP_EXAM_SQ = :EXAM_SQ
   AND BBP_CHUNG_KD= :CHUNG_KD
		*/

		sql = " SELECT *";
		sql += " FROM BT_BILLHN_PR";
		sql += " WHERE BBP_EXAM_DT = '" + EXAM_DT + "'";
		sql += " AND BBP_EXAM_SQ = '" + EXAM_SQ + "'";
		sql += " AND BBP_CHUNG_KD= '" + CHUNG_KD + "'";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : UChungfile2020_JSON_UDP_UINT_CHUNGPER_001 \n";
			G_INFO += "설명 : 개별청구 유무조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " EXAM_DT : " + EXAM_DT + " \n";
			G_INFO += " EXAM_SQ : " + EXAM_SQ + " \n";
			G_INFO += " CHUNG_KD : " + CHUNG_KD + " \n";
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
		<s:AttributeType name='BBP_EXAM_DT' rs:number='1' rs:writeunknown='true' rs:basetable='BT_BILLHN_PR' rs:basecolumn='BBP_EXAM_DT'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='BBP_EXAM_SQ' rs:number='2' rs:writeunknown='true' rs:basetable='BT_BILLHN_PR' rs:basecolumn='BBP_EXAM_SQ'>
			<s:datatype dt:type='string' dt:maxLength='6' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='BBP_CHUNG_KD' rs:number='3' rs:writeunknown='true' rs:basetable='BT_BILLHN_PR' rs:basecolumn='BBP_CHUNG_KD'>
			<s:datatype dt:type='string' dt:maxLength='2' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='BBP_CHUNG_YY' rs:number='4' rs:nullable='true' rs:writeunknown='true' rs:basetable='BT_BILLHN_PR'
			 rs:basecolumn='BBP_CHUNG_YY'>
			<s:datatype dt:type='string' dt:maxLength='4'/>
		</s:AttributeType>
		<s:AttributeType name='BBP_CHUNG_DT' rs:number='5' rs:nullable='true' rs:writeunknown='true' rs:basetable='BT_BILLHN_PR'
			 rs:basecolumn='BBP_CHUNG_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='BBP_CHUNG_NO' rs:number='6' rs:nullable='true' rs:writeunknown='true' rs:basetable='BT_BILLHN_PR'
			 rs:basecolumn='BBP_CHUNG_NO'>
			<s:datatype dt:type='string' dt:maxLength='14'/>
		</s:AttributeType>
		<s:AttributeType name='BBP_RETURN_KD' rs:number='7' rs:nullable='true' rs:writeunknown='true' rs:basetable='BT_BILLHN_PR'
			 rs:basecolumn='BBP_RETURN_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='BBP_BILL_HC' rs:number='8' rs:nullable='true' rs:writeunknown='true' rs:basetable='BT_BILLHN_PR'
			 rs:basecolumn='BBP_BILL_HC'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='BBP_BILL_FL' rs:number='9' rs:nullable='true' rs:writeunknown='true' rs:basetable='BT_BILLHN_PR'
			 rs:basecolumn='BBP_BILL_FL'>
			<s:datatype dt:type='string' dt:maxLength='50'/>
		</s:AttributeType>
		<s:AttributeType name='BBP_BILL_NO' rs:number='10' rs:nullable='true' rs:writeunknown='true' rs:basetable='BT_BILLHN_PR'
			 rs:basecolumn='BBP_BILL_NO'>
			<s:datatype dt:type='string' dt:maxLength='3'/>
		</s:AttributeType>
		<s:AttributeType name='BBP_BIAD_KD' rs:number='11' rs:nullable='true' rs:writeunknown='true' rs:basetable='BT_BILLHN_PR'
			 rs:basecolumn='BBP_BIAD_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='BBP_BILL_PR' rs:number='12' rs:nullable='true' rs:writeunknown='true' rs:basetable='BT_BILLHN_PR'
			 rs:basecolumn='BBP_BILL_PR'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='BBP_BILLFIR_PR' rs:number='13' rs:nullable='true' rs:writeunknown='true' rs:basetable='BT_BILLHN_PR'
			 rs:basecolumn='BBP_BILLFIR_PR'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='BBP_BILLSED_PR' rs:number='14' rs:nullable='true' rs:writeunknown='true' rs:basetable='BT_BILLHN_PR'
			 rs:basecolumn='BBP_BILLSED_PR'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='BBP_BILLCAN_PR' rs:number='15' rs:nullable='true' rs:writeunknown='true' rs:basetable='BT_BILLHN_PR'
			 rs:basecolumn='BBP_BILLCAN_PR'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='BBP_BILLCANFN_PR' rs:number='16' rs:nullable='true' rs:writeunknown='true' rs:basetable='BT_BILLHN_PR'
			 rs:basecolumn='BBP_BILLCANFN_PR'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='BBP_BILLORAL_PR' rs:number='17' rs:nullable='true' rs:writeunknown='true' rs:basetable='BT_BILLHN_PR'
			 rs:basecolumn='BBP_BILLORAL_PR'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='BBP_BILLE_DT' rs:number='18' rs:nullable='true' rs:writeunknown='true' rs:basetable='BT_BILLHN_PR'
			 rs:basecolumn='BBP_BILLE_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='BBP_BILBE_NO' rs:number='19' rs:nullable='true' rs:writeunknown='true' rs:basetable='BT_BILLHN_PR'
			 rs:basecolumn='BBP_BILBE_NO'>
			<s:datatype dt:type='string' dt:maxLength='14'/>
		</s:AttributeType>
		<s:AttributeType name='BBP_INPUT_ID' rs:number='20' rs:nullable='true' rs:writeunknown='true' rs:basetable='BT_BILLHN_PR'
			 rs:basecolumn='BBP_INPUT_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='BBP_INPUT_DTT' rs:number='21' rs:nullable='true' rs:writeunknown='true' rs:basetable='BT_BILLHN_PR'
			 rs:basecolumn='BBP_INPUT_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='BBP_MODI_DTT' rs:number='22' rs:nullable='true' rs:writeunknown='true' rs:basetable='BT_BILLHN_PR'
			 rs:basecolumn='BBP_MODI_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='BBP_MODI_ID' rs:number='23' rs:nullable='true' rs:writeunknown='true' rs:basetable='BT_BILLHN_PR'
			 rs:basecolumn='BBP_MODI_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='BBP_BILLOS_PR' rs:number='24' rs:nullable='true' rs:writeunknown='true' rs:basetable='BT_BILLHN_PR'
			 rs:basecolumn='BBP_BILLOS_PR'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='BBP_BILLOSC_PR' rs:number='25' rs:nullable='true' rs:writeunknown='true' rs:basetable='BT_BILLHN_PR'
			 rs:basecolumn='BBP_BILLOSC_PR'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='BBP_BILLOSD_PR' rs:number='26' rs:nullable='true' rs:writeunknown='true' rs:basetable='BT_BILLHN_PR'
			 rs:basecolumn='BBP_BILLOSD_PR'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='27' rs:rowid='true' rs:writeunknown='true' rs:basetable='BT_BILLHN_PR'
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

			String BBP_EXAM_DT_T = cRsList.getString("BBP_EXAM_DT");
			String BBP_EXAM_SQ_T = cRsList.getString("BBP_EXAM_SQ");
			String BBP_CHUNG_KD_T = cRsList.getString("BBP_CHUNG_KD");
			String BBP_CHUNG_YY_T = cRsList.getString("BBP_CHUNG_YY");
			String BBP_CHUNG_DT_T = cRsList.getString("BBP_CHUNG_DT");
			String BBP_CHUNG_NO_T = cRsList.getString("BBP_CHUNG_NO");
			String BBP_RETURN_KD_T = cRsList.getString("BBP_RETURN_KD");
			String BBP_BILL_HC_T = cRsList.getString("BBP_BILL_HC");
			String BBP_BILL_FL_T = cRsList.getString("BBP_BILL_FL");
			String BBP_BILL_NO_T = cRsList.getString("BBP_BILL_NO");
			String BBP_BIAD_KD_T = cRsList.getString("BBP_BIAD_KD");
			String BBP_BILL_PR_T = cRsList.getString("BBP_BILL_PR");
			String BBP_BILLFIR_PR_T = cRsList.getString("BBP_BILLFIR_PR");
			String BBP_BILLSED_PR_T = cRsList.getString("BBP_BILLSED_PR");
			String BBP_BILLCAN_PR_T = cRsList.getString("BBP_BILLCAN_PR");
			String BBP_BILLCANFN_PR_T = cRsList.getString("BBP_BILLCANFN_PR");
			String BBP_BILLORAL_PR_T = cRsList.getString("BBP_BILLORAL_PR");
			String BBP_BILLE_DT_T = cRsList.getString("BBP_BILLE_DT");
			String BBP_BILBE_NO_T = cRsList.getString("BBP_BILBE_NO");
			String BBP_INPUT_ID_T = cRsList.getString("BBP_INPUT_ID");
			String BBP_INPUT_DTT_T = cRsList.getDate2("BBP_INPUT_DTT");
			String BBP_MODI_DTT_T = cRsList.getDate2("BBP_MODI_DTT");
			String BBP_MODI_ID_T = cRsList.getString("BBP_MODI_ID");
			String BBP_BILLOS_PR_T = cRsList.getString("BBP_BILLOS_PR");
			String BBP_BILLOSC_PR_T = cRsList.getString("BBP_BILLOSC_PR");
			String BBP_BILLOSD_PR_T = cRsList.getString("BBP_BILLOSD_PR");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! BBP_EXAM_DT_T.equals("")) {
%>
		 		BBP_EXAM_DT='<%= BBP_EXAM_DT_T%>'
<%
			}

			if(! BBP_EXAM_SQ_T.equals("")) {
%>
		 		BBP_EXAM_SQ='<%= BBP_EXAM_SQ_T%>'
<%
			}

			if(! BBP_CHUNG_KD_T.equals("")) {
%>
		 		BBP_CHUNG_KD='<%= BBP_CHUNG_KD_T%>'
<%
			}

			if(! BBP_CHUNG_YY_T.equals("")) {
%>
		 		BBP_CHUNG_YY='<%= BBP_CHUNG_YY_T%>'
<%
			}

			if(! BBP_CHUNG_DT_T.equals("")) {
%>
		 		BBP_CHUNG_DT='<%= BBP_CHUNG_DT_T%>'
<%
			}

			if(! BBP_CHUNG_NO_T.equals("")) {
%>
		 		BBP_CHUNG_NO='<%= BBP_CHUNG_NO_T%>'
<%
			}

			if(! BBP_RETURN_KD_T.equals("")) {
%>
		 		BBP_RETURN_KD='<%= BBP_RETURN_KD_T%>'
<%
			}

			if(! BBP_BILL_HC_T.equals("")) {
%>
		 		BBP_BILL_HC='<%= BBP_BILL_HC_T%>'
<%
			}

			if(! BBP_BILL_FL_T.equals("")) {
%>
		 		BBP_BILL_FL='<%= BBP_BILL_FL_T%>'
<%
			}

			if(! BBP_BILL_NO_T.equals("")) {
%>
		 		BBP_BILL_NO='<%= BBP_BILL_NO_T%>'
<%
			}

			if(! BBP_BIAD_KD_T.equals("")) {
%>
		 		BBP_BIAD_KD='<%= BBP_BIAD_KD_T%>'
<%
			}

			if(! BBP_BILL_PR_T.equals("")) {
%>
		 		BBP_BILL_PR='<%= BBP_BILL_PR_T%>'
<%
			}

			if(! BBP_BILLFIR_PR_T.equals("")) {
%>
		 		BBP_BILLFIR_PR='<%= BBP_BILLFIR_PR_T%>'
<%
			}

			if(! BBP_BILLSED_PR_T.equals("")) {
%>
		 		BBP_BILLSED_PR='<%= BBP_BILLSED_PR_T%>'
<%
			}

			if(! BBP_BILLCAN_PR_T.equals("")) {
%>
		 		BBP_BILLCAN_PR='<%= BBP_BILLCAN_PR_T%>'
<%
			}

			if(! BBP_BILLCANFN_PR_T.equals("")) {
%>
		 		BBP_BILLCANFN_PR='<%= BBP_BILLCANFN_PR_T%>'
<%
			}

			if(! BBP_BILLORAL_PR_T.equals("")) {
%>
		 		BBP_BILLORAL_PR='<%= BBP_BILLORAL_PR_T%>'
<%
			}

			if(! BBP_BILLE_DT_T.equals("")) {
%>
		 		BBP_BILLE_DT='<%= BBP_BILLE_DT_T%>'
<%
			}

			if(! BBP_BILBE_NO_T.equals("")) {
%>
		 		BBP_BILBE_NO='<%= BBP_BILBE_NO_T%>'
<%
			}

			if(! BBP_INPUT_ID_T.equals("")) {
%>
		 		BBP_INPUT_ID='<%= BBP_INPUT_ID_T%>'
<%
			}

			if(! BBP_INPUT_DTT_T.equals("")) {
%>
		 		BBP_INPUT_DTT='<%= BBP_INPUT_DTT_T%>'
<%
			}

			if(! BBP_MODI_DTT_T.equals("")) {
%>
		 		BBP_MODI_DTT='<%= BBP_MODI_DTT_T%>'
<%
			}

			if(! BBP_MODI_ID_T.equals("")) {
%>
		 		BBP_MODI_ID='<%= BBP_MODI_ID_T%>'
<%
			}

			if(! BBP_BILLOS_PR_T.equals("")) {
%>
		 		BBP_BILLOS_PR='<%= BBP_BILLOS_PR_T%>'
<%
			}

			if(! BBP_BILLOSC_PR_T.equals("")) {
%>
		 		BBP_BILLOSC_PR='<%= BBP_BILLOSC_PR_T%>'
<%
			}

			if(! BBP_BILLOSD_PR_T.equals("")) {
%>
		 		BBP_BILLOSD_PR='<%= BBP_BILLOSD_PR_T%>'
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
