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

		String MNGT_YR = htMethod.get("MNGT_YR");
		String ESTI_CD = htMethod.get("ESTI_CD");
		String DEPT_SQ = htMethod.get("DEPT_SQ");

		//
		if(MNGT_YR == null) { MNGT_YR = ""; }
		if(ESTI_CD == null) { ESTI_CD = ""; }
		if(DEPT_SQ == null) { DEPT_SQ = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT B.IIM_KNME_NM AS BET_ITEM_NM,  
       CASE WHEN A.BET_ITKD_CD IS NULL OR A.BET_ITKD_CD = '' THEN A.BET_ITKD_CD  ELSE '[' || A.BET_ITKD_CD  || ']' || GetSP_COMMON_cdToNm('HM99G',A.BET_ITKD_CD) END EBT_ITKD_NM, 
       A.* 
FROM BT_ESTI_DEPT_ITEM A INNER JOIN IT_ITEM B ON A.BET_SBCD_CD = B.IIM_SBCD_CD '
WHERE A.BET_MNGT_YR = :MNGT_YR
   AND A.BET_ESTI_CD = :ESTI_CD 
   AND A.BET_DEPT_SQ = :DEPT_SQ 
ORDER BY A.BET_ITKD_CD 

		*/

		sql = " SELECT B.IIM_KNME_NM AS BET_ITEM_NM";
		sql += ", CASE WHEN A.BET_ITKD_CD IS NULL OR A.BET_ITKD_CD = '' THEN A.BET_ITKD_CD ELSE '[' || A.BET_ITKD_CD || ']' || GETSP_COMMON_CDTONM('HM99G',A.BET_ITKD_CD) END EBT_ITKD_NM, A.*";
		sql += " FROM BT_ESTI_DEPT_ITEM A INNER JOIN IT_ITEM B";
		sql += " ON A.BET_SBCD_CD = B.IIM_SBCD_CD";
		sql += " WHERE A.BET_MNGT_YR = '" + MNGT_YR + "'";
		sql += " AND A.BET_ESTI_CD = '" + ESTI_CD + "'";
		sql += " AND A.BET_DEPT_SQ = '" + DEPT_SQ + "'";
		sql += " ORDER BY A.BET_ITKD_CD";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uBT_ESTI_DEPT_APPLY_FormShow_004 \n";
			G_INFO += "설명 : 특수검진정보 로딩 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " MNGT_YR : " + MNGT_YR + " \n";
			G_INFO += " ESTI_CD : " + ESTI_CD + " \n";
			G_INFO += " DEPT_SQ : " + DEPT_SQ + " \n";
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
		<s:AttributeType name='BET_ITEM_NM' rs:number='1' rs:basetable='IT_ITEM' rs:basecolumn='IIM_KNME_NM'>
			<s:datatype dt:type='string' dt:maxLength='200' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EBT_ITKD_NM' rs:number='2' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='BET_MNGT_YR' rs:number='3' rs:basetable='BT_ESTI_DEPT_ITEM' rs:basecolumn='BET_MNGT_YR'
			 rs:keycolumn='true'>
			<s:datatype dt:type='string' dt:maxLength='4' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='BET_ESTI_CD' rs:number='4' rs:basetable='BT_ESTI_DEPT_ITEM' rs:basecolumn='BET_ESTI_CD'
			 rs:keycolumn='true'>
			<s:datatype dt:type='string' dt:maxLength='8' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='BET_DEPT_SQ' rs:number='5' rs:basetable='BT_ESTI_DEPT_ITEM' rs:basecolumn='BET_DEPT_SQ'
			 rs:keycolumn='true'>
			<s:datatype dt:type='string' dt:maxLength='4' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='BET_SBCD_CD' rs:number='6' rs:basetable='BT_ESTI_DEPT_ITEM' rs:basecolumn='BET_SBCD_CD'
			 rs:keycolumn='true'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='BET_ITKD_CD' rs:number='7' rs:nullable='true' rs:basetable='BT_ESTI_DEPT_ITEM' rs:basecolumn='BET_ITKD_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='BET_BSBS_PR' rs:number='8' rs:nullable='true' rs:basetable='BT_ESTI_DEPT_ITEM' rs:basecolumn='BET_BSBS_PR'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='BET_BTGS_PR' rs:number='9' rs:nullable='true' rs:basetable='BT_ESTI_DEPT_ITEM' rs:basecolumn='BET_BTGS_PR'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='BET_BCAS_PR' rs:number='10' rs:nullable='true' rs:basetable='BT_ESTI_DEPT_ITEM' rs:basecolumn='BET_BCAS_PR'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='BET_JSBS_PR' rs:number='11' rs:nullable='true' rs:basetable='BT_ESTI_DEPT_ITEM' rs:basecolumn='BET_JSBS_PR'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='BET_JTGS_PR' rs:number='12' rs:nullable='true' rs:basetable='BT_ESTI_DEPT_ITEM' rs:basecolumn='BET_JTGS_PR'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='BET_JCAS_PR' rs:number='13' rs:nullable='true' rs:basetable='BT_ESTI_DEPT_ITEM' rs:basecolumn='BET_JCAS_PR'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='BET_INPT_ID' rs:number='14' rs:nullable='true' rs:basetable='BT_ESTI_DEPT_ITEM' rs:basecolumn='BET_INPT_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='BET_INPT_DTT' rs:number='15' rs:nullable='true' rs:basetable='BT_ESTI_DEPT_ITEM' rs:basecolumn='BET_INPT_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='BET_MCAS_PR' rs:number='16' rs:nullable='true' rs:basetable='BT_ESTI_DEPT_ITEM' rs:basecolumn='BET_MCAS_PR'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:extends type='rs:rowbase'/>
	</s:ElementType>
</s:Schema>		<rs:data>
<%
		int cnt = 0;
		while(cRsList.next()) {

			cnt++;

			String BET_ITEM_NM_T = cRsList.getString("BET_ITEM_NM");
			String EBT_ITKD_NM_T = cRsList.getString("EBT_ITKD_NM");
			String BET_MNGT_YR_T = cRsList.getString("BET_MNGT_YR");
			String BET_ESTI_CD_T = cRsList.getString("BET_ESTI_CD");
			String BET_DEPT_SQ_T = cRsList.getString("BET_DEPT_SQ");
			String BET_SBCD_CD_T = cRsList.getString("BET_SBCD_CD");
			String BET_ITKD_CD_T = cRsList.getString("BET_ITKD_CD");
			String BET_BSBS_PR_T = cRsList.getString("BET_BSBS_PR");
			String BET_BTGS_PR_T = cRsList.getString("BET_BTGS_PR");
			String BET_BCAS_PR_T = cRsList.getString("BET_BCAS_PR");
			String BET_JSBS_PR_T = cRsList.getString("BET_JSBS_PR");
			String BET_JTGS_PR_T = cRsList.getString("BET_JTGS_PR");
			String BET_JCAS_PR_T = cRsList.getString("BET_JCAS_PR");
			String BET_INPT_ID_T = cRsList.getString("BET_INPT_ID");
			String BET_INPT_DTT_T = cRsList.getDate2("BET_INPT_DTT");
			String BET_MCAS_PR_T = cRsList.getString("BET_MCAS_PR");
%>
			<z:row
<%
			if(! BET_ITEM_NM_T.equals("")) {
%>
		 		BET_ITEM_NM='<%= BET_ITEM_NM_T%>'
<%
			}

			if(! EBT_ITKD_NM_T.equals("")) {
%>
		 		EBT_ITKD_NM='<%= EBT_ITKD_NM_T%>'
<%
			}

			if(! BET_MNGT_YR_T.equals("")) {
%>
		 		BET_MNGT_YR='<%= BET_MNGT_YR_T%>'
<%
			}

			if(! BET_ESTI_CD_T.equals("")) {
%>
		 		BET_ESTI_CD='<%= BET_ESTI_CD_T%>'
<%
			}

			if(! BET_DEPT_SQ_T.equals("")) {
%>
		 		BET_DEPT_SQ='<%= BET_DEPT_SQ_T%>'
<%
			}

			if(! BET_SBCD_CD_T.equals("")) {
%>
		 		BET_SBCD_CD='<%= BET_SBCD_CD_T%>'
<%
			}

			if(! BET_ITKD_CD_T.equals("")) {
%>
		 		BET_ITKD_CD='<%= BET_ITKD_CD_T%>'
<%
			}

			if(! BET_BSBS_PR_T.equals("")) {
%>
		 		BET_BSBS_PR='<%= BET_BSBS_PR_T%>'
<%
			}

			if(! BET_BTGS_PR_T.equals("")) {
%>
		 		BET_BTGS_PR='<%= BET_BTGS_PR_T%>'
<%
			}

			if(! BET_BCAS_PR_T.equals("")) {
%>
		 		BET_BCAS_PR='<%= BET_BCAS_PR_T%>'
<%
			}

			if(! BET_JSBS_PR_T.equals("")) {
%>
		 		BET_JSBS_PR='<%= BET_JSBS_PR_T%>'
<%
			}

			if(! BET_JTGS_PR_T.equals("")) {
%>
		 		BET_JTGS_PR='<%= BET_JTGS_PR_T%>'
<%
			}

			if(! BET_JCAS_PR_T.equals("")) {
%>
		 		BET_JCAS_PR='<%= BET_JCAS_PR_T%>'
<%
			}

			if(! BET_INPT_ID_T.equals("")) {
%>
		 		BET_INPT_ID='<%= BET_INPT_ID_T%>'
<%
			}

			if(! BET_INPT_DTT_T.equals("")) {
%>
		 		BET_INPT_DTT='<%= BET_INPT_DTT_T%>'
<%
			}

			if(! BET_MCAS_PR_T.equals("")) {
%>
		 		BET_MCAS_PR='<%= BET_MCAS_PR_T%>'
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
