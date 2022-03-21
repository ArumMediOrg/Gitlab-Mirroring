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

		String SFIELD = htMethod.get("SFIELD");
		String SGUBUN = htMethod.get("SGUBUN");
		String SLEN = htMethod.get("SLEN");
		String CMBEXAM_YR = htMethod.get("CMBEXAM_YR");
		String SPR_DT = htMethod.get("SPR_DT");

		//
		if(SFIELD == null) { SFIELD = ""; }
		if(SGUBUN == null) { SGUBUN = ""; }
		if(SLEN == null) { SLEN = ""; }
		if(CMBEXAM_YR == null) { CMBEXAM_YR = ""; }
		if(SPR_DT == null) { SPR_DT = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

  SELECT a.IIM_ITEM_CD, a.IIM_KNME_NM, 
                case when :sField = 'IIM_GBHC_KD' or :sGubun = '3' then b.iip_gbsg_pr 
                      when :sField = 'IIM_STHC_KD' and :sGubun = '2' then b.iip_stsg_pr end as item_pr, 
                case when :sField = 'IIM_STHC_KD' and :sGubun = '2' then 0 else b.iip_gasn_pr end as gasn_pr 
  FROM IT_ITEM a, it_item_price b 
  WHERE 0 = 0 
if (:sGubun = '0') or (:sGubun = '1') then --일검, 암
begin
           AND ( NVL(SUBSTR(:sField, 1, 1), '0') <> '0' 
  for i := 1 to :sLen do
           OR NVL(SUBSTR(:sField, i, 1), '0') <> '0' 
                  )
end else if (:sGubun = '2') then --학생
begin
            AND ( NVL(SUBSTR(:sField, 1, 1), '0') <> '0'
  for i := 1 to 5 do
            OR NVL(SUBSTR(:sField, i, 1), '0') <> '0'
                )
end else if (:sGubun = '3') then --학교밖청소년
begin
            AND ( NVL(SUBSTR(:sField, 6, 1), '0') <> '0'
            OR   NVL(SUBSTR(:sField, 7, 1), '0') <> '0')
end;

if ((sGubun = '0') or (sGubun = '1')) and (:cmbExam_Yr < '2017') then  -- C형간염 항목은 2017부터 조회되도록
            AND instr(iim_gbhc_kd, '6') = 0 

         and b.iip_aply_dt = GetITEM_PRICE_ApplyDate(a.iim_item_cd, :sPr_Dt, 'ITEM_CD')
            and b.iip_item_cd = a.iim_item_cd 
            and upper(b.iip_use_yn) = 'Y' 
if (:sGubun = '0') or (:sGubun = '1') then    --일검
  order by case when SUBSTR(a.iim_gbhc_kd, 1, 6) = '000000' then replace(a.iim_gbhc_kd, '0', '9') 
              else replace(a.iim_gbhc_kd, '0', case when SUBSTR(ltrim(TO_CHAR(TO_NUMBER(SUBSTR(a.iim_gbhc_kd, 1, 6)))), 1, 1) = '9' then '8'
                                     else SUBSTR(ltrim(TO_CHAR(TO_NUMBER(SUBSTR(a.iim_gbhc_kd, 1, 6)))), 1, 1) end) end, a.iim_item_cd
else if (:sGubun = '2') then    --학생
  order by case when SUBSTR(a.iim_sthc_kd, 1, 4) = '0000' then replace(a.iim_sthc_kd, '0', '9') end, a.iim_item_cd 
else if (:sGubun = '3') then    --학교밖
  order by case when SUBSTR(a.iim_sthc_kd, 6, 1) = '0' then replace(a.iim_sthc_kd, '0', '9')
              else case when SUBSTR(a.iim_sthc_kd, 6, 1) < '6' then '1'
              else SUBSTR(a.iim_sthc_kd, 6, 1) end end, a.iim_item_cd 
else
  order by a.iim_item_cd 

		*/

		sql = " SELECT A.IIM_ITEM_CD, A.IIM_KNME_NM";
		sql += ", CASE WHEN " + SFIELD + " = 'IIM_GBHC_KD' OR '" + SGUBUN + "' = '3' THEN B.IIP_GBSG_PR";
		sql += "	WHEN " + SFIELD + " = 'IIM_STHC_KD' AND '" + SGUBUN + "' = '2' THEN B.IIP_STSG_PR END AS ITEM_PR";
		
		sql += ", CASE WHEN " + SFIELD + " = 'IIM_STHC_KD' AND '" + SGUBUN + "' = '2' THEN 0 ELSE B.IIP_GASN_PR END AS GASN_PR";
		sql += " FROM IT_ITEM A, IT_ITEM_PRICE B";
		sql += " WHERE 0 = 0";

		if(SGUBUN.equals("0") || SGUBUN.equals("1")) {		// 일검, 암

			sql += " AND (";
			sql += "	NVL(SUBSTR(" + SFIELD + ", 1, 1), '0') <> '0'";

			for(int i=1; i<=Integer.parseInt(SLEN); i++) {
				sql += " OR NVL(SUBSTR(" + SFIELD + ", I, 1), '0') <> '0'";
			}
			sql += ")";

		} else if(SGUBUN.equals("2")) {						// 학생
		
			sql += " AND (";
			sql += "	NVL(SUBSTR(" + SFIELD + ", 1, 1), '0') <> '0'";
			for(int i=1; i<=5; i++) {
				sql += " OR NVL(SUBSTR(" + SFIELD + ", I, 1), '0') <> '0'";
			}
	        sql += ")";

		} else if(SGUBUN.equals("3")) {						// 학교밖청소년
		
		sql += " AND (";
		sql += "	NVL(SUBSTR(" + SFIELD + ", 6, 1), '0') <> '0'";
		sql += " 	OR NVL(SUBSTR(" + SFIELD + ", 7, 1), '0') <> '0'";
		sql += " )";

		}

		if((SGUBUN.equals("0") || SGUBUN.equals("1")) && CMBEXAM_YR.compareTo("2017") < 0) {				// C형간염 항목은 2017부터 조회되도록
	
			sql += " AND INSTR(IIM_GBHC_KD, '6') = 0";
		}

		sql += " AND B.IIP_APLY_DT = GETITEM_PRICE_APPLYDATE(A.IIM_ITEM_CD, '" + SPR_DT + "', 'ITEM_CD')";
		sql += " AND B.IIP_ITEM_CD = A.IIM_ITEM_CD";
		sql += " AND UPPER(B.IIP_USE_YN) = 'Y'";


		if(SGUBUN.equals("0") || SGUBUN.equals("1")) {		// 일검

			sql += " ORDER BY CASE WHEN SUBSTR(A.IIM_GBHC_KD, 1, 6) = '000000' THEN REPLACE(A.IIM_GBHC_KD, '0', '9') ELSE REPLACE(A.IIM_GBHC_KD, '0', CASE WHEN SUBSTR(LTRIM(TO_CHAR(TO_NUMBER(SUBSTR(A.IIM_GBHC_KD, 1, 6)))), 1, 1) = '9' THEN '8' ELSE SUBSTR(LTRIM(TO_CHAR(TO_NUMBER(SUBSTR(A.IIM_GBHC_KD, 1, 6)))), 1, 1) END) END, A.IIM_ITEM_CD";
		} else if(SGUBUN.equals("2")) {						// 학생

			sql += " ORDER BY CASE WHEN SUBSTR(A.IIM_STHC_KD, 1, 4) = '0000' THEN REPLACE(A.IIM_STHC_KD, '0', '9') END, A.IIM_ITEM_CD";
		} else if(SGUBUN.equals("3")) {						// 학교밖
		
			sql += " ORDER BY CASE WHEN SUBSTR(A.IIM_STHC_KD, 6, 1) = '0' THEN REPLACE(A.IIM_STHC_KD, '0', '9') ELSE CASE WHEN SUBSTR(A.IIM_STHC_KD, 6, 1) < '6' THEN '1' ELSE SUBSTR(A.IIM_STHC_KD, 6, 1) END END, A.IIM_ITEM_CD";
		} else {
		
			sql += " ORDER BY A.IIM_ITEM_CD";
		}

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uItem_Call_upGetItem_Call_003 \n";
			G_INFO += "설명 : 상세 항목정보 로딩 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " SFIELD : " + SFIELD + " \n";
			G_INFO += " SGUBUN : " + SGUBUN + " \n";
			G_INFO += " SLEN : " + SLEN + " \n";
			G_INFO += " CMBEXAM_YR : " + CMBEXAM_YR + " \n";
			G_INFO += " SPR_DT : " + SPR_DT + " \n";
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
		<s:AttributeType name='IIM_ITEM_CD' rs:number='1' rs:writeunknown='true' rs:basetable='IT_ITEM' rs:basecolumn='IIM_ITEM_CD'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_KNME_NM' rs:number='2' rs:writeunknown='true' rs:basetable='IT_ITEM' rs:basecolumn='IIM_KNME_NM'>
			<s:datatype dt:type='string' dt:maxLength='200' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ITEM_PR' rs:number='3' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_PRICE'
			 rs:basecolumn='IIP_STSG_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='38' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='GASN_PR' rs:number='4' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_PRICE'
			 rs:basecolumn='IIP_GASN_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='38' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='5' rs:rowid='true' rs:basetable='IT_ITEM' rs:basecolumn='ROWID' rs:keycolumn='true'
			 rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c5' rs:name='ROWID' rs:number='6' rs:rowid='true' rs:basetable='IT_ITEM_PRICE' rs:basecolumn='ROWID'
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

			String IIM_ITEM_CD_T = cRsList.getString("IIM_ITEM_CD");
			String IIM_KNME_NM_T = cRsList.getString("IIM_KNME_NM");
			String ITEM_PR_T = cRsList.getString("ITEM_PR");
			String GASN_PR_T = cRsList.getString("GASN_PR");
			String ROWID_T = cRsList.getString("ROWID");
			String c5_T = cRsList.getString("c5");
%>
			<z:row
<%
			if(! IIM_ITEM_CD_T.equals("")) {
%>
		 		IIM_ITEM_CD='<%= IIM_ITEM_CD_T%>'
<%
			}

			if(! IIM_KNME_NM_T.equals("")) {
%>
		 		IIM_KNME_NM='<%= IIM_KNME_NM_T%>'
<%
			}

			if(! ITEM_PR_T.equals("")) {
%>
		 		ITEM_PR='<%= ITEM_PR_T%>'
<%
			}

			if(! GASN_PR_T.equals("")) {
%>
		 		GASN_PR='<%= GASN_PR_T%>'
<%
			}
%>
				ROWID='<%= cnt%>'
				c5='<%= cnt%>'
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
