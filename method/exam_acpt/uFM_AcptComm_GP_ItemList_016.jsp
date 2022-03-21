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

		String CALC_CD = htMethod.get("CALC_CD");
		String SBCD_CD = htMethod.get("SBCD_CD");
		String APLY_DT = htMethod.get("APLY_DT");
		String ITEM_CD = htMethod.get("ITEM_CD");

		//
		if(CALC_CD == null) { CALC_CD = ""; }
		if(SBCD_CD == null) { SBCD_CD = ""; }
		if(APLY_DT == null) { APLY_DT = ""; }
		if(ITEM_CD == null) { ITEM_CD = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT A.IIM_EXGN_CD, A.IIM_SORT_SQ, 
       LTRIM(RTRIM(A.IIM_ITEM_CD)) ITEM_CD, LTRIM(RTRIM(A.IIM_KNME_NM)) ITEM_NM, 
       '00000000000' GBHC_KD, 
       CASE WHEN SUBSTR(:CALC_CD, 1, 1) = 'Y' THEN B.IIP_SBSG_PR 
            ELSE CASE WHEN SUBSTR(:CALC_CD, 2, 1) = '4' THEN B.IIP_SBSG_PR ELSE B.IIP_TGSG_PR END 
       END AS ITEM_PR, 
       B.IIP_GASN_PR HOLI_PR 
  FROM IT_ITEM A, IT_ITEM_PRICE B 
 WHERE A.IIM_SBCD_CD IN (:SBCD_CD) 
   AND NVL(LTRIM(A.IIM_SBCD_CD), ' ') <> ' '
   AND UPPER(A.IIM_USE_YN) = 'Y'
   AND B.IIP_APLY_DT = GETITEM_PRICE_APPLYDATE(A.IIM_ITEM_CD, :APLY_DT, 'ITEM_CD') 
   AND B.IIP_ITEM_CD = A.IIM_ITEM_CD 
   AND UPPER(B.IIP_USE_YN) = 'Y' 
 UNION ALL
SELECT A.IIM_EXGN_CD, A.IIM_SORT_SQ, 
       LTRIM(RTRIM(A.IIM_ITEM_CD)) ITEM_CD, LTRIM(RTRIM(A.IIM_KNME_NM)) ITEM_NM, 
       '00000000000' GBHC_KD, 
       CASE WHEN SUBSTR(:CALC_CD, 1, 1) = 'Y' THEN B.IIP_SBSG_PR 
             ELSE CASE WHEN SUBSTR(:CALC_CD, 2, 1) = '4' THEN B.IIP_SBSG_PR ELSE B.IIP_TGSG_PR END
       END AS ITEM_PR, 
       B.IIP_GASN_PR HOLI_PR 
  FROM IT_ITEM A, IT_ITEM_PRICE B 
 WHERE A.IIM_ITEM_CD = :ITEM_CD
   AND UPPER(A.IIM_USE_YN) = 'Y'
   AND B.IIP_APLY_DT = GETITEM_PRICE_APPLYDATE(A.IIM_ITEM_CD, :APLY_DT, 'ITEM_CD') 
   AND B.IIP_ITEM_CD = A.IIM_ITEM_CD 
   AND UPPER(B.IIP_USE_YN) = 'Y'
 ORDER BY IIM_EXGN_CD, IIM_SORT_SQ, ITEM_CD 


		*/

		sql = " SELECT A.IIM_EXGN_CD, A.IIM_SORT_SQ, LTRIM(RTRIM(A.IIM_ITEM_CD)) ITEM_CD, LTRIM(RTRIM(A.IIM_KNME_NM)) ITEM_NM, '00000000000' GBHC_KD, CASE WHEN SUBSTR('" + CALC_CD + "', 1, 1) = 'Y' THEN B.IIP_SBSG_PR ELSE CASE WHEN SUBSTR('" + CALC_CD + "', 2, 1) = '4' THEN B.IIP_SBSG_PR ELSE B.IIP_TGSG_PR END END AS ITEM_PR, B.IIP_GASN_PR HOLI_PR";
		sql += " FROM IT_ITEM A, IT_ITEM_PRICE B";
		sql += " WHERE A.IIM_SBCD_CD IN ('" + SBCD_CD + "')";
		sql += " AND NVL(LTRIM(A.IIM_SBCD_CD), ' ') <> ' '";
		sql += " AND UPPER(A.IIM_USE_YN) = 'Y'";
		sql += " AND B.IIP_APLY_DT = GETITEM_PRICE_APPLYDATE(A.IIM_ITEM_CD, '" + APLY_DT + "', 'ITEM_CD')";
		sql += " AND B.IIP_ITEM_CD = A.IIM_ITEM_CD";
		sql += " AND UPPER(B.IIP_USE_YN) = 'Y'";

		sql += " UNION ALL";

		sql += " SELECT A.IIM_EXGN_CD, A.IIM_SORT_SQ, LTRIM(RTRIM(A.IIM_ITEM_CD)) ITEM_CD, LTRIM(RTRIM(A.IIM_KNME_NM)) ITEM_NM, '00000000000' GBHC_KD, CASE WHEN SUBSTR('" + CALC_CD + "', 1, 1) = 'Y' THEN B.IIP_SBSG_PR ELSE CASE WHEN SUBSTR('" + CALC_CD + "', 2, 1) = '4' THEN B.IIP_SBSG_PR ELSE B.IIP_TGSG_PR END END AS ITEM_PR, B.IIP_GASN_PR HOLI_PR";
		sql += " FROM IT_ITEM A, IT_ITEM_PRICE B";
		sql += " WHERE A.IIM_ITEM_CD = '" + ITEM_CD + "'";
		sql += " AND UPPER(A.IIM_USE_YN) = 'Y'";
		sql += " AND B.IIP_APLY_DT = GETITEM_PRICE_APPLYDATE(A.IIM_ITEM_CD, '" + APLY_DT + "', 'ITEM_CD')";
		sql += " AND B.IIP_ITEM_CD = A.IIM_ITEM_CD";
		sql += " AND UPPER(B.IIP_USE_YN) = 'Y'";
		sql += " ORDER BY IIM_EXGN_CD, IIM_SORT_SQ, ITEM_CD";
			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uFM_AcptComm_GP_ItemList_016 \n";
			G_INFO += "설명 : 특검2차 검사항목 / 수가 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " CALC_CD : " + CALC_CD + " \n";
			G_INFO += " SBCD_CD : " + SBCD_CD + " \n";
			G_INFO += " APLY_DT : " + APLY_DT + " \n";
			G_INFO += " ITEM_CD : " + ITEM_CD + " \n";
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
		<s:AttributeType name='IIM_EXGN_CD' rs:number='1' rs:writeunknown='true' rs:basetable='IT_ITEM' rs:basecolumn='IIM_EXGN_CD'>
			<s:datatype dt:type='string' dt:maxLength='7' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_SORT_SQ' rs:number='2' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_SORT_SQ'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='38' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ITEM_CD' rs:number='3' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ITEM_NM' rs:number='4' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='GBHC_KD' rs:number='5' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='11' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ITEM_PR' rs:number='6' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_PRICE'
			 rs:basecolumn='IIP_GASN_PR'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='HOLI_PR' rs:number='7' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='ROWID'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='38' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='8' rs:rowid='true' rs:basetable='IT_ITEM_PRICE' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c8' rs:name='ROWID' rs:number='9' rs:rowid='true' rs:hidden='true'>
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

			String IIM_EXGN_CD_T = cRsList.getString("IIM_EXGN_CD");
			String IIM_SORT_SQ_T = cRsList.getString("IIM_SORT_SQ");
			String ITEM_CD_T = cRsList.getString("ITEM_CD");
			String ITEM_NM_T = cRsList.getString("ITEM_NM");
			String GBHC_KD_T = cRsList.getString("GBHC_KD");
			String ITEM_PR_T = cRsList.getString("ITEM_PR");
			String HOLI_PR_T = cRsList.getString("HOLI_PR");
			String ROWID_T = cRsList.getString("ROWID");
			String c8_T = cRsList.getString("c8");
%>
			<z:row
<%
			if(! IIM_EXGN_CD_T.equals("")) {
%>
		 		IIM_EXGN_CD='<%= IIM_EXGN_CD_T%>'
<%
			}

			if(! IIM_SORT_SQ_T.equals("")) {
%>
		 		IIM_SORT_SQ='<%= IIM_SORT_SQ_T%>'
<%
			}

			if(! ITEM_CD_T.equals("")) {
%>
		 		ITEM_CD='<%= ITEM_CD_T%>'
<%
			}

			if(! ITEM_NM_T.equals("")) {
%>
		 		ITEM_NM='<%= ITEM_NM_T%>'
<%
			}

			if(! GBHC_KD_T.equals("")) {
%>
		 		GBHC_KD='<%= GBHC_KD_T%>'
<%
			}

			if(! ITEM_PR_T.equals("")) {
%>
		 		ITEM_PR='<%= ITEM_PR_T%>'
<%
			}

			if(! HOLI_PR_T.equals("")) {
%>
		 		HOLI_PR='<%= HOLI_PR_T%>'
<%
			}
%>
				ROWID='<%= cnt%>'
<%
			if(! c8_T.equals("")) {
%>
		 		c8='<%= c8_T%>'
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
