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

	ResultSetMetaData rsmd = null;

	CRs cRsList = null;

	//
	String G_INFO = "";

	int colCnt = 0;

	try {
%>
<%@ include file="/inc_prg/connect.jsp"%>
<%
		// 전달자료
		htData = (HashMap<String, Object>)request.getAttribute("htData");
		htMethod = (HashMap<String, String>)request.getAttribute("htMethod_1");

		String SEXAM_DT = htMethod.get("SEXAM_DT");
		String SEXAM_SQ = htMethod.get("SEXAM_SQ");

		//
		if(SEXAM_DT == null) { SEXAM_DT = ""; }
		if(SEXAM_SQ == null) { SEXAM_SQ = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*
Select
  A.ECS_RSLT_KD As RSLT_KD, A.ECS_RSLT_EX As RSLT_EX,
  B.IAU_PENL_NM As PENL_NM, '위' As CAN_KD
From ET_CANCER_STMC A
Left Outer Join IT_AUTH_USER B On B.IAU_EMP_NO  = A.ECS_LICEN_CD
Where A.ECS_EXAM_DT = :sEXAM_DT
 And A.ECS_EXAM_SQ = :sEXAM_SQ
Union
Select
  A.ECC_RSLT_KD As RSLT_KD, A.ECC_RSLT_EX As RSLT_EX,
  B.IAU_PENL_NM As PENL_NM, '대장' As CAN_KD
From ET_CANCER_COLO A
Left Outer Join IT_AUTH_USER B On B.IAU_EMP_NO  = A.ECC_LICEN_CD
Where A.ECC_EXAM_DT = :sEXAM_DT
 And A.ECC_EXAM_SQ = :sEXAM_SQ
Union
Select
  A.ECL_RSLT_KD As RSLT_KD, A.ECL_RSLT_EX As RSLT_EX,
  B.IAU_PENL_NM As PENL_NM, '간' As CAN_KD
From ET_CANCER_LIVER A
Left Outer Join IT_AUTH_USER B On B.IAU_EMP_NO  = A.ECL_LICEN_CD
Where A.ECL_EXAM_DT = :sEXAM_DT
 And A.ECL_EXAM_SQ = :sEXAM_SQ
Union
Select
  A.ECB_RSLT_KD As RSLT_KD, A.ECB_RSLT_EX As RSLT_EX,
  B.IAU_PENL_NM As PENL_NM, '유방' As CAN_KD
From ET_CANCER_BRST A
Left Outer Join IT_AUTH_USER B On B.IAU_EMP_NO  = A.ECB_LICEN_CD
Where A.ECB_EXAM_DT = :sEXAM_DT
 And A.ECB_EXAM_SQ = :sEXAM_SQ
Union
Select
  A.ECV_RSLT_KD As RSLT_KD, A.ECV_RSLT_EX As RSLT_EX,
  B.IAU_PENL_NM As PENL_NM, '자궁' As CAN_KD
From ET_CANCER_CRVC A
Left Outer Join IT_AUTH_USER B On B.IAU_EMP_NO  = A.ECV_LICEN_CD
Where A.ECV_EXAM_DT = :sEXAM_DT
 And A.ECV_EXAM_SQ = :sEXAM_SQ
Union
Select
  A.ECG_RSLT_KD As RSLT_KD, A.ECG_RSLT_EX As RSLT_EX,
  B.IAU_PENL_NM As PENL_NM, '폐' As CAN_KD
From ET_CANCER_LUNG A
Left Outer Join IT_AUTH_USER B On B.IAU_EMP_NO  = A.ECG_LICEN_CD
Where A.ECG_EXAM_DT = :sEXAM_DT
 And A.ECG_EXAM_SQ = :sEXAM_SQ


		*/

		sql = " Select ";
		sql += " A.ECS_RSLT_KD As RSLT_KD, A.ECS_RSLT_EX As RSLT_EX, ";
		sql += " B.IAU_PENL_NM As PENL_NM, '위' As CAN_KD ";
		sql += " From ET_CANCER_STMC A ";
		sql += " Left Outer Join IT_AUTH_USER B On B.IAU_EMP_NO  = A.ECS_LICEN_CD ";
		sql += " Where A.ECS_EXAM_DT = '" + SEXAM_DT + "' ";
		sql += " And A.ECS_EXAM_SQ = '" + SEXAM_SQ + "' ";
		sql += " Union ";
		sql += " Select ";
		sql += " A.ECC_RSLT_KD As RSLT_KD, A.ECC_RSLT_EX As RSLT_EX, ";
		sql += " B.IAU_PENL_NM As PENL_NM, '대장' As CAN_KD ";
		sql += " From ET_CANCER_COLO A ";
		sql += " Left Outer Join IT_AUTH_USER B On B.IAU_EMP_NO  = A.ECC_LICEN_CD ";
		sql += " Where A.ECC_EXAM_DT = '" + SEXAM_DT + "' ";
		sql += " And A.ECC_EXAM_SQ = '" + SEXAM_SQ + "' ";
		sql += " Union ";
		sql += " Select ";
		sql += " A.ECL_RSLT_KD As RSLT_KD, A.ECL_RSLT_EX As RSLT_EX, ";
		sql += " B.IAU_PENL_NM As PENL_NM, '간' As CAN_KD ";
		sql += " From ET_CANCER_LIVER A ";
		sql += " Left Outer Join IT_AUTH_USER B On B.IAU_EMP_NO  = A.ECL_LICEN_CD ";
		sql += " Where A.ECL_EXAM_DT = '" + SEXAM_DT + "' ";
		sql += " And A.ECL_EXAM_SQ = '" + SEXAM_SQ + "' ";
		sql += " Union ";
		sql += " Select ";
		sql += " A.ECB_RSLT_KD As RSLT_KD, A.ECB_RSLT_EX As RSLT_EX, ";
		sql += " B.IAU_PENL_NM As PENL_NM, '유방' As CAN_KD ";
		sql += " From ET_CANCER_BRST A ";
		sql += " Left Outer Join IT_AUTH_USER B On B.IAU_EMP_NO  = A.ECB_LICEN_CD ";
		sql += " Where A.ECB_EXAM_DT = '" + SEXAM_DT + "' ";
		sql += " And A.ECB_EXAM_SQ = '" + SEXAM_SQ + "' ";
		sql += " Union ";
		sql += " Select ";
		sql += " A.ECV_RSLT_KD As RSLT_KD, A.ECV_RSLT_EX As RSLT_EX, ";
		sql += " B.IAU_PENL_NM As PENL_NM, '자궁' As CAN_KD ";
		sql += " From ET_CANCER_CRVC A ";
		sql += " Left Outer Join IT_AUTH_USER B On B.IAU_EMP_NO  = A.ECV_LICEN_CD ";
		sql += " Where A.ECV_EXAM_DT = '" + SEXAM_DT + "' ";
		sql += " And A.ECV_EXAM_SQ = '" + SEXAM_SQ + "' ";
		sql += " Union ";
		sql += " Select ";
		sql += " A.ECG_RSLT_KD As RSLT_KD, A.ECG_RSLT_EX As RSLT_EX, ";
		sql += " B.IAU_PENL_NM As PENL_NM, '폐' As CAN_KD ";
		sql += " From ET_CANCER_LUNG A ";
		sql += " Left Outer Join IT_AUTH_USER B On B.IAU_EMP_NO  = A.ECG_LICEN_CD ";
		sql += " Where A.ECG_EXAM_DT = '" + SEXAM_DT + "' ";
		sql += " And A.ECG_EXAM_SQ = '" + SEXAM_SQ + "' ";



			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uCRM_BASIC_CRMMain_GridDisplay_024 \n";
			G_INFO += "설명 : 상담관리-접수-검사결과-암판정 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";

			G_INFO += " SEXAM_DT : " + SEXAM_DT + " \n";
			G_INFO += " SEXAM_SQ : " + SEXAM_SQ + " \n";
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
		<s:AttributeType name='ROWID' rs:number='<%= Integer.toString(colCnt)%>' rs:rowid='true' rs:basetable='DUAL' rs:basecolumn='ROWID'
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
