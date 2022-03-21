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

		String SCHUNG_DT = htMethod.get("SCHUNG_DT");
		String ECHUNG_DT = htMethod.get("ECHUNG_DT");

		//
		if(SCHUNG_DT == null) { SCHUNG_DT = ""; }
		if(ECHUNG_DT == null) { ECHUNG_DT = ""; }

		// DB객체
		stmtList = connect.createStatement();

		sql = " SELECT ";
		sql += " BBP_CHUNG_YY,          BBP_CHUNG_KD,          BBP_CHUNG_DT,     BBP_CHUNG_NO, ";
		sql += " BBP_BILBE_NO,          BBP_BILL_FL,           BBH_ACPT_NO,                   ";
		sql += " MIN(BBP_EXAM_DT) STDT, MAX(BBP_EXAM_DT) EDDT,                                ";
		sql += " COUNT(*) CNT,                                                                ";
		sql += " SUM(BBP_BILLFIR_PR)  AMT1, ";
		sql += " SUM(BBP_BILLCAN_PR)  AMT2, SUM(BBP_BILLCANFN_PR) AMT3, ";
		sql += " SUM(BBP_BILLORAL_PR) AMT4, ";
		sql += " SUM(BBP_BILLOS_PR)   AMT5, SUM(BBP_BILLOSC_PR) AMT6,   SUM(BBP_BILLOSD_PR) AMT7, ";
		sql += " C.BBC_BILL_FL, C.BBC_RETURN_KD ";
		sql += " FROM BT_BILLHN_PR A                                              ";
		sql += " LEFT OUTER JOIN BT_BILL_HNHIS B ON  A.BBP_BILL_FL = B.BBH_BILL_FL ";
		sql += " LEFT OUTER JOIN BT_BILL_COMP C On  C.BBC_BILL_FL = A.BBP_BILL_FL AND NVL(C.BBC_RETURN_KD, '0') <> '1' ";
		sql += " WHERE BBP_CHUNG_DT >= '" + SCHUNG_DT + "'                     ";
		sql += " AND BBP_CHUNG_DT <= '" + ECHUNG_DT + "'                       ";
		sql += " AND BBP_RETURN_KD = '0'                              ";
		sql += " GROUP BY  BBP_CHUNG_YY, BBP_CHUNG_KD, BBP_CHUNG_DT, ";
        sql += "             BBP_CHUNG_NO, BBP_BILBE_NO,   BBP_BILL_FL, ";
        sql += "             BBH_ACPT_NO, C.BBC_BILL_FL, C.BBC_RETURN_KD ";
		sql += " ORDER BY BBP_CHUNG_DT, BBP_CHUNG_NO ";



			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : ubT_Rece_Up_afLoadGunbo_001 \n";
			G_INFO += "설명 : 건보청구파일 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " SCHUNG_DT : " + SCHUNG_DT + " \n";
			G_INFO += " ECHUNG_DT : " + ECHUNG_DT + " \n";
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
