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

		String DP_FROMDT = htMethod.get("DP_FROMDT");
		String DP_TODT = htMethod.get("DP_TODT");
		String CBPRINT_KD = htMethod.get("CBPRINT_KD");
		String RZ_EXAM = htMethod.get("RZ_EXAM");
		String COMP_CD = htMethod.get("COMP_CD");
		String EDNAME = htMethod.get("EDNAME");
		String RZ_PLACECD = htMethod.get("RZ_PLACECD");
		String RZ_CHKD = htMethod.get("RZ_CHKD");
		String RZ_DMD = htMethod.get("RZ_DMD");
		String CBFAMY_CD1 = htMethod.get("CBFAMY_CD1");
		String CBFAMY_CD2 = htMethod.get("CBFAMY_CD2");
		String CBDEPT_CD = htMethod.get("CBDEPT_CD");
		String CDDEPT_CD = htMethod.get("CDDEPT_CD");
		String RZCB_ORDER = htMethod.get("RZCB_ORDER");
		String ENCRT_KD = htMethod.get("ENCRT_KD");

		//
		if(DP_FROMDT == null) { DP_FROMDT = ""; }
		if(DP_TODT == null) { DP_TODT = ""; }
		if(CBPRINT_KD == null) { CBPRINT_KD = ""; }
		if(RZ_EXAM == null) { RZ_EXAM = ""; }
		if(COMP_CD == null) { COMP_CD = ""; }
		if(EDNAME == null) { EDNAME = ""; }
		if(RZ_PLACECD == null) { RZ_PLACECD = ""; }
		if(RZ_CHKD == null) { RZ_CHKD = ""; }
		if(RZ_DMD == null) { RZ_DMD = ""; }
		if(CBFAMY_CD1 == null) { CBFAMY_CD1 = ""; }
		if(CBFAMY_CD2 == null) { CBFAMY_CD2 = ""; }
		if(CBDEPT_CD == null) { CBDEPT_CD = ""; }
		if(CDDEPT_CD == null) { CDDEPT_CD = ""; }
		if(RZCB_ORDER == null) { RZCB_ORDER = ""; }
		if(ENCRT_KD == null) { ENCRT_KD = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT REPLACE(REPLACE(SND_LT,'고혈압','고혈압'||'('||NVL(BLOODH, '')||','||NVL(BLOODL, '')||')'),'당뇨' ,'당뇨' ||'('||NVL(GLUSE,'')||''||NVL(GLUSE_SIM,'')||')') AS SEDPLIST, FF.*
FROM(
     SELECT EEA_PSNL_NM,EEA_INSU_NO,SUBSTR(ICR_PENL_ID,1,6)||'-'||SUBSTR(ICR_PENL_ID,7,1 )||'******' ICR_PENL_ID, PFP_RESULTR2_1, PFP_RESULTR2_2,
            EEA_ACPT_TX,PFP_EXAM_DT,F_TEL_FORMAT(EEA_MOBL_NO) EEA_MOBL_NO, PFP_FIR_INFO, PFP_SED_INFO, PFP_EXAM_DT2, PFP_TRANC_DATE,
            F_CODE_FIND('0712', EEA_SEND_CD, '', '1') EEA_SEND_NM, EEA_DEPT_NM, EEA_DIVI_NO,
                              case when NVL(LTRIM(PFP_SEDPLIST), ' ') = ' ' then
                                   case when PFP_RESULTR2_1 = '1' and PFP_RESULTR2_2 = '1' then '고혈압. 당뇨'
                                              when PFP_RESULTR2_1 = '1' then '고혈압.'
                                                    when PFP_RESULTR2_2 = '1' then '당뇨.' end
                                         else LTRIM(PFP_SEDPLIST) end SND_LT, PFP_SEDPLIST,
           (SELECT ERI_RSLT_VL FROM  ET_RSLT_ITEM
             WHERE ERI_EXAM_DT=EEA_EXAM_DT AND ERI_EXAM_SQ=EEA_EXAM_SQ
               AND ERI_ITEM_CD IN('A0014') ) AS BLOODH  ,
           (SELECT ERI_RSLT_VL FROM  ET_RSLT_ITEM
             WHERE ERI_EXAM_DT=EEA_EXAM_DT AND ERI_EXAM_SQ=EEA_EXAM_SQ
               AND ERI_ITEM_CD IN('A0015') ) AS BLOODL  ,
           (SELECT ERI_RSLT_VL FROM  ET_RSLT_ITEM
             WHERE ERI_EXAM_DT=EEA_EXAM_DT AND ERI_EXAM_SQ=EEA_EXAM_SQ
               AND ERI_ITEM_CD IN('BA014') ) AS GLUSE ,
           (SELECT NVL(ERI_RSLT_VL,' ') FROM  ET_RSLT_ITEM
             WHERE ERI_EXAM_DT=EEA_EXAM_DT AND ERI_EXAM_SQ=EEA_EXAM_SQ
               AND ERI_ITEM_CD IN('BA079') ) AS GLUSE_SIM ,
           CASE when EEA_ENTY_CD ='1' then '직장가입자'
                when EEA_ENTY_CD ='2' then '피부양자'
                when EEA_ENTY_CD ='3' then '의료급여' end ENTY_NM,
           EEA_HTSB_CD, EEA_COMP_CD, EEA_HDMD_YN ,EEA_EXAM_DT, EEA_EXAM_SQ
     FROM  PT_FIR_PANJUNG A LEFT OUTER JOIN ET_EXAM_ACPT B ON PFP_EXAM_DT =B.EEA_EXAM_DT AND PFP_EXAM_SQ=B.EEA_EXAM_SQ
                        LEFT OUTER JOIN IT_CUSTOMER  C ON B.EEA_CUST_NO =C.ICR_CUST_NO
     WHERE  0=0
            AND  PFP_EXAM_DT >= :dp_fromdt
            AND  PFP_EXAM_DT <= :dp_todt

if (:cbPrint_Kd = 2) then
begin
  if :rz_Exam = '0' then
            AND case when SUBSTR(EEA_HTSB_CD, 1,2) = '11' then
                     case when (NVL(RTRIM(LTRIM(PFP_SEDPLIST)), ' ') <> ' ' OR PFP_PANRETR2='1') then 'ALL' else ' ' end
                     else 'ALL' end <> ' '
  else if :rz_Exam = '1' then
            AND (NVL(RTRIM(LTRIM(PFP_SEDPLIST)), ' ') <> ' ' OR PFP_PANRETR2 = '1')
end else
            AND (NVL(RTRIM(LTRIM(PFP_SEDPLIST)), ' ') <> ' ' OR PFP_PANRETR2 = '1')

if :COMP_CD <> '' then
            AND EEA_COMP_CD = :COMP_CD

if :EdNAME <> '' then
            AND EEA_PSNL_NM like '%'||:EdNAME||'%'

if :rz_placecd = '1' then
            and EEA_PLCE_CD like '1%'
else if :rz_placecd = '2' then
            and EEA_PLCE_CD like  '2%'

if :rz_Exam = '0' then
            AND EEA_HTSB_CD IN ('11001', '12001', '12003')
else if :rz_Exam = '1' then
            AND EEA_HTSB_CD = '11001'
else if :rz_Exam = '2' then
            AND EEA_HTSB_CD IN ('12001', '12003')

if :rz_chkd = '1' then
            AND NVL(PFP_EXAM_DT2, ' ') <> ' '
else if :rz_chkd = '2' then
            AND NVL(PFP_EXAM_DT2, ' ') = ' '

if :rz_Dmd = '1' then
            AND EEA_HDMD_YN = 'Y'
else if :rz_Dmd = '2' then
            AND EEA_HDMD_YN = 'N'

if (:cbFamy_Cd1 <> '0') then
begin
  if (:cbFamy_Cd2 = '0O') then // 본인이외 전체
            and case when NVL(eea_famy_cd, ' ') = ' ' then '01' else eea_famy_cd end <> '01'
  else
            and case when NVL(eea_famy_cd, ' ') = ' ' then '01' else eea_famy_cd end = :cbFamy_Cd2
end;

if (:cbDept_CD <> '') then
begin
  AND EEA_DEPT_CD = :cdDept_CD
end;

if :RZCB_ORDER = '0' then
  ) FF ORDER BY PFP_EXAM_DT
else if :RZCB_ORDER = '1' then
  ) FF ORDER BY EEA_PSNL_NM
