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

		String COMP_CD = htMethod.get("COMP_CD");
		String MNGT_YR = htMethod.get("MNGT_YR");
		String HALF_CD = htMethod.get("HALF_CD");
		String DEPT_CD = htMethod.get("DEPT_CD");

		//
		if(COMP_CD == null) { COMP_CD = ""; }
		if(MNGT_YR == null) { MNGT_YR = ""; }
		if(HALF_CD == null) { HALF_CD = ""; }
		if(DEPT_CD == null) { DEPT_CD = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT B.IIM_KNME_NM AS ICI_ITEM_NM,
       CASE WHEN ICI_ITKD_CD  IS NULL OR ICI_ITKD_CD  = '' THEN ICI_ITKD_CD  else '[' || ICI_ITKD_CD  || ']' || GetSP_COMMON_cdToNm('HM99G',A.ICI_ITKD_CD) END ICI_ITKD_NM, A.*
  FROM IT_COMP_DEPT_ITEM A INNER JOIN IT_ITEM B ON A.ICI_SBCD_CD = B.IIM_SBCD_CD AND B.IIM_USE_YN <> 'N'
 WHERE A.ICI_COMP_CD = :COMP_CD
   AND A.ICI_MNGT_YR = :MNGT_YR
   AND A.ICI_HALF_CD = :HALF_CD
   AND A.ICI_DEPT_CD = :DEPT_CD
 ORDER BY A.ICI_ITKD_CD
		*/

		sql = " SELECT B.IIM_KNME_NM AS ICI_ITEM_NM, CASE WHEN ICI_ITKD_CD IS NULL";
		sql += " OR ICI_ITKD_CD = '' THEN ICI_ITKD_CD ELSE '[' || ICI_ITKD_CD || ']' || GETSP_COMMON_CDTONM('HM99G',A.ICI_ITKD_CD) END ICI_ITKD_NM, A.*";
		sql += " FROM IT_COMP_DEPT_ITEM A INNER JOIN IT_ITEM B";
		sql += " ON A.ICI_SBCD_CD = B.IIM_SBCD_CD";
		sql += " AND B.IIM_USE_YN <> 'N'";
		sql += " WHERE A.ICI_COMP_CD = '" + COMP_CD + "'";
		sql += " AND A.ICI_MNGT_YR = '" + MNGT_YR + "'";
		sql += " AND A.ICI_HALF_CD = '" + HALF_CD + "'";
		sql += " AND A.ICI_DEPT_CD = '" + DEPT_CD + "'";
		sql += " ORDER BY A.ICI_ITKD_CD";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uCOMP_DEPT_APPLY_FormShow_003 \n";
			G_INFO += "설명 : 특검검사 사업장부서 검사항목 리스트 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " COMP_CD : " + COMP_CD + " \n";
			G_INFO += " MNGT_YR : " + MNGT_YR + " \n";
			G_INFO += " HALF_CD : " + HALF_CD + " \n";
			G_INFO += " DEPT_CD : " + DEPT_CD + " \n";
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
		<s:AttributeType name='ICI_ITEM_NM' rs:number='1' rs:basetable='IT_ITEM' rs:basecolumn='IIM_KNME_NM'>
			<s:datatype dt:type='string' dt:maxLength='200' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ICI_ITKD_NM' rs:number='2' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='ICI_COMP_CD' rs:number='3' rs:basetable='IT_COMP_DEPT_ITEM' rs:basecolumn='ICI_COMP_CD'
			 rs:keycolumn='true'>
			<s:datatype dt:type='string' dt:maxLength='12' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ICI_MNGT_YR' rs:number='4' rs:basetable='IT_COMP_DEPT_ITEM' rs:basecolumn='ICI_MNGT_YR'
			 rs:keycolumn='true'>
			<s:datatype dt:type='string' dt:maxLength='4' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ICI_HALF_CD' rs:number='5' rs:basetable='IT_COMP_DEPT_ITEM' rs:basecolumn='ICI_HALF_CD'
			 rs:keycolumn='true'>
			<s:datatype dt:type='string' dt:maxLength='1' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ICI_DEPT_CD' rs:number='6' rs:basetable='IT_COMP_DEPT_ITEM' rs:basecolumn='ICI_DEPT_CD'
			 rs:keycolumn='true'>
			<s:datatype dt:type='string' dt:maxLength='4' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ICI_SBCD_CD' rs:number='7' rs:basetable='IT_COMP_DEPT_ITEM' rs:basecolumn='ICI_SBCD_CD'
			 rs:keycolumn='true'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ICI_ITKD_CD' rs:number='8' rs:nullable='true' rs:basetable='IT_COMP_DEPT_ITEM' rs:basecolumn='ICI_ITKD_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ICI_BSBS_PR' rs:number='9' rs:nullable='true' rs:basetable='IT_COMP_DEPT_ITEM' rs:basecolumn='ICI_BSBS_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ICI_BTGS_PR' rs:number='10' rs:nullable='true' rs:basetable='IT_COMP_DEPT_ITEM' rs:basecolumn='ICI_BTGS_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ICI_BCAS_PR' rs:number='11' rs:nullable='true' rs:basetable='IT_COMP_DEPT_ITEM' rs:basecolumn='ICI_BCAS_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ICI_JSBS_PR' rs:number='12' rs:nullable='true' rs:basetable='IT_COMP_DEPT_ITEM' rs:basecolumn='ICI_JSBS_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ICI_JTGS_PR' rs:number='13' rs:nullable='true' rs:basetable='IT_COMP_DEPT_ITEM' rs:basecolumn='ICI_JTGS_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ICI_JCAS_PR' rs:number='14' rs:nullable='true' rs:basetable='IT_COMP_DEPT_ITEM' rs:basecolumn='ICI_JCAS_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ICI_USE_YN' rs:number='15' rs:nullable='true' rs:basetable='IT_COMP_DEPT_ITEM' rs:basecolumn='ICI_USE_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ICI_NUSE_ID' rs:number='16' rs:nullable='true' rs:basetable='IT_COMP_DEPT_ITEM' rs:basecolumn='ICI_NUSE_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ICI_NUSE_DTT' rs:number='17' rs:nullable='true' rs:basetable='IT_COMP_DEPT_ITEM' rs:basecolumn='ICI_NUSE_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ICI_INPT_ID' rs:number='18' rs:nullable='true' rs:basetable='IT_COMP_DEPT_ITEM' rs:basecolumn='ICI_INPT_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ICI_INPT_DTT' rs:number='19' rs:nullable='true' rs:basetable='IT_COMP_DEPT_ITEM' rs:basecolumn='ICI_INPT_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ICI_MODI_ID' rs:number='20' rs:nullable='true' rs:basetable='IT_COMP_DEPT_ITEM' rs:basecolumn='ICI_MODI_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ICI_MODI_DTT' rs:number='21' rs:nullable='true' rs:basetable='IT_COMP_DEPT_ITEM' rs:basecolumn='ICI_MODI_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ICI_TRNS_ID' rs:number='22' rs:nullable='true' rs:basetable='IT_COMP_DEPT_ITEM' rs:basecolumn='ICI_TRNS_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ICI_TRNS_DTT' rs:number='23' rs:nullable='true' rs:basetable='IT_COMP_DEPT_ITEM' rs:basecolumn='ICI_TRNS_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ICI_DSBS_PR' rs:number='24' rs:nullable='true' rs:basetable='IT_COMP_DEPT_ITEM' rs:basecolumn='ICI_DSBS_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='7' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ICI_DTGS_PR' rs:number='25' rs:nullable='true' rs:basetable='IT_COMP_DEPT_ITEM' rs:basecolumn='ICI_DTGS_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='7' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ICI_DCAS_PR' rs:number='26' rs:nullable='true' rs:basetable='IT_COMP_DEPT_ITEM' rs:basecolumn='ICI_DCAS_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='7' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:extends type='rs:rowbase'/>
	</s:ElementType>
</s:Schema>
		<rs:data>
<%
		int cnt = 0;
		while(cRsList.next()) {

			cnt++;

			String ICI_ITEM_NM_T = cRsList.getString("ICI_ITEM_NM");
			String ICI_ITKD_NM_T = cRsList.getString("ICI_ITKD_NM");
			String ICI_COMP_CD_T = cRsList.getString("ICI_COMP_CD");
			String ICI_MNGT_YR_T = cRsList.getString("ICI_MNGT_YR");
			String ICI_HALF_CD_T = cRsList.getString("ICI_HALF_CD");
			String ICI_DEPT_CD_T = cRsList.getString("ICI_DEPT_CD");
			String ICI_SBCD_CD_T = cRsList.getString("ICI_SBCD_CD");
			String ICI_ITKD_CD_T = cRsList.getString("ICI_ITKD_CD");
			String ICI_BSBS_PR_T = cRsList.getString("ICI_BSBS_PR");
			String ICI_BTGS_PR_T = cRsList.getString("ICI_BTGS_PR");
			String ICI_BCAS_PR_T = cRsList.getString("ICI_BCAS_PR");
			String ICI_JSBS_PR_T = cRsList.getString("ICI_JSBS_PR");
			String ICI_JTGS_PR_T = cRsList.getString("ICI_JTGS_PR");
			String ICI_JCAS_PR_T = cRsList.getString("ICI_JCAS_PR");
			String ICI_USE_YN_T = cRsList.getString("ICI_USE_YN");
			String ICI_NUSE_ID_T = cRsList.getString("ICI_NUSE_ID");
			String ICI_NUSE_DTT_T = cRsList.getDate2("ICI_NUSE_DTT");
			String ICI_INPT_ID_T = cRsList.getString("ICI_INPT_ID");
			String ICI_INPT_DTT_T = cRsList.getDate2("ICI_INPT_DTT");
			String ICI_MODI_ID_T = cRsList.getString("ICI_MODI_ID");
			String ICI_MODI_DTT_T = cRsList.getDate2("ICI_MODI_DTT");
			String ICI_TRNS_ID_T = cRsList.getString("ICI_TRNS_ID");
			String ICI_TRNS_DTT_T = cRsList.getDate2("ICI_TRNS_DTT");
			String ICI_DSBS_PR_T = cRsList.getString("ICI_DSBS_PR");
			String ICI_DTGS_PR_T = cRsList.getString("ICI_DTGS_PR");
			String ICI_DCAS_PR_T = cRsList.getString("ICI_DCAS_PR");
%>
			<z:row
<%
			if(! ICI_ITEM_NM_T.equals("")) {
%>
		 		ICI_ITEM_NM='<%= ICI_ITEM_NM_T%>'
<%
			}

			if(! ICI_ITKD_NM_T.equals("")) {
%>
		 		ICI_ITKD_NM='<%= ICI_ITKD_NM_T%>'
<%
			}

			if(! ICI_COMP_CD_T.equals("")) {
%>
		 		ICI_COMP_CD='<%= ICI_COMP_CD_T%>'
<%
			}

			if(! ICI_MNGT_YR_T.equals("")) {
%>
		 		ICI_MNGT_YR='<%= ICI_MNGT_YR_T%>'
<%
			}

			if(! ICI_HALF_CD_T.equals("")) {
%>
		 		ICI_HALF_CD='<%= ICI_HALF_CD_T%>'
<%
			}

			if(! ICI_DEPT_CD_T.equals("")) {
%>
		 		ICI_DEPT_CD='<%= ICI_DEPT_CD_T%>'
<%
			}

			if(! ICI_SBCD_CD_T.equals("")) {
%>
		 		ICI_SBCD_CD='<%= ICI_SBCD_CD_T%>'
<%
			}

			if(! ICI_ITKD_CD_T.equals("")) {
%>
		 		ICI_ITKD_CD='<%= ICI_ITKD_CD_T%>'
<%
			}

			if(! ICI_BSBS_PR_T.equals("")) {
%>
		 		ICI_BSBS_PR='<%= ICI_BSBS_PR_T%>'
<%
			}

			if(! ICI_BTGS_PR_T.equals("")) {
%>
		 		ICI_BTGS_PR='<%= ICI_BTGS_PR_T%>'
<%
			}

			if(! ICI_BCAS_PR_T.equals("")) {
%>
		 		ICI_BCAS_PR='<%= ICI_BCAS_PR_T%>'
<%
			}

			if(! ICI_JSBS_PR_T.equals("")) {
%>
		 		ICI_JSBS_PR='<%= ICI_JSBS_PR_T%>'
<%
			}

			if(! ICI_JTGS_PR_T.equals("")) {
%>
		 		ICI_JTGS_PR='<%= ICI_JTGS_PR_T%>'
<%
			}

			if(! ICI_JCAS_PR_T.equals("")) {
%>
		 		ICI_JCAS_PR='<%= ICI_JCAS_PR_T%>'
<%
			}

			if(! ICI_USE_YN_T.equals("")) {
%>
		 		ICI_USE_YN='<%= ICI_USE_YN_T%>'
<%
			}

			if(! ICI_NUSE_ID_T.equals("")) {
%>
		 		ICI_NUSE_ID='<%= ICI_NUSE_ID_T%>'
<%
			}

			if(! ICI_NUSE_DTT_T.equals("")) {
%>
		 		ICI_NUSE_DTT='<%= ICI_NUSE_DTT_T%>'
<%
			}

			if(! ICI_INPT_ID_T.equals("")) {
%>
		 		ICI_INPT_ID='<%= ICI_INPT_ID_T%>'
<%
			}

			if(! ICI_INPT_DTT_T.equals("")) {
%>
		 		ICI_INPT_DTT='<%= ICI_INPT_DTT_T%>'
<%
			}

			if(! ICI_MODI_ID_T.equals("")) {
%>
		 		ICI_MODI_ID='<%= ICI_MODI_ID_T%>'
<%
			}

			if(! ICI_MODI_DTT_T.equals("")) {
%>
		 		ICI_MODI_DTT='<%= ICI_MODI_DTT_T%>'
<%
			}

			if(! ICI_TRNS_ID_T.equals("")) {
%>
		 		ICI_TRNS_ID='<%= ICI_TRNS_ID_T%>'
<%
			}

			if(! ICI_TRNS_DTT_T.equals("")) {
%>
		 		ICI_TRNS_DTT='<%= ICI_TRNS_DTT_T%>'
<%
			}

			if(! ICI_DSBS_PR_T.equals("")) {
%>
		 		ICI_DSBS_PR='<%= ICI_DSBS_PR_T%>'
<%
			}

			if(! ICI_DTGS_PR_T.equals("")) {
%>
		 		ICI_DTGS_PR='<%= ICI_DTGS_PR_T%>'
<%
			}

			if(! ICI_DCAS_PR_T.equals("")) {
%>
		 		ICI_DCAS_PR='<%= ICI_DCAS_PR_T%>'
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
