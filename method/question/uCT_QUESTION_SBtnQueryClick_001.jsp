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

		String CMBBOXCQN_EXEM_CD = htMethod.get("CMBBOXCQN_EXEM_CD");
		String CMBBOXCQN_QSKD_CD = htMethod.get("CMBBOXCQN_QSKD_CD");
		String CHKBOXUSE = htMethod.get("CHKBOXUSE");

		//
		if(CMBBOXCQN_EXEM_CD == null) { CMBBOXCQN_EXEM_CD = ""; }
		if(CMBBOXCQN_QSKD_CD == null) { CMBBOXCQN_QSKD_CD = ""; }
		if(CHKBOXUSE == null) { CHKBOXUSE = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT CASE WHEN CQN_EXEM_CD IS NULL OR CQN_EXEM_CD = '' THEN CQN_EXEM_CD else '[' || CQN_EXEM_CD || ']' || GetCOMMON_LvCdToNm('0413',CQN_EXEM_CD,'5',1) END CQN_EXEM_NM,
       CASE WHEN CQN_QSKD_CD IS NULL OR CQN_QSKD_CD = '' THEN CQN_QSKD_CD else '[' || CQN_QSKD_CD || ']' || GetCOMMON_LvCdToNm('0414',CQN_QSKD_CD,'5',2) END CQN_QSKD_NM,
       CASE WHEN CQN_ANSR_CD IS NULL OR CQN_ANSR_CD = '' THEN CQN_ANSR_CD else '[' || CQN_ANSR_CD || ']' || GetCOMMON_LvCdToNm('0415',CQN_ANSR_CD,'5',1) END CQN_ANSR_NM, A.*
FROM CT_QUESTION A
WHERE 0 = 0

if :CmbBoxCQN_EXEM_CD <> '0' then
      AND CQN_EXEM_CD = :CmbBoxCQN_EXEM_CD

if :CmbBoxCQN_QSKD_CD <> '00' then
      AND CQN_QSKD_CD = :CmbBoxCQN_QSKD_CD

if ChkBoxUSE = '0' then
      AND CQN_USE_YN = 'Y'

ORDER BY CQN_QSKD_CD, CQN_QSTN_SQ, CQN_QSTN_LV, CQN_QSTN_CD

		*/

		sql = " SELECT ";
		sql += "  CASE WHEN CQN_EXEM_CD IS NULL OR CQN_EXEM_CD = '' THEN CQN_EXEM_CD ELSE '[' || CQN_EXEM_CD || ']' || GETCOMMON_LVCDTONM('0413',CQN_EXEM_CD,'5',1) END CQN_EXEM_NM";
		sql += ", CASE WHEN CQN_QSKD_CD IS NULL OR CQN_QSKD_CD = '' THEN CQN_QSKD_CD ELSE '[' || CQN_QSKD_CD || ']' || GETCOMMON_LVCDTONM('0414',CQN_QSKD_CD,'5',2) END CQN_QSKD_NM";
		sql += ", CASE WHEN CQN_ANSR_CD IS NULL OR CQN_ANSR_CD = '' THEN CQN_ANSR_CD ELSE '[' || CQN_ANSR_CD || ']' || GETCOMMON_LVCDTONM('0415',CQN_ANSR_CD,'5',1) END CQN_ANSR_NM";
		sql += ", A.*";
		sql += " FROM CT_QUESTION A";
		sql += " WHERE 0 = 0";

		if(!CMBBOXCQN_EXEM_CD.equals("0")) {
			sql += " AND CQN_EXEM_CD = '" + CMBBOXCQN_EXEM_CD + "'";
		}

		if(!CMBBOXCQN_QSKD_CD.equals("00")) {
			sql += " AND CQN_QSKD_CD = '" + CMBBOXCQN_QSKD_CD + "'";
		}

		if(CHKBOXUSE.equals("0")) {
			sql += " AND CQN_USE_YN = 'Y'";
		}

		sql += " ORDER BY CQN_QSTN_CD";
			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uCT_QUESTION_SBtnQueryClick_001 \n";
			G_INFO += "설명 : 문진정보 로딩 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " CMBBOXCQN_EXEM_CD : " + CMBBOXCQN_EXEM_CD + " \n";
			G_INFO += " CMBBOXCQN_QSKD_CD : " + CMBBOXCQN_QSKD_CD + " \n";
			G_INFO += " CHKBOXUSE : " + CHKBOXUSE + " \n";
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