else if :RZCB_ORDER = '2' then
  ) FF ORDER BY ICR_PENL_IDt
		*/

		sql = " SELECT REPLACE(REPLACE(SND_LT,'고혈압','고혈압'||'('||NVL(BLOODH, '')||','||NVL(BLOODL, '')||')'),'당뇨' ,'당뇨' ||'('||NVL(GLUSE,'')||''||NVL(GLUSE_SIM,'')||')') AS SEDPLIST, ";
		sql += " FF.* FROM( ";
		sql += " SELECT EEA_PSNL_NM,EEA_INSU_NO,SUBSTR(ICR_PENL_ID,1,6)||'-'||SUBSTR(ICR_PENL_ID,7,1 )||'******' ICR_PENL_ID, PFP_RESULTR2_1, PFP_RESULTR2_2, ";
		sql += " EEA_ACPT_TX,PFP_EXAM_DT,F_TEL_FORMAT(EEA_MOBL_NO) EEA_MOBL_NO, PFP_FIR_INFO, PFP_SED_INFO, PFP_EXAM_DT2, PFP_TRANC_DATE, ";
		sql += " F_CODE_FIND('0712', EEA_SEND_CD, '', '1') EEA_SEND_NM, EEA_DEPT_NM, EEA_DIVI_NO, EEA_MNGT_HTYR, EEA_CHART_NO, PFP_EXCEL_YN, ";

		if (ENCRT_KD.equals("1")) {
			sql += " C.ICR_PID_EN  as EEA_PSNL_ID2, ";
		} else if (ENCRT_KD.equals("2")) {
			sql += " ECHELONDB.dbo.ecl_decrypt(c.ICR_PID_EN) as EEA_PSNL_ID2, ";
		} else {
			sql += " c.ICR_PENL_ID as EEA_PSNL_ID2, ";
		}

		sql += " CASE WHEN NVL(LTRIM(PFP_SEDPLIST), ' ') = ' ' THEN CASE WHEN PFP_RESULTR2_1 = '1'";
		sql += " AND PFP_RESULTR2_2 = '1' THEN '고혈압. 당뇨' WHEN PFP_RESULTR2_1 = '1' THEN '고혈압.' WHEN PFP_RESULTR2_2 = '1' THEN '당뇨.' END ELSE LTRIM(PFP_SEDPLIST) END SND_LT, PFP_SEDPLIST, (SELECT ERI_RSLT_VL";
		sql += " FROM ET_RSLT_ITEM";
		sql += " WHERE ERI_EXAM_DT=EEA_EXAM_DT";
		sql += " AND ERI_EXAM_SQ=EEA_EXAM_SQ";
		sql += " AND ERI_ITEM_CD IN('A0014') ) AS BLOODH , (SELECT ERI_RSLT_VL";
		sql += " FROM ET_RSLT_ITEM";
		sql += " WHERE ERI_EXAM_DT=EEA_EXAM_DT";
		sql += " AND ERI_EXAM_SQ=EEA_EXAM_SQ";
		sql += " AND ERI_ITEM_CD IN('A0015') ) AS BLOODL , (SELECT ERI_RSLT_VL";
		sql += " FROM ET_RSLT_ITEM";
		sql += " WHERE ERI_EXAM_DT=EEA_EXAM_DT";
		sql += " AND ERI_EXAM_SQ=EEA_EXAM_SQ";
		sql += " AND ERI_ITEM_CD IN('BA014') ) AS GLUSE , (SELECT NVL(ERI_RSLT_VL,' ')";
		sql += " FROM ET_RSLT_ITEM";
		sql += " WHERE ERI_EXAM_DT=EEA_EXAM_DT";
		sql += " AND ERI_EXAM_SQ=EEA_EXAM_SQ";
		sql += " AND ERI_ITEM_CD IN('BA079') ) AS GLUSE_SIM , CASE WHEN EEA_ENTY_CD ='1' THEN '직장가입자' WHEN EEA_ENTY_CD ='2' THEN '피부양자' WHEN EEA_ENTY_CD ='3' THEN '의료급여' END ENTY_NM, EEA_HTSB_CD, EEA_COMP_CD, EEA_HDMD_YN ,EEA_EXAM_DT, EEA_EXAM_SQ";
		sql += " FROM PT_FIR_PANJUNG A LEFT OUTER JOIN ET_EXAM_ACPT B";
		sql += " ON PFP_EXAM_DT =B.EEA_EXAM_DT";
		sql += " AND PFP_EXAM_SQ=B.EEA_EXAM_SQ LEFT OUTER JOIN IT_CUSTOMER C";
		sql += " ON B.EEA_CUST_NO =C.ICR_CUST_NO";
		sql += " WHERE 0=0";
		sql += " AND PFP_EXAM_DT >= '" + DP_FROMDT + "'";
		sql += " AND PFP_EXAM_DT <= '" + DP_TODT + "'";

		if(CBPRINT_KD.equals("2")) {
			if(RZ_EXAM.equals("0")) {
				sql += " AND CASE WHEN SUBSTR(EEA_HTSB_CD, 1,2) = '11' THEN CASE WHEN (NVL(RTRIM(LTRIM(PFP_SEDPLIST)), ' ') <> ' '";
				sql += " OR PFP_PANRETR2='1') THEN 'ALL' ELSE ' ' END ELSE 'ALL' END <> ' '";
			}
			else if(RZ_EXAM.equals("1")) {
				sql += " AND (NVL(RTRIM(LTRIM(PFP_SEDPLIST)), ' ') <> ' '";
				sql += " OR PFP_PANRETR2 = '1')";
			}
		}
		else {
			sql += " AND (NVL(RTRIM(LTRIM(PFP_SEDPLIST)), ' ') <> ' '";
			sql += " OR PFP_PANRETR2 = '1')";
		}

		if(!COMP_CD.equals("")) {
			sql += " AND EEA_COMP_CD = '" + COMP_CD + "'";
		}

		if(!EDNAME.equals("")) {
			sql += " AND EEA_PSNL_NM LIKE '%'||'" + EDNAME + "'||'%'";
		}

		if(RZ_PLACECD.equals("1")) {
			sql += " AND EEA_PLCE_CD LIKE '1%'";
		}
		else if(RZ_PLACECD.equals("2")) {
			sql += " AND EEA_PLCE_CD LIKE '2%'";
		}

		if(RZ_EXAM.equals("0")) {
			sql += " AND EEA_HTSB_CD IN ('11001', '12001', '12003')";
		}
		else if(RZ_EXAM.equals("1")) {
			sql += " AND EEA_HTSB_CD = '11001'";
		}
		else if(RZ_EXAM.equals("2")) {
			sql += " AND EEA_HTSB_CD IN ('12001', '12003')";
		}

		if(RZ_CHKD.equals("1")) {
			sql += " AND NVL(PFP_EXAM_DT2, ' ') <> ' '";
		}
		else if(RZ_CHKD.equals("2")) {
			sql += " AND NVL(PFP_EXAM_DT2, ' ') = ' '";
		}

		if(RZ_DMD.equals("1")) {
			sql += " AND EEA_HDMD_YN = 'Y'";
		}
		else if(RZ_DMD.equals("2")) {
			sql += " AND EEA_HDMD_YN = 'N'";
		}

		if(!CBFAMY_CD1.equals("0")) {
			if(CBFAMY_CD2.equals("00")) {
				sql += " AND CASE WHEN NVL(EEA_FAMY_CD, ' ') = ' ' THEN '01' ELSE EEA_FAMY_CD END <> '01'";
			}
			else {
				sql += " AND CASE WHEN NVL(EEA_FAMY_CD, ' ') = ' ' THEN '01' ELSE EEA_FAMY_CD END = '" + CBFAMY_CD2 + "'";
			}
		}

		if(! CBDEPT_CD.equals("")) {
			sql += " AND EEA_DEPT_CD = '" + CDDEPT_CD + "'";
		}

		if(RZCB_ORDER.equals("0")) {
			sql += " ) FF";
			sql += " ORDER BY PFP_EXAM_DT";
		}
		else if(RZCB_ORDER.equals("1")) {
			sql += " ) FF";
			sql += " ORDER BY EEA_PSNL_NM";
		}
		else if(RZCB_ORDER.equals("2")) {
			sql += " ) FF";
			sql += " ORDER BY ICR_PENL_ID";
		}

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uRT_SedList_Up_afLoadSel_001 \n";
			G_INFO += "설명 : 1차 판정정보및 검진정보 로딩 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " DP_FROMDT : " + DP_FROMDT + " \n";
			G_INFO += " DP_TODT : " + DP_TODT + " \n";
			G_INFO += " CBPRINT_KD : " + CBPRINT_KD + " \n";
			G_INFO += " RZ_EXAM : " + RZ_EXAM + " \n";
			G_INFO += " COMP_CD : " + COMP_CD + " \n";
			G_INFO += " EDNAME : " + EDNAME + " \n";
			G_INFO += " RZ_PLACECD : " + RZ_PLACECD + " \n";
			G_INFO += " RZ_CHKD : " + RZ_CHKD + " \n";
			G_INFO += " RZ_DMD : " + RZ_DMD + " \n";
			G_INFO += " CBFAMY_CD1 : " + CBFAMY_CD1 + " \n";
			G_INFO += " CBFAMY_CD2 : " + CBFAMY_CD2 + " \n";
			G_INFO += " CBDEPT_CD : " + CBDEPT_CD + " \n";
			G_INFO += " CDDEPT_CD : " + CDDEPT_CD + " \n";
			G_INFO += " RZCB_ORDER : " + RZCB_ORDER + " \n";
			G_INFO += " ENCRT_KD : " + ENCRT_KD + " \n";
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
