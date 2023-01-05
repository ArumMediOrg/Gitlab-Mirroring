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

	ResultSetMetaData rsmd = null;
	int colCnt = 0;

	try {
%>
<%@ include file="/inc_prg/connect.jsp"%>
<%
		// 전달자료
		htData = (HashMap<String, Object>)request.getAttribute("htData");
		htMethod = (HashMap<String, String>)request.getAttribute("htMethod_1");

		String EXAM_DT = htMethod.get("EXAM_DT");
		String SEX_CD = htMethod.get("SEX_CD");
		String PSNL_AGE = htMethod.get("PSNL_AGE");
		String JJ_CD = htMethod.get("JJ_CD");
		String PARAM_TX = htMethod.get("PARAM_TX");

		//
		if(EXAM_DT == null) { EXAM_DT = ""; }
		if(SEX_CD == null) { SEX_CD = ""; }
		if(PSNL_AGE == null) { PSNL_AGE = ""; }
		if(JJ_CD == null) { JJ_CD = ""; }
		if(PARAM_TX == null) { PARAM_TX = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*
SELECT DISTINCT
       A.CSP_JJ_CD, A.CSP_SBCD_CD, B.IIM_ITEM_CD, B.IIM_KNME_NM, B.IIM_TRTP_CD,
       GETSP_COMMON_CDTONM('HM06D', B.IIM_TRLT_CD || B.IIM_TRNM_CD) IIM_TRNM_NM,
       C.ERI_RSLT_VL, D.IIV_CHAR_VAL, D.IIV_RSLT_UNIT,  B.IIM_SBCD_CD, E.IIR_RSLT_VL,
       GETSP_COMMON_CDTONM('HM06F', D.IIV_TREF_CD) IIV_TREF_NM,
       D.IIV_RSLT_LOW, D.IIV_LOW_KD, D.IIV_RSLT_HIGH,  D.IIV_HIGH_KD, B.IIM_SORT_SQ
  FROM CT_SP_PROF A
            INNER JOIN IT_ITEM      B ON A.CSP_SBCD_CD = B.IIM_SBCD_CD AND B.IIM_RSLT_KD <> '9'
            INNER JOIN ET_RSLT_ITEM C ON B.IIM_ITEM_CD = C.ERI_ITEM_CD AND C.ERI_CNCL_YN <> 'Y'
       LEFT OUTER JOIN IT_ITEM_RESULT E ON B.IIM_ITEM_CD = E.IIR_ITEM_CD
                                                     AND C.ERI_SPRT_CD = E.IIR_SPEX_CD
       LEFT OUTER JOIN IT_ITEM_VLDT D ON B.IIM_ITEM_CD = D.IIV_ITEM_CD
                                     AND D.IIV_APLY_DT = GETITEM_VLDT_APPLYDATE(B.IIM_ITEM_CD, :EXAM_DT, 'ITEM_CD', '4')
                                     AND D.IIV_SEX_CD  = :SEX_CD
                                     AND D.IIV_AGE_FR <= :PSNL_AGE
                                     AND D.IIV_AGE_TO >= :PSNL_AGE
                                     AND D.IIV_EXAM_CD = '4'
                                     AND D.IIV_PANJ_CD = 'A'
 WHERE A.CSP_JJ_CD = :JJ_CD

 :PARAM_TX
		*/

		sql = " SELECT DISTINCT A.CSP_JJ_CD, A.CSP_SBCD_CD, B.IIM_ITEM_CD, B.IIM_KNME_NM, B.IIM_TRTP_CD, GETSP_COMMON_CDTONM('HM06D', B.IIM_TRLT_CD || B.IIM_TRNM_CD) IIM_TRNM_NM, C.ERI_RSLT_VL, D.IIV_CHAR_VAL, D.IIV_RSLT_UNIT,";
		sql += " B.IIM_SBCD_CD, E.IIR_RSLT_VL, GETSP_COMMON_CDTONM('HM06F', D.IIV_TREF_CD) IIV_TREF_NM, D.IIV_RSLT_LOW, D.IIV_LOW_KD, D.IIV_RSLT_HIGH, D.IIV_HIGH_KD, B.IIM_SORT_SQ";

		sql += " FROM CT_SP_PROF A INNER JOIN IT_ITEM B";
		sql += " ON A.CSP_SBCD_CD = B.IIM_SBCD_CD";
		sql += " AND B.IIM_RSLT_KD <> '9'";

		sql += " INNER JOIN ET_RSLT_ITEM C";
		sql += " ON B.IIM_ITEM_CD = C.ERI_ITEM_CD";
		sql += " AND C.ERI_CNCL_YN <> 'Y'";

		sql += " LEFT OUTER JOIN IT_ITEM_RESULT E ON B.IIM_ITEM_CD = E.IIR_ITEM_CD";
		sql += " AND C.ERI_SPRT_CD = E.IIR_SPEX_CD";

		sql += " LEFT OUTER JOIN IT_ITEM_VLDT D";
		sql += " ON B.IIM_ITEM_CD = D.IIV_ITEM_CD";
		sql += " AND D.IIV_APLY_DT = GETITEM_VLDT_APPLYDATE(B.IIM_ITEM_CD, '" + EXAM_DT + "', 'ITEM_CD', '4')";
		sql += " AND D.IIV_SEX_CD = '" + SEX_CD + "'";
		sql += " AND D.IIV_AGE_FR <= '" + PSNL_AGE + "'";
		sql += " AND D.IIV_AGE_TO >= '" + PSNL_AGE + "'";
		sql += " AND D.IIV_EXAM_CD = '4'";
		sql += " AND D.IIV_PANJ_CD = 'A'";

		sql += " WHERE A.CSP_JJ_CD = '" + JJ_CD + "'";
		sql += PARAM_TX;
			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uSP_HEALTH_POSTMANAGEMENT_UF_GumSokunDisplay_002 \n";
			G_INFO += "설명 : 소견 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " EXAM_DT : " + EXAM_DT + " \n";
			G_INFO += " SEX_CD : " + SEX_CD + " \n";
			G_INFO += " PSNL_AGE : " + PSNL_AGE + " \n";
			G_INFO += " JJ_CD : " + JJ_CD + " \n";
			G_INFO += " PARAM_TX : " + PARAM_TX + " \n";
			G_INFO += "\n\n";

			G_INFO += "질의문 : " + sql + " \n";
			G_INFO += "-->";

		rsList = stmtList.executeQuery(sql);
		cRsList = new CRs(rsList);

		rsmd = rsList.getMetaData();  //Select 결과의 Metadata 가져오기.

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
<%
		for (colCnt = 1; colCnt <= rsmd.getColumnCount(); colCnt++){
			String dataType = "string";
			String maxLength = "4000";

			if (rsmd.getColumnTypeName(colCnt).equals("BLOB")){
				dataType = "bin.hex";
				maxLength = "2147483647";
				//<s:datatype dt:type='bin.hex' dt:maxLength='2147483647' rs:long='true'/>
			} else if (rsmd.getColumnTypeName(colCnt).equals("CLOB")){
				maxLength = "1073741823";
				//<s:datatype dt:type='string' dt:maxLength='1073741823' rs:long='true'/>
			}
%>
		<s:AttributeType name='<%= rsmd.getColumnName(colCnt)%>' rs:number='<%= Integer.toString(colCnt)%>' rs:writeunknown='true' rs:basetable='DUAL' rs:basecolumn='<%= rsmd.getColumnName(colCnt)%>'>
			<s:datatype dt:type='<%= dataType%>' dt:maxLength='<%= maxLength%>' <% if (! maxLength.equals("4000")) { %> rs:long='true' <% } %>/>
		</s:AttributeType>
<%
		}
%>
		<s:AttributeType name='ROWID' rs:number='<%= Integer.toString(colCnt)%>' rs:rowid='true' rs:writeunknown='true' rs:basetable='DUAL'
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

			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			for (colCnt = 1; colCnt <= rsmd.getColumnCount(); colCnt++){
				String tempData = cRsList.getString(rsmd.getColumnName(colCnt));
				if(! tempData.equals("")) {
%>
		 			<%= rsmd.getColumnName(colCnt)%>='<%= tempData%>'
<%
				}
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