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

		String ENCRT_KD = htMethod.get("ENCRT_KD");
		String EXAM_SDT = htMethod.get("EXAM_SDT");
		String EXAM_EDT = htMethod.get("EXAM_EDT");
		String MNGT_YM = htMethod.get("MNGT_YM");
		String PARAM_TX1 = htMethod.get("PARAM_TX1");
		String ORDER_BY = htMethod.get("ORDER_BY");
		String ITEM_CD = htMethod.get("ITEM_CD");

		//

		if(ENCRT_KD == null) { ENCRT_KD = ""; }
		if(EXAM_SDT == null) { EXAM_SDT = ""; }
		if(EXAM_EDT == null) { EXAM_EDT = ""; }
		if(MNGT_YM == null) { MNGT_YM = ""; }
		if(PARAM_TX1 == null) { PARAM_TX1 = ""; }
		if(ORDER_BY == null) { ORDER_BY = ""; }
		if(ITEM_CD == null) { ITEM_CD = ""; }

		// DB객체
		stmtList = connect.createStatement();

		if(ENCRT_KD.equals("1")){
			sql = " SELECT Distinct B.ICR_PID_EN  ICR_PENL_DE,  ";
		}
		else if(ENCRT_KD.equals("2")){
			sql = " SELECT Distinct ECHELONDB.ECL_DECRYPT(B.ICR_PID_EN) ICR_PENL_DE,  ";
		}
		else {
			sql = " SELECT Distinct B.ICR_PENL_ID ICR_PENL_DE, ";
		}

		sql += " 	A.EEA_EXAM_DT, A.EEA_CUST_NO, A.EEA_PSNL_NM, SUBSTR(B.ICR_PENL_ID,1,6) EEA_BIRTH_DT, B.ICR_BIRH_KD, A.EEA_EXAM_SQ, ";
		sql += " 	A.EEA_PSNL_AGE, A.EEA_TEL_NO, A.EEA_MOBL_NO, C.ICY_COMP_CD, C.ICY_COMP_NM, A.EEA_PLCE_CD, A.EEA_COMP_CD, ";
		sql += " 	CASE WHEN A.EEA_EXAM_CD = '41001' OR A.EEA_SPSB_YN = 'Y' THEN '1' ELSE '2' END EEA_SPCH_KD, ";
		sql += " 	A.EEA_EXAM_CD, A.EEA_HDMD_YN, A.EEA_SDMD_YN, A.EEA_SPCL_LT, A.EEA_SPCL_CD, A.EEA_SPHT_CD, ";
		sql += " 	A.EEA_CHART_NO, A.EEA_ADD_DT, A.EEA_ACPT_TX, A.EEA_DEPT_NM ";
		sql += " , A.EEA_2ND_YN, E.SIR_EXAM_DT2, D.SPG_PANJ_CD ";
		sql += " FROM ET_EXAM_ACPT A ";
		sql += " 			INNER JOIN IT_CUSTOMER  B ON A.EEA_CUST_NO = B.ICR_CUST_NO ";
		sql += " 	LEFT OUTER JOIN IT_COMPANY   C ON A.EEA_COMP_CD = C.ICY_COMP_CD ";
		sql += " 	LEFT OUTER JOIN  ST_PANJUNG D On A.EEA_EXAM_DT = D.SPG_EXAM_DT AND A.EEA_EXAM_SQ = D.SPG_EXAM_SQ AND D.SPG_PANJ_CD = '9' ";
		sql += "    LEFT OUTER JOIN ST_ITEM_RECHECK E On D.SIR_EXAM_DT = A.EEA_EXAM_DT AND D.SIR_EXAM_SQ = A.EEA_EXAM_SQ ";
		sql += " WHERE A.EEA_EXAM_DT >= '" + EXAM_SDT + "' ";
		sql += " AND A.EEA_EXAM_DT <= '" + EXAM_EDT + "' ";
		sql += " AND SUBSTR(A.EEA_MNGT_SPYM,1,4) = '" + MNGT_YM + "' ";
		sql += " AND A.EEA_ORDER_YN <> 'C' ";

		sql += PARAM_TX1;
		sql += ORDER_BY;

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uSP_HEALTH_CUSTLIST_UF_SqlSet_007 \n";
			G_INFO += "설명 : 07-유해인자별 2차명단 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " ENCRT_KD : " + ENCRT_KD + " \n";
			G_INFO += " EXAM_SDT : " + EXAM_SDT + " \n";
			G_INFO += " EXAM_EDT : " + EXAM_EDT + " \n";
			G_INFO += " MNGT_YM : " + MNGT_YM + " \n";
			G_INFO += " PARAM_TX1 : " + PARAM_TX1 + " \n";
			G_INFO += " ORDER_BY : " + ORDER_BY + " \n";
			G_INFO += " ITEM_CD : " + ITEM_CD + " \n";
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
