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

	String DTERCPTFR = htMethod.get("DTERCPTFR");
	String DTERCPTTO = htMethod.get("DTERCPTTO");
	String SRCPTSQL = htMethod.get("SRCPTSQL");

	//
	if(DTERCPTFR == null) { DTERCPTFR = ""; }
	if(DTERCPTTO == null) { DTERCPTTO = ""; }
	if(SRCPTSQL == null) { SRCPTSQL = ""; }

	// DB객체
	stmtList = connect.createStatement();

	sql = " SELECT A.ERI_EXAM_DT, A.ERI_EXAM_SQ, A.ERI_ITEM_CD, A.ERI_RSLT_VL, TO_CLOB(A.ERI_RSLT_EX) ERI_RSLT_EX, A.ERI_VLDT_LH, A.ERI_PACS_RSLT, '1' AS SEQ";
	sql += " FROM ET_RSLT_ITEM A JOIN IT_ITEM B";
	sql += " ON IIM_ITEM_CD = ERI_ITEM_CD";
	sql += " AND IIM_RSLT_KD <> '9'";
	sql += " WHERE ERI_EXAM_DT BETWEEN '" + DTERCPTFR + "' AND '" + DTERCPTTO + "'";
	sql += " AND EXISTS (" + SRCPTSQL;
	sql += " AND A.ERI_EXAM_DT = EEA_EXAM_DT";
	sql += " AND A.ERI_EXAM_SQ = EEA_EXAM_SQ";
	sql += " AND NVL(A.ERI_CNCL_YN, 'N') <> 'Y'";
	sql += ")";

	sql += " UNION ALL";
	sql += " SELECT SSV_EXAM_DT AS ERI_EXAM_DT, SSV_EXAM_SQ AS ERI_EXAM_SQ, 'TOTAL' AS ERI_ITEM_CD, '' ERI_RSLT_VL, TO_CLOB(SSV_VIEW_EX) ERI_RSLT_EX, '' ERI_VLDT_LH, '' ERI_PACS_RSLT, '2' SEQ";
	sql += " FROM ST_SYTH_VIEW";
	sql += " WHERE SSV_EXAM_DT BETWEEN '" + DTERCPTFR + "' AND '" + DTERCPTTO + "'";
	sql += " AND EXISTS (" + SRCPTSQL;
	sql += " AND SSV_EXAM_DT = EEA_EXAM_DT";
	sql += " AND SSV_EXAM_SQ = EEA_EXAM_SQ";
	sql += ")";

	sql += " UNION ALL";
	sql += " SELECT PFP_EXAM_DT AS ERI_EXAM_DT, PFP_EXAM_SQ AS ERI_EXAM_SQ, 'FIRPAN' AS ERI_ITEM_CD , CASE WHEN PFP_PANRETA = '1' THEN 'A, ' ELSE '' END || CASE WHEN PFP_PANRETB = '1' THEN 'B, ' ELSE '' END || CASE WHEN PFP_PANRETR1 = '1' THEN 'R1, ' ELSE '' END || CASE WHEN PFP_PANRETR2 = '1' THEN 'R2, ' ELSE '' END || CASE WHEN PFP_PANRETRD = '1' THEN 'RD, ' ELSE '' END AS ERI_RSLT_VL , TO_CLOB('')  ERI_RSLT_EX, '' ERI_VLDT_LH, '' ERI_PACS_RSLT, '3' SEQ";
	sql += " FROM PT_FIR_PANJUNG";
	sql += " WHERE PFP_EXAM_DT BETWEEN '" + DTERCPTFR + "' AND '" + DTERCPTTO + "'";
	sql += " AND EXISTS (" + SRCPTSQL;
	sql += " AND PFP_EXAM_DT = EEA_EXAM_DT";
	sql += " AND PFP_EXAM_SQ = EEA_EXAM_SQ";
	sql += ")";

	sql += " UNION ALL";
	sql += " SELECT PFP_EXAM_DT AS ERI_EXAM_DT, PFP_EXAM_SQ AS ERI_EXAM_SQ, 'FIREX' AS ERI_ITEM_CD, '' ERI_RSLT_VL , TO_CLOB(CASE WHEN PFP_EXAM_DT < '2018-01-01' THEN '조치: ' || PFP_RVIEW || ' / 소견: ' || PFP_BVIEW ELSE '의심질환소견: ' || PFP_OPIN1 || ' / 유질환소견: ' || PFP_OPIN2 || ' / 생활습관소견: ' || PFP_OPIN3 || ' / 기타소견: ' || PFP_OPIN4 END) AS ERI_RSLT_EX , '' ERI_VLDT_LH, '' ERI_PACS_RSLT, '4' SEQ";
	sql += " FROM PT_FIR_PANJUNG";
	sql += " WHERE PFP_EXAM_DT BETWEEN '" + DTERCPTFR + "' AND '" + DTERCPTTO + "'";
	sql += " AND EXISTS (" + SRCPTSQL;
	sql += " AND PFP_EXAM_DT = EEA_EXAM_DT";
	sql += " AND PFP_EXAM_SQ = EEA_EXAM_SQ";
	sql += ")";

	sql += " UNION ALL";
	sql += " SELECT PSP_EXAM_DT AS ERI_EXAM_DT, PSP_EXAM_SQ AS ERI_EXAM_SQ, 'SECEX' AS ERI_ITEM_CD, '' ERI_RSLT_VL, TO_CLOB(PSP_RVIEW || CHR(13) || CHR(10) || PSP_BVIEW) ERI_RSLT_EX, '' ERI_VLDT_LH, '' ERI_PACS_RSLT, '5' SEQ";
	sql += " FROM PT_SED_PANJUNG";
	sql += " WHERE PSP_EXAM_DT BETWEEN '" + DTERCPTFR + "' AND '" + DTERCPTTO + "'";
	sql += " AND EXISTS (" + SRCPTSQL;
	sql += " AND PSP_EXAM_DT = EEA_EXAM_DT";
	sql += " AND PSP_EXAM_SQ = EEA_EXAM_SQ";
	sql += ")";

	sql += " ORDER BY ERI_EXAM_DT, ERI_EXAM_SQ, ERI_ITEM_CD, SEQ";

	//
	G_INFO += "<!-- \n";
	G_INFO += "서비스명 : uMake_Excel_upGetExamItem_001 \n";
	G_INFO += "설명 : 검사정보 로딩 \n";
	G_INFO += "\n\n";

	G_INFO += "전달인자 : \n";
	G_INFO += " DTERCPTFR : " + DTERCPTFR + " \n";
	G_INFO += " DTERCPTTO : " + DTERCPTTO + " \n";
	G_INFO += " SRCPTSQL : " + SRCPTSQL + " \n";
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
					<s:AttributeType name='ERI_EXAM_DT' rs:number='1' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_RSLT_ITEM'
									 rs:basecolumn='ERI_EXAM_DT'>
						<s:datatype dt:type='string' dt:maxLength='10'/>
					</s:AttributeType>
					<s:AttributeType name='ERI_EXAM_SQ' rs:number='2' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_RSLT_ITEM'
									 rs:basecolumn='ERI_EXAM_SQ'>
						<s:datatype dt:type='string' dt:maxLength='6'/>
					</s:AttributeType>
					<s:AttributeType name='ERI_ITEM_CD' rs:number='3' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_RSLT_ITEM'
									 rs:basecolumn='ERI_ITEM_CD'>
						<s:datatype dt:type='string' dt:maxLength='10'/>
					</s:AttributeType>
					<s:AttributeType name='ERI_RSLT_VL' rs:number='4' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_RSLT_ITEM'
									 rs:basecolumn='ERI_RSLT_VL'>
						<s:datatype dt:type='string' dt:maxLength='50'/>
					</s:AttributeType>
					<s:AttributeType name='ERI_RSLT_EX' rs:number='5' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_RSLT_ITEM'
									 rs:basecolumn='ERI_RSLT_EX'>
						<s:datatype dt:type='string' dt:maxLength='1073741823' rs:long='true'/>
					</s:AttributeType>
					<s:AttributeType name='ERI_VLDT_LH' rs:number='6' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_RSLT_ITEM'
									 rs:basecolumn='ERI_VLDT_LH'>
						<s:datatype dt:type='string' dt:maxLength='1'/>
					</s:AttributeType>
					<s:AttributeType name='ERI_PACS_RSLT' rs:number='7' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_RSLT_ITEM'
									 rs:basecolumn='ERI_PACS_RSLT'>
						<s:datatype dt:type='string' dt:maxLength='4000'/>
					</s:AttributeType>
					<s:AttributeType name='SEQ' rs:number='8' rs:nullable='true'>
						<s:datatype dt:type='string' dt:maxLength='1' rs:fixedlength='true'/>
					</s:AttributeType>
					<s:extends type='rs:rowbase'/>
				</s:ElementType>
			</s:Schema>
			<rs:data>
				<%
					int cnt = 0;
					while(cRsList.next()) {

						cnt++;

						String ERI_EXAM_DT_T = cRsList.getString("ERI_EXAM_DT");
						String ERI_EXAM_SQ_T = cRsList.getString("ERI_EXAM_SQ");
						String ERI_ITEM_CD_T = cRsList.getString("ERI_ITEM_CD");
						String ERI_RSLT_VL_T = cRsList.getString("ERI_RSLT_VL");
						String ERI_RSLT_EX_T = cRsList.getString("ERI_RSLT_EX");
						String ERI_VLDT_LH_T = cRsList.getString("ERI_VLDT_LH");
						String ERI_PACS_RSLT_T = cRsList.getString("ERI_PACS_RSLT");
						String SEQ_T = cRsList.getString("SEQ");
				%>
				<z:row
						<%
							if(! ERI_EXAM_DT_T.equals("")) {
						%>
						ERI_EXAM_DT='<%= ERI_EXAM_DT_T%>'
						<%
							}

							if(! ERI_EXAM_SQ_T.equals("")) {
						%>
						ERI_EXAM_SQ='<%= ERI_EXAM_SQ_T%>'
						<%
							}

							if(! ERI_ITEM_CD_T.equals("")) {
						%>
						ERI_ITEM_CD='<%= ERI_ITEM_CD_T%>'
						<%
							}

							if(! ERI_RSLT_VL_T.equals("")) {
						%>
						ERI_RSLT_VL='<%= ERI_RSLT_VL_T%>'
						<%
							}

							if(! ERI_RSLT_EX_T.equals("")) {
						%>
						ERI_RSLT_EX='<%= ERI_RSLT_EX_T%>'
						<%
							}

							if(! ERI_VLDT_LH_T.equals("")) {
						%>
						ERI_VLDT_LH='<%= ERI_VLDT_LH_T%>'
						<%
							}

							if(! ERI_PACS_RSLT_T.equals("")) {
						%>
						ERI_PACS_RSLT='<%= ERI_PACS_RSLT_T%>'
						<%
							}

							if(! SEQ_T.equals("")) {
						%>
						SEQ='<%= SEQ_T%>'
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
