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
		String RSVN_NO = htMethod.get("RSVN_NO");

		//
		if(ENCRT_KD == null) { ENCRT_KD = ""; }
		if(RSVN_NO == null) { RSVN_NO = ""; }

		// DB객체
		stmtList = connect.createStatement();

		if(ENCRT_KD.equals("2")) {
	  		sql = " SELECT ECL_DECRYPT(B.ICR_PID_EN) AS ICR_PENL_DE";
		} else {
			sql = " SELECT B.ICR_PENL_ID AS ICR_PENL_DE";
		}

		sql += " , B.ICR_PID_EN, B.ICR_NTNA_CD, B.ICR_REGION_CD, B.ICR_CUST_TX, ";
		sql += " CASE WHEN NVL(B.ICR_CUST_NO, ' ') = ' ' THEN 'N' ELSE 'Y' END AS ICR_YESNO, ";
		sql += " A.*, ";
		sql += " F_CODE_FIND('0703', B.ICR_NTNA_CD, '', '1') RRT_NTNA_NM, ";
		sql += " F_CODE_FIND('0723', B.ICR_REGION_CD, '', '1') RRT_REGN_NM, ";
		sql += " F_CODE_FIND('0908', A.RRT_CNTR_CD, '', '1') RRT_CNTR_NM, ";
		sql += " F_CODE_FIND('0989', A.RRT_DISC_RC, '', '1') RRT_DISC_NM, ";
		sql += " F_CODE_FIND('0987', A.RRT_CNTB_RC, '', '1') RRT_CNTB_NM, ";
		sql += " C.ICY_COMP_NM, C.ICY_COTK_CD, C.ICY_COMP_TX";
		sql += " FROM RT_RSVT A LEFT OUTER JOIN IT_CUSTOMER B";
		sql += " ON B.ICR_CUST_NO = A.RRT_CUST_NO LEFT OUTER JOIN IT_COMPANY C";
		sql += " ON C.ICY_COMP_CD = A.RRT_COMP_CD";
		sql += " WHERE A.RRT_RSVN_NO = '" + RSVN_NO + "'";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uFM_AcptComm_GF_RsvnDataFind_001 \n";
			G_INFO += "설명 : 개별예약 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " ENCRT_KD : " + ENCRT_KD + " \n";
			G_INFO += " RSVN_NO : " + RSVN_NO + " \n";
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
