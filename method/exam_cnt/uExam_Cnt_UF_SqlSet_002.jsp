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

		String EXAM_SDT = htMethod.get("EXAM_SDT");
		String EXAM_EDT = htMethod.get("EXAM_EDT");
		String PARAM_TX = htMethod.get("PARAM_TX");
		String ORDER_BY = htMethod.get("ORDER_BY");

		//
		if(EXAM_SDT == null) { EXAM_SDT = ""; }
		if(EXAM_EDT == null) { EXAM_EDT = ""; }
		if(PARAM_TX == null) { PARAM_TX = ""; }
		if(ORDER_BY == null) { ORDER_BY = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT A.EEA_EXAM_DT, A.EEA_EXAM_SQ, A.EEA_CUST_NO, A.EEA_PSNL_NM, 
       A.EEA_COMP_CD, F_COMP_FIND(A.EEA_COMP_CD) EEA_COMP_NM, 
       A.EEA_DIVI_NO, A.EEA_DEPT_NM, A.EEA_SPCL_LT, A.EEA_CHART_NO,         
       B.ICR_PENL_ID ICR_PENL_DE,                 
       A.EEA_STOMA_CD, A.EEA_COLON_CD, A.EEA_LIVER_CD, A.EEA_BAST_CD, A.EEA_UTER_CD, A.EEA_LUNG_CD,      
       A.EEA_EXAM_CD,  A.EEA_HTSB_CD,  A.EEA_SPSB_CD,  A.EEA_CVSB_CD, A.EEA_EMSB_CD, A.EEA_ETSB_CD,                         
       F_EXAM_FIND(EEA_EXAM_LT, EEA_COMP_CD, EEA_EXAM_CD) AS PACK_NM,
       GETCOMMON_LVCDTONM('0401',EEA_HTSB_CD,5,5) EEA_HTSB_NM,
       CASE WHEN SUBSTR(A.EEA_EXAM_CD, 1, 1) = '4' OR A.EEA_SPSB_YN = 'Y' THEN 
            F_CODE_FIND('0910', A.EEA_SPCL_CD, '', '1') ELSE '' END EEA_SPCL_NM,                      
       F_PACK_FIND(EEA_EMSB_LT, '') AS EMSB_NM,                        
       F_PACK_FIND(EEA_ETSB_LT, '') AS ETSB_NM                         
  FROM ET_EXAM_ACPT A INNER JOIN IT_CUSTOMER B ON A.EEA_CUST_NO = B.ICR_CUST_NO
 WHERE A.EEA_EXAM_DT >= :EXAM_SDT
   AND A.EEA_EXAM_DT <= :EXAM_EDT
   AND A.EEA_ORDER_YN <> 'C'
   
:PARAM_TX
:ORDER_BY         
		*/

		sql = " SELECT A.EEA_EXAM_DT, A.EEA_EXAM_SQ, A.EEA_CUST_NO, A.EEA_PSNL_NM, A.EEA_COMP_CD, F_COMP_FIND(A.EEA_COMP_CD) EEA_COMP_NM, A.EEA_DIVI_NO, A.EEA_DEPT_NM, A.EEA_SPCL_LT, A.EEA_CHART_NO, B.ICR_PENL_ID ICR_PENL_DE, A.EEA_STOMA_CD, A.EEA_COLON_CD, A.EEA_LIVER_CD, A.EEA_BAST_CD, A.EEA_UTER_CD, A.EEA_LUNG_CD, A.EEA_EXAM_CD, A.EEA_HTSB_CD, A.EEA_SPSB_CD, A.EEA_CVSB_CD, A.EEA_EMSB_CD, A.EEA_ETSB_CD, F_EXAM_FIND(EEA_EXAM_LT, EEA_COMP_CD, EEA_EXAM_CD) AS PACK_NM, GETCOMMON_LVCDTONM('0401',EEA_HTSB_CD,5,5) EEA_HTSB_NM";
		sql += ", CASE WHEN SUBSTR(A.EEA_EXAM_CD, 1, 1) = '4' OR A.EEA_SPSB_YN = 'Y' THEN F_CODE_FIND('0910', A.EEA_SPCL_CD, '', '1') ELSE '' END EEA_SPCL_NM";
		sql += ", F_PACK_FIND(EEA_EMSB_LT, '') AS EMSB_NM, F_PACK_FIND(EEA_ETSB_LT, '') AS ETSB_NM";
		sql += " FROM ET_EXAM_ACPT A INNER JOIN IT_CUSTOMER B";
		sql += " ON A.EEA_CUST_NO = B.ICR_CUST_NO";
		sql += " WHERE A.EEA_EXAM_DT >= '" + EXAM_SDT + "'";
		sql += " AND A.EEA_EXAM_DT <= '" + EXAM_EDT + "'";
		sql += " AND A.EEA_ORDER_YN <> 'C'";
		sql += PARAM_TX;
		sql += ORDER_BY;

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uExam_Cnt_UF_SqlSet_002 \n";
			G_INFO += "설명 : 검진일자별 검진자별 명단 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " EXAM_SDT : " + EXAM_SDT + " \n";
			G_INFO += " EXAM_EDT : " + EXAM_EDT + " \n";
			G_INFO += " PARAM_TX : " + PARAM_TX + " \n";
			G_INFO += " ORDER_BY : " + ORDER_BY + " \n";
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
		<s:AttributeType name='EEA_EXAM_SQ' rs:number='2' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_EXAM_SQ'>
			<s:datatype dt:type='string' dt:maxLength='6' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_CUST_NO' rs:number='3' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_CUST_NO'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_PSNL_NM' rs:number='4' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_PSNL_NM'>
			<s:datatype dt:type='string' dt:maxLength='100' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_COMP_CD' rs:number='5' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_COMP_CD'>
			<s:datatype dt:type='string' dt:maxLength='12'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_COMP_NM' rs:number='6' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_DIVI_NO' rs:number='7' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_DIVI_NO'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_DEPT_NM' rs:number='8' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_DEPT_NM'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SPCL_LT' rs:number='9' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_SPCL_LT'>
			<s:datatype dt:type='string' dt:maxLength='500'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_CHART_NO' rs:number='10' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_CHART_NO'>
			<s:datatype dt:type='string' dt:maxLength='30'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_PENL_DE' rs:number='11' rs:writeunknown='true' rs:basetable='IT_CUSTOMER' rs:basecolumn='ICR_PENL_ID'>
			<s:datatype dt:type='string' dt:maxLength='13' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_STOMA_CD' rs:number='12' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_STOMA_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_COLON_CD' rs:number='13' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_COLON_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_LIVER_CD' rs:number='14' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_LIVER_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_BAST_CD' rs:number='15' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_BAST_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_UTER_CD' rs:number='16' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_UTER_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_LUNG_CD' rs:number='17' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_LUNG_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_EXAM_CD' rs:number='18' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_EXAM_CD'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_HTSB_CD' rs:number='19' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_HTSB_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SPSB_CD' rs:number='20' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_SPSB_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_CVSB_CD' rs:number='21' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_CVSB_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_EMSB_CD' rs:number='22' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_EMSB_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_ETSB_CD' rs:number='23' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_ETSB_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='PACK_NM' rs:number='24' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_HTSB_NM' rs:number='25' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SPCL_NM' rs:number='26' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='EMSB_NM' rs:number='27' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='ETSB_NM' rs:number='28' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='29' rs:rowid='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c29' rs:name='ROWID' rs:number='30' rs:rowid='true' rs:basetable='IT_CUSTOMER' rs:basecolumn='ROWID'
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
			String EEA_EXAM_SQ_T = cRsList.getString("EEA_EXAM_SQ");
			String EEA_CUST_NO_T = cRsList.getString("EEA_CUST_NO");
			String EEA_PSNL_NM_T = cRsList.getString("EEA_PSNL_NM");
			String EEA_COMP_CD_T = cRsList.getString("EEA_COMP_CD");
			String EEA_COMP_NM_T = cRsList.getString("EEA_COMP_NM");
			String EEA_DIVI_NO_T = cRsList.getString("EEA_DIVI_NO");
			String EEA_DEPT_NM_T = cRsList.getString("EEA_DEPT_NM");
			String EEA_SPCL_LT_T = cRsList.getString("EEA_SPCL_LT");
			String EEA_CHART_NO_T = cRsList.getString("EEA_CHART_NO");
			String ICR_PENL_DE_T = cRsList.getString("ICR_PENL_DE");
			String EEA_STOMA_CD_T = cRsList.getString("EEA_STOMA_CD");
			String EEA_COLON_CD_T = cRsList.getString("EEA_COLON_CD");
			String EEA_LIVER_CD_T = cRsList.getString("EEA_LIVER_CD");
			String EEA_BAST_CD_T = cRsList.getString("EEA_BAST_CD");
			String EEA_UTER_CD_T = cRsList.getString("EEA_UTER_CD");
			String EEA_LUNG_CD_T = cRsList.getString("EEA_LUNG_CD");
			String EEA_EXAM_CD_T = cRsList.getString("EEA_EXAM_CD");
			String EEA_HTSB_CD_T = cRsList.getString("EEA_HTSB_CD");
			String EEA_SPSB_CD_T = cRsList.getString("EEA_SPSB_CD");
			String EEA_CVSB_CD_T = cRsList.getString("EEA_CVSB_CD");
			String EEA_EMSB_CD_T = cRsList.getString("EEA_EMSB_CD");
			String EEA_ETSB_CD_T = cRsList.getString("EEA_ETSB_CD");
			String PACK_NM_T = cRsList.getString("PACK_NM");
			String EEA_HTSB_NM_T = cRsList.getString("EEA_HTSB_NM");
			String EEA_SPCL_NM_T = cRsList.getString("EEA_SPCL_NM");
			String EMSB_NM_T = cRsList.getString("EMSB_NM");
			String ETSB_NM_T = cRsList.getString("ETSB_NM");
			String ROWID_T = cRsList.getString("ROWID");
			String c29_T = cRsList.getString("c29");
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

			if(! EEA_COMP_CD_T.equals("")) {
%>
		 		EEA_COMP_CD='<%= EEA_COMP_CD_T%>'
<%
			}

			if(! EEA_COMP_NM_T.equals("")) {
%>
		 		EEA_COMP_NM='<%= EEA_COMP_NM_T%>'
<%
			}

			if(! EEA_DIVI_NO_T.equals("")) {
%>
		 		EEA_DIVI_NO='<%= EEA_DIVI_NO_T%>'
<%
			}

			if(! EEA_DEPT_NM_T.equals("")) {
%>
		 		EEA_DEPT_NM='<%= EEA_DEPT_NM_T%>'
<%
			}

			if(! EEA_SPCL_LT_T.equals("")) {
%>
		 		EEA_SPCL_LT='<%= EEA_SPCL_LT_T%>'
<%
			}

			if(! EEA_CHART_NO_T.equals("")) {
%>
		 		EEA_CHART_NO='<%= EEA_CHART_NO_T%>'
<%
			}

			if(! ICR_PENL_DE_T.equals("")) {
%>
		 		ICR_PENL_DE='<%= ICR_PENL_DE_T%>'
<%
			}

			if(! EEA_STOMA_CD_T.equals("")) {
%>
		 		EEA_STOMA_CD='<%= EEA_STOMA_CD_T%>'
<%
			}

			if(! EEA_COLON_CD_T.equals("")) {
%>
		 		EEA_COLON_CD='<%= EEA_COLON_CD_T%>'
<%
			}

			if(! EEA_LIVER_CD_T.equals("")) {
%>
		 		EEA_LIVER_CD='<%= EEA_LIVER_CD_T%>'
<%
			}

			if(! EEA_BAST_CD_T.equals("")) {
%>
		 		EEA_BAST_CD='<%= EEA_BAST_CD_T%>'
<%
			}

			if(! EEA_UTER_CD_T.equals("")) {
%>
		 		EEA_UTER_CD='<%= EEA_UTER_CD_T%>'
<%
			}

			if(! EEA_LUNG_CD_T.equals("")) {
%>
		 		EEA_LUNG_CD='<%= EEA_LUNG_CD_T%>'
<%
			}

			if(! EEA_EXAM_CD_T.equals("")) {
%>
		 		EEA_EXAM_CD='<%= EEA_EXAM_CD_T%>'
<%
			}

			if(! EEA_HTSB_CD_T.equals("")) {
%>
		 		EEA_HTSB_CD='<%= EEA_HTSB_CD_T%>'
<%
			}

			if(! EEA_SPSB_CD_T.equals("")) {
%>
		 		EEA_SPSB_CD='<%= EEA_SPSB_CD_T%>'
<%
			}

			if(! EEA_CVSB_CD_T.equals("")) {
%>
		 		EEA_CVSB_CD='<%= EEA_CVSB_CD_T%>'
<%
			}

			if(! EEA_EMSB_CD_T.equals("")) {
%>
		 		EEA_EMSB_CD='<%= EEA_EMSB_CD_T%>'
<%
			}

			if(! EEA_ETSB_CD_T.equals("")) {
%>
		 		EEA_ETSB_CD='<%= EEA_ETSB_CD_T%>'
<%
			}

			if(! PACK_NM_T.equals("")) {
%>
		 		PACK_NM='<%= PACK_NM_T%>'
<%
			}

			if(! EEA_HTSB_NM_T.equals("")) {
%>
		 		EEA_HTSB_NM='<%= EEA_HTSB_NM_T%>'
<%
			}

			if(! EEA_SPCL_NM_T.equals("")) {
%>
		 		EEA_SPCL_NM='<%= EEA_SPCL_NM_T%>'
<%
			}

			if(! EMSB_NM_T.equals("")) {
%>
		 		EMSB_NM='<%= EMSB_NM_T%>'
<%
			}

			if(! ETSB_NM_T.equals("")) {
%>
		 		ETSB_NM='<%= ETSB_NM_T%>'
<%
			}
%>
				ROWID='<%= cnt%>'
				c29='<%= cnt%>'
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
