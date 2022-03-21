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

		String EXAM_YR = htMethod.get("EXAM_YR");
		String STDT_KD = htMethod.get("STDT_KD");
		String STDT_CS = htMethod.get("STDT_CS");
		String EXAM_DT = htMethod.get("EXAM_DT");
		String EXAM_SQ = htMethod.get("EXAM_SQ");

		//
		if(EXAM_YR == null) { EXAM_YR = ""; }
		if(STDT_KD == null) { STDT_KD = ""; }
		if(STDT_CS == null) { STDT_CS = ""; }
		if(EXAM_DT == null) { EXAM_DT = ""; }
		if(EXAM_SQ == null) { EXAM_SQ = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT D.ITEM_CD, D.ITEM_NM, D.ITEM_PR, E.RLOW, E.RHIGH, E.LOWKD, E.HIGHKD 
  FROM (SELECT LTRIM(RTRIM(A.IIM_ITEM_CD)) ITEM_CD, LTRIM(RTRIM(A.IIM_KNME_NM)) ITEM_NM, 
               B.IIP_STSG_PR ITEM_PR, C.EEA_SEX_CD, C.EEA_PSNL_AGE, C.EEA_EXAM_DT 
          FROM IT_ITEM A, IT_ITEM_PRICE B, ET_EXAM_ACPT C, IT_ITEM_CALL D 
         WHERE D.IIC_EXAM_YR = :EXAM_YR

IF (:STDT_KD = 'O') THEN
           AND SUBSTR(CASE WHEN D.IIC_EXAM_YR >= '2018' THEN SUBSTR(D.IIC_STDTO_KD, 1, 1) ELSE SUBSTR(D.IIC_STHC_KD, 8, 1) END = '4'           
ELSE
           AND SUBSTR(CASE WHEN D.IIC_EXAM_YR >= '2018' THEN D.IIC_STDT_KD ELSE D.IIC_STHC_KD END, :STDT_CS, 1) = '4'


           AND A.IIM_ITEM_CD = D.IIC_ITEM_CD 
           AND UPPER(A.IIM_USE_YN) = 'Y'
           AND B.IIP_ITEM_CD = A.IIM_ITEM_CD 
           AND B.IIP_APLY_DT = GETITEM_PRICE_APPLYDATE(A.IIM_ITEM_CD, :EXAM_DT, 'ITEM_CD') 
           AND UPPER(B.IIP_USE_YN) = 'Y'
           AND C.EEA_EXAM_DT = :EXAM_DT
           AND C.EEA_EXAM_SQ = :EXAM_SQ) D 
      LEFT OUTER JOIN TABLE(GETITEMVLDTTABLE_PKG.GETITEMVLDTTABLE(D.ITEM_CD, D.EEA_SEX_CD, D.EEA_PSNL_AGE, D.EEA_EXAM_DT, '6')) E 
                   ON E.ITEM_CD = D.ITEM_CD 

		*/

		sql = " SELECT D.ITEM_CD, D.ITEM_NM, D.ITEM_PR, E.RLOW, E.RHIGH, E.LOWKD, E.HIGHKD";
		sql += " FROM (";
		sql += "	SELECT LTRIM(RTRIM(A.IIM_ITEM_CD)) ITEM_CD, LTRIM(RTRIM(A.IIM_KNME_NM)) ITEM_NM, B.IIP_STSG_PR ITEM_PR, C.EEA_SEX_CD, C.EEA_PSNL_AGE, C.EEA_EXAM_DT";
		sql += " 	FROM IT_ITEM A, IT_ITEM_PRICE B, ET_EXAM_ACPT C, IT_ITEM_CALL D";
		sql += " 	WHERE D.IIC_EXAM_YR = '" + EXAM_YR + "'";

		if(STDT_KD.equals("0")) {
			sql += " 	AND SUBSTR(CASE WHEN D.IIC_EXAM_YR >= '2018' THEN SUBSTR(D.IIC_STDTO_KD, 1, 1) ELSE SUBSTR(D.IIC_STHC_KD, 8, 1) END = '4'";
		} else {
			sql += " 	AND SUBSTR(CASE WHEN D.IIC_EXAM_YR >= '2018' THEN D.IIC_STDT_KD ELSE D.IIC_STHC_KD END, '" + STDT_CS + "', 1) = '4'";
		}

		sql += " 	AND A.IIM_ITEM_CD = D.IIC_ITEM_CD";
		sql += " 	AND UPPER(A.IIM_USE_YN) = 'Y'";
		sql += " 	AND B.IIP_ITEM_CD = A.IIM_ITEM_CD";
		sql += " 	AND B.IIP_APLY_DT = GETITEM_PRICE_APPLYDATE(A.IIM_ITEM_CD, '" + EXAM_DT + "', 'ITEM_CD')";
		sql += " 	AND UPPER(B.IIP_USE_YN) = 'Y'";
		sql += " 	AND C.EEA_EXAM_DT = '" + EXAM_DT + "'";
		sql += " 	AND C.EEA_EXAM_SQ = '" + EXAM_SQ + "'";
		sql += " ) D LEFT OUTER JOIN TABLE(GETITEMVLDTTABLE_PKG.GETITEMVLDTTABLE(D.ITEM_CD, D.EEA_SEX_CD, D.EEA_PSNL_AGE, D.EEA_EXAM_DT, '6')) E";
		sql += " ON E.ITEM_CD = D.ITEM_CD";


			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uStdt_Pnjn_Up_RsltDisplay_002 \n";
			G_INFO += "설명 : 학생/학교밖검진 비만검사 항목 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " EXAM_YR : " + EXAM_YR + " \n";
			G_INFO += " STDT_KD : " + STDT_KD + " \n";
			G_INFO += " STDT_CS : " + STDT_CS + " \n";
			G_INFO += " EXAM_DT : " + EXAM_DT + " \n";
			G_INFO += " EXAM_SQ : " + EXAM_SQ + " \n";
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
		<s:AttributeType name='ITEM_CD' rs:number='1' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ITEM_NM' rs:number='2' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='ITEM_PR' rs:number='3' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='38' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='RLOW' rs:number='4' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='RHIGH' rs:number='5' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='LOWKD' rs:number='6' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='HIGHKD' rs:number='7' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:extends type='rs:rowbase'/>
	</s:ElementType>
</s:Schema>
		<rs:data>
<%
		int cnt = 0;
		while(cRsList.next()) {

			cnt++;

			String ITEM_CD_T = cRsList.getString("ITEM_CD");
			String ITEM_NM_T = cRsList.getString("ITEM_NM");
			String ITEM_PR_T = cRsList.getString("ITEM_PR");
			String RLOW_T = cRsList.getString("RLOW");
			String RHIGH_T = cRsList.getString("RHIGH");
			String LOWKD_T = cRsList.getString("LOWKD");
			String HIGHKD_T = cRsList.getString("HIGHKD");
%>
			<z:row
<%
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

			if(! ITEM_PR_T.equals("")) {
%>
		 		ITEM_PR='<%= ITEM_PR_T%>'
<%
			}

			if(! RLOW_T.equals("")) {
%>
		 		RLOW='<%= RLOW_T%>'
<%
			}

			if(! RHIGH_T.equals("")) {
%>
		 		RHIGH='<%= RHIGH_T%>'
<%
			}

			if(! LOWKD_T.equals("")) {
%>
		 		LOWKD='<%= LOWKD_T%>'
<%
			}

			if(! HIGHKD_T.equals("")) {
%>
		 		HIGHKD='<%= HIGHKD_T%>'
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
