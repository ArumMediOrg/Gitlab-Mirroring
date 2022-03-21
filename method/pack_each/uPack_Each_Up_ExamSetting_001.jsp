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

		String CBEXGN_CDYN = htMethod.get("CBEXGN_CDYN");
		String CBEXGN_CD = htMethod.get("CBEXGN_CD");
		String CBBLPT_CDYN = htMethod.get("CBBLPT_CDYN");
		String CBBLPT_CD = htMethod.get("CBBLPT_CD");
		String EDSRCH_ITYN = htMethod.get("EDSRCH_ITYN");
		String EDSRCH_IT = htMethod.get("EDSRCH_IT");
		String GSYSDATE = htMethod.get("GSYSDATE");

		//
		if(CBEXGN_CDYN == null) { CBEXGN_CDYN = ""; }
		if(CBEXGN_CD == null) { CBEXGN_CD = ""; }
		if(CBBLPT_CDYN == null) { CBBLPT_CDYN = ""; }
		if(CBBLPT_CD == null) { CBBLPT_CD = ""; }
		if(EDSRCH_ITYN == null) { EDSRCH_ITYN = ""; }
		if(EDSRCH_IT == null) { EDSRCH_IT = ""; }
		if(GSYSDATE == null) { GSYSDATE = ""; }

		// DB객체
		stmtList = connect.createStatement();

		sql = " SELECT LTRIM(RTRIM(A.IIM_ITEM_CD)) ITEM_CD, LTRIM(RTRIM(A.IIM_OSCD_CD))|| CASE WHEN NVL(IIM_NITEM_CD,' ') = ' ' THEN '' ELSE ' ['||IIM_NITEM_CD||']' END OCS_CD, LTRIM(RTRIM(A.IIM_KNME_NM)) ITEM_NM, A.IIM_EXGN_CD, A.IIM_NITEM_CD OLD_CD, NVL(B.IIP_JCSG_PR, 0) ITEM_JC, NVL(B.IIP_GBSG_PR, 0) ITEM_GB, NVL(B.IIP_HESG_PR, 0) ITEM_HE";
		sql += " FROM IT_ITEM A, IT_ITEM_PRICE B";
		sql += " WHERE UPPER(A.IIM_USE_YN) = 'Y'";

		if(CBEXGN_CDYN.equals("Y")) {
			sql += " AND A.IIM_EXGN_CD = '" + CBEXGN_CD + "'";
		}

		if(CBBLPT_CDYN.equals("Y")) {
			sql += " AND A.IIM_BLPT_CD = '" + CBBLPT_CD + "'";
		}

		if(EDSRCH_ITYN.equals("Y")) {
			sql += " AND ((UPPER(A.IIM_KNME_NM) LIKE UPPER('%" + EDSRCH_IT + "%')) ";
            sql += " OR   (A.IIM_ITEM_CD  = '" + EDSRCH_IT + "' ) ";
            sql += " OR   (A.IIM_NITEM_CD = '" + EDSRCH_IT + "' ) ";
            sql += " OR   (A.IIM_OSCD_CD  = '" + EDSRCH_IT + "' ) ) ";
		}

		sql += " AND B.IIP_APLY_DT = GETITEM_PRICE_APPLYDATE(A.IIM_ITEM_CD, '" + GSYSDATE + "', 'ITEM_CD')";
		sql += " AND B.IIP_ITEM_CD = A.IIM_ITEM_CD";
		sql += " AND UPPER(B.IIP_USE_YN) = 'Y'";
		sql += " ORDER BY A.IIM_ITEM_CD";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uPack_Each_Up_ExamSetting_001 \n";
			G_INFO += "설명 : 아이템 정보 로딩 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " CBEXGN_CDYN : " + CBEXGN_CDYN + " \n";
			G_INFO += " CBEXGN_CD : " + CBEXGN_CD + " \n";
			G_INFO += " CBBLPT_CDYN : " + CBBLPT_CDYN + " \n";
			G_INFO += " CBBLPT_CD : " + CBBLPT_CD + " \n";
			G_INFO += " EDSRCH_ITYN : " + EDSRCH_ITYN + " \n";
			G_INFO += " EDSRCH_IT : " + EDSRCH_IT + " \n";
			G_INFO += " GSYSDATE : " + GSYSDATE + " \n";
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
			} else if (rsmd.getColumnTypeName(colCnt).equals("DATE")){  //why doesn't working?
				//<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
				dataType = "dateTime";
				maxLength = "20";
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
