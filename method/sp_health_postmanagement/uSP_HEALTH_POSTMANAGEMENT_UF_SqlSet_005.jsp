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

		String SEXAM_DT = htMethod.get("SEXAM_DT");
		String EEXAM_DT = htMethod.get("EEXAM_DT");
		String PPARAM_TX1 = htMethod.get("PPARAM_TX1");
		String PPARAM_TX2 = htMethod.get("PPARAM_TX2");

		//

		if(SEXAM_DT == null) { SEXAM_DT = ""; }
		if(EEXAM_DT == null) { EEXAM_DT = ""; }
		if(PPARAM_TX1 == null) { PPARAM_TX1 = ""; }
		if(PPARAM_TX2 == null) { PPARAM_TX2 = ""; }

		// DB객체
		stmtList = connect.createStatement();

		sql = " Select ";
		sql += " A.EEA_EXAM_DT, A.EEA_EXAM_SQ, B.SPG_SOKY_CD, B.SPG_PANJ_CD, B.SPG_JILH_CD, ";
		sql += " B.SPG_MATT_CD, B.SPG_MATT_SQ, B.SPG_ORGA_CD, B.SPG_SWING_CD ";
		sql += " From ET_EXAM_ACPT A ";
		sql += " Inner Join ST_PANJUNG B On A.EEA_EXAM_DT = B.SPG_EXAM_DT ";
		sql += " 					And A.EEA_EXAM_SQ = B.SPG_EXAM_SQ ";
		sql += " 					And B.SPG_PANJ_CD IN ('4', '5', '6', '7', 'A', 'B','C', 'D', 'C0', 'D0') ";
		sql += " 					And B.SPG_JILH_CD = ' ' ";
		sql += " WHERE A.EEA_EXAM_DT >= '" + SEXAM_DT + "' ";
		sql += " And A.EEA_EXAM_DT <= '" + EEXAM_DT + "' ";
		sql += " And A.EEA_ORDER_YN <> 'C' ";

		sql += PPARAM_TX1;

		sql += PPARAM_TX2;

			//
		G_INFO += "<!-- \n";
		G_INFO += "서비스명 : uSP_HEALTH_POSTMANAGEMENT_UF_SqlSet_005 \n";
		G_INFO += "설명 : 2차 판정 조회 \n";
		G_INFO += "\n\n";

		G_INFO += "전달인자 : 없음 \n";
		G_INFO += " SEXAM_DT : " + SEXAM_DT + " \n";
		G_INFO += " EEXAM_DT : " + EEXAM_DT + " \n";
		G_INFO += " PPARAM_TX1 : " + PPARAM_TX1 + " \n";
		G_INFO += " PPARAM_TX2 : " + PPARAM_TX2 + " \n";

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
