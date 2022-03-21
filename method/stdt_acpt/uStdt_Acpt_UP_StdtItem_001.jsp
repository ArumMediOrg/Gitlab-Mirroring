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

		//
		if(EXAM_DT == null) { EXAM_DT = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT SUBSTR(:EXAM_DT, 1, 4) EXAM_YR, 
       LTRIM(RTRIM(A.IIM_ITEM_CD)) EXAM_CD, 
       LTRIM(RTRIM(A.IIM_KNME_NM)) EXAM_NM, 
       SUBSTR(C.IIC_STDT_KD, 1, 6) || '0' EXAM_KD, 
       :EXAM_DT PRCE_DT, '1' CALC_CD, 
       B.IIP_STSG_PR EXAM_PR 
  FROM IT_ITEM_CALL C, IT_ITEM A, IT_ITEM_PRICE B 
 WHERE C.IIC_EXAM_YR = SUBSTR(:EXAM_DT, 1, 4)
   AND SUBSTR(NVL(C.IIC_STDT_KD, '000000'), 1, 6) <> '000000'
   AND A.IIM_ITEM_CD = C.IIC_ITEM_CD 
   AND UPPER(A.IIM_USE_YN) = 'Y' 
   AND UPPER(B.IIP_USE_YN) = 'Y' 
   AND B.IIP_APLY_DT = GETITEM_PRICE_APPLYDATE(A.IIM_ITEM_CD, :EXAM_DT, 'ITEM_CD') 
   AND B.IIP_ITEM_CD = A.IIM_ITEM_CD 
 ORDER BY A.IIM_EXGN_CD, A.IIM_SORT_SQ, A.IIM_ITEM_CD
		*/

		sql = " SELECT SUBSTR('" + EXAM_DT + "', 1, 4) EXAM_YR, LTRIM(RTRIM(A.IIM_ITEM_CD)) EXAM_CD, LTRIM(RTRIM(A.IIM_KNME_NM)) EXAM_NM, SUBSTR(C.IIC_STDT_KD, 1, 6) || '0' EXAM_KD, '" + EXAM_DT + "' PRCE_DT, '1' CALC_CD, B.IIP_STSG_PR EXAM_PR";
		sql += " FROM IT_ITEM_CALL C, IT_ITEM A, IT_ITEM_PRICE B";
		sql += " WHERE C.IIC_EXAM_YR = SUBSTR('" + EXAM_DT + "', 1, 4)";
		sql += " AND SUBSTR(NVL(C.IIC_STDT_KD, '000000'), 1, 6) <> '000000'";
		sql += " AND A.IIM_ITEM_CD = C.IIC_ITEM_CD";
		sql += " AND UPPER(A.IIM_USE_YN) = 'Y'";
		sql += " AND UPPER(B.IIP_USE_YN) = 'Y'";
		sql += " AND B.IIP_APLY_DT = GETITEM_PRICE_APPLYDATE(A.IIM_ITEM_CD, '" + EXAM_DT + "', 'ITEM_CD')";
		sql += " AND B.IIP_ITEM_CD = A.IIM_ITEM_CD";
		sql += " ORDER BY A.IIM_EXGN_CD, A.IIM_SORT_SQ, A.IIM_ITEM_CD";
			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uStdt_Acpt_UP_StdtItem_001 \n";
			G_INFO += "설명 : 학생 검진 검사항목 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " EXAM_DT : " + EXAM_DT + " \n";
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
		<s:AttributeType name='EXAM_YR' rs:number='1' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EXAM_CD' rs:number='2' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EXAM_NM' rs:number='3' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='EXAM_KD' rs:number='4' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='13'/>
		</s:AttributeType>
		<s:AttributeType name='PRCE_DT' rs:number='5' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='CALC_CD' rs:number='6' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EXAM_PR' rs:number='7' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_PRICE'
			 rs:basecolumn='IIP_STSG_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='38' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='8' rs:rowid='true' rs:basetable='IT_ITEM_CALL' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c8' rs:name='ROWID' rs:number='9' rs:rowid='true' rs:basetable='IT_ITEM' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c9' rs:name='ROWID' rs:number='10' rs:rowid='true' rs:basetable='IT_ITEM_PRICE' rs:basecolumn='ROWID'
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

			String EXAM_YR_T = cRsList.getString("EXAM_YR");
			String EXAM_CD_T = cRsList.getString("EXAM_CD");
			String EXAM_NM_T = cRsList.getString("EXAM_NM");
			String EXAM_KD_T = cRsList.getString("EXAM_KD");
			String PRCE_DT_T = cRsList.getString("PRCE_DT");
			String CALC_CD_T = cRsList.getString("CALC_CD");
			String EXAM_PR_T = cRsList.getString("EXAM_PR");
			String ROWID_T = cRsList.getString("ROWID");
			String c8_T = cRsList.getString("c8");
			String c9_T = cRsList.getString("c9");
%>
			<z:row
<%
			if(! EXAM_YR_T.equals("")) {
%>
		 		EXAM_YR='<%= EXAM_YR_T%>'
<%
			}

			if(! EXAM_CD_T.equals("")) {
%>
		 		EXAM_CD='<%= EXAM_CD_T%>'
<%
			}

			if(! EXAM_NM_T.equals("")) {
%>
		 		EXAM_NM='<%= EXAM_NM_T%>'
<%
			}

			if(! EXAM_KD_T.equals("")) {
%>
		 		EXAM_KD='<%= EXAM_KD_T%>'
<%
			}

			if(! PRCE_DT_T.equals("")) {
%>
		 		PRCE_DT='<%= PRCE_DT_T%>'
<%
			}

			if(! CALC_CD_T.equals("")) {
%>
		 		CALC_CD='<%= CALC_CD_T%>'
<%
			}

			if(! EXAM_PR_T.equals("")) {
%>
		 		EXAM_PR='<%= EXAM_PR_T%>'
<%
			}
%>
				ROWID='<%= cnt%>'
				c8='<%= cnt%>'
				c9='<%= cnt%>'
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
