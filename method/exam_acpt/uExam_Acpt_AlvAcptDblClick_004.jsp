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
		String EXAM_SQ = htMethod.get("EXAM_SQ");

		//
		if(EXAM_DT == null) { EXAM_DT = ""; }
		if(EXAM_SQ == null) { EXAM_SQ = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT SUM(EEP_FST_PR)  FST_PR,  SUM(EEP_ADD_PR)   ADD_PR,   SUM(EEP_PRGS_PR) PRGS_PR,
       SUM(EEP_HTSB_PR) HTSB_PR, SUM(EEP_CAN_PR)   CAN_PR,   SUM(EEP_SPSB_PR) SPSB_PR,
       SUM(EEP_CVSB_PR) CVSB_PR, SUM(EEP_EMSB_PR)  EMSB_PR,  SUM(EEP_ETSB_PR) ETSB_PR,
       SUM(EEP_DMD_PR)  DMD_PR,  SUM(EEP_HDMD_PR)  HDMD_PR,  SUM(EEP_SDMD_PR) SDMD_PR,
       SUM(EEP_COMP_PR) COMP_PR, SUM(EEP_COMPS_PR) COMPS_PR, SUM(EEP_PSNL_PR+EEP_PSNLP_PR) PSNLT_PR,
       SUM(EEP_PSNL_PR) PSNL_PR, SUM(EEP_PSNLP_PR) PSNLP_PR, SUM(EEP_EXAM_PR) EXAM_PR
  FROM ET_EXAM_PRICE
 WHERE EEP_EXAM_DT = :EXAM_DT
   AND EEP_EXAM_SQ = :EXAM_SQ

		*/

		sql = " SELECT SUM(EEP_FST_PR) FST_PR, SUM(EEP_ADD_PR) ADD_PR, SUM(EEP_PRGS_PR) PRGS_PR, SUM(EEP_HTSB_PR) HTSB_PR, SUM(EEP_CAN_PR) CAN_PR, SUM(EEP_SPSB_PR) SPSB_PR, SUM(EEP_CVSB_PR) CVSB_PR, SUM(EEP_EMSB_PR) EMSB_PR, SUM(EEP_ETSB_PR) ETSB_PR, SUM(EEP_DMD_PR) DMD_PR, SUM(EEP_HDMD_PR) HDMD_PR, SUM(EEP_SDMD_PR) SDMD_PR, SUM(EEP_COMP_PR) COMP_PR, SUM(EEP_COMPS_PR) COMPS_PR, SUM(EEP_PSNL_PR+EEP_PSNLP_PR) PSNLT_PR, SUM(EEP_PSNL_PR) PSNL_PR, SUM(EEP_PSNLP_PR) PSNLP_PR, SUM(EEP_EXAM_PR) EXAM_PR";
		sql += " FROM ET_EXAM_PRICE";
		sql += " WHERE EEP_EXAM_DT = '" + EXAM_DT + "'";
		sql += " AND EEP_EXAM_SQ = '" + EXAM_SQ + "'";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uExam_Acpt_AlvAcptDblClick_004 \n";
			G_INFO += "설명 : 접수 수가 내역 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
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
		<s:AttributeType name='FST_PR' rs:number='1' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='ADD_PR' rs:number='2' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='PRGS_PR' rs:number='3' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='HTSB_PR' rs:number='4' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='CAN_PR' rs:number='5' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='SPSB_PR' rs:number='6' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='CVSB_PR' rs:number='7' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='EMSB_PR' rs:number='8' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='ETSB_PR' rs:number='9' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='DMD_PR' rs:number='10' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='HDMD_PR' rs:number='11' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='SDMD_PR' rs:number='12' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='COMP_PR' rs:number='13' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='COMPS_PR' rs:number='14' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='PSNLT_PR' rs:number='15' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='PSNL_PR' rs:number='16' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='PSNLP_PR' rs:number='17' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='EXAM_PR' rs:number='18' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:extends type='rs:rowbase'/>
	</s:ElementType>
</s:Schema>
		<rs:data>
<%
		int cnt = 0;
		while(cRsList.next()) {

			cnt++;

			String FST_PR_T = cRsList.getString("FST_PR");
			String ADD_PR_T = cRsList.getString("ADD_PR");
			String PRGS_PR_T = cRsList.getString("PRGS_PR");
			String HTSB_PR_T = cRsList.getString("HTSB_PR");
			String CAN_PR_T = cRsList.getString("CAN_PR");
			String SPSB_PR_T = cRsList.getString("SPSB_PR");
			String CVSB_PR_T = cRsList.getString("CVSB_PR");
			String EMSB_PR_T = cRsList.getString("EMSB_PR");
			String ETSB_PR_T = cRsList.getString("ETSB_PR");
			String DMD_PR_T = cRsList.getString("DMD_PR");
			String HDMD_PR_T = cRsList.getString("HDMD_PR");
			String SDMD_PR_T = cRsList.getString("SDMD_PR");
			String COMP_PR_T = cRsList.getString("COMP_PR");
			String COMPS_PR_T = cRsList.getString("COMPS_PR");
			String PSNLT_PR_T = cRsList.getString("PSNLT_PR");
			String PSNL_PR_T = cRsList.getString("PSNL_PR");
			String PSNLP_PR_T = cRsList.getString("PSNLP_PR");
			String EXAM_PR_T = cRsList.getString("EXAM_PR");
%>
			<z:row
<%
			if(! FST_PR_T.equals("")) {
%>
		 		FST_PR='<%= FST_PR_T%>'
<%
			}

			if(! ADD_PR_T.equals("")) {
%>
		 		ADD_PR='<%= ADD_PR_T%>'
<%
			}

			if(! PRGS_PR_T.equals("")) {
%>
		 		PRGS_PR='<%= PRGS_PR_T%>'
<%
			}

			if(! HTSB_PR_T.equals("")) {
%>
		 		HTSB_PR='<%= HTSB_PR_T%>'
<%
			}

			if(! CAN_PR_T.equals("")) {
%>
		 		CAN_PR='<%= CAN_PR_T%>'
<%
			}

			if(! SPSB_PR_T.equals("")) {
%>
		 		SPSB_PR='<%= SPSB_PR_T%>'
<%
			}

			if(! CVSB_PR_T.equals("")) {
%>
		 		CVSB_PR='<%= CVSB_PR_T%>'
<%
			}

			if(! EMSB_PR_T.equals("")) {
%>
		 		EMSB_PR='<%= EMSB_PR_T%>'
<%
			}

			if(! ETSB_PR_T.equals("")) {
%>
		 		ETSB_PR='<%= ETSB_PR_T%>'
<%
			}

			if(! DMD_PR_T.equals("")) {
%>
		 		DMD_PR='<%= DMD_PR_T%>'
<%
			}

			if(! HDMD_PR_T.equals("")) {
%>
		 		HDMD_PR='<%= HDMD_PR_T%>'
<%
			}

			if(! SDMD_PR_T.equals("")) {
%>
		 		SDMD_PR='<%= SDMD_PR_T%>'
<%
			}

			if(! COMP_PR_T.equals("")) {
%>
		 		COMP_PR='<%= COMP_PR_T%>'
<%
			}

			if(! COMPS_PR_T.equals("")) {
%>
		 		COMPS_PR='<%= COMPS_PR_T%>'
<%
			}

			if(! PSNLT_PR_T.equals("")) {
%>
		 		PSNLT_PR='<%= PSNLT_PR_T%>'
<%
			}

			if(! PSNL_PR_T.equals("")) {
%>
		 		PSNL_PR='<%= PSNL_PR_T%>'
<%
			}

			if(! PSNLP_PR_T.equals("")) {
%>
		 		PSNLP_PR='<%= PSNLP_PR_T%>'
<%
			}

			if(! EXAM_PR_T.equals("")) {
%>
		 		EXAM_PR='<%= EXAM_PR_T%>'
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
