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
		String CMB_PANINDEX = htMethod.get("CMB_PANINDEX");
		String CMB_PANTEXT = htMethod.get("CMB_PANTEXT");

		//
		if(EXAM_DT == null) { EXAM_DT = ""; }
		if(EXAM_SQ == null) { EXAM_SQ = ""; }
		if(CMB_PANINDEX == null) { CMB_PANINDEX = ""; }
		if(CMB_PANTEXT == null) { CMB_PANTEXT = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT PlP_EXAM_DT, PLP_EXAM_SQ, PLP_JLPN_DSCD, PLP_JLPN_PNCD, PLP_JLPN_DOCV
        , CASE WHEN ITEM_CD = 'A0014' AND NVL(PSP_HIBLOOD_VAL, ' ') <> ' ' THEN IIM_SNME_NM || ': 1차:' || ERI_RSLT_VL || ERI_RSLT_UNIT || ', 2차:' || PSP_HIBLOOD_VAL || ERI_RSLT_UNIT
            WHEN ITEM_CD = 'A0015' AND NVL(PSP_LIBLOOD_VAL, ' ') <> ' ' THEN IIM_SNME_NM || ': 1차:' || ERI_RSLT_VL || ERI_RSLT_UNIT || ', 2차:' || PSP_LIBLOOD_VAL || ERI_RSLT_UNIT
            WHEN ITEM_CD = 'BA014' AND NVL(PSP_RVAL_GLO, ' ') <> ' ' THEN IIM_SNME_NM || ': 1차:' || ERI_RSLT_VL || ERI_RSLT_UNIT || ', 2차:' || PSP_RVAL_GLO || ERI_RSLT_UNIT
            ELSE IIM_SNME_NM || ': ' || ERI_RSLT_VL || NVL(ERI_RSLT_UNIT, ' ') END AS ERI_RSLT_VL
        , PFP_RESULTR2_1, PFP_RESULTR2_2
        , CASE WHEN NVL((SELECT JLPN_NAME FROM JLPN_TEMP WHERE PLP_JLPN_SH01 = CODE ), ' ') <> ' ' THEN
              NVL((SELECT JLPN_NAME FROM JLPN_TEMP WHERE PLP_JLPN_SH01 = CODE ), ' ') || CHR(13) ELSE '' END ||
          CASE WHEN NVL((SELECT JLPN_NAME FROM JLPN_TEMP WHERE PLP_JLPN_SH02 = CODE ), ' ') <> ' ' THEN
              NVL((SELECT JLPN_NAME FROM JLPN_TEMP WHERE PLP_JLPN_SH02 = CODE ), ' ') || CHR(13) ELSE '' END ||
          CASE WHEN NVL((SELECT JLPN_NAME FROM JLPN_TEMP WHERE PLP_JLPN_SH03 = CODE ), ' ') <> ' ' THEN
              NVL((SELECT JLPN_NAME FROM JLPN_TEMP WHERE PLP_JLPN_SH03 = CODE ), ' ') || CHR(13) ELSE '' END ||
    NVL(PLP_ETC_EX, ' ') AS JLPN_EX
        , PLP_JLPN_WORK, PLP_JLPN_TTPN
   FROM PT_LABOR_PANJUNG
   LEFT OUTER JOIN PT_FIR_PANJUNG
     ON PFP_EXAM_DT = PlP_EXAM_DT
    AND PFP_EXAM_SQ = PLP_EXAM_SQ
   LEFT OUTER JOIN (SELECT CAST( SUBSTR(CCN_SMALL,1,2) AS INT) AS PACK_CD
                         , SUBSTR(CCN_SMALL,3,5) AS  ITEM_CD, CCN_FULL_NM AS IIM_SNME_NM
                      FROM CT_COMMON
                      JOIN IT_ITEM
                        ON IIM_ITEM_CD = SUBSTR(CCN_SMALL,3,5)
                     WHERE CCN_LARGE = '0423' AND CCN_LEVEL = '5' AND CCN_USE_YN = 'Y') C
     ON SUBSTR(PLP_JLPN_DSCD,1,1) = C.PACK_CD
   LEFT OUTER JOIN ET_RSLT_ITEM
     ON ERI_EXAM_DT = PLP_EXAM_DT
    AND ERI_EXAM_SQ = PLP_EXAM_SQ
    AND ERI_ITEM_CD = ITEM_CD
   LEFT OUTER JOIN PT_SED_PANJUNG
     ON PSP_EXAM_DT = PFP_EXAM_DT2
    AND PSP_EXAM_SQ = PFP_EXAM_SQ2
  WHERE PLP_EXAM_DT = :EXAM_DT
    AND PLP_EXAM_SQ = :EXAM_SQ
    AND NVL(PLP_JLPN_PNCD, ' ') <> ' '
    AND NVL(ERI_RSLT_VL, ' ') <> ' '

if (:cmb_panIndex = '5') or
   (:cmb_panIndex = '6') then //2018.04.02 이명재 추가
begin
  if :cmb_panIndex = '5' then
    AND PLP_JLPN_PNCD In ('C', 'D1', 'D2')
  else if :cmb_panIndex = '6' then
    AND PLP_JLPN_PNCD In ('D1', 'D2')
end else if :cmb_panText <> ' then
begin
  AND PLP_JLPN_PNCD = :cmb_panText
end;

ORDER BY PLP_JLPN_DSCD
		*/

		sql = " SELECT PLP_EXAM_DT, PLP_EXAM_SQ, PLP_JLPN_DSCD, PLP_JLPN_PNCD, PLP_JLPN_DOCV, ITEM_CD";

		sql += ", CASE WHEN ITEM_CD = 'A0014' AND NVL(PSP_HIBLOOD_VAL, ' ') <> ' ' THEN";
		sql += "	IIM_SNME_NM || ': 1차:' || ERI_RSLT_VL || ERI_RSLT_UNIT || ', 2차:' || PSP_HIBLOOD_VAL || ERI_RSLT_UNIT";
		sql += " WHEN ITEM_CD = 'A0015' AND NVL(PSP_LIBLOOD_VAL, ' ') <> ' ' THEN";
		sql += " IIM_SNME_NM || ': 1차:' || ERI_RSLT_VL || ERI_RSLT_UNIT || ', 2차:' || PSP_LIBLOOD_VAL || ERI_RSLT_UNIT WHEN ITEM_CD = 'BA014' AND NVL(PSP_RVAL_GLO, ' ') <> ' ' THEN";
		sql += "	IIM_SNME_NM || ': 1차:' || ERI_RSLT_VL || ERI_RSLT_UNIT || ', 2차:' || PSP_RVAL_GLO || ERI_RSLT_UNIT ELSE IIM_SNME_NM || ': ' || ERI_RSLT_VL || NVL(ERI_RSLT_UNIT, ' ')";
		sql += " END AS ERI_RSLT_VL";

		sql += ", PFP_RESULTR2_1, PFP_RESULTR2_2";
		sql += ", CASE WHEN NVL(";
		sql += "	(";
		sql += "		SELECT JLPN_NAME";
		sql += " 		FROM JLPN_TEMP";
		sql += " 		WHERE PLP_JLPN_SH01 = CODE";
		sql += "	), ' ') <> ' ' THEN";
		sql += "	NVL(";
		sql += "		(";
		sql += "			SELECT JLPN_NAME";
		sql += " 			FROM JLPN_TEMP";
		sql += " 			WHERE PLP_JLPN_SH01 = CODE";
		sql += "		), ' ')";
		sql += "	|| CHR(13)";
		sql += "  ELSE '' END";

		sql += " || CASE WHEN NVL(";
		sql += "	(";
		sql += "		SELECT JLPN_NAME";
		sql += " 		FROM JLPN_TEMP";
		sql += " 		WHERE PLP_JLPN_SH02 = CODE";
		sql += "	), ' ') <> ' '";
		sql += " THEN NVL(";
		sql += "	(";
		sql += "		SELECT JLPN_NAME";
		sql += " 		FROM JLPN_TEMP";
		sql += " 		WHERE PLP_JLPN_SH02 = CODE";
		sql += "	), ' ') || CHR(13) ELSE '' END";
		sql += " || CASE WHEN NVL(";
		sql += "	(";
		sql += "		SELECT JLPN_NAME";
		sql += " 		FROM JLPN_TEMP";
		sql += " 		WHERE PLP_JLPN_SH03 = CODE";
		sql += "	), ' ') <> ' ' THEN";
		sql += " NVL(";
		sql += "	(";
		sql += "		SELECT JLPN_NAME";
		sql += " 		FROM JLPN_TEMP";
		sql += " 		WHERE PLP_JLPN_SH03 = CODE";
		sql += "	), ' ') || CHR(13) ELSE '' END";
		sql += " || NVL(";
		sql += "	PLP_ETC_EX, ' ') AS JLPN_EX";
		sql += ", PLP_JLPN_WORK, PLP_JLPN_TTPN";
		sql += " FROM PT_LABOR_PANJUNG LEFT OUTER JOIN PT_FIR_PANJUNG";
		sql += " ON PFP_EXAM_DT = PLP_EXAM_DT";
		sql += " AND PFP_EXAM_SQ = PLP_EXAM_SQ LEFT OUTER JOIN (SELECT CAST( SUBSTR(CCN_SMALL,1,2) AS INT) AS PACK_CD";
		sql += ", SUBSTR(CCN_SMALL,3,5) AS ITEM_CD, CCN_FULL_NM AS IIM_SNME_NM";
		sql += " FROM CT_COMMON JOIN IT_ITEM";
		sql += " ON IIM_ITEM_CD = SUBSTR(CCN_SMALL,3,5)";
		sql += " WHERE CCN_LARGE = '0423'";
		sql += " AND CCN_LEVEL = '5'";
		sql += " AND CCN_USE_YN = 'Y') C";
		sql += " ON SUBSTR(PLP_JLPN_DSCD,1,1) = C.PACK_CD LEFT OUTER JOIN ET_RSLT_ITEM";
		sql += " ON ERI_EXAM_DT = PLP_EXAM_DT";
		sql += " AND ERI_EXAM_SQ = PLP_EXAM_SQ";
		sql += " AND ERI_ITEM_CD = ITEM_CD LEFT OUTER JOIN PT_SED_PANJUNG";
		sql += " ON PSP_EXAM_DT = PFP_EXAM_DT2";
		sql += " AND PSP_EXAM_SQ = PFP_EXAM_SQ2";
		sql += " WHERE PLP_EXAM_DT = '" + EXAM_DT + "'";
		sql += " AND PLP_EXAM_SQ = '" + EXAM_SQ + "'";
		sql += " AND NVL(PLP_JLPN_PNCD, ' ') <> ' '";

		if(CMB_PANINDEX.equals("5") || CMB_PANINDEX.equals("6")) {
			if(CMB_PANINDEX.equals("5")) {
				sql += " AND PLP_JLPN_PNCD IN ('C', 'D1', 'D2')";
			}
			else if(CMB_PANINDEX.equals("6")) {
				sql += " AND PLP_JLPN_PNCD IN ('D1', 'D2')";
			}
		}
		else if(!CMB_PANTEXT.equals("")) {
			sql += " AND PLP_JLPN_PNCD = '" + CMB_PANTEXT + "'";
		}

		sql += " ORDER BY PLP_JLPN_DSCD";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uHEPOSTMANPRT_up_GetDetailData_002 \n";
			G_INFO += "설명 : 상세판정정보 로딩 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " EXAM_DT : " + EXAM_DT + " \n";
			G_INFO += " EXAM_SQ : " + EXAM_SQ + " \n";
			G_INFO += " CMB_PANINDEX : " + CMB_PANINDEX + " \n";
			G_INFO += " CMB_PANTEXT : " + CMB_PANTEXT + " \n";
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
		<s:AttributeType name='PLP_EXAM_DT' rs:number='1'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='PLP_EXAM_SQ' rs:number='2'>
			<s:datatype dt:type='string' dt:maxLength='6' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='PLP_JLPN_DSCD' rs:number='3'>
			<s:datatype dt:type='string' dt:maxLength='3' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='PLP_JLPN_PNCD' rs:number='4' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='PLP_JLPN_DOCV' rs:number='5' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_RSLT_VL' rs:number='6' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='405'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_RESULTR2_1' rs:number='7' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_RESULTR2_2' rs:number='8' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='JLPN_EX' rs:number='9' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='363'/>
		</s:AttributeType>
		<s:AttributeType name='PLP_JLPN_WORK' rs:number='10' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='PLP_JLPN_TTPN' rs:number='11' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:extends type='rs:rowbase'/>
	</s:ElementType>
</s:Schema>		<rs:data>
<%
		int cnt = 0;
		while(cRsList.next()) {

			cnt++;

			String PLP_EXAM_DT_T = cRsList.getString("PLP_EXAM_DT");
			String PLP_EXAM_SQ_T = cRsList.getString("PLP_EXAM_SQ");
			String PLP_JLPN_DSCD_T = cRsList.getString("PLP_JLPN_DSCD");
			String PLP_JLPN_PNCD_T = cRsList.getString("PLP_JLPN_PNCD");
			String PLP_JLPN_DOCV_T = cRsList.getString("PLP_JLPN_DOCV");
			String ERI_RSLT_VL_T = cRsList.getString("ERI_RSLT_VL");
			String PFP_RESULTR2_1_T = cRsList.getString("PFP_RESULTR2_1");
			String PFP_RESULTR2_2_T = cRsList.getString("PFP_RESULTR2_2");
			String JLPN_EX_T = cRsList.getString("JLPN_EX");
			String PLP_JLPN_WORK_T = cRsList.getString("PLP_JLPN_WORK");
			String PLP_JLPN_TTPN_T = cRsList.getString("PLP_JLPN_TTPN");
%>
			<z:row
<%
			if(! PLP_EXAM_DT_T.equals("")) {
%>
		 		PLP_EXAM_DT='<%= PLP_EXAM_DT_T%>'
<%
			}

			if(! PLP_EXAM_SQ_T.equals("")) {
%>
		 		PLP_EXAM_SQ='<%= PLP_EXAM_SQ_T%>'
<%
			}

			if(! PLP_JLPN_DSCD_T.equals("")) {
%>
		 		PLP_JLPN_DSCD='<%= PLP_JLPN_DSCD_T%>'
<%
			}

			if(! PLP_JLPN_PNCD_T.equals("")) {
%>
		 		PLP_JLPN_PNCD='<%= PLP_JLPN_PNCD_T%>'
<%
			}

			if(! PLP_JLPN_DOCV_T.equals("")) {
%>
		 		PLP_JLPN_DOCV='<%= PLP_JLPN_DOCV_T%>'
<%
			}

			if(! ERI_RSLT_VL_T.equals("")) {
%>
		 		ERI_RSLT_VL='<%= ERI_RSLT_VL_T%>'
<%
			}

			if(! PFP_RESULTR2_1_T.equals("")) {
%>
		 		PFP_RESULTR2_1='<%= PFP_RESULTR2_1_T%>'
<%
			}

			if(! PFP_RESULTR2_2_T.equals("")) {
%>
		 		PFP_RESULTR2_2='<%= PFP_RESULTR2_2_T%>'
<%
			}

			if(! JLPN_EX_T.equals("")) {
%>
		 		JLPN_EX='<%= JLPN_EX_T%>'
<%
			}

			if(! PLP_JLPN_WORK_T.equals("")) {
%>
		 		PLP_JLPN_WORK='<%= PLP_JLPN_WORK_T%>'
<%
			}

			if(! PLP_JLPN_TTPN_T.equals("")) {
%>
		 		PLP_JLPN_TTPN='<%= PLP_JLPN_TTPN_T%>'
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
