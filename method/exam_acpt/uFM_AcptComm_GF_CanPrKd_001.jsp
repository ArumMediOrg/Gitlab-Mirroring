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

		String CUST_NO = htMethod.get("CUST_NO");
		String EXAM_DT = htMethod.get("EXAM_DT");
		String MNGT_HTYR = htMethod.get("MNGT_HTYR");

		//
		if(CUST_NO == null) { CUST_NO = ""; }
		if(EXAM_DT == null) { EXAM_DT = ""; }
		if(MNGT_HTYR == null) { MNGT_HTYR = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT A.*
  FROM (SELECT EEA_EXAM_DT, EEA_EXAM_SQ, EEA_EXAM_CD, EEA_ENTY_CD ENTY_CD, 
               SUBSTR(EEA_NHIC_TX, INSTR(EEA_NHIC_TX, '위암 : '), INSTR(EEA_NHIC_TX, '대장 : ') - INSTR(EEA_NHIC_TX, '위암 : ')-1) STOMA_TX,
               SUBSTR(EEA_NHIC_TX, INSTR(EEA_NHIC_TX, '대장 : '), INSTR(EEA_NHIC_TX, '간암 : ') - INSTR(EEA_NHIC_TX, '대장 : ')-1) COLON_TX
          FROM ET_EXAM_ACPT  
         WHERE EEA_CUST_NO   = :CUST_NO
           AND EEA_EXAM_DT  <= :EXAM_DT
           AND EEA_MNGT_HTYR = :MNGT_HTYR
           AND EEA_HTSB_CD  LIKE '1%'
           AND NVL(EEA_NHIC_TX, ' ') <> ' '
           AND EEA_ORDER_YN <> 'C'
           AND (INSTR(EEA_NHIC_TX, '위암 : ') > 0 
            OR  INSTR(EEA_NHIC_TX, '대장 : ') > 0)
         ORDER BY EEA_EXAM_DT DESC, EEA_EXAM_SQ DESC
       ) A
 WHERE ROWNUM = 1
		*/

		sql = " SELECT A.*";
		sql += " FROM (";
		sql += "	SELECT EEA_EXAM_DT, EEA_EXAM_SQ, EEA_EXAM_CD, EEA_ENTY_CD ENTY_CD";
		sql += "	, SUBSTR(EEA_NHIC_TX, INSTR(EEA_NHIC_TX, '위암 : '), INSTR(EEA_NHIC_TX, '대장 : ') - INSTR(EEA_NHIC_TX, '위암 : ')-1) STOMA_TX";
		sql += "	, SUBSTR(EEA_NHIC_TX, INSTR(EEA_NHIC_TX, '대장 : '), INSTR(EEA_NHIC_TX, '간암 : ') - INSTR(EEA_NHIC_TX, '대장 : ')-1) COLON_TX";
		sql += "	FROM ET_EXAM_ACPT";
		sql += " 	WHERE EEA_CUST_NO = '" + CUST_NO + "'";
		sql += " 	AND EEA_EXAM_DT <= '" + EXAM_DT + "'";
		sql += " 	AND EEA_MNGT_HTYR = '" + MNGT_HTYR + "'";
		sql += " 	AND EEA_HTSB_CD LIKE '1%'";
		sql += " 	AND NVL(EEA_NHIC_TX, ' ') <> ' '";
		sql += " 	AND EEA_ORDER_YN <> 'C'";
		sql += " 	AND (";
		sql += "		INSTR(EEA_NHIC_TX, '위암 : ') > 0";
		sql += " 		OR INSTR(EEA_NHIC_TX, '대장 : ') > 0";
		sql += " 	)";
		sql += " 	ORDER BY EEA_EXAM_DT DESC, EEA_EXAM_SQ DESC";
		sql += ") A";
		sql += " WHERE ROWNUM = 1";
			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uFM_AcptComm_GF_CanPrKd_001 \n";
			G_INFO += "설명 : 추가암 본인부담 여부 확인 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " CUST_NO : " + CUST_NO + " \n";
			G_INFO += " EXAM_DT : " + EXAM_DT + " \n";
			G_INFO += " MNGT_HTYR : " + MNGT_HTYR + " \n";
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
		<s:AttributeType name='EEA_EXAM_DT' rs:number='1'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_EXAM_SQ' rs:number='2'>
			<s:datatype dt:type='string' dt:maxLength='6' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_EXAM_CD' rs:number='3'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ENTY_CD' rs:number='4' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='STOMA_TX' rs:number='5' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='2000'/>
		</s:AttributeType>
		<s:AttributeType name='COLON_TX' rs:number='6' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='2000'/>
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
			String EEA_EXAM_CD_T = cRsList.getString("EEA_EXAM_CD");
			String ENTY_CD_T = cRsList.getString("ENTY_CD");
			String STOMA_TX_T = cRsList.getString("STOMA_TX");
			String COLON_TX_T = cRsList.getString("COLON_TX");
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

			if(! EEA_EXAM_CD_T.equals("")) {
%>
		 		EEA_EXAM_CD='<%= EEA_EXAM_CD_T%>'
<%
			}

			if(! ENTY_CD_T.equals("")) {
%>
		 		ENTY_CD='<%= ENTY_CD_T%>'
<%
			}

			if(! STOMA_TX_T.equals("")) {
%>
		 		STOMA_TX='<%= STOMA_TX_T%>'
<%
			}

			if(! COLON_TX_T.equals("")) {
%>
		 		COLON_TX='<%= COLON_TX_T%>'
<%
			}
%>
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
