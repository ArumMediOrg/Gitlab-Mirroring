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

		String DTEDTEXAM_SDT = htMethod.get("DTEDTEXAM_SDT");
		String DTEDTEXAM_EDT = htMethod.get("DTEDTEXAM_EDT");
		String CMBSP_GUBN = htMethod.get("CMBSP_GUBN");
		String G_HOSP_NO = htMethod.get("G_HOSP_NO");
		String CBADD_YN = htMethod.get("CBADD_YN");
		String MSKEDTCOMP_CD1 = htMethod.get("MSKEDTCOMP_CD1");
		String CHKBOXMAIN = htMethod.get("CHKBOXMAIN");
		String MSKEDTCOMP_CD2 = htMethod.get("MSKEDTCOMP_CD2");
		String EDTCUST_NO = htMethod.get("EDTCUST_NO");
		String EDTPSNL_NM = htMethod.get("EDTPSNL_NM");
		String CMBBOXPLCE_CD = htMethod.get("CMBBOXPLCE_CD");
		String RZEDIT3 = htMethod.get("RZEDIT3");
		String CMBBOXSORT = htMethod.get("CMBBOXSORT");

		//
		if(DTEDTEXAM_SDT == null) { DTEDTEXAM_SDT = ""; }
		if(DTEDTEXAM_EDT == null) { DTEDTEXAM_EDT = ""; }
		if(CMBSP_GUBN == null) { CMBSP_GUBN = ""; }
		if(G_HOSP_NO == null) { G_HOSP_NO = ""; }
		if(CBADD_YN == null) { CBADD_YN = ""; }
		if(MSKEDTCOMP_CD1 == null) { MSKEDTCOMP_CD1 = ""; }
		if(CHKBOXMAIN == null) { CHKBOXMAIN = ""; }
		if(MSKEDTCOMP_CD2 == null) { MSKEDTCOMP_CD2 = ""; }
		if(EDTCUST_NO == null) { EDTCUST_NO = ""; }
		if(EDTPSNL_NM == null) { EDTPSNL_NM = ""; }
		if(CMBBOXPLCE_CD == null) { CMBBOXPLCE_CD = ""; }
		if(RZEDIT3 == null) { RZEDIT3 = ""; }
		if(CMBBOXSORT == null) { CMBBOXSORT = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

select a.EEA_EXAM_DT,a.EEA_EXAM_SQ,a.EEA_PSNL_NM,b.ICR_BIRH_DT,a.EEA_PSNL_AGE,c.ICY_COMP_NM,a.EEA_CHART_NO,
       a.EEA_EXAM_CD,a.EEA_ORAL_YN
From ET_EXAM_ACPT A
     inner join IT_CUSTOMER B ON A.EEA_CUST_NO = B.ICR_CUST_NO
     LEFT OUTER JOIN IT_COMPANY C ON A.EEA_COMP_CD = C.ICY_COMP_CD

WHERE 0=0

      AND A.EEA_EXAM_DT >= :DTEdtEXAM_SDT
      AND A.EEA_EXAM_DT <= :DTEdtEXAM_EDT
      AND A.EEA_ORDER_YN <> 'C'

if :CmbSP_GUBN = '10' then
begin
      AND SUBSTR(A.EEA_HTSB_CD, 1, 1) = '1' 
end else if :CmbSP_GUBN <> '00') then
begin
      and ((a.eea_exam_cd like :CmbSP_GUBN||'%'
       or   a.eea_htsb_cd like :CmbSP_GUBN||'%'
       or   a.eea_spsb_cd like :CmbSP_GUBN||'%'
       or   a.eea_emsb_cd like :CmbSP_GUBN||'%'
       or   a.eea_cvsb_cd like :CmbSP_GUBN||'%'
       or   a.eea_etsb_cd like :CmbSP_GUBN||'%')

  if :CmbSP_GUBN = '13' then
       or   a.eea_stoma_cd||a.eea_colon_cd||a.eea_liver_cd||a.eea_bast_cd||a.eea_uter_cd||NVL(a.eea_lung_cd, '0') <> '000000')
  else if :CmbSP_GUBN = '14' then
       or  (a.eea_oral_yn = 'Y' and upper(a.eea_hdmd_yn) = 'Y'))
  else
      )
