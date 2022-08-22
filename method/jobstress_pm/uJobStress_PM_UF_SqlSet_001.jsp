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

		String DTEDTEXAM_SDT = htMethod.get("DTEDTEXAM_SDT");
		String DTEDTEXAM_EDT = htMethod.get("DTEDTEXAM_EDT");
		String MSKEDTCOMP_CD1 = htMethod.get("MSKEDTCOMP_CD1");
		String CHKBOXMAIN = htMethod.get("CHKBOXMAIN");
		String MSKEDTCOMP_CD2 = htMethod.get("MSKEDTCOMP_CD2");
		String RZCMBBOXPANJ = htMethod.get("RZCMBBOXPANJ");
		String EDTCUST_NO = htMethod.get("EDTCUST_NO");
		String EDTCHART_NO = htMethod.get("EDTCHART_NO");
		String EDTPSNL_NM = htMethod.get("EDTPSNL_NM");
		String CMBBOXPLCE_CD = htMethod.get("CMBBOXPLCE_CD");
		String CMBFAMYCD = htMethod.get("CMBFAMYCD");
		String CMBBOXSORT = htMethod.get("CMBBOXSORT");

		//
		if(DTEDTEXAM_SDT == null) { DTEDTEXAM_SDT = ""; }
		if(DTEDTEXAM_EDT == null) { DTEDTEXAM_EDT = ""; }
		if(MSKEDTCOMP_CD1 == null) { MSKEDTCOMP_CD1 = ""; }
		if(CHKBOXMAIN == null) { CHKBOXMAIN = ""; }
		if(MSKEDTCOMP_CD2 == null) { MSKEDTCOMP_CD2 = ""; }
		if(RZCMBBOXPANJ == null) { RZCMBBOXPANJ = ""; }
		if(EDTCUST_NO == null) { EDTCUST_NO = ""; }
		if(EDTCHART_NO == null) { EDTCHART_NO = ""; }
		if(EDTPSNL_NM == null) { EDTPSNL_NM = ""; }
		if(CMBBOXPLCE_CD == null) { CMBBOXPLCE_CD = ""; }
		if(CMBFAMYCD == null) { CMBFAMYCD = ""; }
		if(CMBBOXSORT == null) { CMBBOXSORT = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT A.EEA_EXAM_DT, A.EEA_EXAM_SQ, ICY_COMP_CD, ICY_COMP_NM, A.EEA_CUST_NO, A.EEA_PSNL_NM, A.EEA_CHART_NO, A.EEA_DEPT_NM, A.EEA_PSNL_AGE,
      CASE WHEN A.EEA_SEX_CD  IS NULL OR A.EEA_SEX_CD  = '' THEN A.EEA_SEX_CD  ELSE GetCOMMON_LvCdToNm('0411',A.EEA_SEX_CD,'5',1) END ICR_SEX_NM,
      SUBSTR(B.ICR_PENL_ID,1,6) ICR_BIRH_DT,
      CASE WHEN A.EEA_COMP_CD IS NULL OR A.EEA_COMP_CD  = '' THEN ''  ELSE '[' || A.EEA_COMP_CD || ']' || C.ICY_COMP_NM  END EEA_COMP_NM,
      D.*
FROM ET_EXAM_ACPT A INNER JOIN IT_CUSTOMER     B ON A.EEA_CUST_NO = B.ICR_CUST_NO
                    INNER JOIN ET_JOBSTRESS    D ON A.EEA_EXAM_DT = D.EJS_EXAM_DT AND A.EEA_EXAM_SQ = D.EJS_EXAM_SQ
                    LEFT OUTER JOIN IT_COMPANY C ON A.EEA_COMP_CD = C.ICY_COMP_CD
WHERE A.EEA_EXAM_DT >= :DTEdtEXAM_SDT
  AND A.EEA_EXAM_DT <= :DTEdtEXAM_EDT
  AND A.EEA_ORDER_YN <> 'C'

if :MskEdtCOMP_CD1 <> '' then
begin
  if :ChkBoxMain = '1' then
    AND A.EEA_COMP_CD IN :MskEdtCOMP_CD2
  else
    AND A.EEA_COMP_CD = :MskEdtCOMP_CD2
end;

if :RzCmbBoxPANJ = '1' then
    AND D.EJS_PANJ_YN = 'Y'
else
    AND D.EJS_PANJ_YN = 'N';

if :EdtCUST_NO <> '' then
    AND A.EEA_COMP_CD = :EdtCUST_NO

if :EdtChart_No <> '' then
    AND A.EEA_CHART_NO = :EdtChart_No

if :EdtPSNL_NM <> '' then
    AND A.EEA_PSNL_NM like '%' || :EdtPSNL_NM || '%'

if  :CmbBoxPLCE_CD <> '0' then
    AND SUBSTR(A.EEA_PLCE_CD,1,1) = :CmbBoxPLCE_CD

if :cmbFamyCd <> '00' then
    AND A.EEA_FAMY_CD = :cmbFamyCd

if :CmbBoxSort = '0' then
  ORDER BY A.EEA_EXAM_DT, C.ICY_COMP_NM, A.EEA_PSNL_NM
else if :CmbBoxSort = '1' then
  ORDER BY C.ICY_COMP_NM, A.EEA_EXAM_DT, A.EEA_PSNL_NM
else if :CmbBoxSort = '2' then
  ORDER BY C.ICY_COMP_NM, A.EEA_DEPT_NM, A.EEA_PSNL_NM
else if :CmbBoxSort = '3' then
  ORDER BY C.ICY_COMP_NM, A.EEA_PSNL_NM
else if :CmbBoxSort = '4' then
  ORDER BY A.EEA_PSNL_NM

		*/

		sql = " SELECT A.EEA_EXAM_DT, A.EEA_EXAM_SQ, ICY_COMP_CD, ICY_COMP_NM, A.EEA_CUST_NO, A.EEA_PSNL_NM, A.EEA_CHART_NO, A.EEA_DEPT_NM, A.EEA_PSNL_AGE";
		sql += ", CASE WHEN A.EEA_SEX_CD IS NULL OR A.EEA_SEX_CD = '' THEN A.EEA_SEX_CD ELSE GETCOMMON_LVCDTONM('0411',A.EEA_SEX_CD,'5',1) END ICR_SEX_NM";
		sql += ", SUBSTR(B.ICR_PENL_ID,1,6) ICR_BIRH_DT";
		sql += ", CASE WHEN A.EEA_COMP_CD IS NULL OR A.EEA_COMP_CD = '' THEN '' ELSE '[' || A.EEA_COMP_CD || ']' || C.ICY_COMP_NM END EEA_COMP_NM";
		sql += ", D.*";
		sql += " FROM ET_EXAM_ACPT A INNER JOIN IT_CUSTOMER B";
		sql += " ON A.EEA_CUST_NO = B.ICR_CUST_NO INNER JOIN ET_JOBSTRESS D";
		sql += " ON A.EEA_EXAM_DT = D.EJS_EXAM_DT";
		sql += " AND A.EEA_EXAM_SQ = D.EJS_EXAM_SQ LEFT OUTER JOIN IT_COMPANY C";
		sql += " ON A.EEA_COMP_CD = C.ICY_COMP_CD";
		sql += " WHERE A.EEA_EXAM_DT >= '" + DTEDTEXAM_SDT + "'";
		sql += " AND A.EEA_EXAM_DT <= '" + DTEDTEXAM_EDT + "'";
		sql += " AND A.EEA_ORDER_YN <> 'C'";

		if(!MSKEDTCOMP_CD1.equals("")) {
			if(CHKBOXMAIN.equals("1")) {
				sql += " AND A.EEA_COMP_CD IN '" + MSKEDTCOMP_CD2 + "'";
			}
			else {
				sql += " AND A.EEA_COMP_CD = '" + MSKEDTCOMP_CD2 + "'";
			}
		}

		if(RZCMBBOXPANJ.equals("1")) {
			sql += " AND D.EJS_PANJ_YN = 'Y'";
		}
		else {
			sql += " AND D.EJS_PANJ_YN = 'N'";
		}


		if(!EDTCUST_NO.equals("")) {
			sql += " AND A.EEA_COMP_CD = '" + EDTCUST_NO + "'";
		}

		if(!EDTCHART_NO.equals("")) {
			sql += " AND A.EEA_CHART_NO = '" + EDTCHART_NO + "'";
		}

		if(!EDTPSNL_NM.equals("")) {
			sql += " AND A.EEA_PSNL_NM LIKE '%" + EDTPSNL_NM + "%'";
		}

		if(!CMBBOXPLCE_CD.equals("00")) {
			sql += " AND A.EEA_PLCE_CD = '" + CMBBOXPLCE_CD + "'";
		}

		if(!CMBFAMYCD.equals("00")) {
			sql += " AND A.EEA_FAMY_CD = '" + CMBFAMYCD + "'";
		}


		if(CMBBOXSORT.equals("0")) {
			sql += " ORDER BY A.EEA_EXAM_DT, C.ICY_COMP_NM, A.EEA_PSNL_NM";
		}
		else if(CMBBOXSORT.equals("1")) {
			sql += " ORDER BY C.ICY_COMP_NM, A.EEA_EXAM_DT, A.EEA_PSNL_NM";
		}
		else if(CMBBOXSORT.equals("2")) {
			sql += " ORDER BY C.ICY_COMP_NM, A.EEA_DEPT_NM, A.EEA_PSNL_NM";
		}
		else if(CMBBOXSORT.equals("3")) {
			sql += " ORDER BY C.ICY_COMP_NM, A.EEA_PSNL_NM";
		}
		else if(CMBBOXSORT.equals("4")) {
			sql += " ORDER BY A.EEA_PSNL_NM";
		}

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uJobStress_PM_UF_SqlSet_001 \n";
			G_INFO += "설명 : 직무스트레스 검사결과정보 로딩 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " DTEDTEXAM_SDT : " + DTEDTEXAM_SDT + " \n";
			G_INFO += " DTEDTEXAM_EDT : " + DTEDTEXAM_EDT + " \n";
			G_INFO += " MSKEDTCOMP_CD1 : " + MSKEDTCOMP_CD1 + " \n";
			G_INFO += " CHKBOXMAIN : " + CHKBOXMAIN + " \n";
			G_INFO += " MSKEDTCOMP_CD2 : " + MSKEDTCOMP_CD2 + " \n";
			G_INFO += " RZCMBBOXPANJ : " + RZCMBBOXPANJ + " \n";
			G_INFO += " EDTCUST_NO : " + EDTCUST_NO + " \n";
			G_INFO += " EDTCHART_NO : " + EDTCHART_NO + " \n";
			G_INFO += " EDTPSNL_NM : " + EDTPSNL_NM + " \n";
			G_INFO += " CMBBOXPLCE_CD : " + CMBBOXPLCE_CD + " \n";
			G_INFO += " CMBFAMYCD : " + CMBFAMYCD + " \n";
			G_INFO += " CMBBOXSORT : " + CMBBOXSORT + " \n";
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
