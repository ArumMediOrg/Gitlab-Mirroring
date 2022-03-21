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

		String EXAM_SDT = htMethod.get("EXAM_SDT");
		String EXAM_EDT = htMethod.get("EXAM_EDT");
		String COMP_CD = htMethod.get("COMP_CD");
		String PLCE_CD = htMethod.get("PLCE_CD");
		String ACPT_CD = htMethod.get("ACPT_CD");
		String PARAM_TX = htMethod.get("PARAM_TX");

		//
		if(EXAM_SDT == null) { EXAM_SDT = ""; }
		if(EXAM_EDT == null) { EXAM_EDT = ""; }
		if(COMP_CD == null) { COMP_CD = ""; }
		if(PLCE_CD == null) { PLCE_CD = ""; }
		if(ACPT_CD == null) { ACPT_CD = ""; }
		if(PARAM_TX == null) { PARAM_TX = ""; }

		// DB객체
		stmtList = connect.createStatement();


		sql = " SELECT A.EEA_EXAM_DT, A.EEA_CHART_NO, A.EEA_PSNL_NM, A.EEA_SEX_CD, A.EEA_PSNL_AGE, ";
		sql += " 	F_PID(F_PERID_FIND(A.EEA_CUST_NO, '0')) EEA_PSNL_ID, A.EEA_ACPT_CD, ";
		sql += " 	CASE WHEN A.EEA_ACPT_CD = '1' THEN '개인' ";
		sql += " 			WHEN A.EEA_ACPT_CD = '2' THEN '사업장' ";
		sql += " 			WHEN A.EEA_ACPT_CD = '3' THEN '단체' ";
		sql += " 			WHEN A.EEA_ACPT_CD = '4' THEN '해외' END EEA_ACPT_NM,  ";
		sql += " 	F_TEL_FORMAT(A.EEA_MOBL_NO) EEA_MOBL_NO, ";
		sql += " 	F_COMP_FIND(A.EEA_COMP_CD) EEA_COMP_NM, ";
		sql += " 	B.ERI_ITEM_CD, B.ERI_OCS_CD, D.IIM_KNME_NM, D.IIM_ENME_NM, D.IIM_SNME_NM ";
		sql += " FROM ET_EXAM_ACPT A, ET_RSLT_ITEM B, CT_COMMON C, IT_ITEM D ";
		sql += " WHERE A.EEA_EXAM_DT BETWEEN '" + EXAM_SDT + "' AND '" + EXAM_EDT + "'  ";
		sql += " AND A.EEA_ORDER_YN <> 'C'  ";

		if(!COMP_CD.equals("")){
			sql += " AND A.EEA_COMP_CD = '" + COMP_CD + "' ";
		}

		if(!PLCE_CD.equals("")){
			sql += " AND A.EEA_PLCE_CD = '" + PLCE_CD + "' ";
		}

		if(!ACPT_CD.equals("")){
			sql += " AND A.EEA_ACPT_CD = '" + ACPT_CD + "' ";
		}

		sql += " AND B.ERI_EXAM_DT = A.EEA_EXAM_DT ";
		sql += " AND B.ERI_EXAM_SQ = A.EEA_EXAM_SQ ";
		sql += " AND B.ERI_CNCL_YN <> 'Y' ";
		sql += " AND C.CCN_LARGE = '9904' ";
		sql += " AND C.CCN_LEVEL = '5' ";
		sql += " AND C.CCN_USE_YN = 'Y' ";
		sql += " AND C.CCN_VALUE = B.ERI_ITEM_CD ";
		sql += " AND D.IIM_ITEM_CD = B.ERI_ITEM_CD ";

		sql += PARAM_TX;

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uAcpt_List_btnAcpt_SrchClick_008 \n";
			G_INFO += "설명 : 영상검사 현황 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " EXAM_SDT : " + EXAM_SDT + " \n";
			G_INFO += " EXAM_EDT : " + EXAM_EDT + " \n";
			G_INFO += " COMP_CD : " + COMP_CD + " \n";
			G_INFO += " PLCE_CD : " + PLCE_CD + " \n";
			G_INFO += " ACPT_CD : " + ACPT_CD + " \n";
			G_INFO += " PARAM_TX : " + PARAM_TX + " \n";

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

				if (rsmd.getColumnTypeName(colCnt).equals("BLOB")){
					byte[] buf_BLOB = rsList.getBytes(rsmd.getColumnName(colCnt));
					if(buf_BLOB != null) {
						tempData = new String(buf_BLOB);
					}
				}

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
