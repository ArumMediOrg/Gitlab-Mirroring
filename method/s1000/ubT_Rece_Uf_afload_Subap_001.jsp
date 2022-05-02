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

		String RECE_NO = htMethod.get("RECE_NO");

		//
		if(RECE_NO == null) { RECE_NO = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT RRM_RECE_NO,RRM_RECE_SEQ,RRM_RECE_DT,  RRM_MEMO, RRM_INPUT_ID,
       RRM_OCCU_KD,
       (SELECT CCN_FULL_NM
          FROM CT_COMMON
         WHERE A.RRM_OCCU_KD=CCN_SMALL
           AND CCN_LARGE='0925' ) RRM_OCCU_NM,
       RRM_RECE_PR,  RRM_OVERPAY_PR,  RRM_RETURN_PR,
       RRM_SALE_KD,
       (SELECT CCN_FULL_NM
          FROM CT_COMMON
         WHERE A.RRM_SALE_KD=CCN_SMALL
           AND CCN_LARGE='0921' ) RRM_SALE_NM,
       RRM_SALE_PR,RRM_TRUNC_PR,
       RRM_PAYEND_KD,
       CASE RRM_PAYEND_KD WHEN '01' THEN '전체'
                          WHEN '02' THEN '일부'
                          WHEN '03' THEN '분활' END  RRM_PAYEND_NM,
       RRM_PAY_KD,
       (SELECT CCN_FULL_NM
          FROM CT_COMMON
         WHERE A.RRM_PAY_KD=CCN_SMALL
           AND CCN_LARGE='0920' ) RRM_PAY_NM,
       RRM_RESER_PR,RRM_RESEREPL_PR,
       RRM_ISSUE_CD ,
       NVL((SELECT CCN_FULL_NM
                 FROM CT_COMMON
                WHERE A.RRM_ISSUE_CD=CCN_SMALL
                  AND CCN_LARGE='0923' ),' ') || NVL(RRM_CARD_NM,' ') RRM_ISSUE_NM, RRM_RETURN_RECE_SEQ
  from RT_RECE_MEDICHK A
 WHERE RRM_RECE_NO = :RECE_NO
		*/

		sql = " SELECT RRM_RECE_NO,RRM_RECE_SEQ,RRM_RECE_DT, RRM_MEMO, RRM_INPUT_ID, RRM_OCCU_KD, RRM_APPR_NO";
		sql += ", (";
		sql += "	SELECT CCN_FULL_NM";
		sql += " 	FROM CT_COMMON";
		sql += " 	WHERE A.RRM_OCCU_KD=CCN_SMALL";
		sql += " 	AND CCN_LARGE='0925'";
		sql += ") RRM_OCCU_NM";
		sql += ", RRM_RECE_PR, RRM_OVERPAY_PR, RRM_RETURN_PR, RRM_SALE_KD";
		sql += ", (";
		sql += "	SELECT CCN_FULL_NM";
		sql += " 	FROM CT_COMMON";
		sql += " 	WHERE A.RRM_SALE_KD=CCN_SMALL";
		sql += " 	AND CCN_LARGE='0921'";
		sql += ") RRM_SALE_NM";
		sql += ", RRM_SALE_PR,RRM_TRUNC_PR, RRM_PAYEND_KD";
		sql += ", CASE RRM_PAYEND_KD WHEN '01' THEN '전체' WHEN '02' THEN '일부' WHEN '03' THEN '분활' END RRM_PAYEND_NM";
		sql += ", RRM_PAY_KD";
		sql += ", (";
		sql += "	SELECT CCN_FULL_NM";
		sql += " 	FROM CT_COMMON";
		sql += " 	WHERE A.RRM_PAY_KD=CCN_SMALL";
		sql += " 	AND CCN_LARGE='0920'";
		sql += ") RRM_PAY_NM";
		sql += ", RRM_RESER_PR,RRM_RESEREPL_PR, RRM_ISSUE_CD";
		sql += ", NVL(";
		sql += "	(";
		sql += "		SELECT CCN_FULL_NM";
		sql += " 		FROM CT_COMMON";
		sql += " 		WHERE A.RRM_ISSUE_CD=CCN_SMALL";
		sql += " 		AND CCN_LARGE='0923'";
		sql += "	),' ')";
		sql += " || NVL(RRM_CARD_NM,' ') RRM_ISSUE_NM, RRM_RETURN_RECE_SEQ";
		sql += " FROM RT_RECE_MEDICHK A";
		sql += " WHERE RRM_RECE_NO = '" + RECE_NO + "'";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : ubT_Rece_Uf_afload_Subap_001 \n";
			G_INFO += "설명 : 선택자료 기 수납내역조회(수납번호 조건) \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " RECE_NO : " + RECE_NO + " \n";
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
		<s:AttributeType name='RRM_RECE_NO' rs:number='1' rs:writeunknown='true' rs:basetable='RT_RECE_MEDICHK' rs:basecolumn='RRM_RECE_NO'>
			<s:datatype dt:type='string' dt:maxLength='14' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='RRM_RECE_SEQ' rs:number='2' rs:writeunknown='true' rs:basetable='RT_RECE_MEDICHK' rs:basecolumn='RRM_RECE_SEQ'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='RRM_RECE_DT' rs:number='3' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RECE_MEDICHK'
			 rs:basecolumn='RRM_RECE_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='RRM_MEMO' rs:number='4' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RECE_MEDICHK'
			 rs:basecolumn='RRM_MEMO'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='RRM_INPUT_ID' rs:number='5' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RECE_MEDICHK'
			 rs:basecolumn='RRM_INPUT_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='RRM_OCCU_KD' rs:number='6' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RECE_MEDICHK'
			 rs:basecolumn='RRM_OCCU_KD'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='RRM_APPR_NO' rs:number='7' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RECE_MEDICHK'
			 rs:basecolumn='RRM_APPR_NO'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='RRM_OCCU_NM' rs:number='8' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='300'/>
		</s:AttributeType>
		<s:AttributeType name='RRM_RECE_PR' rs:number='9' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RECE_MEDICHK'
			 rs:basecolumn='RRM_RECE_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='RRM_OVERPAY_PR' rs:number='10' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RECE_MEDICHK'
			 rs:basecolumn='RRM_OVERPAY_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='RRM_RETURN_PR' rs:number='11' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RECE_MEDICHK'
			 rs:basecolumn='RRM_RETURN_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='RRM_SALE_KD' rs:number='12' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RECE_MEDICHK'
			 rs:basecolumn='RRM_SALE_KD'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='RRM_SALE_NM' rs:number='13' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='300'/>
		</s:AttributeType>
		<s:AttributeType name='RRM_SALE_PR' rs:number='14' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RECE_MEDICHK'
			 rs:basecolumn='RRM_SALE_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='RRM_TRUNC_PR' rs:number='15' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RECE_MEDICHK'
			 rs:basecolumn='RRM_TRUNC_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='RRM_PAYEND_KD' rs:number='16' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RECE_MEDICHK'
			 rs:basecolumn='RRM_PAYEND_KD'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='RRM_PAYEND_NM' rs:number='17' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RECE_MEDICHK'
			 rs:basecolumn='RRM_PAYEND_NM'>
			<s:datatype dt:type='string' dt:maxLength='4' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='RRM_PAY_KD' rs:number='18' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='RRM_PAY_NM' rs:number='19' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='300'/>
		</s:AttributeType>
		<s:AttributeType name='RRM_RESER_PR' rs:number='20' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RECE_MEDICHK'
			 rs:basecolumn='RRM_RESER_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='RRM_RESEREPL_PR' rs:number='21' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RECE_MEDICHK'
			 rs:basecolumn='RRM_RESEREPL_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='RRM_ISSUE_CD' rs:number='22' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RECE_MEDICHK'
			 rs:basecolumn='RRM_ISSUE_CD'>
			<s:datatype dt:type='string' dt:maxLength='3'/>
		</s:AttributeType>
		<s:AttributeType name='RRM_ISSUE_NM' rs:number='23' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='340'/>
		</s:AttributeType>
		<s:AttributeType name='RRM_RETURN_RECE_SEQ' rs:number='24' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RECE_MEDICHK'
			 rs:basecolumn='RRM_RETURN_RECE_SEQ'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='25' rs:rowid='true' rs:basetable='RT_RECE_MEDICHK' rs:basecolumn='ROWID'
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

			String RRM_RECE_NO_T = cRsList.getString("RRM_RECE_NO");
			String RRM_RECE_SEQ_T = cRsList.getString("RRM_RECE_SEQ");
			String RRM_RECE_DT_T = cRsList.getString("RRM_RECE_DT");
			String RRM_MEMO_T = cRsList.getString("RRM_MEMO");
			String RRM_INPUT_ID_T = cRsList.getString("RRM_INPUT_ID");
			String RRM_OCCU_KD_T = cRsList.getString("RRM_OCCU_KD");
			String RRM_APPR_NO_T = cRsList.getString("RRM_APPR_NO");
			String RRM_OCCU_NM_T = cRsList.getString("RRM_OCCU_NM");
			String RRM_RECE_PR_T = cRsList.getString("RRM_RECE_PR");
			String RRM_OVERPAY_PR_T = cRsList.getString("RRM_OVERPAY_PR");
			String RRM_RETURN_PR_T = cRsList.getString("RRM_RETURN_PR");
			String RRM_SALE_KD_T = cRsList.getString("RRM_SALE_KD");
			String RRM_SALE_NM_T = cRsList.getString("RRM_SALE_NM");
			String RRM_SALE_PR_T = cRsList.getString("RRM_SALE_PR");
			String RRM_TRUNC_PR_T = cRsList.getString("RRM_TRUNC_PR");
			String RRM_PAYEND_KD_T = cRsList.getString("RRM_PAYEND_KD");
			String RRM_PAYEND_NM_T = cRsList.getString("RRM_PAYEND_NM");
			String RRM_PAY_KD_T = cRsList.getString("RRM_PAY_KD");
			String RRM_PAY_NM_T = cRsList.getString("RRM_PAY_NM");
			String RRM_RESER_PR_T = cRsList.getString("RRM_RESER_PR");
			String RRM_RESEREPL_PR_T = cRsList.getString("RRM_RESEREPL_PR");
			String RRM_ISSUE_CD_T = cRsList.getString("RRM_ISSUE_CD");
			String RRM_ISSUE_NM_T = cRsList.getString("RRM_ISSUE_NM");
			String RRM_RETURN_RECE_SEQ_T = cRsList.getString("RRM_RETURN_RECE_SEQ");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! RRM_RECE_NO_T.equals("")) {
%>
		 		RRM_RECE_NO='<%= RRM_RECE_NO_T%>'
<%
			}

			if(! RRM_RECE_SEQ_T.equals("")) {
%>
		 		RRM_RECE_SEQ='<%= RRM_RECE_SEQ_T%>'
<%
			}

			if(! RRM_RECE_DT_T.equals("")) {
%>
		 		RRM_RECE_DT='<%= RRM_RECE_DT_T%>'
<%
			}

			if(! RRM_MEMO_T.equals("")) {
%>
		 		RRM_MEMO='<%= RRM_MEMO_T%>'
<%
			}

			if(! RRM_INPUT_ID_T.equals("")) {
%>
		 		RRM_INPUT_ID='<%= RRM_INPUT_ID_T%>'
<%
			}

			if(! RRM_OCCU_KD_T.equals("")) {
%>
		 		RRM_OCCU_KD='<%= RRM_OCCU_KD_T%>'
<%
			}

			if(! RRM_APPR_NO_T.equals("")) {
%>
		 		RRM_APPR_NO='<%= RRM_APPR_NO_T%>'
<%
			}

			if(! RRM_OCCU_NM_T.equals("")) {
%>
		 		RRM_OCCU_NM='<%= RRM_OCCU_NM_T%>'
<%
			}

			if(! RRM_RECE_PR_T.equals("")) {
%>
		 		RRM_RECE_PR='<%= RRM_RECE_PR_T%>'
<%
			}

			if(! RRM_OVERPAY_PR_T.equals("")) {
%>
		 		RRM_OVERPAY_PR='<%= RRM_OVERPAY_PR_T%>'
<%
			}

			if(! RRM_RETURN_PR_T.equals("")) {
%>
		 		RRM_RETURN_PR='<%= RRM_RETURN_PR_T%>'
<%
			}

			if(! RRM_SALE_KD_T.equals("")) {
%>
		 		RRM_SALE_KD='<%= RRM_SALE_KD_T%>'
<%
			}

			if(! RRM_SALE_NM_T.equals("")) {
%>
		 		RRM_SALE_NM='<%= RRM_SALE_NM_T%>'
<%
			}

			if(! RRM_SALE_PR_T.equals("")) {
%>
		 		RRM_SALE_PR='<%= RRM_SALE_PR_T%>'
<%
			}

			if(! RRM_TRUNC_PR_T.equals("")) {
%>
		 		RRM_TRUNC_PR='<%= RRM_TRUNC_PR_T%>'
<%
			}

			if(! RRM_PAYEND_KD_T.equals("")) {
%>
		 		RRM_PAYEND_KD='<%= RRM_PAYEND_KD_T%>'
<%
			}

			if(! RRM_PAYEND_NM_T.equals("")) {
%>
		 		RRM_PAYEND_NM='<%= RRM_PAYEND_NM_T%>'
<%
			}

			if(! RRM_PAY_KD_T.equals("")) {
%>
		 		RRM_PAY_KD='<%= RRM_PAY_KD_T%>'
<%
			}

			if(! RRM_PAY_NM_T.equals("")) {
%>
		 		RRM_PAY_NM='<%= RRM_PAY_NM_T%>'
<%
			}

			if(! RRM_RESER_PR_T.equals("")) {
%>
		 		RRM_RESER_PR='<%= RRM_RESER_PR_T%>'
<%
			}

			if(! RRM_RESEREPL_PR_T.equals("")) {
%>
		 		RRM_RESEREPL_PR='<%= RRM_RESEREPL_PR_T%>'
<%
			}

			if(! RRM_ISSUE_CD_T.equals("")) {
%>
		 		RRM_ISSUE_CD='<%= RRM_ISSUE_CD_T%>'
<%
			}

			if(! RRM_ISSUE_NM_T.equals("")) {
%>
		 		RRM_ISSUE_NM='<%= RRM_ISSUE_NM_T%>'
<%
			}

			if(! RRM_RETURN_RECE_SEQ_T.equals("")) {
%>
		 		RRM_RETURN_RECE_SEQ='<%= RRM_RETURN_RECE_SEQ_T%>'
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