end;

if (:g_HOSP_NO = '11100761') and (:cbAdd_Yn = '1') then
      AND SUBSTR(A.EEA_EXAM_CD, 1, 2) <> '21'

if :MskEdtCOMP_CD1 <> ' then
begin
   if :ChkBoxMain = '1' then 
   begin
      AND A.EEA_COMP_CD IN :MskEdtCOMP_CD2
   end else
   begin
      AND A.EEA_COMP_CD = :MskEdtCOMP_CD2
   end;
end;

if :EdtCUST_NO <> '' then
   AND A.EEA_CUST_NO = :EdtCUST_NO

if :EdtPSNL_NM <> '' then
   AND A.EEA_PSNL_NM like '%' || :EdtPSNL_NM || '%'

if  :CmbBoxPLCE_CD <> '0' then
   AND SUBSTR(A.EEA_PLCE_CD,1,1) = :CmbBoxPLCE_CD

if  :RzEdit3 <> '' then
   AND A.EEA_CHART_NO = :RzEdit3

if :cbAdd_Yn = '1' then
begin
   and (INSTR(A.EEA_EXAM_LT, 'I81') > 0 OR INSTR(A.EEA_EXAM_LT, 'I87') > 0)
end;


if (:CmbBoxSort = '1') then
  ORDER BY A.EEA_PSNL_NM
else if (:CmbBoxSort = '2') then
  ORDER BY A.EEA_DEPT_NM
else if (CmbBoxSort = '3') then
  ORDER BY A.EEA_DIVI_NO
else if (CmbBoxSort = '4') then
  ORDER BY A.EEA_CHART_NO
else if (CmbBoxSort = '5') then
  ORDER BY A.EEA_COMP_CD, A.EEA_PSNL_NM
else if (CmbBoxSort = '6') then
  ORDER BY A.EEA_COMP_CD, A.EEA_DEPT_NM, A.EEA_PSNL_NM
