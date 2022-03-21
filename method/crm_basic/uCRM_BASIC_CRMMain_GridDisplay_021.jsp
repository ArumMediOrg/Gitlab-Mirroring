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

	ResultSetMetaData rsmd = null;

	CRs cRsList = null;

	//
	String G_INFO = "";

	int colCnt = 0;

	try {
%>
<%@ include file="/inc_prg/connect.jsp"%>
<%
		// 전달자료
		htData = (HashMap<String, Object>)request.getAttribute("htData");
		htMethod = (HashMap<String, String>)request.getAttribute("htMethod_1");

		String SEXAM_DT = htMethod.get("SEXAM_DT");
		String SEXAM_SQ = htMethod.get("SEXAM_SQ");

		//
		if(SEXAM_DT == null) { SEXAM_DT = ""; }
		if(SEXAM_SQ == null) { SEXAM_SQ = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*
Select A.ERI_ITEM_CD, B.IIM_KNME_NM,   A.ERI_RSLT_VL,  A.ERI_VLDT_LH,
       A.ERI_RSLT_EX, A.ERI_RSLT_KD,   A.ERI_LOW_KD,   A.ERI_RSLT_LOW,
       A.ERI_HIGH_KD, A.ERI_RSLT_HIGH, A.ERI_CHAR_VAL, A.ERI_SORT_SQ
  From ET_RSLT_ITEM A
 Inner Join IT_ITEM B On B.IIM_ITEM_CD = A.ERI_ITEM_CD
 Where A.ERI_EXAM_DT = :sEXAM_DT
   And A.ERI_EXAM_SQ = :sEXAM_SQ
   And (NVL(A.ERI_RSLT_VL, ' ') <> ' '
    Or  NVL(A.ERI_RSLT_EX, ' ') <> ' ')
   And A.ERI_CNCL_YN  <> 'Y'
 Order By A.ERI_SORT_SQ

		*/


		sql += " Select A.ERI_ITEM_CD, B.IIM_KNME_NM,   A.ERI_RSLT_VL,  A.ERI_VLDT_LH, ";
		sql += " 	A.ERI_RSLT_EX, A.ERI_RSLT_KD,   A.ERI_LOW_KD,   A.ERI_RSLT_LOW, ";
		sql += " 	A.ERI_HIGH_KD, A.ERI_RSLT_HIGH, A.ERI_CHAR_VAL, A.ERI_SORT_SQ ";
		sql += " From ET_RSLT_ITEM A ";
		sql += " Inner Join IT_ITEM B On B.IIM_ITEM_CD = A.ERI_ITEM_CD ";
		sql += " Where A.ERI_EXAM_DT = '" + SEXAM_DT + "' ";
		sql += " And A.ERI_EXAM_SQ = '" + SEXAM_SQ + "' ";
		sql += " And (NVL(A.ERI_RSLT_VL, ' ') <> ' ' ";
		sql += " 	Or  NVL(A.ERI_RSLT_EX, ' ') <> ' ') ";
		sql += " And A.ERI_CNCL_YN  <> 'Y' ";
		sql += " Order By A.ERI_SORT_SQ ";



			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uCRM_BASIC_CRMMain_GridDisplay_021 \n";
			G_INFO += "설명 : 상담관리-접수-검사결과 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";

			G_INFO += " SEXAM_DT : " + SEXAM_DT + " \n";
			G_INFO += " SEXAM_SQ : " + SEXAM_SQ + " \n";
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
		<s:AttributeType name='ROWID' rs:number='<%= Integer.toString(colCnt)%>' rs:rowid='true' rs:basetable='DUAL' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:extends type='rs:rowbase'/>
	</s:ElementType>
</s:Schema>
		<rs:data>
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
