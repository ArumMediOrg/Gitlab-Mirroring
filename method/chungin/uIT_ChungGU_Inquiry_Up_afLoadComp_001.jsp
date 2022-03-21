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

		String SBILL_DT = htMethod.get("SBILL_DT");
		String EBILL_DT = htMethod.get("EBILL_DT");
		String SSQL_ADD = htMethod.get("SSQL_ADD");

		//
		if(SBILL_DT == null) { SBILL_DT = ""; }
		if(EBILL_DT == null) { EBILL_DT = ""; }
		if(SSQL_ADD == null) { SSQL_ADD = ""; }

		// DB객체
		stmtList = connect.createStatement();

		sql = " SELECT A.BBC_COMP_CD, B.ICY_COMP_NM, A.BBC_BILL_DT, A.BBC_BILL_NO";
		sql += ", CASE WHEN A.BBC_BILL_KD='31' THEN '일반' WHEN A.BBC_BILL_KD='32' THEN '특검' WHEN A.BBC_BILL_KD='90' THEN '학생' WHEN A.BBC_BILL_KD='99' THEN '전체' ELSE '급여' END BBC_BILL_KD";
		sql += ", A.BBC_BILL_CT, A.BBC_BILL_PR, C.IAU_PENL_NM ICY_J_NM, D.IAU_PENL_NM ICY_T_NM";
		sql += ", CASE WHEN A.BBC_RECE_KD='2' THEN '수납' ";
		sql += "       WHEN A.BBC_RECE_KD='1' THEN '일부' ";
		sql += "       ELSE ' ' END BBC_RECE_KD ";
		sql += ", A.BBC_CST_DT || ' - ' || A.BBC_CET_DT AS ACPDT";
		sql += ", BBC_CTAX_NO, A.BBC_MODI_DTT, A.BBC_MODI_ID, A.BBC_BILL_ETC ";
		sql += ", BBC_BOOK_DT, BBC_BILL_TX ";
		sql += " FROM BT_BILL_COMP A LEFT OUTER JOIN IT_COMPANY B";
		sql += " ON A.BBC_COMP_CD = B.ICY_COMP_CD LEFT OUTER JOIN IT_AUTH_USER C";
		sql += " ON B.ICY_SALE_ID = C.IAU_EMP_NO LEFT OUTER JOIN IT_AUTH_USER D";
		sql += " ON B.ICY_SSUB_ID = D.IAU_EMP_NO";
		sql += " WHERE 0=0";
		sql += " AND BBC_BILL_DT >= '" + SBILL_DT + "'";
		sql += " AND BBC_BILL_DT <= '" + EBILL_DT + "'";
		sql += SSQL_ADD;

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uIT_ChungGU_Inquiry_Up_afLoadComp_001 \n";
			G_INFO += "설명 : 청구사업장내역조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " SBILL_DT : " + SBILL_DT + " \n";
			G_INFO += " EBILL_DT : " + EBILL_DT + " \n";
			G_INFO += " SSQL_ADD : " + SSQL_ADD + " \n";
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
