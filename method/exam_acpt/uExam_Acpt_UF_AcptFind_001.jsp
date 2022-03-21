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

		String ENCRT_KD = htMethod.get("ENCRT_KD");
		String EXAM_DT = htMethod.get("EXAM_DT");
		String EXAM_SQ = htMethod.get("EXAM_SQ");

		//
		if(ENCRT_KD == null) { ENCRT_KD = ""; }
		if(EXAM_DT == null) { EXAM_DT = ""; }
		if(EXAM_SQ == null) { EXAM_SQ = ""; }

		// DB객체
		stmtList = connect.createStatement();

		if(ENCRT_KD.equals("2")) {
			sql = "SELECT ECL_DECRYPT(B.ICR_PID_EN) AS ICR_PENL_DE";
		} else {
			sql = "SELECT B.ICR_PENL_ID AS ICR_PENL_DE";
		}
		sql += ", B.ICR_PID_EN, B.ICR_PENL_ID, B.ICR_NTNA_CD, B.ICR_INFO_YN, B.ICR_INFORE_YN, B.ICR_REGION_CD, B.ICR_CUST_TX, C.ICY_COMP_NM, C.ICY_COTK_CD, C.ICY_COMP_TX";
		sql += ", A.*";
		sql += ", F_CODE_FIND('0401', A.EEA_EXAM_CD, '', '1') AS EEA_EXAM_NM";
		sql += ", CASE WHEN A.EEA_HTSB_YN = 'Y' THEN F_CODE_FIND('0401', A.EEA_HTSB_CD, '', '1') ELSE '' END AS EEA_HTSB_NM";
		sql += ", CASE WHEN A.EEA_SPSB_YN = 'Y' THEN F_CODE_FIND('0401', A.EEA_SPSB_CD, '', '1') ELSE '' END AS EEA_SPSB_NM";
		sql += ", CASE WHEN A.EEA_EMSB_YN = 'Y' THEN '채용' ELSE '' END AS EEA_EMSB_NM";
		sql += ", CASE WHEN A.EEA_CVSB_YN = 'Y' THEN '뇌심' ELSE '' END AS EEA_CVSB_NM";
		sql += ", CASE WHEN A.EEA_ETSB_YN = 'Y' THEN '기타' ELSE '' END AS EEA_ETSB_NM";
		sql += ", CASE WHEN SUBSTR(A.EEA_EXAM_CD, 1, 1) = '4' OR SUBSTR(A.EEA_SPSB_CD, 1, 1) = '4' THEN F_CODE_FIND('0910', A.EEA_SPCL_CD, '', '1') || '  |  ' || F_CODE_FIND('0911', A.EEA_SPHT_CD, '', '1') ELSE ' ' END AS EEA_SPCL_NM";
		sql += ", F_CODE_FIND('0703', B.ICR_NTNA_CD, '', '1') EEA_NTNA_NM";
		sql += ", F_CODE_FIND('0723', B.ICR_REGION_CD, '', '1') EEA_REGN_NM";
		sql += ", F_CODE_FIND('0908', A.EEA_CNTR_CD, '', '1') EEA_CNTR_NM";
		sql += ", F_CODE_FIND('0989', A.EEA_DISC_RC, '', '1') EEA_DISC_NM";
		sql += ", F_CODE_FIND('0987', A.EEA_CNTB_RC, '', '1') EEA_CNTB_NM";
		sql += ", F_USER_FIND(A.EEA_INPT_ID) EEA_INPT_NM";
		sql += " FROM ET_EXAM_ACPT A LEFT OUTER JOIN IT_CUSTOMER B";
		sql += " ON B.ICR_CUST_NO = A.EEA_CUST_NO";
		sql += " LEFT OUTER JOIN IT_COMPANY C";
		sql += " ON C.ICY_COMP_CD = A.EEA_COMP_CD";
		sql += " WHERE A.EEA_EXAM_DT = '" + EXAM_DT + "'";
		sql += " AND A.EEA_EXAM_SQ = '" +  EXAM_SQ + "'";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uExam_Acpt_UF_AcptFind_001 \n";
			G_INFO += "설명 : 개별 접수 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " ENCRT_KD : " + ENCRT_KD + " \n";
			G_INFO += " EXAM_DT : " + EXAM_DT + " \n";
			G_INFO += " EXAM_SQ : " + EXAM_SQ + " \n";
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
