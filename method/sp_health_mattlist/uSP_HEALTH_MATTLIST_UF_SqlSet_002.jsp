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

		String SEXAM_DT = htMethod.get("SEXAM_DT");
		String EEXAM_DT = htMethod.get("EEXAM_DT");
		String MNGT_SPYM = htMethod.get("MNGT_SPYM");
		String SSQL_ADD = htMethod.get("SSQL_ADD");

		//
		if(SEXAM_DT == null) { SEXAM_DT = ""; }
		if(EEXAM_DT == null) { EEXAM_DT = ""; }
		if(MNGT_SPYM == null) { MNGT_SPYM = ""; }
		if(SSQL_ADD == null) { SSQL_ADD = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

Select DISTINCT A.EEA_EXAM_DT, A.EEA_EXAM_SQ, D.ICY_COMP_NM, EEA_PSNL_NM,
                CASE WHEN A.EEA_SPCL_CD IS NULL OR A.EEA_SPCL_CD = '' THEN EEA_SPCL_CD
                Else GetCOMMON_LvCdToNm('0910',A.EEA_SPCL_CD,'5',2) END EEA_SPCL_CD,
                A.EEA_COMP_CD, B.SPG_MATT_CD, C.CSM_MATT_NM
From ET_EXAM_ACPT A
  Inner Join ST_PANJUNG B   On B.SPG_EXAM_DT = A.EEA_EXAM_DT
                         And B.SPG_EXAM_SQ = A.EEA_EXAM_SQ
  Inner Join CT_SP_MATTER C On C.CSM_MATT_CD = B.SPG_MATT_CD
  Inner Join IT_COMPANY D   ON D.ICY_COMP_CD = A.EEA_COMP_CD
Where A.EEA_EXAM_DT Between :sEXAM_DT And :eEXAM_DT
  And SUBSTR(A.EEA_MNGT_SPYM,1,4) = :MNGT_SPYM
  And A.EEA_ORDER_YN <> 'C'
        And (A.EEA_EXAM_CD = '41001' OR A.EEA_SPSB_YN = 'Y')
  And SPG_EXAM_CHA = '1'
||:sSQL_ADD
		*/

		sql = " SELECT DISTINCT A.EEA_EXAM_DT, A.EEA_EXAM_SQ, D.ICY_COMP_NM, EEA_PSNL_NM, CASE WHEN A.EEA_SPCL_CD IS NULL";
		sql += " OR A.EEA_SPCL_CD = '' THEN EEA_SPCL_CD ELSE GETCOMMON_LVCDTONM('0910',A.EEA_SPCL_CD,'5',2) END EEA_SPCL_CD, A.EEA_COMP_CD, B.SPG_MATT_CD, C.CSM_MATT_NM";
		sql += " FROM ET_EXAM_ACPT A INNER JOIN ST_PANJUNG B";
		sql += " ON B.SPG_EXAM_DT = A.EEA_EXAM_DT";
		sql += " AND B.SPG_EXAM_SQ = A.EEA_EXAM_SQ INNER JOIN CT_SP_MATTER C";
		sql += " ON C.CSM_MATT_CD = B.SPG_MATT_CD INNER JOIN IT_COMPANY D";
		sql += " ON D.ICY_COMP_CD = A.EEA_COMP_CD";
		sql += " WHERE A.EEA_EXAM_DT BETWEEN '" + SEXAM_DT + "'";
		sql += " AND '" + EEXAM_DT + "'";
		sql += " AND SUBSTR(A.EEA_MNGT_SPYM,1,4) = '" + MNGT_SPYM + "'";
		sql += " AND A.EEA_ORDER_YN <> 'C'";
		sql += " AND (A.EEA_EXAM_CD = '41001'";
		sql += " OR A.EEA_SPSB_YN = 'Y')";
		sql += " AND SPG_EXAM_CHA = '1'";
		sql += SSQL_ADD;

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uSP_HEALTH_MATTLIST_UF_SqlSet_002 \n";
			G_INFO += "설명 : 취급물질별 내역(취급물질별 인원) \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " SEXAM_DT : " + SEXAM_DT + " \n";
			G_INFO += " EEXAM_DT : " + EEXAM_DT + " \n";
			G_INFO += " MNGT_SPYM : " + MNGT_SPYM + " \n";
			G_INFO += " SSQL_ADD : " + SSQL_ADD + " \n";
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
		<s:AttributeType name='EEA_EXAM_DT' rs:number='1' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_EXAM_DT' rs:keycolumn='true'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_EXAM_SQ' rs:number='2' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_EXAM_SQ' rs:keycolumn='true'>
			<s:datatype dt:type='string' dt:maxLength='6' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_COMP_NM' rs:number='3' rs:basetable='IT_COMPANY' rs:basecolumn='ICY_COMP_NM'>
			<s:datatype dt:type='string' dt:maxLength='100' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_PSNL_NM' rs:number='4' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_PSNL_NM'>
			<s:datatype dt:type='string' dt:maxLength='100' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SPCL_CD' rs:number='5' rs:nullable='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_SPCL_CD'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_COMP_CD' rs:number='6' rs:nullable='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_COMP_CD'>
			<s:datatype dt:type='string' dt:maxLength='12'/>
		</s:AttributeType>
		<s:AttributeType name='SPG_MATT_CD' rs:number='7' rs:basetable='ST_PANJUNG' rs:basecolumn='SPG_MATT_CD'>
			<s:datatype dt:type='string' dt:maxLength='5' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='CSM_MATT_NM' rs:number='8' rs:basetable='CT_SP_MATTER' rs:basecolumn='CSM_MATT_NM'>
			<s:datatype dt:type='string' dt:maxLength='300' rs:maybenull='false'/>
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
			String ICY_COMP_NM_T = cRsList.getString("ICY_COMP_NM");
			String EEA_PSNL_NM_T = cRsList.getString("EEA_PSNL_NM");
			String EEA_SPCL_CD_T = cRsList.getString("EEA_SPCL_CD");
			String EEA_COMP_CD_T = cRsList.getString("EEA_COMP_CD");
			String SPG_MATT_CD_T = cRsList.getString("SPG_MATT_CD");
			String CSM_MATT_NM_T = cRsList.getString("CSM_MATT_NM");
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

			if(! ICY_COMP_NM_T.equals("")) {
%>
		 		ICY_COMP_NM='<%= ICY_COMP_NM_T%>'
<%
			}

			if(! EEA_PSNL_NM_T.equals("")) {
%>
		 		EEA_PSNL_NM='<%= EEA_PSNL_NM_T%>'
<%
			}

			if(! EEA_SPCL_CD_T.equals("")) {
%>
		 		EEA_SPCL_CD='<%= EEA_SPCL_CD_T%>'
<%
			}

			if(! EEA_COMP_CD_T.equals("")) {
%>
		 		EEA_COMP_CD='<%= EEA_COMP_CD_T%>'
<%
			}

			if(! SPG_MATT_CD_T.equals("")) {
%>
		 		SPG_MATT_CD='<%= SPG_MATT_CD_T%>'
<%
			}

			if(! CSM_MATT_NM_T.equals("")) {
%>
		 		CSM_MATT_NM='<%= CSM_MATT_NM_T%>'
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
