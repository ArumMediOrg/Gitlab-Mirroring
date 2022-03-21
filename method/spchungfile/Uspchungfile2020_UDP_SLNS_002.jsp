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

		String CHUNG_KD = htMethod.get("CHUNG_KD");
		String COMP_CD = htMethod.get("COMP_CD");
		String MNGT_SPYM = htMethod.get("MNGT_SPYM");
		String SSQL_ADD = htMethod.get("SSQL_ADD");

		//
		if(CHUNG_KD == null) { CHUNG_KD = ""; }
		if(COMP_CD == null) { COMP_CD = ""; }
		if(MNGT_SPYM == null) { MNGT_SPYM = ""; }
		if(SSQL_ADD == null) { SSQL_ADD = ""; }

		// DB객체
		stmtList = connect.createStatement();

		sql = " SELECT EEA_EXAM_DT, CASE WHEN SUBSTR(EEA_EXAM_CD,1,1) <> '4' THEN EEA_SPSB_CD ELSE EEA_EXAM_CD END FIRSTGBN, SBE_EXAM_DT, CASE WHEN SUBSTR(EEA_PLCE_CD,1,1)='1' THEN '2' ELSE '1' END SLNS_PLACE,EEA_HOLIDAY_YN, CASE WHEN EEA_HDMD_YN='Y' THEN '1' ELSE '0' END EEA_HDMD_YN, EEA_EXAM_SQ,EEA_CHART_NO,SBE_XRAY_NO,SBE_XRAY_CD,SBE_MEDI_CNT, F_DOCTOR_FIND('1',SBE_XDOC_CD)SBE_XDOC_CD, F_DOCLICNE(SBE_XDOC_CD,'의사') POTOGRFNO_DOCTRLCN , F_DOCTOR_FIND('1',SBE_DDOC_CD) SBE_DDOC_CD , F_DOCLICNE(SBE_DDOC_CD,'의사') DSGR_DOCTRLCN , (SELECT MAX(IAU_PENL_NM)";
		sql += " FROM ST_PANJUNG LEFT OUTER JOIN IT_AUTH_USER";
		sql += " ON IAU_DEPT_CD='0207'";
		sql += " AND IAU_EMP_NO= SPG_DOCT_CD";
		sql += " WHERE SPG_EXAM_DT=EEA_EXAM_DT";
		sql += " AND SPG_EXAM_SQ=EEA_EXAM_SQ) TCNXPRT_NM , F_DOCLICNE((SELECT MAX(SPG_DOCT_CD)";
		sql += " FROM ST_PANJUNG";
		sql += " WHERE SPG_EXAM_DT=A.EEA_EXAM_DT";
		sql += " AND SPG_EXAM_SQ=A.EEA_EXAM_SQ),'의사') TCNXPRT_LCN, SBE_XRFM_CD, SBE_MEDI_YN, EEA_SPHT_CD ";
		sql += " FROM ET_EXAM_ACPT A LEFT OUTER JOIN ST_BASE B";
		sql += " ON A.EEA_EXAM_DT =B.SBE_EXAM_DT";
		sql += " AND A.EEA_EXAM_SQ =B.SBE_EXAM_SQ LEFT OUTER JOIN ST_BILLHN_PR C";
		sql += " ON A.EEA_EXAM_DT=C.SBP_EXAM_DT";
		sql += " AND A.EEA_EXAM_SQ=C.SBP_EXAM_SQ";
		sql += " AND SBP_CHUNG_KD = '" + CHUNG_KD + "' LEFT OUTER JOIN IT_COMPANY I";
		sql += " ON A.EEA_COMP_CD=I.ICY_COMP_CD";
		sql += " WHERE 0=0";
		sql += " AND A.EEA_COMP_CD = '" + COMP_CD + "'";
		sql += " AND (A.EEA_EXAM_CD IN ('41001','42001')";
		sql += " OR A.EEA_SPSB_CD IN ('41001','42001'))";
		sql += " AND A.EEA_MNGT_SPYM LIKE '" + MNGT_SPYM + "'||'%'";
		sql += " AND SBE_PANJ_YN='Y'";
		sql += SSQL_ADD;
			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : Uspchungfile2020_UDP_SLNS_002 \n";
			G_INFO += "설명 : 특검청구 검진정보 조회(1차) \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " CHUNG_KD : " + CHUNG_KD + " \n";
			G_INFO += " COMP_CD : " + COMP_CD + " \n";
			G_INFO += " MNGT_SPYM : " + MNGT_SPYM + " \n";
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
