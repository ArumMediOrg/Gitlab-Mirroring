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

		String DTEDTEEA_EXAM_SDT = htMethod.get("DTEDTEEA_EXAM_SDT");
		String DTEDTEEA_EXAM_EDT = htMethod.get("DTEDTEEA_EXAM_EDT");
		String MSKEDTEEA_COMP_CD1 = htMethod.get("MSKEDTEEA_COMP_CD1");
		String CHKBOXMAIN = htMethod.get("CHKBOXMAIN");
		String MSKEDTEEA_COMP_CD2 = htMethod.get("MSKEDTEEA_COMP_CD2");
		String CMBFAMYCD = htMethod.get("CMBFAMYCD");
		String RZCMBBOXPANJ = htMethod.get("RZCMBBOXPANJ");
		String CBDEPT_CD = htMethod.get("CBDEPT_CD");
		String DEPT_CD = htMethod.get("DEPT_CD");
		String EDITDEPT_NM = htMethod.get("EDITDEPT_NM");
		String CMBBOXPLCE_CD = htMethod.get("CMBBOXPLCE_CD");

		//
		if(DTEDTEEA_EXAM_SDT == null) { DTEDTEEA_EXAM_SDT = ""; }
		if(DTEDTEEA_EXAM_EDT == null) { DTEDTEEA_EXAM_EDT = ""; }
		if(MSKEDTEEA_COMP_CD1 == null) { MSKEDTEEA_COMP_CD1 = ""; }
		if(CHKBOXMAIN == null) { CHKBOXMAIN = ""; }
		if(MSKEDTEEA_COMP_CD2 == null) { MSKEDTEEA_COMP_CD2 = ""; }
		if(CMBFAMYCD == null) { CMBFAMYCD = ""; }
		if(RZCMBBOXPANJ == null) { RZCMBBOXPANJ = ""; }
		if(CBDEPT_CD == null) { CBDEPT_CD = ""; }
		if(DEPT_CD == null) { DEPT_CD = ""; }
		if(EDITDEPT_NM == null) { EDITDEPT_NM = ""; }
		if(CMBBOXPLCE_CD == null) { CMBBOXPLCE_CD = ""; }

		// DB객체
		stmtList = connect.createStatement();

		sql = " SELECT A.EEA_EXAM_DT, A.EEA_EXAM_SQ, F_COMP_FIND(A.EEA_COMP_CD) EEA_COMP_NM, CASE WHEN A.EEA_SEX_CD IS NULL";
		sql += " OR A.EEA_SEX_CD = '' THEN A.EEA_SEX_CD ELSE GETCOMMON_LVCDTONM('0411',A.EEA_SEX_CD,'5',1) END ICR_SEX_NM, D.*";
		sql += " FROM ET_EXAM_ACPT A INNER JOIN ET_JOBSTRESS_SIMPLE D";
		sql += " ON A.EEA_EXAM_DT = D.EJS_EXAM_DT";
		sql += " AND A.EEA_EXAM_SQ = D.EJS_EXAM_SQ";
		sql += " WHERE A.EEA_EXAM_DT >= '" + DTEDTEEA_EXAM_SDT + "'";
		sql += " AND A.EEA_EXAM_DT <= '" + DTEDTEEA_EXAM_EDT + "'";
		sql += " AND A.EEA_ORDER_YN <> 'C'";

		if(!MSKEDTEEA_COMP_CD1.equals("")) {
			if(CHKBOXMAIN.equals("1")) {
				sql += " AND A.EEA_COMP_CD IN '" + MSKEDTEEA_COMP_CD2 + "'";
			}
			else {
				sql += " AND A.EEA_COMP_CD = '" + MSKEDTEEA_COMP_CD2 + "'";
			}
		}

		if(CBDEPT_CD.equals("1")) {
			sql += " AND A.EEA_DEPT_CD = '" + DEPT_CD + "' ";
		} else if(! EDITDEPT_NM.equals("")) {
			sql += " AND A.EEA_DEPT_NM LIKE '" + EDITDEPT_NM + "%' ";
		}

		if(!CMBFAMYCD.equals("00")) {
			sql += " AND A.EEA_FAMY_CD = '" + CMBFAMYCD + "'";
		}

		if(!CMBBOXPLCE_CD.equals("00")) {
			sql += " AND A.EEA_PLCE_CD = '" + CMBBOXPLCE_CD + "'";
		}

		if(RZCMBBOXPANJ.equals("1")) {
			sql += " AND D.EJS_PANJ_YN = 'Y'";
		}
		else if(RZCMBBOXPANJ.equals("2")) {
			sql += " AND D.EJS_PANJ_YN = 'N'";
		}

		sql += " ORDER BY A.EEA_EXAM_DT";
			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uJobStress_Simple_Stats_SBtnQueryClick_001 \n";
			G_INFO += "설명 : 직무스트레스(단축) 검사결과정보 로딩 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " DTEDTEEA_EXAM_SDT : " + DTEDTEEA_EXAM_SDT + " \n";
			G_INFO += " DTEDTEEA_EXAM_EDT : " + DTEDTEEA_EXAM_EDT + " \n";
			G_INFO += " MSKEDTEEA_COMP_CD1 : " + MSKEDTEEA_COMP_CD1 + " \n";
			G_INFO += " CHKBOXMAIN : " + CHKBOXMAIN + " \n";
			G_INFO += " MSKEDTEEA_COMP_CD2 : " + MSKEDTEEA_COMP_CD2 + " \n";
			G_INFO += " CMBFAMYCD : " + CMBFAMYCD + " \n";
			G_INFO += " RZCMBBOXPANJ : " + RZCMBBOXPANJ + " \n";
			G_INFO += " CBDEPT_CD : " + CBDEPT_CD + " \n";
			G_INFO += " DEPT_CD : " + DEPT_CD + " \n";
			G_INFO += " EDITDEPT_NM : " + EDITDEPT_NM + " \n";
			G_INFO += " CMBBOXPLCE_CD : " + CMBBOXPLCE_CD + " \n";
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
