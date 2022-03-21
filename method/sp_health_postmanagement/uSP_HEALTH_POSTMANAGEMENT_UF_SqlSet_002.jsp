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

		String PARAM_TX1 = htMethod.get("PARAM_TX1");
		String PARAM_TX2 = htMethod.get("PARAM_TX2");

		//
		if(PARAM_TX1 == null) { PARAM_TX1 = ""; }
		if(PARAM_TX2 == null) { PARAM_TX2 = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT B.SPG_DOCT_CD, C.IAU_PENL_NM, F_DOCLICNE(B.SPG_DOCT_CD,'전문의') SPG_DOCT_NO, C.IAU_EMP_NO
  FROM ET_EXAM_ACPT A
            INNER JOIN ST_PANJUNG   B ON A.EEA_EXAM_DT = B.SPG_EXAM_DT
                                     AND A.EEA_EXAM_SQ = B.SPG_EXAM_SQ
       LEFT OUTER JOIN IT_AUTH_USER C ON B.SPG_DOCT_CD = C.IAU_EMP_NO
       LEFT OUTER JOIN IT_COMPANY   E ON A.EEA_COMP_CD = E.ICY_COMP_CD
        
:PARAM_TX1
:PARAM_TX2
		*/

		sql = " SELECT B.SPG_DOCT_CD, C.IAU_PENL_NM, F_DOCLICNE(B.SPG_DOCT_CD,'전문의') SPG_DOCT_NO, C.IAU_EMP_NO";
		sql += " FROM ET_EXAM_ACPT A INNER JOIN ST_PANJUNG B";
		sql += " ON A.EEA_EXAM_DT = B.SPG_EXAM_DT";
		sql += " AND A.EEA_EXAM_SQ = B.SPG_EXAM_SQ LEFT OUTER JOIN IT_AUTH_USER C";
		sql += " ON B.SPG_DOCT_CD = C.IAU_EMP_NO LEFT OUTER JOIN IT_COMPANY E";
		sql += " ON A.EEA_COMP_CD = E.ICY_COMP_CD";
		sql += PARAM_TX1;
		sql += PARAM_TX2;
			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uSP_HEALTH_POSTMANAGEMENT_UF_SqlSet_002 \n";
			G_INFO += "설명 : 판정의사 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " PARAM_TX1 : " + PARAM_TX1 + " \n";
			G_INFO += " PARAM_TX2 : " + PARAM_TX2 + " \n";
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
		<s:AttributeType name='SPG_DOCT_CD' rs:number='1' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_PANJUNG'
			 rs:basecolumn='SPG_DOCT_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_PENL_NM' rs:number='2' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_PENL_NM'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='SPG_DOCT_NO' rs:number='3' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_EMP_NO' rs:number='4' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_EMP_NO'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='5' rs:rowid='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c5' rs:name='ROWID' rs:number='6' rs:rowid='true' rs:basetable='ST_PANJUNG' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c6' rs:name='ROWID' rs:number='7' rs:rowid='true' rs:basetable='IT_AUTH_USER' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c7' rs:name='ROWID' rs:number='8' rs:rowid='true' rs:basetable='IT_COMPANY' rs:basecolumn='ROWID'
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

			String SPG_DOCT_CD_T = cRsList.getString("SPG_DOCT_CD");
			String IAU_PENL_NM_T = cRsList.getString("IAU_PENL_NM");
			String SPG_DOCT_NO_T = cRsList.getString("SPG_DOCT_NO");
			String IAU_EMP_NO_T = cRsList.getString("IAU_EMP_NO");
			String ROWID_T = cRsList.getString("ROWID");
			String c5_T = cRsList.getString("c5");
			String c6_T = cRsList.getString("c6");
			String c7_T = cRsList.getString("c7");
%>
			<z:row
<%
			if(! SPG_DOCT_CD_T.equals("")) {
%>
		 		SPG_DOCT_CD='<%= SPG_DOCT_CD_T%>'
<%
			}

			if(! IAU_PENL_NM_T.equals("")) {
%>
		 		IAU_PENL_NM='<%= IAU_PENL_NM_T%>'
<%
			}

			if(! SPG_DOCT_NO_T.equals("")) {
%>
		 		SPG_DOCT_NO='<%= SPG_DOCT_NO_T%>'
<%
			}

			if(! IAU_EMP_NO_T.equals("")) {
%>
		 		IAU_EMP_NO='<%= IAU_EMP_NO_T%>'
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

			if(! c7_T.equals("")) {
%>
		 		c7='<%= c7_T%>'
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
