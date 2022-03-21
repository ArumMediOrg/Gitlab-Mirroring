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

		String CUST_NO = htMethod.get("CUST_NO");
		String EXAM_DT = htMethod.get("EXAM_DT");
		String HTSB_CD = htMethod.get("HTSB_CD");

		//
		if(CUST_NO == null) { CUST_NO = ""; }
		if(EXAM_DT == null) { EXAM_DT = ""; }
		if(HTSB_CD == null) { HTSB_CD = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT *
  FROM (SELECT A.EEA_EXAM_DT, A.EEA_EXAM_SQ, A.EEA_INSU_NO, A.EEA_ENTY_CD, A.EEA_CNTR_CD,
               CASE WHEN B.PFP_RESULTR2_1 = '1' THEN '1' ELSE '0' END AS PFP_RESULTR2_1, 
               CASE WHEN B.PFP_RESULTR2_2 = '1' THEN '1' ELSE '0' END AS PFP_RESULTR2_2, 
               CASE WHEN B.PFP_RESULTR2_1 = '1' THEN '1' ELSE '0' END ||
                       CASE WHEN B.PFP_RESULTR2_2 = '1' THEN '1' ELSE '0' END AS PFP_RESULTR2, 
               B.PFP_SEDPLIST, F_USER_FIND(B.PFP_DOCTORFIR) AS PFP_DOCT_NM 
          FROM ET_EXAM_ACPT A LEFT OUTER JOIN PT_FIR_PANJUNG B
            ON B.PFP_EXAM_DT = A.EEA_EXAM_DT
           AND B.PFP_EXAM_SQ = A.EEA_EXAM_SQ
           AND NVL(B.PFP_EXAM_SQ2, ' ') = ' '
         WHERE A.EEA_CUST_NO = :CUST_NO
           AND A.EEA_EXAM_DT LIKE :EXAM_DT||%
           AND A.EEA_HTSB_CD = :HTSB_CD
           AND A.EEA_ORDER_YN <> 'C'
         ORDER BY EEA_EXAM_DT DESC, EEA_EXAM_SQ DESC
       ) C
 WHERE ROWNUM = 1

		*/

		sql = " SELECT *";
		sql += " FROM (";
		sql += "	SELECT A.EEA_EXAM_DT, A.EEA_EXAM_SQ, A.EEA_INSU_NO, A.EEA_ENTY_CD, A.EEA_CNTR_CD";
		sql += "	, CASE WHEN B.PFP_RESULTR2_1 = '1' THEN '1' ELSE '0' END AS PFP_RESULTR2_1";
		sql += " 	, CASE WHEN B.PFP_RESULTR2_2 = '1' THEN '1' ELSE '0' END AS PFP_RESULTR2_2";
		sql += " 	, CASE WHEN B.PFP_RESULTR2_1 = '1' THEN '1' ELSE '0' END || CASE WHEN B.PFP_RESULTR2_2 = '1' THEN '1' ELSE '0' END AS PFP_RESULTR2";
		sql += " 	, B.PFP_SEDPLIST";
		sql += "	, F_USER_FIND(B.PFP_DOCTORFIR) AS PFP_DOCT_NM";
		sql += "	FROM ET_EXAM_ACPT A LEFT OUTER JOIN PT_FIR_PANJUNG B";
		sql += "	ON B.PFP_EXAM_DT = A.EEA_EXAM_DT";
		sql += "	AND B.PFP_EXAM_SQ = A.EEA_EXAM_SQ";
		sql += "	AND NVL(B.PFP_EXAM_SQ2, ' ') = ' '";

		sql += " 	WHERE A.EEA_CUST_NO = '" + CUST_NO + "'";
		sql += " 	AND A.EEA_EXAM_DT LIKE '" + EXAM_DT + "%'";
		sql += " 	AND A.EEA_HTSB_CD = '" + HTSB_CD + "'";
		sql += " 	AND A.EEA_ORDER_YN <> 'C'";
		sql += " 	ORDER BY EEA_EXAM_DT DESC, EEA_EXAM_SQ DESC";
		sql += ") C";
		sql += " WHERE ROWNUM = 1";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uExam_Acpt_UP_FindFstPnjn_001 \n";
			G_INFO += "설명 : 일검 1차 판정정보 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " CUST_NO : " + CUST_NO + " \n";
			G_INFO += " EXAM_DT : " + EXAM_DT + " \n";
			G_INFO += " HTSB_CD : " + HTSB_CD + " \n";
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
		<s:AttributeType name='EEA_INSU_NO' rs:number='3' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_INSU_NO'>
			<s:datatype dt:type='string' dt:maxLength='11'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_ENTY_CD' rs:number='4' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_ENTY_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_CNTR_CD' rs:number='5' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_CNTR_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_RESULTR2_1' rs:number='6' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_FIR_PANJUNG'
			 rs:basecolumn='PFP_SEDPLIST'>
			<s:datatype dt:type='string' dt:maxLength='1' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_RESULTR2_2' rs:number='7' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_RESULTR2' rs:number='8' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='ROWID'>
			<s:datatype dt:type='string' dt:maxLength='2' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_SEDPLIST' rs:number='9' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_FIR_PANJUNG'
			 rs:basecolumn='ROWID'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_DOCT_NM' rs:number='10' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='11' rs:rowid='true' rs:hidden='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c11' rs:name='ROWID' rs:number='12' rs:rowid='true' rs:hidden='true'>
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

			String EEA_EXAM_DT_T = cRsList.getString("EEA_EXAM_DT");
			String EEA_EXAM_SQ_T = cRsList.getString("EEA_EXAM_SQ");
			String EEA_INSU_NO_T = cRsList.getString("EEA_INSU_NO");
			String EEA_ENTY_CD_T = cRsList.getString("EEA_ENTY_CD");
			String EEA_CNTR_CD_T = cRsList.getString("EEA_CNTR_CD");
			String PFP_RESULTR2_1_T = cRsList.getString("PFP_RESULTR2_1");
			String PFP_RESULTR2_2_T = cRsList.getString("PFP_RESULTR2_2");
			String PFP_RESULTR2_T = cRsList.getString("PFP_RESULTR2");
			String PFP_SEDPLIST_T = cRsList.getString("PFP_SEDPLIST");
			String PFP_DOCT_NM_T = cRsList.getString("PFP_DOCT_NM");
			String ROWID_T = cRsList.getString("ROWID");
			String c11_T = cRsList.getString("c11");
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

			if(! EEA_INSU_NO_T.equals("")) {
%>
		 		EEA_INSU_NO='<%= EEA_INSU_NO_T%>'
<%
			}

			if(! EEA_ENTY_CD_T.equals("")) {
%>
		 		EEA_ENTY_CD='<%= EEA_ENTY_CD_T%>'
<%
			}

			if(! EEA_CNTR_CD_T.equals("")) {
%>
		 		EEA_CNTR_CD='<%= EEA_CNTR_CD_T%>'
<%
			}

			if(! PFP_RESULTR2_1_T.equals("")) {
%>
		 		PFP_RESULTR2_1='<%= PFP_RESULTR2_1_T%>'
<%
			}

			if(! PFP_RESULTR2_2_T.equals("")) {
%>
		 		PFP_RESULTR2_2='<%= PFP_RESULTR2_2_T%>'
<%
			}

			if(! PFP_RESULTR2_T.equals("")) {
%>
		 		PFP_RESULTR2='<%= PFP_RESULTR2_T%>'
<%
			}

			if(! PFP_SEDPLIST_T.equals("")) {
%>
		 		PFP_SEDPLIST='<%= PFP_SEDPLIST_T%>'
<%
			}

			if(! PFP_DOCT_NM_T.equals("")) {
%>
		 		PFP_DOCT_NM='<%= PFP_DOCT_NM_T%>'
<%
			}
%>
				ROWID='<%= cnt%>'
<%
			if(! c11_T.equals("")) {
%>
		 		c11='<%= c11_T%>'
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
