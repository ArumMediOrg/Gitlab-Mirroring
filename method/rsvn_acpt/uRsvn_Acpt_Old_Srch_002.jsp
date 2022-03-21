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
		String PSNL_NM = htMethod.get("PSNL_NM");
		String RSVN_ID = htMethod.get("RSVN_ID");
		String PARAM_TX = htMethod.get("PARAM_TX");
		String RSVN_YN = htMethod.get("RSVN_YN");

		//
		if(EXAM_SDT == null) { EXAM_SDT = ""; }
		if(EXAM_EDT == null) { EXAM_EDT = ""; }
		if(PSNL_NM == null) { PSNL_NM = ""; }
		if(RSVN_ID == null) { RSVN_ID = ""; }
		if(PARAM_TX == null) { PARAM_TX = ""; }
		if(RSVN_YN == null) { RSVN_YN = ""; }


		// DB객체
		stmtList = connect.createStatement();

		sql += " SELECT A.*, ";
		sql += " 	B.ICR_CUST_NO, B.ICR_PENL_ID, B.ICR_PID_EN, B.ICR_NTNA_CD, B.ICR_REGION_CD, B.ICR_CUST_TX, ";
		sql += " 	F_CODE_FIND('0703', B.ICR_NTNA_CD,   '', '1') RRO_NTNA_NM, ";
		sql += " 	F_CODE_FIND('0723', B.ICR_REGION_CD, '', '1') RRO_REGN_NM, ";
		sql += " 	C.ICY_COMP_CD, C.ICY_COMP_NM, D.EPO_PACK_NM ";
		sql += " FROM RT_RSVT_OLD A ";
		sql += " 	LEFT OUTER JOIN IT_CUSTOMER B ON B.ICR_CUST_NO = '11' || A.RRO_CHART_NO ";
		sql += " 	LEFT OUTER JOIN IT_COMPANY C  ON C.ICY_PAST_CD = A.RRO_COMP_CD ";
		sql += " 	LEFT OUTER JOIN ET_PACK_OLD D  ON D.EPO_PACK_CD = A.RRO_EXAM_LT ";
		sql += " WHERE A.RRO_EXAM_DT BETWEEN '" + EXAM_SDT + "' AND '" + EXAM_EDT + "' ";

		if (!PSNL_NM.equals("")){
			sql += " AND A.RRO_PSNL_NM LIKE '" + PSNL_NM + "%' ";
		}

		if (!RSVN_ID.equals("")){
			sql += " AND A.RRO_RSVN_ID = '" + RSVN_ID + "' ";
		}

		if (RSVN_YN.equals("Y")){
			sql += " AND A.RRO_RSVN_NO IS NOT NULL ";
		}
		else if (RSVN_YN.equals("N")){
			sql += " AND A.RRO_RSVN_NO IS NULL ";
		}


		sql += PARAM_TX;

			//
		G_INFO += "<!-- \n";
		G_INFO += "서비스명 : uRsvn_Acpt_Old_Srch_002 \n";
		G_INFO += "설명 : 구 예약자료 내역조회 \n";
		G_INFO += "\n\n";

		G_INFO += "전달인자 : \n";
		G_INFO += " EXAM_SDT : " + EXAM_SDT + " \n";
		G_INFO += " EXAM_EDT : " + EXAM_EDT + " \n";
		G_INFO += " PSNL_NM : " + PSNL_NM + " \n";
		G_INFO += " RSVN_ID : " + RSVN_ID + " \n";
		G_INFO += " PARAM_TX : " + PARAM_TX + " \n";
		G_INFO += " RSVN_YN : " + RSVN_YN + " \n";

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
