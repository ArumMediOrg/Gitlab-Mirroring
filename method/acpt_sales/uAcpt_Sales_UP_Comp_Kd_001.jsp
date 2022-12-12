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

	String EXAM_SDT = htMethod.get("EXAM_SDT");
	String EXAM_EDT = htMethod.get("EXAM_EDT");
	String TOTL_KD = htMethod.get("TOTL_KD");
	String SEX_CD = htMethod.get("SEX_CD");
	String PARAM_TX = htMethod.get("PARAM_TX");

	//
	if(EXAM_SDT == null) { EXAM_SDT = ""; }
	if(EXAM_EDT == null) { EXAM_EDT = ""; }
	if(TOTL_KD == null) { TOTL_KD = ""; }
	if(SEX_CD == null) { SEX_CD = ""; }
	if(PARAM_TX == null) { PARAM_TX = ""; }

	// DB객체
	stmtList = connect.createStatement();

	sql = " SELECT A.EEA_COMP_CD COMP_CD, F_COMP_FIND(A.EEA_COMP_CD) COMP_NM,";
	sql += " SUM(CASE WHEN A.EEA_EXAM_CD = '31001' THEN 0 ELSE B.PSNL_PR END) AS PSNL_PR,";
	sql += " SUM(CASE WHEN A.EEA_EXAM_CD = '31001' THEN B.COMP_PR+B.PSNL_PR ELSE B.COMP_PR END) AS COMP_PR,";
	sql += " COUNT(*) EXAM_CNT1,";
	sql += " SUM(A.EEA_PSNLR_PR) PSNL_PR1, SUM(A.EEA_COMPR_PR) COMP_PR1,";
	sql += " SUM(A.EEA_HLTHR_PR) HDMD_PR1, SUM(A.EEA_SPCLR_PR) SDMD_PR1,";
	sql += " SUM(A.EEA_PSNLR_PR+A.EEA_COMPR_PR+A.EEA_HLTHR_PR+A.EEA_SPCLR_PR) TOTL_PR1,";
	sql += " SUM(A.EEA_DISC_PR)  DISC_PR1, SUM(A.EEA_DISC_CPR) DISC_CPR1,";
	sql += " SUM(B.CNT)     EXAM_CNT2, SUM(B.INSU)     EXAM_PER2,";
	sql += " SUM(B.PSNL_PR) PSNL_PR2,  SUM(B.COMP_PR)  COMP_PR2,";
	sql += " SUM(B.HDMD_PR) HDMD_PR2,  SUM(B.SDMD_PR)  SDMD_PR2,";
	sql += " SUM(B.DISC_PR) DISC_PR2,  SUM(B.DISC_CPR) DISC_CPR2,";
	sql += " SUM(B.TOTAL_PR) TOTL_PR2";
	sql += " FROM (SELECT EEP_EXAM_DT, EEP_EXAM_SQ, 1 CNT,";
	sql += " CASE WHEN MIN(EEP_ORDER_SQ) = '1' THEN 1 ELSE 0 END INSU,";
	sql += " SUM(EEP_HDMD_PR) HDMD_PR,";
	sql += " SUM(EEP_SDMD_PR) SDMD_PR,";
	sql += " SUM(EEP_COMP_PR+EEP_COMPS_PR) COMP_PR,";
	sql += " SUM(EEP_COMP_PR) COMP_CPR,";
	sql += " SUM(EEP_COMPS_PR) COMP_SPR,";
	sql += " SUM(EEP_PSNL_PR+EEP_PSNLP_PR) PSNL_PR,";
	sql += " SUM(EEP_HDMD_PR+EEP_SDMD_PR+EEP_COMPS_PR+EEP_COMP_PR+EEP_PSNL_PR+EEP_PSNLP_PR) TOTAL_PR,";
	sql += " SUM(NVL(EEP_DISC_PR, 0)) DISC_PR,";
	sql += " SUM(NVL(EEP_DISC_CPR, 0)) DISC_CPR";
	sql += " FROM ET_EXAM_PRICE";

	if (TOTL_KD.equals("1")) {
		sql += " WHERE EEP_EXAM_DT BETWEEN '" + EXAM_SDT + "' AND '" + EXAM_EDT + "'";
	} else {
		sql += " WHERE EEP_ORDER_DT BETWEEN '" + EXAM_SDT + "' AND '" + EXAM_EDT + "'";
	}

	sql += " GROUP BY EEP_EXAM_DT, EEP_EXAM_SQ";
	sql += " ) B, ET_EXAM_ACPT A";
	sql += " WHERE A.EEA_EXAM_DT = B.EEP_EXAM_DT";
	sql += " AND A.EEA_EXAM_SQ = B.EEP_EXAM_SQ";
	sql += " AND A.EEA_ORDER_YN <> 'C'";
	sql += " AND NVL(A.EEA_RECE_NO, ' ') <> 'R'";

	if (!SEX_CD.equals("0")) {
		sql += " AND A.EEA_SEX_CD = '" + SEX_CD + "'";
	}

	sql += PARAM_TX;

	sql += " GROUP BY A.EEA_COMP_CD";
	sql += " ORDER BY COMP_NM";

	//
	G_INFO += "<!-- \n";
	G_INFO += "서비스명 : uAcpt_Sales_UP_Comp_Kd_001 \n";
	G_INFO += "설명 : 사업장별 현황 \n";
	G_INFO += "\n\n";

	G_INFO += "전달인자 : \n";
	G_INFO += " EXAM_SDT : " + EXAM_SDT + " \n";
	G_INFO += " EXAM_EDT : " + EXAM_EDT + " \n";
	G_INFO += " TOTL_KD : " + TOTL_KD + " \n";
	G_INFO += " SEX_CD : " + SEX_CD + " \n";
	G_INFO += " PARAM_TX : " + PARAM_TX + " \n";
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
