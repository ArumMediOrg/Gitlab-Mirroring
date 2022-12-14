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

		String EXAM_DT = htMethod.get("EXAM_DT");
		String EXAM_SQ = htMethod.get("EXAM_SQ");
		String ITEM_CD = htMethod.get("ITEM_CD");
		String MARK_CD = htMethod.get("MARK_CD");

		//
		if(EXAM_DT == null) { EXAM_DT = ""; }
		if(EXAM_SQ == null) { EXAM_SQ = ""; }
		if(ITEM_CD == null) { ITEM_CD = ""; }
		if(MARK_CD == null) { MARK_CD = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT ET_RSLT_ITEM.ERI_RSLT_EX ,ET_RSLT_ITEM.ERI_ITEM_CD, ET_RSLT_ITEM.ERI_RSLT_VL,
                           ET_RSLT_ITEM.ERI_RSLT_CD, ET_PACK_MARK_ITEM.EMI_MARK_CD, ET_PACK_MARK_ITEM.EMI_MARK_SQ
                    FROM ET_RSLT_ITEM, ET_PACK_MARK_ITEM
                    WHERE ET_RSLT_ITEM.ERI_ITEM_CD = ET_PACK_MARK_ITEM.EMI_ITEM_CD
                      AND ET_RSLT_ITEM.ERI_EXAM_DT = :EXAM_DT
                      AND ET_RSLT_ITEM.ERI_EXAM_SQ = :EXAM_SQ
                      AND ET_RSLT_ITEM.ERI_ITEM_CD = :ITEM_CD
                      AND ET_PACK_MARK_ITEM.EMI_MARK_CD = :MARK_CD
                      AND ET_PACK_MARK_ITEM.EMI_MARK_SQ = '001'
                      AND ET_PACK_MARK_ITEM.EMI_MARK_KD = '2'
                      AND ET_RSLT_ITEM.ERI_CNCL_YN <> 'Y'
                      AND ((ET_RSLT_ITEM.ERI_RSLT_VL <> ' ' And ET_RSLT_ITEM.ERI_RSLT_VL is Not Null) OR
                           (ET_RSLT_ITEM.ERI_RSLT_CD <> ' ' And ET_RSLT_ITEM.ERI_RSLT_CD is Not Null) OR
                           (ET_RSLT_ITEM.ERI_RSLT_EX <> ' ' And ET_RSLT_ITEM.ERI_RSLT_EX is Not Null)  )
                    ORDER BY ET_PACK_MARK_ITEM.EMI_SORT_SQ
		*/

		sql = " SELECT DISTINCT ET_RSLT_ITEM.ERI_RSLT_EX ,ET_RSLT_ITEM.ERI_ITEM_CD, ET_RSLT_ITEM.ERI_RSLT_VL, ET_RSLT_ITEM.ERI_RSLT_CD, ";
		sql += " ET_PACK_MARK_ITEM.EMI_MARK_CD, ET_PACK_MARK_ITEM.EMI_MARK_SQ, ET_PACK_MARK_ITEM.EMI_SORT_SQ ";
		sql += " FROM ET_RSLT_ITEM, ET_PACK_MARK_ITEM, ET_PACK_MARK ";
		sql += " WHERE ET_RSLT_ITEM.ERI_ITEM_CD = ET_PACK_MARK_ITEM.EMI_ITEM_CD";
		sql += " AND ET_RSLT_ITEM.ERI_EXAM_DT = '" + EXAM_DT + "'";
		sql += " AND ET_RSLT_ITEM.ERI_EXAM_SQ = '" + EXAM_SQ + "'";
		sql += " AND ET_RSLT_ITEM.ERI_ITEM_CD = '" + ITEM_CD + "'";
		sql += " AND ET_PACK_MARK_ITEM.EMI_MARK_CD = '" + MARK_CD + "'";
		sql += " AND ET_PACK_MARK_ITEM.EMI_MARK_SQ = '001'";
		sql += " AND ET_PACK_MARK_ITEM.EMI_MARK_KD = '2'";
		sql += " AND ET_PACK_MARK_ITEM.EMI_MARK_CD = ET_PACK_MARK.EPM_MARK_CD ";
        sql += " AND ET_PACK_MARK.EPM_USE_YN <> 'N' ";
		sql += " AND ET_RSLT_ITEM.ERI_CNCL_YN <> 'Y'";
		sql += " AND ((ET_RSLT_ITEM.ERI_RSLT_VL <> ' '";
		sql += " AND ET_RSLT_ITEM.ERI_RSLT_VL IS NOT NULL)";
		sql += " OR (ET_RSLT_ITEM.ERI_RSLT_CD <> ' '";
		sql += " AND ET_RSLT_ITEM.ERI_RSLT_CD IS NOT NULL)";
		sql += " OR (ET_RSLT_ITEM.ERI_RSLT_EX <> ' '";
		sql += " AND ET_RSLT_ITEM.ERI_RSLT_EX IS NOT NULL) )";
		sql += " ORDER BY ET_PACK_MARK_ITEM.EMI_SORT_SQ";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uGetExam_SelectMarkcd_002 \n";
			G_INFO += "설명 : 과거 검사 항목 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " EXAM_DT : " + EXAM_DT + " \n";
			G_INFO += " EXAM_SQ : " + EXAM_SQ + " \n";
			G_INFO += " ITEM_CD : " + ITEM_CD + " \n";
			G_INFO += " MARK_CD : " + MARK_CD + " \n";
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