else
  ORDER BY A.EEA_EXAM_DT, A.EEA_EXAM_SQ

		*/

		sql = " SELECT A.EEA_EXAM_DT,A.EEA_EXAM_SQ,A.EEA_PSNL_NM,B.ICR_BIRH_DT,A.EEA_PSNL_AGE,C.ICY_COMP_NM,A.EEA_CHART_NO, A.EEA_EXAM_CD,A.EEA_ORAL_YN";
		sql += " FROM ET_EXAM_ACPT A INNER JOIN IT_CUSTOMER B";
		sql += " ON A.EEA_CUST_NO = B.ICR_CUST_NO LEFT OUTER JOIN IT_COMPANY C";
		sql += " ON A.EEA_COMP_CD = C.ICY_COMP_CD";
		sql += " WHERE 0=0";
		sql += " AND A.EEA_EXAM_DT >= '" + DTEDTEXAM_SDT + "'";
		sql += " AND A.EEA_EXAM_DT <= '" + DTEDTEXAM_EDT + "'";
		sql += " AND A.EEA_ORDER_YN <> 'C'";

		if(CMBSP_GUBN.equals("10")) {
			sql += " AND SUBSTR(A.EEA_HTSB_CD, 1, 1) = '1'";
		}
		else if(!CMBSP_GUBN.equals("00")) {
			sql += " AND ((A.EEA_EXAM_CD LIKE '" + CMBSP_GUBN + "%'";
			sql += " OR A.EEA_HTSB_CD LIKE '" + CMBSP_GUBN + "%'";
			sql += " OR A.EEA_SPSB_CD LIKE '" + CMBSP_GUBN + "%'";
			sql += " OR A.EEA_EMSB_CD LIKE '" + CMBSP_GUBN + "%'";
			sql += " OR A.EEA_CVSB_CD LIKE '" + CMBSP_GUBN + "%'";
			sql += " OR A.EEA_ETSB_CD LIKE '" + CMBSP_GUBN + "%')";
		
			if(CMBSP_GUBN.equals("13")) {
				sql += " OR A.EEA_STOMA_CD||A.EEA_COLON_CD||A.EEA_LIVER_CD||A.EEA_BAST_CD||A.EEA_UTER_CD||NVL(A.EEA_LUNG_CD, '0') <> '000000'";
			}
			else if(CMBSP_GUBN.equals("14")) {
				sql += " OR (A.EEA_ORAL_YN = 'Y' AND UPPER(A.EEA_HDMD_YN) = 'Y')";
			} else {
				sql += " )";
			}
		}


		if(G_HOSP_NO.equals("11100761") && CBADD_YN.equals("1")) {
			sql += " AND SUBSTR(A.EEA_EXAM_CD, 1, 2) <> '21'";
		}
		
		if(!MSKEDTCOMP_CD1.equals("")) {
			if(CHKBOXMAIN.equals("1")) {
				sql += " AND A.EEA_COMP_CD IN '" + MSKEDTCOMP_CD2 + "'";
			}
			else {
				sql += " AND A.EEA_COMP_CD = '" + MSKEDTCOMP_CD2 + "'";
			}
		}


		if(!EDTCUST_NO.equals("")) {
			sql += " AND A.EEA_CUST_NO = '" + EDTCUST_NO + "'";
		}
		
		if(!EDTPSNL_NM.equals("")) {
			sql += " AND A.EEA_PSNL_NM LIKE '%" + EDTPSNL_NM + "%'";
		}
		
		if(!CMBBOXPLCE_CD.equals("0")) {
			sql += " AND SUBSTR(A.EEA_PLCE_CD,1,1) = '" + CMBBOXPLCE_CD + "'";
		}
		
		if(!RZEDIT3.equals("")) {
			sql += " AND A.EEA_CHART_NO = '" + RZEDIT3 + "'";
		}
		
		if(CBADD_YN.equals("1")) {
			sql += " AND (INSTR(A.EEA_EXAM_LT, 'I81') > 0";
			sql += " OR INSTR(A.EEA_EXAM_LT, 'I87') > 0)";
		}


		if(CMBBOXSORT.equals("1")) {
			sql += " ORDER BY A.EEA_PSNL_NM";
		}
		else if(CMBBOXSORT.equals("2")) {
			sql += " ORDER BY A.EEA_DEPT_NM";
		}
		else if(CMBBOXSORT.equals("3")) {
			sql += " ORDER BY A.EEA_DIVI_NO";
		}
		else if(CMBBOXSORT.equals("4")) {
			sql += " ORDER BY A.EEA_CHART_NO";
		}
		else if(CMBBOXSORT.equals("5")) {
			sql += " ORDER BY A.EEA_COMP_CD, A.EEA_PSNL_NM";
		}
		else if(CMBBOXSORT.equals("6")) {
			sql += " ORDER BY A.EEA_COMP_CD, A.EEA_DEPT_NM, A.EEA_PSNL_NM";
		}
		else {
			sql += " ORDER BY A.EEA_EXAM_DT, A.EEA_EXAM_SQ";
		}

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uTOTPERReport_UF_SqlSet_001 \n";
			G_INFO += "설명 : 고객정보및 접수정보 로딩 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " DTEDTEXAM_SDT : " + DTEDTEXAM_SDT + " \n";
			G_INFO += " DTEDTEXAM_EDT : " + DTEDTEXAM_EDT + " \n";
			G_INFO += " CMBSP_GUBN : " + CMBSP_GUBN + " \n";
			G_INFO += " G_HOSP_NO : " + G_HOSP_NO + " \n";
			G_INFO += " CBADD_YN : " + CBADD_YN + " \n";
			G_INFO += " MSKEDTCOMP_CD1 : " + MSKEDTCOMP_CD1 + " \n";
			G_INFO += " CHKBOXMAIN : " + CHKBOXMAIN + " \n";
			G_INFO += " MSKEDTCOMP_CD2 : " + MSKEDTCOMP_CD2 + " \n";
			G_INFO += " EDTCUST_NO : " + EDTCUST_NO + " \n";
			G_INFO += " EDTPSNL_NM : " + EDTPSNL_NM + " \n";
			G_INFO += " CMBBOXPLCE_CD : " + CMBBOXPLCE_CD + " \n";
			G_INFO += " RZEDIT3 : " + RZEDIT3 + " \n";
			G_INFO += " CMBBOXSORT : " + CMBBOXSORT + " \n";
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
		<s:AttributeType name='EEA_EXAM_DT' rs:number='1' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_EXAM_DT'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_EXAM_SQ' rs:number='2' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_EXAM_SQ'>
			<s:datatype dt:type='string' dt:maxLength='6' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_PSNL_NM' rs:number='3' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_PSNL_NM'>
			<s:datatype dt:type='string' dt:maxLength='100' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_BIRH_DT' rs:number='4' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_BIRH_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_PSNL_AGE' rs:number='5' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_PSNL_AGE'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='38' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_COMP_NM' rs:number='6' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMPANY'
			 rs:basecolumn='ICY_COMP_NM'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_CHART_NO' rs:number='7' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_CHART_NO'>
			<s:datatype dt:type='string' dt:maxLength='30'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_EXAM_CD' rs:number='8' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_EXAM_CD'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_ORAL_YN' rs:number='9' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_ORAL_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='10' rs:rowid='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c10' rs:name='ROWID' rs:number='11' rs:rowid='true' rs:basetable='IT_CUSTOMER' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c11' rs:name='ROWID' rs:number='12' rs:rowid='true' rs:basetable='IT_COMPANY' rs:basecolumn='ROWID'
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

			String EEA_EXAM_DT_T = cRsList.getString("EEA_EXAM_DT");
			String EEA_EXAM_SQ_T = cRsList.getString("EEA_EXAM_SQ");
			String EEA_PSNL_NM_T = cRsList.getString("EEA_PSNL_NM");
			String ICR_BIRH_DT_T = cRsList.getString("ICR_BIRH_DT");
			String EEA_PSNL_AGE_T = cRsList.getString("EEA_PSNL_AGE");
			String ICY_COMP_NM_T = cRsList.getString("ICY_COMP_NM");
			String EEA_CHART_NO_T = cRsList.getString("EEA_CHART_NO");
			String EEA_EXAM_CD_T = cRsList.getString("EEA_EXAM_CD");
			String EEA_ORAL_YN_T = cRsList.getString("EEA_ORAL_YN");
			String ROWID_T = cRsList.getString("ROWID");
			String c10_T = cRsList.getString("c10");
			String c11_T = cRsList.getString("c11");
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

			if(! EEA_PSNL_NM_T.equals("")) {
%>
		 		EEA_PSNL_NM='<%= EEA_PSNL_NM_T%>'
<%
			}

			if(! ICR_BIRH_DT_T.equals("")) {
%>
		 		ICR_BIRH_DT='<%= ICR_BIRH_DT_T%>'
<%
			}

			if(! EEA_PSNL_AGE_T.equals("")) {
%>
		 		EEA_PSNL_AGE='<%= EEA_PSNL_AGE_T%>'
<%
			}

			if(! ICY_COMP_NM_T.equals("")) {
%>
		 		ICY_COMP_NM='<%= ICY_COMP_NM_T%>'
<%
			}

			if(! EEA_CHART_NO_T.equals("")) {
%>
		 		EEA_CHART_NO='<%= EEA_CHART_NO_T%>'
<%
			}

			if(! EEA_EXAM_CD_T.equals("")) {
%>
		 		EEA_EXAM_CD='<%= EEA_EXAM_CD_T%>'
<%
			}

			if(! EEA_ORAL_YN_T.equals("")) {
%>
		 		EEA_ORAL_YN='<%= EEA_ORAL_YN_T%>'
<%
			}
%>
				ROWID='<%= cnt%>'
				c10='<%= cnt%>'
				c11='<%= cnt%>'
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
