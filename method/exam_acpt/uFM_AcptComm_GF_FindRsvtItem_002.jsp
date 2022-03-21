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
		String EXAM_SDT = htMethod.get("EXAM_SDT");
		String EXAM_EDT = htMethod.get("EXAM_EDT");
		String SELECT_KD = htMethod.get("SELECT_KD");


		//
		if(RSVN_NO == null) { RSVN_NO = ""; }
		if(EXAM_SDT == null) { EXAM_SDT = ""; }
		if(EXAM_EDT == null) { EXAM_EDT = ""; }
		if(SELECT_KD == null) { SELECT_KD = ""; }


		// DB객체
		stmtList = connect.createStatement();

		if(SELECT_KD.equals("1")){
			sql = " SELECT DISTINCT A.RRI_RSVN_NO, B.EMI_MARK_SQ, C.EPM_MARK_TNM ";
			sql += " FROM RT_RSVT E, RT_RSVT_ITEM A, ET_PACK_MARK_ITEM B, ET_PACK_MARK C, IT_ITEM D ";

			if(!RSVN_NO.equals("")){
				sql += " WHERE E.RRT_RSVN_NO = '" + RSVN_NO + "' ";
			} else {
				sql += " WHERE E.RRT_EXAM_DT BETWEEN '" + EXAM_SDT + "' AND '" + EXAM_EDT + "' ";
			}

			sql += " 	AND E.RRT_CNCL_YN <> 'Y' ";
			sql += " 	AND A.RRI_RSVN_NO = E.RRT_RSVN_NO ";
			sql += " 	AND NVL(A.RRI_CNCL_YN, 'N') = 'N' ";
			sql += " 	AND B.EMI_MARK_KD = '3' ";
			sql += " 	AND B.EMI_MARK_CD = '01' ";
			sql += " 	AND B.EMI_MARK_SQ <> '000' ";
			sql += " 	AND B.EMI_ITEM_CD = A.RRI_ITEM_CD ";
			sql += " 	AND NVL(B.EMI_USE_YN, 'Y') = 'Y' ";
			sql += " 	AND C.EPM_MARK_KD = B.EMI_MARK_KD ";
			sql += " 	AND C.EPM_MARK_CD = B.EMI_MARK_CD ";
			sql += " 	AND C.EPM_MARK_SQ = B.EMI_MARK_SQ ";
			sql += " 	AND NVL(C.EPM_USE_YN, 'Y') = 'Y' ";
			sql += " 	AND D.IIM_ITEM_CD = A.RRI_ITEM_CD ";
			sql += " ORDER BY A.RRI_RSVN_NO, B.EMI_MARK_SQ ";

		} else if(SELECT_KD.equals("2")){

			sql = " SELECT A.RRI_RSVN_NO, B.EMI_MARK_SQ, C.EPM_MARK_TNM, ";
			sql += " 		D.IIM_ITEM_CD, D.IIM_KNME_NM, D.IIM_SNME_NM, ";
			sql += " 		A.RRI_EXAM_TM, A.RRI_EHR_PL ";
			sql += " 	FROM RT_RSVT E, RT_RSVT_ITEM A, ET_PACK_MARK_ITEM B, ET_PACK_MARK C, IT_ITEM D ";

			if(!RSVN_NO.equals("")){
				sql += " WHERE E.RRT_RSVN_NO = '" + RSVN_NO + "' ";
			}else {
				sql += " WHERE E.RRT_EXAM_DT BETWEEN '" + EXAM_SDT + "' AND '" + EXAM_EDT + "' ";
			}

			sql += " 	AND E.RRT_CNCL_YN <> 'Y' ";
			sql += " 	AND A.RRI_RSVN_NO = E.RRT_RSVN_NO ";
			sql += " 	AND NVL(A.RRI_CNCL_YN, 'N') = 'N' ";
			sql += " 	AND B.EMI_MARK_KD = '3' ";
			sql += " 	AND B.EMI_MARK_CD = '01' ";
			sql += " 	AND B.EMI_MARK_SQ <> '000' ";
			sql += " 	AND B.EMI_ITEM_CD = A.RRI_ITEM_CD ";
			sql += " 	AND NVL(B.EMI_USE_YN, 'Y') = 'Y' ";
			sql += " 	AND C.EPM_MARK_KD = B.EMI_MARK_KD ";
			sql += " 	AND C.EPM_MARK_CD = B.EMI_MARK_CD ";
			sql += " 	AND C.EPM_MARK_SQ = B.EMI_MARK_SQ ";
			sql += " 	AND NVL(C.EPM_USE_YN, 'Y') = 'Y' ";
			sql += " 	AND D.IIM_ITEM_CD = A.RRI_ITEM_CD ";
			sql += " ORDER BY A.RRI_RSVN_NO, B.EMI_MARK_SQ, B.EMI_SORT_SQ ";
		}



			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uFM_AcptComm_GF_FindRsvtItem_002 \n";
			G_INFO += "설명 : 예약항목별 표기명 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " RSVN_NO : " + RSVN_NO + " \n";
			G_INFO += " EXAM_SDT : " + EXAM_SDT + " \n";
			G_INFO += " EXAM_EDT : " + EXAM_EDT + " \n";
			G_INFO += " SELECT_KD : " + SELECT_KD + " \n";

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
