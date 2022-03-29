<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>

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

		String FROMDT = htMethod.get("FROMDT");
		String TODT = htMethod.get("TODT");
		String USE_YYYYMM = htMethod.get("USE_YYYYMM");

		//
		if(FROMDT == null) { FROMDT = ""; }
		if(TODT == null) { TODT = ""; }
		if(USE_YYYYMM == null) { USE_YYYYMM = ""; }

		// DB객체
		stmtList = connect.createStatement();

		sql = " select RKP_LOCAL_NM, RKP_EMPL_NO, RKP_EMPL_NM, RKP_DEPT_NM, ";
		sql += " 	sum(TotalPRICE) TotalPRICE ";
		sql += " from ( ";
		sql += " select RKP_LOCAL_NM, RKP_EMPL_NO, RKP_EMPL_NM, RKP_DEPT_NM, ";
		sql += " 	TotalPRICE ";
		sql += " from ";
		sql += " ( ";
		sql += " 		select AA.rrm_rece_no, AA.rrm_rece_seq, AA.rrm_rece_pr, ";
		sql += " 			AA.rrm_return_pr, nvl(AA.rrm_rece_pr,0)-nvl(AA.rrm_return_pr, 0) TotalPRICE ";
		sql += " 		from rt_rece_medichk AA ";
		sql += " 		where (AA.rrm_pay_kd = '05') ";
		sql += " 			and (AA.rrm_input_dt < '" + TODT + "') ";
		sql += " 			and (AA.rrm_input_dt >= '" + FROMDT + "') ";
		sql += " 	) RECE_INFO LEFT OUTER  join RT_KUMC_POINT_NEW B ON  ";
		sql += " 	(RECE_INFO.rrm_rece_no = B.RKP_RECE_NO) and ";
		sql += " 	(RECE_INFO.rrm_rece_seq = B.RKP_RECE_SEQ) and ";
		sql += " 	(B.RKP_USE_YYYYMM = '" + USE_YYYYMM + "') ";
		sql += " ) group by RKP_LOCAL_NM, RKP_EMPL_NO, RKP_EMPL_NM, RKP_DEPT_NM ";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uPointPrint_setData_002 \n";
			G_INFO += "설명 : 병원 포인트 사용현황 인쇄_NEW \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " FROMDT : " + FROMDT + " \n";
			G_INFO += " TODT : " + TODT + " \n";
			G_INFO += " USE_YYYYMM : " + USE_YYYYMM + " \n";
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
