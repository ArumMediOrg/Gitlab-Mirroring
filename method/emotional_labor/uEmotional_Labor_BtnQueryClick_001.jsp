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

		String MASKEDITSDT = htMethod.get("MASKEDITSDT");
		String MASKEDITEDT = htMethod.get("MASKEDITEDT");
		String EDTEEA_CHART_NO = htMethod.get("EDTEEA_CHART_NO");
		String CMBBOXEEA_PLCE_CD = htMethod.get("CMBBOXEEA_PLCE_CD");
		String MSKEDTEEA_COMP_CD = htMethod.get("MSKEDTEEA_COMP_CD");
		String CHKBOXMAIN = htMethod.get("CHKBOXMAIN");
		String CMBBOXEEA_EXAM_CD2 = htMethod.get("CMBBOXEEA_EXAM_CD2");
		String CMBBOXEEA_EXAM_CD1 = htMethod.get("CMBBOXEEA_EXAM_CD1");
		String CMBBOXEEA_EXAM_CD2X = htMethod.get("CMBBOXEEA_EXAM_CD2X");
		String BEFORECMBBOXEEA_EXAM_CD2 = htMethod.get("BEFORECMBBOXEEA_EXAM_CD2");
		String CMBFAMYCD = htMethod.get("CMBFAMYCD");
		String EDTEEA_PSNL_NM = htMethod.get("EDTEEA_PSNL_NM");

		//
		if(MASKEDITSDT == null) { MASKEDITSDT = ""; }
		if(MASKEDITEDT == null) { MASKEDITEDT = ""; }
		if(EDTEEA_CHART_NO == null) { EDTEEA_CHART_NO = ""; }
		if(CMBBOXEEA_PLCE_CD == null) { CMBBOXEEA_PLCE_CD = ""; }
		if(MSKEDTEEA_COMP_CD == null) { MSKEDTEEA_COMP_CD = ""; }
		if(CHKBOXMAIN == null) { CHKBOXMAIN = ""; }
		if(CMBBOXEEA_EXAM_CD2 == null) { CMBBOXEEA_EXAM_CD2 = ""; }
		if(CMBBOXEEA_EXAM_CD1 == null) { CMBBOXEEA_EXAM_CD1 = ""; }
		if(CMBBOXEEA_EXAM_CD2X == null) { CMBBOXEEA_EXAM_CD2X = ""; }
		if(BEFORECMBBOXEEA_EXAM_CD2 == null) { BEFORECMBBOXEEA_EXAM_CD2 = ""; }
		if(CMBFAMYCD == null) { CMBFAMYCD = ""; }
		if(EDTEEA_PSNL_NM == null) { EDTEEA_PSNL_NM = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT A.EEA_EXAM_DT, A.EEA_CUST_NO, A.EEA_PSNL_NM, SUBSTR(B.ICR_PENL_ID,1,6) EEA_BIRTH_DT, B.ICR_BIRH_KD, A.EEA_EXAM_SQ, A.EEA_CHART_NO, 
        CASE WHEN B.ICR_SEX_KD  IS NULL OR B.ICR_SEX_KD  = '' THEN B.ICR_SEX_KD  ELSE '[' || B.ICR_SEX_KD  || ']' || GetCOMMON_LvCdToNm('0411',B.ICR_SEX_KD,'5',1) END ICR_SEX_NM, 
        A.EEA_PSNL_AGE, B.ICR_TEL_NO, B.ICR_MOBL_NO, A.EEA_COMP_CD, C.ICY_COMP_NM, 
        CASE WHEN A.EEA_EXAM_CD  IS NULL OR A.EEA_EXAM_CD  = '' THEN A.EEA_EXAM_CD  ELSE '[' || A.EEA_EXAM_CD  || ']' || GetCOMMON_LvCdToNm('0401',A.EEA_EXAM_CD,'5',5) END ICR_EXAM_NM,  
        A.EEA_EXAM_CD, A.EEA_HDMD_YN, A.EEA_SDMD_YN 
FROM ET_EXAM_ACPT A INNER JOIN IT_CUSTOMER B ON A.EEA_CUST_NO = B.ICR_CUST_NO 
        LEFT OUTER JOIN IT_COMPANY c ON A.EEA_COMP_CD = C.ICY_COMP_CD 
WHERE A.EEA_EXAM_DT >= :MaskEditSdt
        AND A.EEA_EXAM_DT <= :MaskEditEdt
        AND A.EEA_ORDER_YN <> 'C'

if :EdtEEA_CHART_NO <> '' then
        AND A.EEA_CHART_NO = :EdtEEA_CHART_NO

if  :CmbBoxEEA_PLCE_CD <> '00' then
        AND A.EEA_PLCE_CD = :CmbBoxEEA_PLCE_CD

if :MskEdtEEA_COMP_CD <> '' then
begin
        if :ChkBoxMain = 'Y' then 
                AND A.EEA_COMP_CD IN :MskEdtEEA_COMP_CD
        else
                AND A.EEA_COMP_CD = :MskEdtEEA_COMP_CD
end;

if (:CmbBoxEEA_EXAM_CD2 <> '00000') and (:CmbBoxEEA_EXAM_CD2 <> '') then
begin
        if (:CmbBoxEEA_EXAM_CD1 = '11') or (:CmbBoxEEA_EXAM_CD1 = '12') then //일반검진, 생애검진
        begin
                AND (A.EEA_EXAM_CD = :CmbBoxEEA_EXAM_CD2
                OR (A.EEA_HTSB_YN = 'Y' AND A.EEA_HTSB_CD = :CmbBoxEEA_EXAM_CD2))';
        end
        else if :CmbBoxEEA_EXAM_CD2x = '13' then //암검진
        begin
                AND (A.EEA_EXAM_CD = :CmbBoxEEA_EXAM_CD2
                OR A.EEA_STOMA_CD <> '0' OR EEA_COLON_CD <> '0'OR EEA_LIVER_CD <> '0' OR EEA_BAST_CD <> '0'OR EEA_UTER_CD <> '0')
        end
        else if :CmbBoxEEA_EXAM_CD1 = '14' then //구강검진
        begin
                AND (SUBSTR(A.EEA_EXAM_CD,1,2) = :CmbBoxEEA_EXAM_CD1 
                OR EEA_ORAL_YN = 'Y') 
        end
        else if :CmbBoxEEA_EXAM_CD2x  = '32' then //채용검진
        begin
                AND (A.EEA_EXAM_CD = :CmbBoxEEA_EXAM_CD2
                OR (A.EEA_EMSB_YN = 'Y' AND A.EEA_EMSB_CD = :CmbBoxEEA_EXAM_CD2))
        end
        else if :CmbBoxEEA_EXAM_CD1  = '41' then //특검1차
        begin
                AND (A.EEA_EXAM_CD = '41001'
                OR (A.EEA_SPSB_YN = 'Y' AND A.EEA_SPSB_CD = '41001'))
                //배치 전
                if :beforeCmbBoxEEA_EXAM_CD2 = '1' then
                begin
                        AND A.EEA_SPCL_CD <> '07'
                end
                else
                begin
                        AND A.EEA_SPCL_CD = '07' 
                end;
        end
        else if :CmbBoxEEA_EXAM_CD2x = '81' then //뇌심혈관
        begin
                AND (A.EEA_EXAM_CD = :CmbBoxEEA_EXAM_CD2
                OR (A.EEA_CVSB_YN = 'Y' AND A.EEA_CVSB_CD = :CmbBoxEEA_EXAM_CD2))
        end
        else //종합검진,학생검진,선원검진,총포검진,적성검사,기타검진,개별검진,혈액검진,정밀검진,특검2차
        begin
                AND A.EEA_EXAM_CD = :CmbBoxEEA_EXAM_CD2
        end;
end
else if :CmbBoxEEA_EXAM_CD1 <> '00' then
begin
        if (:CmbBoxEEA_EXAM_CD1 = '11') or (:CmbBoxEEA_EXAM_CD1 = '12') then //일반검진, 생애검진
        begin
                AND (SUBSTR(A.EEA_EXAM_CD,1,2) = :CmbBoxEEA_EXAM_CD1
                OR (EEA_HTSB_YN = 'Y' AND SUBSTR(A.EEA_HTSB_CD,1,2) = :CmbBoxEEA_EXAM_CD1))
        end
        else if :CmbBoxEEA_EXAM_CD1 = '13' then //암검진
        begin
                AND (SUBSTR(A.EEA_EXAM_CD,1,2) = :CmbBoxEEA_EXAM_CD1
                OR EEA_STOMA_CD <> '0' OR EEA_COLON_CD <> '0'OR EEA_LIVER_CD <> '0'OR EEA_BAST_CD <> '0' OR EEA_UTER_CD <> '0')
        end
        else if :CmbBoxEEA_EXAM_CD1 = '14' then //구강검진
        begin
                AND (SUBSTR(A.EEA_EXAM_CD,1,2) = :CmbBoxEEA_EXAM_CD1 
                OR EEA_ORAL_YN = 'Y') 
        end
        else if :CmbBoxEEA_EXAM_CD1 = '32' then //채용검진
        begin
                AND (SUBSTR(A.EEA_EXAM_CD,1,2) = :CmbBoxEEA_EXAM_CD1 
                OR (EEA_EMSB_YN = 'Y' AND SUBSTR(A.EEA_EMSB_CD,1,2) = :CmbBoxEEA_EXAM_CD1
        end
        else if :CmbBoxEEA_EXAM_CD1  = '41' then //특검1차
        begin
                AND (SUBSTR(A.EEA_EXAM_CD,1,2) = :CmbBoxEEA_EXAM_CD1 
                OR (EEA_SPSB_YN = 'Y' AND SUBSTR(A.EEA_SPSB_CD,1,2) = :CmbBoxEEA_EXAM_CD1 
        end
        else if :CmbBoxEEA_EXAM_CD1 = '81' then //뇌심혈관
        begin
                AND (SUBSTR(A.EEA_EXAM_CD,1,2) = :CmbBoxEEA_EXAM_CD1 
                OR (EEA_CVSB_YN = 'Y' AND SUBSTR(A.EEA_CVSB_CD,1,2) = :CmbBoxEEA_EXAM_CD1 ))
        end
        else //종합검진,학생검진,선원검진,총포검진,적성검사,기타검진,개별검진,혈액검진,정밀검진,특검2차
        begin
                AND SUBSTR(A.EEA_EXAM_CD,1,2) = :CmbBoxEEA_EXAM_CD1 
        end;
end;

//본인여부
if :cmbFamyCd <> '00' then
        AND A.EEA_FAMY_CD = :cmbFamyCd 

if :EdtEEA_PSNL_NM <> '' then
        AND A.EEA_PSNL_NM like '%' || :EdtEEA_PSNL_NM || '%'

ORDER BY A.EEA_EXAM_DT, A.EEA_EXAM_SQ 

		*/

		sql = " SELECT A.EEA_EXAM_DT, A.EEA_CUST_NO, A.EEA_PSNL_NM, SUBSTR(B.ICR_PENL_ID,1,6) EEA_BIRTH_DT, B.ICR_BIRH_KD, A.EEA_EXAM_SQ, A.EEA_CHART_NO, CASE WHEN B.ICR_SEX_KD IS NULL";
		sql += " OR B.ICR_SEX_KD = '' THEN B.ICR_SEX_KD ELSE '[' || B.ICR_SEX_KD || ']' || GETCOMMON_LVCDTONM('0411',B.ICR_SEX_KD,'5',1) END ICR_SEX_NM, A.EEA_PSNL_AGE, B.ICR_TEL_NO, B.ICR_MOBL_NO, A.EEA_COMP_CD, C.ICY_COMP_NM, CASE WHEN A.EEA_EXAM_CD IS NULL";
		sql += " OR A.EEA_EXAM_CD = '' THEN A.EEA_EXAM_CD ELSE '[' || A.EEA_EXAM_CD || ']' || GETCOMMON_LVCDTONM('0401',A.EEA_EXAM_CD,'5',5) END ICR_EXAM_NM, A.EEA_EXAM_CD, A.EEA_HDMD_YN, A.EEA_SDMD_YN";
		sql += " FROM ET_EXAM_ACPT A INNER JOIN IT_CUSTOMER B";
		sql += " ON A.EEA_CUST_NO = B.ICR_CUST_NO LEFT OUTER JOIN IT_COMPANY C";
		sql += " ON A.EEA_COMP_CD = C.ICY_COMP_CD";
		sql += " WHERE A.EEA_EXAM_DT >= '" + MASKEDITSDT + "'";
		sql += " AND A.EEA_EXAM_DT <= '" + MASKEDITEDT + "'";
		sql += " AND A.EEA_ORDER_YN <> 'C'";

		if(!EDTEEA_CHART_NO.equals("")) {
			sql += " AND A.EEA_CHART_NO = '" + EDTEEA_CHART_NO + "'";
		}

		if(!CMBBOXEEA_PLCE_CD.equals("00")) {
			sql += " AND A.EEA_PLCE_CD = '" + CMBBOXEEA_PLCE_CD + "'";
		}

		if(!MSKEDTEEA_COMP_CD.equals("")) {
			if(!CHKBOXMAIN.equals("Y")) {
				sql += " AND A.EEA_COMP_CD IN '" + MSKEDTEEA_COMP_CD + "'";
			} else {
				sql += " AND A.EEA_COMP_CD = '" + MSKEDTEEA_COMP_CD + "'";	
			}
		}

		if(!CMBBOXEEA_EXAM_CD2.equals("00000") && !CMBBOXEEA_EXAM_CD2.equals("")) {
			if(CMBBOXEEA_EXAM_CD1.equals("11") || CMBBOXEEA_EXAM_CD1.equals("12")) {
				sql += " AND (A.EEA_EXAM_CD = '" + CMBBOXEEA_EXAM_CD2 + "'";
				sql += " OR (A.EEA_HTSB_YN = 'Y'";
				sql += " AND A.EEA_HTSB_CD = '" + CMBBOXEEA_EXAM_CD2 + "'))";

			} else if(CMBBOXEEA_EXAM_CD2X.equals("13")) {
				sql += " AND (A.EEA_EXAM_CD = '" + CMBBOXEEA_EXAM_CD2 + "'";
				sql += " OR A.EEA_STOMA_CD <> '0'";
				sql += " OR EEA_COLON_CD <> '0'";
				sql += " OR EEA_LIVER_CD <> '0'";
				sql += " OR EEA_BAST_CD <> '0'";
				sql += " OR EEA_UTER_CD <> '0')";

			} else if(CMBBOXEEA_EXAM_CD1.equals("14")) {
				sql += " AND (SUBSTR(A.EEA_EXAM_CD,1,2) = '" + CMBBOXEEA_EXAM_CD1 + "'";
				sql += " OR EEA_ORAL_YN = 'Y')";

			} else if(CMBBOXEEA_EXAM_CD2X.equals("32")) {
				sql += " AND (A.EEA_EXAM_CD = '" + CMBBOXEEA_EXAM_CD2 + "'";
				sql += " OR (A.EEA_EMSB_YN = 'Y'";
				sql += " AND A.EEA_EMSB_CD = '" + CMBBOXEEA_EXAM_CD2 + "'))";

			} else if(CMBBOXEEA_EXAM_CD1.equals("41")) {
				sql += " AND (A.EEA_EXAM_CD = '41001'";
				sql += " OR (A.EEA_SPSB_YN = 'Y'";
				sql += " AND A.EEA_SPSB_CD = '41001'))";

				if(BEFORECMBBOXEEA_EXAM_CD2.equals("1")) {
					sql += " AND A.EEA_SPCL_CD <> '07'";
				} else {
					sql += " AND A.EEA_SPCL_CD = '07'";
				}
			}

			else if(CMBBOXEEA_EXAM_CD2X.equals("81")) {
				sql += " AND (A.EEA_EXAM_CD = '" + CMBBOXEEA_EXAM_CD2 + "'";
				sql += " OR (A.EEA_CVSB_YN = 'Y'";
				sql += " AND A.EEA_CVSB_CD = '" + CMBBOXEEA_EXAM_CD2 + "'))";	

			} else {
				sql += " AND A.EEA_EXAM_CD = '" + CMBBOXEEA_EXAM_CD2 + "'";
			}		
		} 


		if(!CMBBOXEEA_EXAM_CD1.equals("00")) {
			if(CMBBOXEEA_EXAM_CD1.equals("11") || CMBBOXEEA_EXAM_CD1.equals("12")) {
				sql += " AND (SUBSTR(A.EEA_EXAM_CD,1,2) = '" + CMBBOXEEA_EXAM_CD1 + "'";
				sql += " OR (EEA_HTSB_YN = 'Y'";
				sql += " AND SUBSTR(A.EEA_HTSB_CD,1,2) = '" + CMBBOXEEA_EXAM_CD1 + "'))";

			} else if(CMBBOXEEA_EXAM_CD1.equals("13")) {
				sql += " AND (SUBSTR(A.EEA_EXAM_CD,1,2) = '" + CMBBOXEEA_EXAM_CD1 + "'";
				sql += " OR EEA_STOMA_CD <> '0'";
				sql += " OR EEA_COLON_CD <> '0'";
				sql += " OR EEA_LIVER_CD <> '0'";
				sql += " OR EEA_BAST_CD <> '0'";
				sql += " OR EEA_UTER_CD <> '0')";

			} else if(CMBBOXEEA_EXAM_CD1.equals("14")) {
				sql += " AND (SUBSTR(A.EEA_EXAM_CD,1,2) = '" + CMBBOXEEA_EXAM_CD1 + "'";
				sql += " OR EEA_ORAL_YN = 'Y')";

			} else if(CMBBOXEEA_EXAM_CD1.equals("32")) {
				sql += " AND (SUBSTR(A.EEA_EXAM_CD,1,2) = '" + CMBBOXEEA_EXAM_CD1 + "'";
				sql += " OR (EEA_EMSB_YN = 'Y'";
				sql += " AND SUBSTR(A.EEA_EMSB_CD,1,2) = '" + CMBBOXEEA_EXAM_CD1 + "'";

			} else if(CMBBOXEEA_EXAM_CD1.equals("41")) {
				sql += " AND (SUBSTR(A.EEA_EXAM_CD,1,2) = '" + CMBBOXEEA_EXAM_CD1 + "'";
				sql += " OR (EEA_SPSB_YN = 'Y'";
				sql += " AND SUBSTR(A.EEA_SPSB_CD,1,2) = '" + CMBBOXEEA_EXAM_CD1 + "'";
	
			} else if(CMBBOXEEA_EXAM_CD1.equals("81")) {
				sql += " AND (SUBSTR(A.EEA_EXAM_CD,1,2) = '" + CMBBOXEEA_EXAM_CD1 + "'";
				sql += " OR (EEA_CVSB_YN = 'Y'";
				sql += " AND SUBSTR(A.EEA_CVSB_CD,1,2) = '" + CMBBOXEEA_EXAM_CD1 + "' ))";
	
			} else {
				sql += " AND SUBSTR(A.EEA_EXAM_CD,1,2) = '" + CMBBOXEEA_EXAM_CD1 + "'";
	
			}		
		} 

		if(!CMBFAMYCD.equals("00")) {
			sql += " AND A.EEA_FAMY_CD = '" + CMBFAMYCD + "'";
		} 

		if(!EDTEEA_PSNL_NM.equals("")) {
			sql += " AND A.EEA_PSNL_NM LIKE '%' || '" + EDTEEA_PSNL_NM + "' || '%'";

		} 
		sql += " ORDER BY A.EEA_EXAM_DT, A.EEA_EXAM_SQ";
			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uEmotional_Labor_BtnQueryClick_001 \n";
			G_INFO += "설명 : 평가정보 로딩 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " MASKEDITSDT : " + MASKEDITSDT + " \n";
			G_INFO += " MASKEDITEDT : " + MASKEDITEDT + " \n";
			G_INFO += " EDTEEA_CHART_NO : " + EDTEEA_CHART_NO + " \n";
			G_INFO += " CMBBOXEEA_PLCE_CD : " + CMBBOXEEA_PLCE_CD + " \n";
			G_INFO += " MSKEDTEEA_COMP_CD : " + MSKEDTEEA_COMP_CD + " \n";
			G_INFO += " CHKBOXMAIN : " + CHKBOXMAIN + " \n";
			G_INFO += " CMBBOXEEA_EXAM_CD2 : " + CMBBOXEEA_EXAM_CD2 + " \n";
			G_INFO += " CMBBOXEEA_EXAM_CD1 : " + CMBBOXEEA_EXAM_CD1 + " \n";
			G_INFO += " CMBBOXEEA_EXAM_CD2X : " + CMBBOXEEA_EXAM_CD2X + " \n";
			G_INFO += " BEFORECMBBOXEEA_EXAM_CD2 : " + BEFORECMBBOXEEA_EXAM_CD2 + " \n";
			G_INFO += " CMBFAMYCD : " + CMBFAMYCD + " \n";
			G_INFO += " EDTEEA_PSNL_NM : " + EDTEEA_PSNL_NM + " \n";
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
		<s:AttributeType name='EEA_CUST_NO' rs:number='2' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_CUST_NO'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_PSNL_NM' rs:number='3' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_PSNL_NM'>
			<s:datatype dt:type='string' dt:maxLength='100' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_BIRTH_DT' rs:number='4' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='12'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_BIRH_KD' rs:number='5' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_BIRH_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_EXAM_SQ' rs:number='6' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_EXAM_SQ'>
			<s:datatype dt:type='string' dt:maxLength='6' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_CHART_NO' rs:number='7' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_CHART_NO'>
			<s:datatype dt:type='string' dt:maxLength='30'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_SEX_NM' rs:number='8' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_PSNL_AGE' rs:number='9' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='38' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_TEL_NO' rs:number='10' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_TEL_NO'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_MOBL_NO' rs:number='11' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_MOBL_NO'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_COMP_CD' rs:number='12' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_COMP_CD'>
			<s:datatype dt:type='string' dt:maxLength='12'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_COMP_NM' rs:number='13' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMPANY'
			 rs:basecolumn='ICY_COMP_NM'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_EXAM_NM' rs:number='14' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_EXAM_CD' rs:number='15'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_HDMD_YN' rs:number='16' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_HDMD_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SDMD_YN' rs:number='17' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_SDMD_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='18' rs:rowid='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c18' rs:name='ROWID' rs:number='19' rs:rowid='true' rs:basetable='IT_CUSTOMER' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c19' rs:name='ROWID' rs:number='20' rs:rowid='true' rs:basetable='IT_COMPANY' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:extends type='rs:rowbase'/>
	</s:ElementType>
</s:Schema>		<rs:data>
<%
		int cnt = 0;
		while(cRsList.next()) {

			cnt++;

			String EEA_EXAM_DT_T = cRsList.getString("EEA_EXAM_DT");
			String EEA_CUST_NO_T = cRsList.getString("EEA_CUST_NO");
			String EEA_PSNL_NM_T = cRsList.getString("EEA_PSNL_NM");
			String EEA_BIRTH_DT_T = cRsList.getString("EEA_BIRTH_DT");
			String ICR_BIRH_KD_T = cRsList.getString("ICR_BIRH_KD");
			String EEA_EXAM_SQ_T = cRsList.getString("EEA_EXAM_SQ");
			String EEA_CHART_NO_T = cRsList.getString("EEA_CHART_NO");
			String ICR_SEX_NM_T = cRsList.getString("ICR_SEX_NM");
			String EEA_PSNL_AGE_T = cRsList.getString("EEA_PSNL_AGE");
			String ICR_TEL_NO_T = cRsList.getString("ICR_TEL_NO");
			String ICR_MOBL_NO_T = cRsList.getString("ICR_MOBL_NO");
			String EEA_COMP_CD_T = cRsList.getString("EEA_COMP_CD");
			String ICY_COMP_NM_T = cRsList.getString("ICY_COMP_NM");
			String ICR_EXAM_NM_T = cRsList.getString("ICR_EXAM_NM");
			String EEA_EXAM_CD_T = cRsList.getString("EEA_EXAM_CD");
			String EEA_HDMD_YN_T = cRsList.getString("EEA_HDMD_YN");
			String EEA_SDMD_YN_T = cRsList.getString("EEA_SDMD_YN");
			String ROWID_T = cRsList.getString("ROWID");
			String c18_T = cRsList.getString("c18");
			String c19_T = cRsList.getString("c19");
%>
			<z:row
<%
			if(! EEA_EXAM_DT_T.equals("")) {
%>
		 		EEA_EXAM_DT='<%= EEA_EXAM_DT_T%>'
<%
			}

			if(! EEA_CUST_NO_T.equals("")) {
%>
		 		EEA_CUST_NO='<%= EEA_CUST_NO_T%>'
<%
			}

			if(! EEA_PSNL_NM_T.equals("")) {
%>
		 		EEA_PSNL_NM='<%= EEA_PSNL_NM_T%>'
<%
			}

			if(! EEA_BIRTH_DT_T.equals("")) {
%>
		 		EEA_BIRTH_DT='<%= EEA_BIRTH_DT_T%>'
<%
			}

			if(! ICR_BIRH_KD_T.equals("")) {
%>
		 		ICR_BIRH_KD='<%= ICR_BIRH_KD_T%>'
<%
			}

			if(! EEA_EXAM_SQ_T.equals("")) {
%>
		 		EEA_EXAM_SQ='<%= EEA_EXAM_SQ_T%>'
<%
			}

			if(! EEA_CHART_NO_T.equals("")) {
%>
		 		EEA_CHART_NO='<%= EEA_CHART_NO_T%>'
<%
			}

			if(! ICR_SEX_NM_T.equals("")) {
%>
		 		ICR_SEX_NM='<%= ICR_SEX_NM_T%>'
<%
			}

			if(! EEA_PSNL_AGE_T.equals("")) {
%>
		 		EEA_PSNL_AGE='<%= EEA_PSNL_AGE_T%>'
<%
			}

			if(! ICR_TEL_NO_T.equals("")) {
%>
		 		ICR_TEL_NO='<%= ICR_TEL_NO_T%>'
<%
			}

			if(! ICR_MOBL_NO_T.equals("")) {
%>
		 		ICR_MOBL_NO='<%= ICR_MOBL_NO_T%>'
<%
			}

			if(! EEA_COMP_CD_T.equals("")) {
%>
		 		EEA_COMP_CD='<%= EEA_COMP_CD_T%>'
<%
			}

			if(! ICY_COMP_NM_T.equals("")) {
%>
		 		ICY_COMP_NM='<%= ICY_COMP_NM_T%>'
<%
			}

			if(! ICR_EXAM_NM_T.equals("")) {
%>
		 		ICR_EXAM_NM='<%= ICR_EXAM_NM_T%>'
<%
			}

			if(! EEA_EXAM_CD_T.equals("")) {
%>
		 		EEA_EXAM_CD='<%= EEA_EXAM_CD_T%>'
<%
			}

			if(! EEA_HDMD_YN_T.equals("")) {
%>
		 		EEA_HDMD_YN='<%= EEA_HDMD_YN_T%>'
<%
			}

			if(! EEA_SDMD_YN_T.equals("")) {
%>
		 		EEA_SDMD_YN='<%= EEA_SDMD_YN_T%>'
<%
			}
%>
				ROWID='<%= cnt%>'
				c18='<%= cnt%>'
				c19='<%= cnt%>'
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
