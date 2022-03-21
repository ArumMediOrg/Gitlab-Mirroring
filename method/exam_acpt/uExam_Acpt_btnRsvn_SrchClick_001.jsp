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
		String EXAM_CD = htMethod.get("EXAM_CD");
		String COMP_CD = htMethod.get("COMP_CD");
		String COMP_NM = htMethod.get("COMP_NM");
		String PSNL_ID = htMethod.get("PSNL_ID");
		String PSNL_NM = htMethod.get("PSNL_NM");
		String PARAM_TX = htMethod.get("PARAM_TX");
		String PLCE_CD = htMethod.get("PLCE_CD");

		//
		if(EXAM_SDT == null) { EXAM_SDT = ""; }
		if(EXAM_EDT == null) { EXAM_EDT = ""; }
		if(EXAM_CD == null) { EXAM_CD = ""; }
		if(COMP_CD == null) { COMP_CD = ""; }
		if(COMP_NM == null) { COMP_NM = ""; }
		if(PSNL_ID == null) { PSNL_ID = ""; }
		if(PSNL_NM == null) { PSNL_NM = ""; }
		if(PARAM_TX == null) { PARAM_TX = ""; }
		if(PLCE_CD == null) { PLCE_CD = ""; }

		// DB객체
		stmtList = connect.createStatement();

		sql = " SELECT A.RRT_INPT_DTT RRT_RSVN_DT, A.RRT_RSVN_NO, A.RRT_EXAM_DT, A.RRT_CHART_NO, A.RRT_PLCE_CD, A.RRT_EXAM_TM, ";
		sql += " A.RRT_PSNL_NM, B.ICR_BIRH_DT, A.RRT_CUST_NO, A.RRT_EXAM_LT, A.RRT_COMP_CD, A.RRT_RSVN_TX, NVL((SELECT EPM_MEMO_SQ";
		sql += " FROM ET_PSNL_MEMO";
		sql += " WHERE EPM_CUST_NO = A.RRT_CUST_NO";
		sql += " AND ROWNUM = 1), '0') EPM_MEMO_SQ, F_TEL_FORMAT(A.RRT_MOBL_NO) RRT_MOBL_NO, F_TEL_FORMAT(A.RRT_TEL_NO) RRT_TEL_NO, F_PID(A.RRT_PSNL_ID) RRT_PSNL_ID, CASE WHEN SUBSTR(A.RRT_EXAM_LT, 1, 3) IN ('P00', 'E00') THEN F_PACK_FIND(A.RRT_EXAM_LT, '') WHEN SUBSTR(A.RRT_EXAM_LT, 1, 3) = 'C03' THEN F_PACK_FIND(A.RRT_EXAM_LT, A.RRT_COMP_CD) ELSE F_CODE_FIND('0401', SUBSTR(A.RRT_EXAM_CD || '001', 1, 5), '', '1') END AS RRT_EXAM_NM, F_COMP_FIND(A.RRT_COMP_CD) RRT_COMP_NM, A.RRT_EQUIP_LT, A.RRT_EQUIP_TM, F_USER_FIND(A.RRT_INPT_ID) RRT_INPT_NM, A.RRT_INPT_DTT";
		sql += " FROM RT_RSVT A LEFT OUTER JOIN IT_CUSTOMER B";
		sql += " ON B.ICR_CUST_NO = A.RRT_CUST_NO";
		sql += " WHERE A.RRT_EXAM_DT BETWEEN '" + EXAM_SDT + "'";
		sql += " AND '" + EXAM_EDT + "'";
		sql += " AND NVL(A.RRT_EXAM_SQ, ' ') = ' '";
		sql += " AND NVL(A.RRT_CNCL_YN, ' ') <> 'Y'";
		sql += " AND SUBSTR(A.RRT_EXAM_CD, 1, 2) <> '31'";

		if(!PLCE_CD.equals("")){
			sql += " AND A.RRT_PLCE_CD = '" + PLCE_CD + "' ";
		}


		if(! EXAM_CD.equals("00")) {

			sql += " AND (A.RRT_EXAM_CD LIKE '" + EXAM_CD + "%'";

			if(EXAM_CD.equals("11") || EXAM_CD.equals("12")) {

				sql += " OR A.RRT_HTSB_CD LIKE '" + EXAM_CD + "%'";
				sql += " OR NVL(A.RRT_HTSB_YN, 'N') = 'Y'";
			} else if(EXAM_CD.equals("13")) {

				sql += " OR A.RRT_HTSB_CD LIKE '" + EXAM_CD + "%'";
				sql += " OR NVL(A.RRT_STOMA_CD, '0') <> '0'";
				sql += " OR NVL(A.RRT_COLON_CD, '0') <> '0'";
				sql += " OR NVL(A.RRT_LIVER_CD, '0') <> '0'";
				sql += " OR NVL(A.RRT_BAST_CD, '0') <> '0'";
				sql += " OR NVL(A.RRT_UTER_CD, '0') <> '0'";
				sql += " OR NVL(A.RRT_LUNG_CD, '0') <> '0'";
			} else if(EXAM_CD.equals("32")) {

				sql += " OR A.RRT_EMSB_CD LIKE '" + EXAM_CD + "%'";
				sql += " OR NVL(A.RRT_EMSB_YN, 'N') = 'Y'";
			} else if(EXAM_CD.equals("41")) {

				sql += " OR A.RRT_SPSB_CD LIKE '" + EXAM_CD + "%'";
				sql += " OR NVL(A.RRT_SPSB_YN, 'N') = 'Y'";
			} else if(EXAM_CD.equals("91")) {

				sql += " OR A.RRT_ETSB_CD LIKE '" + EXAM_CD + "%'";
				sql += " OR NVL(A.RRT_ETSB_YN, 'N') = 'Y'";
			}

	  		sql += ")";
		}

		if(! COMP_CD.equals("")) {
			sql += " AND A.RRT_COMP_CD = '" + COMP_CD + "'";
		} else if(! COMP_NM.equals("")) {
			sql += " AND F_COMP_FIND(A.RRT_COMP_CD) LIKE '%" + COMP_NM + "%'";
		}

		if(! PSNL_ID.equals("")) {
			sql += " AND A.RRT_PSNL_ID LIKE '" + PSNL_ID + "%'";
		}

		sql += PARAM_TX;

		if(! PSNL_NM.equals("")) {
			sql += " AND A.RRT_PSNL_NM LIKE '%" + PSNL_NM + "%'";
			sql += " ORDER BY A.RRT_PSNL_NM, A.RRT_EXAM_DT, A.RRT_EXAM_TM";
		} else {
			sql += " ORDER BY A.RRT_EXAM_DT, A.RRT_EXAM_TM, A.RRT_PSNL_NM";
		}


			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uExam_Acpt_btnRsvn_SrchClick_001 \n";
			G_INFO += "설명 : 예약자료 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " EXAM_SDT : " + EXAM_SDT + " \n";
			G_INFO += " EXAM_EDT : " + EXAM_EDT + " \n";
			G_INFO += " EXAM_CD : " + EXAM_CD + " \n";
			G_INFO += " COMP_CD : " + COMP_CD + " \n";
			G_INFO += " COMP_NM : " + COMP_NM + " \n";
			G_INFO += " PSNL_ID : " + PSNL_ID + " \n";
			G_INFO += " PSNL_NM : " + PSNL_NM + " \n";
			G_INFO += " PARAM_TX : " + PARAM_TX + " \n";
			G_INFO += " PLCE_CD : " + PLCE_CD + " \n";
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
