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
	String SEX_CD = htMethod.get("SEX_CD");

	//
	if(EXAM_SDT == null) { EXAM_SDT = ""; }
	if(EXAM_EDT == null) { EXAM_EDT = ""; }
	if(SEX_CD == null) { SEX_CD = ""; }

	// DB객체
	stmtList = connect.createStatement();

		sql = " SELECT ' ' COMP_CD, B.EPK_EXAM_CD||'-'||B.EPK_PACK_SQ PACK_NO,";
		sql += " MAX(B.EPK_PACK_NM) PACK_NM, COUNT(*) PACK_CNT,";
		sql += " MAX(B.EPK_SALE_PR) UNIT_PR, SUM(B.EPK_SALE_PR) PACK_PR";
		sql += " FROM ET_EXAM_ACPT A,";
		sql += " (SELECT EPK_EXAM_CD, EPK_PACK_SQ, EPK_EXAM_CD||EPK_PACK_SQ PACK_NO, EPK_PACK_NM, EPK_SALE_PR";
		sql += " FROM ET_PACK) B";
		sql += " WHERE A.EEA_EXAM_DT BETWEEN '" + EXAM_SDT + "' AND '" + EXAM_EDT + "' ";

		if(!SEX_CD.equals("0")) {
			sql += " AND A.EEA_SEX_CD = '" + SEX_CD + "'";
		}

		sql += " AND A.EEA_ORDER_YN <> 'C'";
		sql += " AND A.EEA_EXAM_LT LIKE '%'||B.PACK_NO||'$%'";
		sql += " GROUP BY B.EPK_EXAM_CD, B.EPK_PACK_SQ";
		sql += " UNION ALL";

		sql += " SELECT A.EEA_COMP_CD COMP_CD, B.PACK_NO,";
		sql += " F_COMP_FIND(A.EEA_COMP_CD)||'-'||SUBSTR(B.PACK_NO, 1, 4)||'-'||MAX(B.ECP_PACK_NM) PACK_NM,";
		sql += " COUNT(*) PACK_CNT, MAX(B.ECP_CNRT_PR) UNIT_PR, SUM(B.ECP_CNRT_PR) PACK_PR";
		sql += " FROM ET_EXAM_ACPT A,";
		sql += " (SELECT ECP_COMP_CD, ECP_MNGT_YR||ECP_EXAM_CD||ECP_CNRT_SQ||ECP_PROF_SQ PACK_NO,";
		sql += " ECP_PROF_NM||'-'||ECP_PROF_TL ECP_PACK_NM, ECP_CNRT_PR";
		sql += " FROM ET_COMP_CNRT_PROF) B";
		sql += " WHERE A.EEA_EXAM_DT BETWEEN '" + EXAM_SDT + "' AND '" + EXAM_EDT + "' ";

		if (!SEX_CD.equals("0")) {
			sql += " AND A.EEA_SEX_CD = '" + SEX_CD + "'";
		}

		sql += " AND A.EEA_ORDER_YN <> 'C'";
		sql += " AND A.EEA_COMP_CD = ECP_COMP_CD";
		sql += " AND A.EEA_EXAM_LT LIKE '%'||B.PACK_NO||'$%'";
		sql += " GROUP BY A.EEA_COMP_CD, B.PACK_NO";
		sql += " ORDER BY COMP_CD, PACK_NO";

	//
	G_INFO += "<!-- \n";
	G_INFO += "서비스명 : uAcpt_Sales_UP_Pack2_Kd_001 \n";
	G_INFO += "설명 : 검사묶음별 현황-2 \n";
	G_INFO += "\n\n";

	G_INFO += "전달인자 : \n";
	G_INFO += " EXAM_SDT : " + EXAM_SDT + " \n";
	G_INFO += " EXAM_EDT : " + EXAM_EDT + " \n";
	G_INFO += " SEX_CD : " + SEX_CD + " \n";
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
