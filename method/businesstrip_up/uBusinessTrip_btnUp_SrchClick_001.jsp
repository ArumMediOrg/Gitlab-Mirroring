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

		String MOBL_NO = htMethod.get("MOBL_NO");
		String TEL_NO = htMethod.get("TEL_NO");
		String SEX_CD = htMethod.get("SEX_CD");
		String EXAM_CD = htMethod.get("EXAM_CD");
		String DIVI_CD = htMethod.get("DIVI_CD");
		String DIVI_CS = htMethod.get("DIVI_CS");
		String COMP_CD = htMethod.get("COMP_CD");
		String HTSB_YN = htMethod.get("HTSB_YN");
		String HTSB_CD = htMethod.get("HTSB_CD");
		String STOMA_CD = htMethod.get("STOMA_CD");
		String COLON_CD = htMethod.get("COLON_CD");
		String LIVER_CD = htMethod.get("LIVER_CD");
		String BAST_CD = htMethod.get("BAST_CD");
		String UTER_CD = htMethod.get("UTER_CD");
		String LUNG_CD = htMethod.get("LUNG_CD");
		String ORAL_YN = htMethod.get("ORAL_YN");
		String HDMD_YN = htMethod.get("HDMD_YN");
		String SPSB_YN = htMethod.get("SPSB_YN");
		String CVSB_YN = htMethod.get("CVSB_YN");
		String EMSB_YN = htMethod.get("EMSB_YN");
		String ETSB_YN = htMethod.get("ETSB_YN");

		//
		if(MOBL_NO == null) { MOBL_NO = ""; }
		if(TEL_NO == null) { TEL_NO = ""; }
		if(SEX_CD == null) { SEX_CD = ""; }
		if(EXAM_CD == null) { EXAM_CD = ""; }
		if(DIVI_CD == null) { DIVI_CD = ""; }
		if(DIVI_CS == null) { DIVI_CS = ""; }
		if(COMP_CD == null) { COMP_CD = ""; }
		if(HTSB_YN == null) { HTSB_YN = ""; }
		if(HTSB_CD == null) { HTSB_CD = ""; }
		if(STOMA_CD == null) { STOMA_CD = ""; }
		if(COLON_CD == null) { COLON_CD = ""; }
		if(LIVER_CD == null) { LIVER_CD = ""; }
		if(BAST_CD == null) { BAST_CD = ""; }
		if(UTER_CD == null) { UTER_CD = ""; }
		if(LUNG_CD == null) { LUNG_CD = ""; }
		if(ORAL_YN == null) { ORAL_YN = ""; }
		if(HDMD_YN == null) { HDMD_YN = ""; }
		if(SPSB_YN == null) { SPSB_YN = ""; }
		if(CVSB_YN == null) { CVSB_YN = ""; }
		if(EMSB_YN == null) { EMSB_YN = ""; }
		if(ETSB_YN == null) { ETSB_YN = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

select f_tel_format(:mobl_no) eea_mobl_no,
       f_tel_format(:tel_no) eea_tel_no,
       case when (:sex_cd) = '1' then '남' else '여' end as eea_sex_nm,
       f_code_find('0401', :exam_cd, '', '1') ||
       case when :exam_cd = '31001' then
            case when :divi_cd = '1' then '-초-' || :divi_cs
                 when :divi_cd = '2' then '-중'
                 when :divi_cd = '3' then '-고' end else '' end as eea_exam_nm, 
       F_COMP_FIND(:comp_cd) eea_comp_nm,
       case when upper(:htsb_yn) = 'Y' then
            case when SUBSTR(:htsb_cd, 1, 2) = '11' then
                 case when SUBSTR(:htsb_cd, 5, 1) = '1' then '일검'
                      when SUBSTR(:htsb_cd, 5, 1) = '3' then '일검'
                      else '일검2' end
                 when SUBSTR(:htsb_cd, 1, 2) = '12' then
                 case when SUBSTR(:htsb_cd, 5, 1) = '1' then '생애'
                      when SUBSTR(:htsb_cd, 5, 1) = '3' then '생애'
                      else '생애2' end
                 when SUBSTR(:htsb_cd, 1, 2) = '13' then '암'
                 when SUBSTR(:htsb_cd, 1, 2) = '14' then '구강' end else '' end as eea_htsb_ox,
       :stoma_cd || 
       :colon_cd || 
       :liver_cd || 
       :bast_cd  || 
       :uter_cd  || 
       NVL(:lung_cd, '0') eea_can_cd,
       case when NVL(:stoma_cd, ' ') = ' ' or NVL(:stoma_cd, '0') = '0' then ''
            else '위' end eea_stoma_ct,
       case when NVL(:colon_cd, ' ') = ' ' or NVL(:colon_cd, '0') = '0' then ''
            else '대' end eea_colon_ct,
       case when NVL(:liver_cd, ' ') = ' ' or NVL(:liver_cd, '0') = '0' then ''
            else '간' end eea_liver_ct,
       case when NVL(:bast_cd,  ' ') = ' ' or NVL(:bast_cd,  '0') = '0' then ''
            else '유' end eea_bast_ct,
       case when NVL(:uter_cd,  ' ') = ' ' or NVL(:uter_cd,  '0') = '0' then ''
            else '자' end eea_uter_ct,
       case when NVL(:lung_cd,  ' ') = ' ' or NVL(:lung_cd,  '0') = '0' then ''
            else '폐' end eea_lung_ct,
       case when upper(:oral_yn) = 'Y' and upper(:hdmd_yn) = 'Y' then '구강'
            when       :oral_yn  = '1' then '구강' 
            when       :oral_yn  = '3' then '구강' else '' end as eea_oral_ox,
       case when upper(:spsb_yn) = 'Y' then '특검' else '' end as eea_spsb_ox,
       case when upper(:cvsb_yn) = 'Y' then '뇌심' else '' end as eea_cvsb_ox,
       case when upper(:emsb_yn) = 'Y' then '채용' else '' end as eea_emsb_ox,
       case when upper(:etsb_yn) = 'Y' then '기타' else '' end as eea_etsb_ox
from dual

		*/

		sql = " SELECT F_TEL_FORMAT('" + MOBL_NO + "') EEA_MOBL_NO, F_TEL_FORMAT('" + TEL_NO + "') EEA_TEL_NO";
		sql += ", CASE WHEN ('" + SEX_CD + "') = '1' THEN '남' ELSE '여' END AS EEA_SEX_NM";

		sql += ", F_CODE_FIND('0401', '" + EXAM_CD + "', '', '1')";
		sql += "	|| CASE WHEN '" + EXAM_CD + "' = '31001' THEN";
		sql += "		CASE WHEN '" + DIVI_CD + "' = '1' THEN '-초-' || '" + DIVI_CS + "'";
		sql += "		WHEN '" + DIVI_CD + "' = '2' THEN '-중'";
		sql += "		WHEN '" + DIVI_CD + "' = '3' THEN '-고'";
		sql += "		END";
		sql += "	ELSE '' END AS EEA_EXAM_NM";

		sql += ", F_COMP_FIND('" + COMP_CD + "') EEA_COMP_NM";

		sql += ", CASE WHEN UPPER('" + HTSB_YN + "') = 'Y' THEN";
		sql += "	CASE WHEN SUBSTR('" + HTSB_CD + "', 1, 2) = '11' THEN";
		sql += "		CASE WHEN SUBSTR('" + HTSB_CD + "', 5, 1) = '1' THEN '일검'";
		sql += "		WHEN SUBSTR('" + HTSB_CD + "', 5, 1) = '3' THEN '일검'";
		sql += "		ELSE '일검2' END";
		sql += "	WHEN SUBSTR('" + HTSB_CD + "', 1, 2) = '12' THEN";
		sql += "		CASE WHEN SUBSTR('" + HTSB_CD + "', 5, 1) = '1' THEN '생애'";
		sql += "		WHEN SUBSTR('" + HTSB_CD + "', 5, 1) = '3' THEN '생애'";
		sql += "		ELSE '생애2' END";
		sql += "	WHEN SUBSTR('" + HTSB_CD + "', 1, 2) = '13' THEN '암'";
		sql += "	WHEN SUBSTR('" + HTSB_CD + "', 1, 2) = '14' THEN '구강'";
		sql += "	END";
		sql += "  ELSE '' END AS EEA_HTSB_OX";
		
		sql += ", '" + STOMA_CD + "' || '" + COLON_CD + "' || '" + LIVER_CD + "' || '" + BAST_CD + "' || '" + UTER_CD + "' || NVL('" + LUNG_CD + "', '0') EEA_CAN_CD";
		
		sql += ", CASE WHEN NVL('" + STOMA_CD + "', ' ') = ' ' OR NVL('" + STOMA_CD + "', '0') = '0' THEN '' ELSE '위' END EEA_STOMA_CT";
		sql += ", CASE WHEN NVL('" + COLON_CD + "', ' ') = ' ' OR NVL('" + COLON_CD + "', '0') = '0' THEN '' ELSE '대' END EEA_COLON_CT";
		sql += ", CASE WHEN NVL('" + LIVER_CD + "', ' ') = ' ' OR NVL('" + LIVER_CD + "', '0') = '0' THEN '' ELSE '간' END EEA_LIVER_CT";
		sql += ", CASE WHEN NVL('" + BAST_CD + "', ' ') = ' ' OR NVL('" + BAST_CD + "', '0') = '0' THEN '' ELSE '유' END EEA_BAST_CT";
		sql += ", CASE WHEN NVL('" + UTER_CD + "', ' ') = ' ' OR NVL('" + UTER_CD + "', '0') = '0' THEN '' ELSE '자' END EEA_UTER_CT";
		sql += ", CASE WHEN NVL('" + LUNG_CD + "', ' ') = ' ' OR NVL('" + LUNG_CD + "', '0') = '0' THEN '' ELSE '폐' END EEA_LUNG_CT";
		sql += ", CASE WHEN UPPER('" + ORAL_YN + "') = 'Y' AND UPPER('" + HDMD_YN + "') = 'Y' THEN '구강' WHEN '" + ORAL_YN + "' = '1' THEN '구강' WHEN '" + ORAL_YN + "' = '3' THEN '구강' ELSE '' END AS EEA_ORAL_OX";
		sql += ", CASE WHEN UPPER('" + SPSB_YN + "') = 'Y' THEN '특검' ELSE '' END AS EEA_SPSB_OX";
		sql += ", CASE WHEN UPPER('" + CVSB_YN + "') = 'Y' THEN '뇌심' ELSE '' END AS EEA_CVSB_OX";
		sql += ", CASE WHEN UPPER('" + EMSB_YN + "') = 'Y' THEN '채용' ELSE '' END AS EEA_EMSB_OX";
		sql += ", CASE WHEN UPPER('" + ETSB_YN + "') = 'Y' THEN '기타' ELSE '' END AS EEA_ETSB_OX";
		sql += " FROM DUAL";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uBusinessTrip_btnUp_SrchClick_001 \n";
			G_INFO += "설명 : 출장접수정보 로딩 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " MOBL_NO : " + MOBL_NO + " \n";
			G_INFO += " TEL_NO : " + TEL_NO + " \n";
			G_INFO += " SEX_CD : " + SEX_CD + " \n";
			G_INFO += " EXAM_CD : " + EXAM_CD + " \n";
			G_INFO += " DIVI_CD : " + DIVI_CD + " \n";
			G_INFO += " DIVI_CS : " + DIVI_CS + " \n";
			G_INFO += " COMP_CD : " + COMP_CD + " \n";
			G_INFO += " HTSB_YN : " + HTSB_YN + " \n";
			G_INFO += " HTSB_CD : " + HTSB_CD + " \n";
			G_INFO += " STOMA_CD : " + STOMA_CD + " \n";
			G_INFO += " COLON_CD : " + COLON_CD + " \n";
			G_INFO += " LIVER_CD : " + LIVER_CD + " \n";
			G_INFO += " BAST_CD : " + BAST_CD + " \n";
			G_INFO += " UTER_CD : " + UTER_CD + " \n";
			G_INFO += " LUNG_CD : " + LUNG_CD + " \n";
			G_INFO += " ORAL_YN : " + ORAL_YN + " \n";
			G_INFO += " HDMD_YN : " + HDMD_YN + " \n";
			G_INFO += " SPSB_YN : " + SPSB_YN + " \n";
			G_INFO += " CVSB_YN : " + CVSB_YN + " \n";
			G_INFO += " EMSB_YN : " + EMSB_YN + " \n";
			G_INFO += " ETSB_YN : " + ETSB_YN + " \n";
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
		<s:AttributeType name='EEA_MOBL_NO' rs:number='1' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_TEL_NO' rs:number='2' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SEX_NM' rs:number='3' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='2' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_EXAM_NM' rs:number='4' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_COMP_NM' rs:number='5' rs:nullable='true' rs:writeunknown='true' rs:basetable='DUAL'
			 rs:basecolumn='EEA_STOMA_CT'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_HTSB_OX' rs:number='6' rs:nullable='true' rs:writeunknown='true' rs:basetable='DUAL'
			 rs:basecolumn='EEA_COLON_CT'>
			<s:datatype dt:type='string' dt:maxLength='5'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_CAN_CD' rs:number='7' rs:nullable='true' rs:writeunknown='true' rs:basetable='DUAL'
			 rs:basecolumn='EEA_LIVER_CT'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_STOMA_CT' rs:number='8' rs:nullable='true' rs:writeunknown='true' rs:basetable='DUAL'
			 rs:basecolumn='EEA_BAST_CT'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_COLON_CT' rs:number='9' rs:nullable='true' rs:writeunknown='true' rs:basetable='DUAL'
			 rs:basecolumn='EEA_UTER_CT'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_LIVER_CT' rs:number='10' rs:nullable='true' rs:writeunknown='true' rs:basetable='DUAL'
			 rs:basecolumn='EEA_LUNG_CT'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_BAST_CT' rs:number='11' rs:nullable='true' rs:writeunknown='true' rs:basetable='DUAL'
			 rs:basecolumn='ROWID'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_UTER_CT' rs:number='12' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_LUNG_CT' rs:number='13' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_ORAL_OX' rs:number='14' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SPSB_OX' rs:number='15' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_CVSB_OX' rs:number='16' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_EMSB_OX' rs:number='17' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_ETSB_OX' rs:number='18' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='19' rs:rowid='true' rs:basetable='DUAL' rs:basecolumn='ROWID' rs:keycolumn='true'
			 rs:hidden='true' rs:autoincrement='true'>
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

			String EEA_MOBL_NO_T = cRsList.getString("EEA_MOBL_NO");
			String EEA_TEL_NO_T = cRsList.getString("EEA_TEL_NO");
			String EEA_SEX_NM_T = cRsList.getString("EEA_SEX_NM");
			String EEA_EXAM_NM_T = cRsList.getString("EEA_EXAM_NM");
			String EEA_COMP_NM_T = cRsList.getString("EEA_COMP_NM");
			String EEA_HTSB_OX_T = cRsList.getString("EEA_HTSB_OX");
			String EEA_CAN_CD_T = cRsList.getString("EEA_CAN_CD");
			String EEA_STOMA_CT_T = cRsList.getString("EEA_STOMA_CT");
			String EEA_COLON_CT_T = cRsList.getString("EEA_COLON_CT");
			String EEA_LIVER_CT_T = cRsList.getString("EEA_LIVER_CT");
			String EEA_BAST_CT_T = cRsList.getString("EEA_BAST_CT");
			String EEA_UTER_CT_T = cRsList.getString("EEA_UTER_CT");
			String EEA_LUNG_CT_T = cRsList.getString("EEA_LUNG_CT");
			String EEA_ORAL_OX_T = cRsList.getString("EEA_ORAL_OX");
			String EEA_SPSB_OX_T = cRsList.getString("EEA_SPSB_OX");
			String EEA_CVSB_OX_T = cRsList.getString("EEA_CVSB_OX");
			String EEA_EMSB_OX_T = cRsList.getString("EEA_EMSB_OX");
			String EEA_ETSB_OX_T = cRsList.getString("EEA_ETSB_OX");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! EEA_MOBL_NO_T.equals("")) {
%>
		 		EEA_MOBL_NO='<%= EEA_MOBL_NO_T%>'
<%
			}

			if(! EEA_TEL_NO_T.equals("")) {
%>
		 		EEA_TEL_NO='<%= EEA_TEL_NO_T%>'
<%
			}

			if(! EEA_SEX_NM_T.equals("")) {
%>
		 		EEA_SEX_NM='<%= EEA_SEX_NM_T%>'
<%
			}

			if(! EEA_EXAM_NM_T.equals("")) {
%>
		 		EEA_EXAM_NM='<%= EEA_EXAM_NM_T%>'
<%
			}

			if(! EEA_COMP_NM_T.equals("")) {
%>
		 		EEA_COMP_NM='<%= EEA_COMP_NM_T%>'
<%
			}

			if(! EEA_HTSB_OX_T.equals("")) {
%>
		 		EEA_HTSB_OX='<%= EEA_HTSB_OX_T%>'
<%
			}

			if(! EEA_CAN_CD_T.equals("")) {
%>
		 		EEA_CAN_CD='<%= EEA_CAN_CD_T%>'
<%
			}

			if(! EEA_STOMA_CT_T.equals("")) {
%>
		 		EEA_STOMA_CT='<%= EEA_STOMA_CT_T%>'
<%
			}

			if(! EEA_COLON_CT_T.equals("")) {
%>
		 		EEA_COLON_CT='<%= EEA_COLON_CT_T%>'
<%
			}

			if(! EEA_LIVER_CT_T.equals("")) {
%>
		 		EEA_LIVER_CT='<%= EEA_LIVER_CT_T%>'
<%
			}
%>
				EEA_BAST_CT='<%= cnt%>'
<%
			if(! EEA_UTER_CT_T.equals("")) {
%>
		 		EEA_UTER_CT='<%= EEA_UTER_CT_T%>'
<%
			}

			if(! EEA_LUNG_CT_T.equals("")) {
%>
		 		EEA_LUNG_CT='<%= EEA_LUNG_CT_T%>'
<%
			}

			if(! EEA_ORAL_OX_T.equals("")) {
%>
		 		EEA_ORAL_OX='<%= EEA_ORAL_OX_T%>'
<%
			}

			if(! EEA_SPSB_OX_T.equals("")) {
%>
		 		EEA_SPSB_OX='<%= EEA_SPSB_OX_T%>'
<%
			}

			if(! EEA_CVSB_OX_T.equals("")) {
%>
		 		EEA_CVSB_OX='<%= EEA_CVSB_OX_T%>'
<%
			}

			if(! EEA_EMSB_OX_T.equals("")) {
%>
		 		EEA_EMSB_OX='<%= EEA_EMSB_OX_T%>'
<%
			}

			if(! EEA_ETSB_OX_T.equals("")) {
%>
		 		EEA_ETSB_OX='<%= EEA_ETSB_OX_T%>'
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
