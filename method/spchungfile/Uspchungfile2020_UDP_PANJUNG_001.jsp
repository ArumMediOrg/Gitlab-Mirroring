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

		sql = " SELECT SPG_EXAM_DT,SPG_EXAM_SQ,SPG_MATT_SQ, ";
		//sql += " F_SP_MATTSQ_FIND(SIR_EXAM_DT2,SIR_EXAM_SQ2,SPG_ORGA_CD,SPG_MATT_CD) SED_SPGMSTT_SQ, ";
		sql += " SPG_EXAM_CHA,SIR_EXAM_DT2,SIR_EXAM_SQ2, ID ,SPG_MATT_CD,SPG_ORGA_CD,SPG_SWING_CD, ";
		sql += " SPG_SLNS_KD, SPG_SOKY_CD, SPG_SOKY_NM, CASE WHEN SUBSTR(SPG_SOKY_NM,4,1) = 'U' THEN '9' WHEN SUBSTR(SPG_SOKY_NM,4,1) = 'R' THEN '8' WHEN SUBSTR(SPG_PANJ_CD,1,1) = '6' THEN '7' WHEN SUBSTR(SPG_PANJ_CD,1,1) = '7' THEN '6' WHEN SUBSTR(SPG_PANJ_CD,1,1) = 'B' THEN '5' WHEN SUBSTR(SPG_PANJ_CD,1,1) = '4' THEN '4' WHEN SUBSTR(SPG_PANJ_CD,1,1) = '5' THEN '3' WHEN SUBSTR(SPG_PANJ_CD,1,1) = 'A' THEN '2' ELSE '1' END AS SPG_PANJ_SQ, SPG_PANJ_CD,SPG_JOCHI_CD, SPG_JOCHI_NM, SPG_JILH_CD,SPG_POSM1_CD,SPG_POSM2_CD,SPG_POSM3_CD,SPG_POSM1_TX,SPG_POSM2_TX, SPG_POSM3_TX,SPG_POSM1_DT,SPG_POSM2_DT,SPG_POSM3_DT,SPG_BUSI_CD, BFE_OPIN_CD, SPG_REMARK,SPG_ETC_TX,SPG_ORSU_CD,SPG_CYCLE_CD,SPG_CYCLE_TX, SPG_CYCLE_DT, CHUNGBN,SBE_PANJ_YN, SPG_SOKY_TX";
		sql += " FROM (SELECT SPG_EXAM_DT,SPG_EXAM_SQ,SPG_MATT_SQ, SPG_EXAM_CHA,SIR_EXAM_DT2, SIR_EXAM_SQ2,F_PERID_FIND1(EEA_EXAM_DT,EEA_EXAM_SQ,'0') ID , SPG_MATT_CD,SPG_ORGA_CD,SPG_SWING_CD, CASE WHEN SIR_EXAM_DT2 <> '' THEN'2' ELSE '1' END SPG_SLNS_KD, SPG_SOKY_CD, SPG_SOKY_NM, SPG_PANJ_CD,SPG_JOCHI_CD, SPG_JOCHI_NM, SPG_JILH_CD, SPG_POSM1_CD,SPG_POSM2_CD,SPG_POSM3_CD,SPG_POSM1_TX, SPG_POSM2_TX,SPG_POSM3_TX,SPG_POSM1_DT,SPG_POSM2_DT,SPG_POSM3_DT,SPG_BUSI_CD, '' BFE_OPIN_CD, SPG_REMARK,SPG_ETC_TX,SPG_ORSU_CD,SPG_CYCLE_CD, SPG_CYCLE_TX, SPG_CYCLE_DT, CASE WHEN SPG_PANJ_CD <>'9' THEN 'Y' WHEN SPG_PANJ_CD ='9'";
		sql += " AND NVL(SIR_EXAM_DT2, ' ') <> ' ' THEN 'Y' ELSE 'N' END CHUNGBN ,SBE_PANJ_YN , SPG_SOKY_TX";
		sql += " FROM ET_EXAM_ACPT A LEFT OUTER JOIN ST_PANJUNG B";
		sql += " ON A.EEA_EXAM_DT = B.SPG_EXAM_DT";
		sql += " AND A.EEA_EXAM_SQ = B.SPG_EXAM_SQ LEFT OUTER JOIN ST_BASE D";
		sql += " ON D.SBE_EXAM_DT = A.EEA_EXAM_DT";
		sql += " AND D.SBE_EXAM_SQ=A.EEA_EXAM_SQ LEFT OUTER JOIN ST_BILLHN_PR C";
		sql += " ON A.EEA_EXAM_DT = C.SBP_EXAM_DT";
		sql += " AND A.EEA_EXAM_SQ = C.SBP_EXAM_SQ";
		sql += " AND SBP_CHUNG_KD = '" + CHUNG_KD + "' LEFT OUTER JOIN IT_COMPANY E";
		sql += " ON A.EEA_COMP_CD = E.ICY_COMP_CD LEFT OUTER JOIN (SELECT SIR_EXAM_DT,SIR_EXAM_SQ,SIR_MATT_CD,SIR_ORGA_CD,SIR_EXAM_DT2,SIR_EXAM_SQ2";
		sql += " FROM ST_ITEM_RECHECK";
		sql += " GROUP BY SIR_EXAM_DT,SIR_EXAM_SQ,SIR_MATT_CD,SIR_ORGA_CD, SIR_EXAM_DT2,SIR_EXAM_SQ2) F";
		sql += " ON A.EEA_EXAM_DT = F.SIR_EXAM_DT";
		sql += " AND A.EEA_EXAM_SQ = F.SIR_EXAM_SQ";
		sql += " AND SPG_MATT_CD = SIR_MATT_CD";
		sql += " AND SPG_ORGA_CD = SIR_ORGA_CD";
		sql += " WHERE 0=0";
		sql += " AND A.EEA_COMP_CD = '" + COMP_CD + "'";
		sql += " AND (A.EEA_EXAM_CD IN ('41001','42001')";
		sql += " OR A.EEA_SPSB_CD IN ('41001','42001'))";
		sql += " AND A.EEA_MNGT_SPYM LIKE '" + MNGT_SPYM + "%'";
		sql += " AND SBE_PANJ_YN='Y'";
		sql += " AND SBE_EXAM_CHA='1'";
		sql += SSQL_ADD;
		sql += ") FF";
		sql += " WHERE CHUNGBN='Y'";
		sql += " AND SBE_PANJ_YN='Y'";
		sql += " ORDER BY SPG_MATT_CD, SPG_ORGA_CD, SPG_SWING_CD, SPG_PANJ_SQ ASC";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : Uspchungfile2020_UDP_PANJUNG_001 \n";
			G_INFO += "설명 : 특검청구 판정내역 조회 \n";
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
