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

		String RSVN_NO = htMethod.get("RSVN_NO");
		String ITEM_CD = htMethod.get("ITEM_CD");
		String OCS_YN = htMethod.get("OCS_YN");
		String CNCL_YN = htMethod.get("CNCL_YN");
		String OCS_CD = htMethod.get("OCS_CD");
		String OCSC_SNO = htMethod.get("OCSC_SNO");


		//
		if(RSVN_NO == null) { RSVN_NO = ""; }
		if(ITEM_CD == null) { ITEM_CD = ""; }
		if(OCS_YN == null) { OCS_YN = ""; }
		if(CNCL_YN == null) { CNCL_YN = ""; }
		if(OCS_CD == null) { OCS_CD = ""; }
		if(OCSC_SNO == null) { OCSC_SNO = ""; }


		// DB객체
		stmtList = connect.createStatement();

		/*
SELECT A.*, B.IIM_KNME_NM, B.IIM_OSCD_CD, B.IIM_OSSB_CD, B.IIM_OSRL_CD
  FROM RT_RSVT_ITEM A JOIN IT_ITEM B
    ON B.IIM_ITEM_CD = A.RRI_ITEM_CD
 WHERE A.RRI_RSVN_NO = :RSVN_NO

if (:ITEM_CD <> '') then
   AND A.RRI_ITEM_CD = :ITEM_CD

if (:OCS_YN <> '') then
   AND A.RRI_OCS_YN = :OCS_YN

if (:CNCL_YN <> '') then
   AND A.RRI_CNCL_YN = :CNCL_YN

if (:OCS_CD = '1') then
   AND NVL(A.RRI_OCS_CD , ' ') = ' '
else if (:OCS_CD = '2') then
   AND NVL(A.RRI_OCS_CD , ' ') <> ' '
else if (:OCS_CD <> '') then
   AND NVL(A.RRI_OCS_CD , ' ') = NVL(:OCS_CD, ' ')

if (:OCSC_SNO = '1') then
   AND NVL(A.RRI_OCSC_SNO , ' ') = ' '
else if (:OCSC_SNO = '2') then
   AND NVL(A.RRI_OCSC_SNO , ' ') <> ' '
else if (:OCSC_SNO <> '') then
   AND NVL(A.RRI_OCSC_SNO , ' ') = NVL(:OCSC_SNO, ' ')
		*/

		sql = " SELECT A.*, B.IIM_KNME_NM, B.IIM_OSCD_CD, B.IIM_OSSB_CD, B.IIM_OSRL_CD ";
		sql += " FROM RT_RSVT_ITEM A JOIN IT_ITEM B ";
		sql += " 	ON B.IIM_ITEM_CD = A.RRI_ITEM_CD ";
		sql += " WHERE A.RRI_RSVN_NO = '" + RSVN_NO + "' ";

		if (! ITEM_CD.equals("")){
			sql += "AND A.RRI_ITEM_CD = '" + ITEM_CD + "' ";
		}

		if (! OCS_YN.equals("")) {
			sql += " AND A.RRI_OCS_YN = '" + OCS_YN + "' ";
		}

		if (! CNCL_YN.equals("")) {
			sql += " AND A.RRI_CNCL_YN = '" + CNCL_YN + "' ";
		}

		if (OCS_CD.equals("1")) {
			sql += " AND NVL(A.RRI_OCS_CD , ' ') = ' ' ";
		} else if (OCS_CD.equals("2")) {
			sql += " AND NVL(A.RRI_OCS_CD , ' ') <> ' ' ";
		} else if (! OCS_CD.equals("")) {
			sql += " AND NVL(A.RRI_OCS_CD , ' ') = NVL('" + OCS_CD + "', ' ') ";
		}

		if (OCSC_SNO.equals("1")) {
			sql += " AND NVL(A.RRI_OCSC_SNO , ' ') = ' ' ";
		} else if (OCSC_SNO.equals("2")) {
			sql += " AND NVL(A.RRI_OCSC_SNO , ' ') <> ' ' ";
		} else if (! OCSC_SNO.equals("")) {
			sql += " AND NVL(A.RRI_OCSC_SNO , ' ') = NVL('" + OCSC_SNO + "', ' ') ";
		}


			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uFM_AcptComm_GF_FindRsvtItem_001 \n";
			G_INFO += "설명 : 예약 항목 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " RSVN_NO : " + RSVN_NO + " \n";
			G_INFO += " ITEM_CD : " + ITEM_CD + " \n";
			G_INFO += " OCS_YN : " + OCS_YN + " \n";
			G_INFO += " CNCL_YN : " + CNCL_YN + " \n";
			G_INFO += " OCS_CD : " + OCS_CD + " \n";
			G_INFO += " OCSC_SNO : " + OCSC_SNO + " \n";

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
