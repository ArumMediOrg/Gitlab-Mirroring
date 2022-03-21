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
		String EXAM_YR = htMethod.get("EXAM_YR");
		String GROUP_CD = htMethod.get("GROUP_CD");
		String LCODE = htMethod.get("LCODE");

		//

		if(EXAM_DT == null) { EXAM_DT = ""; }
		if(EXAM_SQ == null) { EXAM_SQ = ""; }
		if(EXAM_YR == null) { EXAM_YR = ""; }
		if(GROUP_CD == null) { GROUP_CD = ""; }
		if(LCODE == null) { LCODE = ""; }

		// DB객체
		stmtList = connect.createStatement();

		sql = " SELECT ERI_EXAM_DT, ERI_EXAM_SQ, IIC_RSLT_GROUP, CCF_CODENM, CCF_LCODE, CCF_PANVIEW, ";
		sql += " CASE WHEN CCF_LCODE = '4' THEN 'RD' ELSE CCF_PAN_CD END PAN_CD ";
		sql += " from ET_RSLT_ITEM A ";
		sql += " INNER JOIN IT_ITEM_CALL C ON C.IIC_ITEM_CD = A.ERI_ITEM_CD ";
		sql += " inner join CT_COMM_FIRVIEW D on D.CCF_RSLT_GROUP = C.IIC_RSLT_GROUP ";
		sql += " Where ERI_EXAM_DT = '" + EXAM_DT + "' ";
		sql += " And   ERI_EXAM_SQ = '" + EXAM_SQ + "' ";
		sql += " AND   NVL(IIC_RSLT_GROUP, ' ') <> ' ' ";
		sql += " AND NVL(ERI_CNCL_YN, 'N') <> 'Y' ";
		sql += " AND IIC_EXAM_YR = '" + EXAM_YR + "' ";
		sql += " and IIC_RSLT_GROUP = '" + GROUP_CD + "' ";
		sql += " AND SUBSTR(ERI_HTSB_PANJ,2,1) = CCF_PAN_CD ";
		sql += " and CCF_LCODE = '" + LCODE + "' ";
		sql += " AND CCF_CODE = (CASE WHEN IIC_RSLT_GROUP = 'A01' AND SUBSTR(ERI_HTSB_PANJ,1,1) = 'L' THEN '18' ";
		sql += " WHEN IIC_RSLT_GROUP = 'A01' AND SUBSTR(ERI_HTSB_PANJ,1,1) = 'H' THEN '15'  ELSE CCF_CODE END) ";
		sql += " Group by ERI_EXAM_DT, ERI_EXAM_SQ, CCF_PAN_CD, CCF_PANVIEW, CCF_LCODE, CCF_CODENM, IIC_RSLT_GROUP ";
		sql += " Order by CCF_PAN_CD desc ";



			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uEmail_Send_PAN_EX_001 \n";
			G_INFO += "설명 : 결과전송 판정소견 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " EXAM_DT : " + EXAM_DT + " \n";
			G_INFO += " EXAM_SQ : " + EXAM_SQ + " \n";
			G_INFO += " EXAM_YR : " + EXAM_YR + " \n";
			G_INFO += " GROUP_CD : " + GROUP_CD + " \n";
			G_INFO += " LCODE : " + LCODE + " \n";
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
