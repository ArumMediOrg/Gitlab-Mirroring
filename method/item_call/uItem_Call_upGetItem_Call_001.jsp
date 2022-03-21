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
		String EXAM_YR = htMethod.get("EXAM_YR");
		String SLEN = htMethod.get("SLEN");
		String SPR_DT = htMethod.get("SPR_DT");
		String SGUBUN = htMethod.get("SGUBUN");

		//
		if(SFIELD == null) { SFIELD = ""; }
		if(EXAM_YR == null) { EXAM_YR = ""; }
		if(SLEN == null) { SLEN = ""; }
		if(SPR_DT == null) { SPR_DT = ""; }
		if(SGUBUN == null) { SGUBUN = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

      SELECT C.IIM_ITEM_CD, C.IIM_KNME_NM, 
           case when ':sField' = 'IIC_HLTH_KD' or
                         ':sField' = 'IIC_CAN_KD' or
                         ':sField' = 'IIC_STDTO_KD' then b.iip_gbsg_pr 
           when ':sField' = 'IIC_STDT_KD'  then b.iip_stsg_pr end as item_pr, 
           case when ':sField' = 'IIC_STDT_KD'  then 0 else b.iip_gasn_pr end as gasn_pr 
        FROM IT_ITEM_CALL a, it_item_price b, IT_ITEM C 
        WHERE IIC_EXAM_YR = :EXAM_YR
           AND ( NVL(SUBSTR(:sField, 1, 1), '0') <> '0' 
        for i := 1 to :sLen do
           OR NVL(SUBSTR(:sField, i, 1), '0') <> '0' 
        ) 

        and c.iim_item_cd = a.iic_item_cd 
                        and b.iip_aply_dt = GetITEM_PRICE_ApplyDate(a.iic_item_cd, :sPr_Dt, 'ITEM_CD') 
                        and b.iip_item_cd = a.iic_item_cd 
                        and upper(b.iip_use_yn) = 'Y' 
      if (sGubun = '0') then    -- 일검
        order by case when SUBSTR(:sField, 1, 2) = '00' then replace(replace(:sField, '9', '8'), '0', '9') 
                    else '00' end, a.iic_item_cd 
      else if (sGubun = '1') then    --암
        order by replace(:sField, '0', '9'), a.iic_item_cd 
      else if (sGubun = '2') then    --학생
        order by case when SUBSTR(:sField, 1, 4) = '0000' then replace(:sField, '0', '9') else '0000' end, a.iic_item_cd 
      else if (sGubun = '3') then    --학교밖
        order by case when SUBSTR(:sField, 1, 1) = '0' then replace(:sField, '0', '9') 
                    else case when SUBSTR(:sField, 1, 1) < '6' then '1'
                    else SUBSTR(:sField, 1, 1) end end, a.iic_item_cd
      else
        order by a.iic_item_cd 
		*/

		sql = " SELECT C.IIM_ITEM_CD, C.IIM_KNME_NM";
		sql += ", CASE WHEN '" + SFIELD + "' = 'IIC_HLTH_KD' OR '" + SFIELD + "' = 'IIC_CAN_KD' OR '" + SFIELD + "' = 'IIC_STDTO_KD' THEN B.IIP_GBSG_PR WHEN '" + SFIELD + "' = 'IIC_STDT_KD' THEN B.IIP_STSG_PR END AS ITEM_PR";
		sql += ", CASE WHEN '" + SFIELD + "' = 'IIC_STDT_KD' THEN 0 ELSE B.IIP_GASN_PR END AS GASN_PR";
		sql += " FROM IT_ITEM_CALL A, IT_ITEM_PRICE B, IT_ITEM C";
		sql += " WHERE IIC_EXAM_YR = '" + EXAM_YR + "'";
		sql += " AND ( NVL(SUBSTR(" + SFIELD + ", 1, 1), '0') <> '0'";

		for(int i=1; i<=Integer.parseInt(SLEN); i++) {
			sql += " OR NVL(SUBSTR(" + SFIELD + ", " + i + ", 1), '0') <> '0'";
		}
		sql += ")";

		sql += " AND C.IIM_ITEM_CD = A.IIC_ITEM_CD";
		sql += " AND B.IIP_APLY_DT = GETITEM_PRICE_APPLYDATE(A.IIC_ITEM_CD, '" + SPR_DT + "', 'ITEM_CD')";
		sql += " AND B.IIP_ITEM_CD = A.IIC_ITEM_CD";
		sql += " AND UPPER(B.IIP_USE_YN) = 'Y'";

		if(SGUBUN.equals("0")) {				// 일검
			sql += " ORDER BY CASE WHEN SUBSTR(" + SFIELD + ", 1, 2) = '00' THEN REPLACE(REPLACE(" + SFIELD + ", '9', '8'), '0', '9') ELSE '00' END, A.IIC_ITEM_CD";
		} else if(SGUBUN.equals("1")) {			// 암
			sql += " ORDER BY REPLACE(" + SFIELD + ", '0', '9'), A.IIC_ITEM_CD";
		} else if(SGUBUN.equals("2")) {			// 학생
			sql += " ORDER BY CASE WHEN SUBSTR(" + SFIELD + ", 1, 4) = '0000' THEN REPLACE(" + SFIELD + ", '0', '9') ELSE '0000' END, A.IIC_ITEM_CD";
		} else if(SGUBUN.equals("3")) {			// 학교밖
			sql += " ORDER BY CASE WHEN SUBSTR(" + SFIELD + ", 1, 1) = '0' THEN REPLACE(" + SFIELD + ", '0', '9') ELSE CASE WHEN SUBSTR(" + SFIELD + ", 1, 1) < '6' THEN '1' ELSE SUBSTR(" + SFIELD + ", 1, 1) END END, A.IIC_ITEM_CD";
		} else {
			sql += " ORDER BY A.IIC_ITEM_CD";
		}


			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uItem_Call_upGetItem_Call_001 \n";
			G_INFO += "설명 : 상세항목정보 로딩 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " SFIELD : " + SFIELD + " \n";
			G_INFO += " EXAM_YR : " + EXAM_YR + " \n";
			G_INFO += " SLEN : " + SLEN + " \n";
			G_INFO += " SPR_DT : " + SPR_DT + " \n";
			G_INFO += " SGUBUN : " + SGUBUN + " \n";
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
		<s:AttributeType name='ITEM_PR' rs:number='3' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_CALL'
			 rs:basecolumn='ROWID'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='GASN_PR' rs:number='4' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_PRICE'
			 rs:basecolumn='ROWID'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='5' rs:rowid='true' rs:basetable='IT_ITEM' rs:basecolumn='ROWID' rs:keycolumn='true'
			 rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c5' rs:name='ROWID' rs:number='6' rs:rowid='true' rs:hidden='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c6' rs:name='ROWID' rs:number='7' rs:rowid='true' rs:hidden='true'>
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
			String c6_T = cRsList.getString("c6");
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
<%
			if(! c5_T.equals("")) {
%>
		 		c5='<%= c5_T%>'
<%
			}

			if(! c6_T.equals("")) {
%>
		 		c6='<%= c6_T%>'
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
