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

	ResultSetMetaData rsmd = null;
	int colCnt = 0;

	try {
%>
<%@ include file="/inc_prg/connect.jsp"%>
<%
		// 전달자료
		htData = (HashMap<String, Object>)request.getAttribute("htData");
		htMethod = (HashMap<String, String>)request.getAttribute("htMethod_1");

		String SEXAM_DT = htMethod.get("SEXAM_DT");
		String EEXAM_DT = htMethod.get("EEXAM_DT");
		String SCOMP_CD = htMethod.get("SCOMP_CD");
		String SCMBSP_GUBN = htMethod.get("SCMBSP_GUBN");

		//
		if(SEXAM_DT == null) { SEXAM_DT = ""; }
		if(EEXAM_DT == null) { EEXAM_DT = ""; }
		if(SCOMP_CD == null) { SCOMP_CD = ""; }
		if(SCMBSP_GUBN == null) { SCMBSP_GUBN = ""; }

		// DB객체
		stmtList = connect.createStatement();

		if(SCMBSP_GUBN.equals("0")){
			sql = " Select B.EEA_DIVI_NO, B.EEA_PSNL_NM, C.ICR_PENL_ID As ICR_PENL_DE, B.EEA_EXAM_CD, ";
			sql += " 		A.SPG_EXAM_DT As Exam_Dt, A.SPG_SOKY_CD, A.SPG_SOKY_NM, A.SPG_EXAM_SQ As EXAM_SQ, ";
			sql += " 		B.EEA_SPCL_CD, ' ' As EEA_HTSB_CD, ";
			sql += " 		GetSP_COMMON_cdToNm('HM05E',SPG_PANJ_CD)  SPG_PANJ_NM ";
			sql += " From ST_PANJUNG A ";
			sql += " INNER JOIN ET_EXAM_ACPT B On A.SPG_EXAM_DT = B.EEA_EXAM_DT ";
			sql += " 									And A.SPG_EXAM_SQ = B.EEA_EXAM_SQ ";
			sql += " 									And (SUBSTR(B.EEA_EXAM_CD,1,2) = '41' or ";
			sql += " 										SUBSTR(B.EEA_EXAM_CD,1,2) = '42' ) ";
			sql += " INNER JOIN IT_CUSTOMER  C ON B.EEA_CUST_NO = C.ICR_CUST_NO ";
			sql += " Where A.SPG_EXAM_DT >= '" + SEXAM_DT + "' ";
			sql += " And A.SPG_EXAM_DT <= '" + EEXAM_DT + "' ";
			sql += " And A.SPG_SOKY_CD <> ' ' ";

			if (!SCOMP_CD.equals("")){
				sql += " And B.EEA_COMP_CD = '" + SCOMP_CD + "' ";
			}

			sql += " Union ";
			sql += " Select B.EEA_DIVI_NO, B.EEA_PSNL_NM, C.ICR_PENL_ID As ICR_PENL_DE, B.EEA_EXAM_CD, ";
			sql += " 		A.PFP_EXAM_DT As Exam_Dt, ' ' As SPG_SOKY_CD, ' ' As SPG_SOKY_NM, ";
			sql += " 		A.PFP_EXAM_SQ As EXAM_SQ, B.EEA_SPCL_CD, B.EEA_HTSB_CD, ' ' SPG_PANJ_NM ";
			sql += " From PT_FIR_PANJUNG A ";
			sql += " INNER JOIN ET_EXAM_ACPT B On A.PFP_EXAM_DT = B.EEA_EXAM_DT ";
			sql += " 									And A.PFP_EXAM_SQ = B.EEA_EXAM_SQ ";
			sql += " 									And (SUBSTR(B.EEA_EXAM_CD,1,2) = '11' or ";
			sql += " 											SUBSTR(B.EEA_EXAM_CD,1,2) = '12' ) ";
			sql += " INNER JOIN IT_CUSTOMER  C ON B.EEA_CUST_NO = C.ICR_CUST_NO ";
			sql += " Where A.PFP_EXAM_DT >= '" + SEXAM_DT + "' ";
			sql += " And A.PFP_EXAM_DT <= '" + EEXAM_DT + "' ";
		} else if (SCMBSP_GUBN.equals("1")){
			sql = " Select B.EEA_DIVI_NO, B.EEA_PSNL_NM, C.ICR_PENL_ID As ICR_PENL_DE, B.EEA_EXAM_CD, ";
			sql += " 		A.PFP_EXAM_DT As Exam_Dt, ' ' As SPG_SOKY_CD, ' ' As SPG_SOKY_NM, ";
			sql += " 		A.PFP_EXAM_SQ As EXAM_SQ, B.EEA_SPCL_CD, B.EEA_HTSB_CD, ' ' SPG_PANJ_NM ";
			sql += " From PT_FIR_PANJUNG A ";
			sql += " INNER JOIN ET_EXAM_ACPT B On A.PFP_EXAM_DT = B.EEA_EXAM_DT ";
			sql += " 									And A.PFP_EXAM_SQ = B.EEA_EXAM_SQ ";
			sql += " 									And (SUBSTR(B.EEA_EXAM_CD,1,2) = '11' or ";
			sql += " 										SUBSTR(B.EEA_EXAM_CD,1,2) = '12' or ";
			sql += " 										SUBSTR(B.EEA_EXAM_CD,1,2) = '41' or ";
			sql += " 										SUBSTR(B.EEA_EXAM_CD,1,2) = '42') ";
			sql += " 								And (B.EEA_HTSB_CD = '11001' or ";
			sql += " 										B.EEA_HTSB_CD = '12001' or ";
			sql += " 										B.EEA_HTSB_CD = '12003' ) ";
			sql += " INNER JOIN IT_CUSTOMER  C ON B.EEA_CUST_NO = C.ICR_CUST_NO ";
			sql += " Where A.PFP_EXAM_DT >= '" + SEXAM_DT + "' ";
			sql += " And A.PFP_EXAM_DT <= '" + EEXAM_DT + "' ";
		} else if (SCMBSP_GUBN.equals("2") || SCMBSP_GUBN.equals("3")) {

			sql = " Select B.EEA_DIVI_NO, B.EEA_PSNL_NM, C.ICR_PENL_ID As ICR_PENL_DE, B.EEA_EXAM_CD, ";
			sql += " 		A.SPG_EXAM_DT As Exam_Dt, A.SPG_SOKY_CD, A.SPG_SOKY_NM, A.SPG_EXAM_SQ As EXAM_SQ, ";
			sql += " 		B.EEA_SPCL_CD, ' ' As EEA_HTSB_CD, ";
			sql += " 		GetSP_COMMON_cdToNm('HM05E',SPG_PANJ_CD)  SPG_PANJ_NM ";
			sql += " From ST_PANJUNG A ";
			sql += " INNER JOIN ET_EXAM_ACPT B On A.SPG_EXAM_DT = B.EEA_EXAM_DT ";
			sql += " 									And A.SPG_EXAM_SQ = B.EEA_EXAM_SQ ";

			if(SCMBSP_GUBN.equals("2")){
				sql += " And SUBSTR(B.EEA_EXAM_CD,1,2) = '41' ";
			} else if (SCMBSP_GUBN.equals("3")) {
				sql += " And SUBSTR(B.EEA_EXAM_CD,1,2) = '42' ";
			}

			sql += " INNER JOIN IT_CUSTOMER  C ON B.EEA_CUST_NO = C.ICR_CUST_NO ";
			sql += " Where A.SPG_EXAM_DT >= '" + SEXAM_DT + "' ";
			sql += " And A.SPG_EXAM_DT <= '" + EEXAM_DT + "' ";
			sql += " And A.SPG_SOKY_CD <> ' ' ";

		} else if (SCMBSP_GUBN.equals("4")){

			sql = " Select B.EEA_DIVI_NO, B.EEA_PSNL_NM, C.ICR_PENL_ID As ICR_PENL_DE, B.EEA_EXAM_CD, ";
			sql += " 		A.SPG_EXAM_DT As Exam_Dt, A.SPG_SOKY_CD, A.SPG_SOKY_NM, A.SPG_EXAM_SQ As EXAM_SQ, ";
			sql += " 		B.EEA_SPCL_CD, ' ' As EEA_HTSB_CD, ";
			sql += " 		GetSP_COMMON_cdToNm('HM05E',SPG_PANJ_CD)  SPG_PANJ_NM ";
			sql += " From ST_PANJUNG A ";
			sql += " INNER JOIN ET_EXAM_ACPT B On A.SPG_EXAM_DT = B.EEA_EXAM_DT ";
			sql += " 									And A.SPG_EXAM_SQ = B.EEA_EXAM_SQ ";
			sql += " 									And (SUBSTR(B.EEA_EXAM_CD,1,2) = '41' or ";
			sql += " 										SUBSTR(B.EEA_EXAM_CD,1,2) = '42' ) ";
			sql += " 									And EEA_SPCL_CD = '07' ";
			sql += " INNER JOIN IT_CUSTOMER  C ON B.EEA_CUST_NO = C.ICR_CUST_NO ";
			sql += " Where A.SPG_EXAM_DT >= '" + SEXAM_DT + "' ";
			sql += " And A.SPG_EXAM_DT <= '" + EEXAM_DT + "' ";
			sql += " And A.SPG_SOKY_CD <> ' ' ";
		}

		if(!SCOMP_CD.equals("")){
			sql += " And B.EEA_COMP_CD = '" + SCOMP_CD + "' ";
		}


		sql += " Order By Exam_Dt, EXAM_SQ ";


			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uSAnsan_Kumc_XML_COM_002 \n";
			G_INFO += "설명 : 현대기아 환자정보 및 판정소견 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " SEXAM_DT : " + SEXAM_DT + " \n";
			G_INFO += " EEXAM_DT : " + EEXAM_DT + " \n";
			G_INFO += " SCOMP_CD : " + SCOMP_CD + " \n";
			G_INFO += " SCMBSP_GUBN : " + SCMBSP_GUBN + " \n";
			G_INFO += "\n\n";

			G_INFO += "질의문 : " + sql + " \n";
			G_INFO += "-->";

		rsList = stmtList.executeQuery(sql);
		cRsList = new CRs(rsList);

		rsmd = rsList.getMetaData();  //Select 결과의 Metadata 가져오기.

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
<%
		for (colCnt = 1; colCnt <= rsmd.getColumnCount(); colCnt++){
			String dataType = "string";
			String maxLength = "4000";

			if (rsmd.getColumnTypeName(colCnt).equals("BLOB")){
				dataType = "bin.hex";
				maxLength = "2147483647";
				//<s:datatype dt:type='bin.hex' dt:maxLength='2147483647' rs:long='true'/>
			} else if (rsmd.getColumnTypeName(colCnt).equals("CLOB")){
				maxLength = "1073741823";
				//<s:datatype dt:type='string' dt:maxLength='1073741823' rs:long='true'/>
			}
%>
		<s:AttributeType name='<%= rsmd.getColumnName(colCnt)%>' rs:number='<%= Integer.toString(colCnt)%>' rs:writeunknown='true' rs:basetable='DUAL' rs:basecolumn='<%= rsmd.getColumnName(colCnt)%>'>
			<s:datatype dt:type='<%= dataType%>' dt:maxLength='<%= maxLength%>' <% if (! maxLength.equals("4000")) { %> rs:long='true' <% } %>/>
		</s:AttributeType>
<%
		}
%>
		<s:AttributeType name='ROWID' rs:number='<%= Integer.toString(colCnt)%>' rs:rowid='true' rs:writeunknown='true' rs:basetable='DUAL'
			 rs:basecolumn='ROWID' rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:extends type='rs:rowbase'/>
	</s:ElementType>
</s:Schema>		<rs:data>
<%
		int cnt = 0;
		while(cRsList.next()) {

			cnt++;

			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			for (colCnt = 1; colCnt <= rsmd.getColumnCount(); colCnt++){
				String tempData = cRsList.getString(rsmd.getColumnName(colCnt));
				if(! tempData.equals("")) {
%>
		 			<%= rsmd.getColumnName(colCnt)%>='<%= tempData%>'
<%
				}
			}
%>
				ROWID='<%= cnt%>'
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
