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

		String CHUNG_NO = htMethod.get("CHUNG_NO");
		String CHUNG_NM = htMethod.get("CHUNG_NM");
		String CHGBN = htMethod.get("CHGBN");

		//
		if(CHUNG_NO == null) { CHUNG_NO = ""; }
		if(CHUNG_NM == null) { CHUNG_NM = ""; }
		if(CHGBN == null) { CHGBN = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT BBP_EXAM_DT EEA_EXAM_DT, BBP_EXAM_SQ EEA_EXAM_SQ,
       ICR_PENL_ID, ICR_PENL_NM, BBP_BILL_FL,
       '120865013300' EEA_COMP_CD,
       row_number() over (order by EEA_COMP_CD desc) Row_num,

case strToInt(:chgbn) of
      1 :        BBP_BILLFIR_PR        CHUNGAMT
      2 :        BBP_BILLSED_PR       CHUNGAMT
      3 :        BBP_BILLCAN_PR       CHUNGAMT
      4 :        BBP_BILLCANFN_PR  CHUNGAMT
      5 :        BBP_BILLORAL_PR     CHUNGAMT
      6 :        BBP_BILLOS_PR          CHUNGAMT
      7 :        BBP_BILLOSC_PR       CHUNGAMT
      8 :        BBP_BILLOSD_PR       CHUNGAMT
      9 :        '0'                                   CHUNGAMT
    end;

FROM BT_BILLHN_PR A
LEFT OUTER JOIN ET_EXAM_ACPT B  ON A.BBP_EXAM_DT = B.EEA_EXAM_DT
                               AND A.BBP_EXAM_SQ = B.EEA_EXAM_SQ
LEFT OUTER JOIN IT_CUSTOMER  C  ON B.EEA_CUST_NO = C.ICR_CUST_NO
WHERE BBP_CHUNG_NO = :CHUNG_NO
and BBP_BILL_FL = :CHUNG_NM
AND BBP_RETURN_KD = '0'
		*/

			sql = " SELECT BBP_EXAM_DT AS EEA_EXAM_DT, BBP_EXAM_SQ AS EEA_EXAM_SQ, ";
			sql += "		ICR_PENL_ID, ICR_PENL_NM, BBP_BILL_FL,           ";
			sql += " 	'120865013300' EEA_COMP_CD,                          ";
			sql += " 	row_number() over (order by EEA_COMP_CD desc) ROW_NUM, ";

			if (CHGBN.equals("1")){
				sql += " BBP_BILLFIR_PR AS CHUNGAMT ";
			} else if (CHGBN.equals("2")){
				sql += " BBP_BILLSED_PR AS CHUNGAMT ";
			} else if (CHGBN.equals("3")){
				sql += " BBP_BILLCAN_PR AS CHUNGAMT ";
			} else if (CHGBN.equals("4")){
				sql += " BBP_BILLCANFN_PR AS CHUNGAMT ";
			} else if (CHGBN.equals("5")){
				sql += " BBP_BILLORAL_PR AS CHUNGAMT ";
			} else if (CHGBN.equals("6")){
				sql += " BBP_BILLOS_PR AS CHUNGAMT ";
			} else if (CHGBN.equals("7")){
				sql += " BBP_BILLOSC_PR AS CHUNGAMT ";
			} else if (CHGBN.equals("8")){
				sql += " BBP_BILLOSD_PR AS CHUNGAMT ";
			} else if (CHGBN.equals("9")){
				sql += " 0 AS CHUNGAMT ";
			}

			sql += " FROM BT_BILLHN_PR A ";
			sql += " LEFT OUTER JOIN ET_EXAM_ACPT B  ON A.BBP_EXAM_DT = B.EEA_EXAM_DT ";
			sql += " 							AND A.BBP_EXAM_SQ = B.EEA_EXAM_SQ ";
			sql += " LEFT OUTER JOIN IT_CUSTOMER  C  ON B.EEA_CUST_NO = C.ICR_CUST_NO ";
			sql += " WHERE BBP_CHUNG_NO = '" + CHUNG_NO + "' ";
			sql += " and BBP_BILL_FL = '" + CHUNG_NM + "' ";
			sql += " AND BBP_RETURN_KD = '0' ";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : ubT_Rece_Up_afLoadGunbo_002 \n";
			G_INFO += "설명 : 건보청구 인원별 금액 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " CHGBN : " + CHGBN + " \n";
			G_INFO += " CHUNG_NO : " + CHUNG_NO + " \n";
			G_INFO += " CHUNG_NM : " + CHUNG_NM + " \n";
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
		<s:AttributeType name='EEA_EXAM_DT' rs:number='1' rs:writeunknown='true' rs:basetable='BT_BILLHN_PR' rs:basecolumn='EEA_EXAM_DT'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_EXAM_SQ' rs:number='2' rs:writeunknown='true' rs:basetable='BT_BILLHN_PR' rs:basecolumn='EEA_EXAM_SQ'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_PENL_ID' rs:number='3' rs:writeunknown='true' rs:basetable='BT_BILLHN_PR' rs:basecolumn='ICR_PENL_ID'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_PENL_NM' rs:number='4' rs:writeunknown='true' rs:basetable='BT_BILLHN_PR' rs:basecolumn='ICR_PENL_NM'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='BBP_BILL_FL' rs:number='5' rs:writeunknown='true' rs:basetable='BT_BILLHN_PR' rs:basecolumn='BBP_BILL_FL'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_COMP_CD' rs:number='6' rs:writeunknown='true' rs:basetable='BT_BILLHN_PR' rs:basecolumn='EEA_COMP_CD'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='ROW_NUM' rs:number='7' rs:writeunknown='true' rs:basetable='BT_BILLHN_PR' rs:basecolumn='ROW_NUM'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='CHUNGAMT' rs:number='8' rs:writeunknown='true' rs:basetable='BT_BILLHN_PR' rs:basecolumn='CHUNGAMT'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='9' rs:rowid='true' rs:writeunknown='true' rs:basetable='BT_BILLHN_PR'
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
			String EEA_EXAM_DT_T = cRsList.getString("EEA_EXAM_DT");
			String EEA_EXAM_SQ_T = cRsList.getString("EEA_EXAM_SQ");
			String ICR_PENL_ID_T = cRsList.getString("ICR_PENL_ID");
			String ICR_PENL_NM_T = cRsList.getString("ICR_PENL_NM");
			String BBP_BILL_FL_T = cRsList.getString("BBP_BILL_FL");

			String EEA_COMP_CD_T = cRsList.getString("EEA_COMP_CD");
			String ROW_NUM_T = cRsList.getString("ROW_NUM");
			String CHUNGAMT_T = cRsList.getString("CHUNGAMT");

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

			if(! ICR_PENL_ID_T.equals("")) {
%>
		 		ICR_PENL_ID='<%= ICR_PENL_ID_T%>'
<%
			}

			if(! ICR_PENL_NM_T.equals("")) {
%>
		 		ICR_PENL_NM='<%= ICR_PENL_NM_T%>'
<%
			}

			if(! BBP_BILL_FL_T.equals("")) {
%>
		 		BBP_BILL_FL='<%= BBP_BILL_FL_T%>'
<%
			}

			if(! EEA_COMP_CD_T.equals("")) {
%>
		 		EEA_COMP_CD='<%= EEA_COMP_CD_T%>'
<%
			}

			if(! ROW_NUM_T.equals("")) {
%>
		 		ROW_NUM='<%= ROW_NUM_T%>'
<%
			}

			if(! CHUNGAMT_T.equals("")) {
%>
		 		CHUNGAMT='<%= CHUNGAMT_T%>'
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
