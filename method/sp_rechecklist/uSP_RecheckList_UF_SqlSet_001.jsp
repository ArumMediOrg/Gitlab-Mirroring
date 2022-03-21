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
		String PLCE_CD = htMethod.get("PLCE_CD");
		String CHART_NO = htMethod.get("CHART_NO");
		String PSNL_NM = htMethod.get("PSNL_NM");
		String PARAM_TX1 = htMethod.get("PARAM_TX1");
		String PARAM_TX2 = htMethod.get("PARAM_TX2");
		String ORDER_BY = htMethod.get("ORDER_BY");

		//
		if(EXAM_SDT == null) { EXAM_SDT = ""; }
		if(EXAM_EDT == null) { EXAM_EDT = ""; }
		if(PLCE_CD == null) { PLCE_CD = ""; }
		if(CHART_NO == null) { CHART_NO = ""; }
		if(PSNL_NM == null) { PSNL_NM = ""; }
		if(PARAM_TX1 == null) { PARAM_TX1 = ""; }
		if(PARAM_TX2 == null) { PARAM_TX2 = ""; }
		if(ORDER_BY == null) { ORDER_BY = ""; }

		// DB객체
		stmtList = connect.createStatement();


		sql = " SELECT A.EEA_EXAM_DT, A.EEA_EXAM_SQ, A.EEA_CHART_NO, A.EEA_PSNL_NM, A.EEA_PSNL_AGE, B.ICR_PENL_ID, A.EEA_CUST_NO, ";
		sql += " A.EEA_MNGT_SPYM, A.EEA_SEX_CD, A.EEA_DIVI_NO, GETCOMMON_LVCDTONM('0411',A.EEA_SEX_CD ,'5',1) EEA_SEX_NM, A.EEA_COMP_CD, ";
		sql += " A.EEA_DEPT_NM, A.EEA_MNGT_HTYR, A.EEA_EXAM_CD, A.EEA_SPCL_CD, GETCOMMON_LVCDTONM('0910',A.EEA_SPCL_CD,'5',2) EEA_SPCL_NM";
		sql += ", CASE WHEN A.EEA_EXAM_CD = '41001' OR A.EEA_SPSB_YN = 'Y' THEN '1' ELSE '2' END EEA_TKGM_CHA";
		sql += ", A.EEA_HTSB_CD, A.EEA_SPSB_CD, A.EEA_HTSB_YN, A.EEA_SPSB_YN, C.ICY_COMP_NM, C.ICY_ZIP_AR, C.ICY_ROAD_AR, D.PFP_PANRETR2, D.PFP_SEDPLIST, C.ICY_T_NM";
		sql += ", A.EEA_MOBL_NO, A.EEA_TEL_NO, E.SPG_PANJ_DT, F.SBE_TOBO_DT  ";
		sql += " FROM ET_EXAM_ACPT A LEFT OUTER JOIN IT_CUSTOMER B";
		sql += " ON A.EEA_CUST_NO = B.ICR_CUST_NO LEFT OUTER JOIN IT_COMPANY C";
		sql += " ON A.EEA_COMP_CD = C.ICY_COMP_CD LEFT OUTER JOIN PT_FIR_PANJUNG D";
		sql += " ON A.EEA_EXAM_DT = D.PFP_EXAM_DT";
		sql += " AND A.EEA_EXAM_SQ = D.PFP_EXAM_SQ";
		sql += " AND NVL(D.PFP_SEDPLIST, ' ') <> ' ' LEFT OUTER JOIN ST_PANJUNG E";
		sql += " ON A.EEA_EXAM_DT = E.SPG_EXAM_DT";
		sql += " AND A.EEA_EXAM_SQ = E.SPG_EXAM_SQ";
		sql += " AND E.SPG_EXAM_CHA = '1' LEFT OUTER JOIN ST_BASE F";
		sql += " ON A.EEA_EXAM_DT = F.SBE_EXAM_DT";
		sql += " AND A.EEA_EXAM_SQ = F.SBE_EXAM_SQ";
		sql += " AND F.SBE_PANJ_YN = 'Y'";
		sql += " WHERE A.EEA_EXAM_DT >= '" + EXAM_SDT + "'";
		sql += " AND A.EEA_EXAM_DT <= '" + EXAM_EDT + "'";
		sql += " AND A.EEA_ORDER_YN <> 'C'";

		if(!PLCE_CD.equals("") && !PLCE_CD.equals("0")) {
			sql += " AND SUBSTR(A.EEA_PLCE_CD,1,1) = '" + PLCE_CD + "'";
		}

		if(!CHART_NO.equals("")) {
			sql += " AND A.EEA_CHART_NO = '" + CHART_NO + "'";
		}

		if(!PSNL_NM.equals("")) {
			sql += " AND A.EEA_PSNL_NM LIKE '%' || '" + PSNL_NM + "' || '%'";
		}

		sql += PARAM_TX1;
		sql += PARAM_TX2;
		sql += " GROUP BY A.EEA_EXAM_DT, A.EEA_EXAM_SQ, A.EEA_CHART_NO, A.EEA_PSNL_NM, A.EEA_PSNL_AGE, B.ICR_PENL_ID, A.EEA_CUST_NO, ";
		sql += " A.EEA_MNGT_SPYM, A.EEA_SEX_CD, A.EEA_DIVI_NO, A.EEA_COMP_CD, A.EEA_DEPT_NM, A.EEA_MNGT_HTYR, A.EEA_EXAM_CD, A.EEA_SPCL_CD, ";
		sql += " CASE WHEN A.EEA_EXAM_CD = '41001'";
		sql += " OR A.EEA_SPSB_YN = 'Y' THEN '1' ELSE '2' END, A.EEA_HTSB_CD, A.EEA_SPSB_CD, A.EEA_HTSB_YN, A.EEA_SPSB_YN, C.ICY_COMP_NM, C.ICY_ZIP_AR, C.ICY_ROAD_AR, D.PFP_PANRETR2, D.PFP_SEDPLIST, C.ICY_T_NM";
		sql += ", A.EEA_MOBL_NO, A.EEA_TEL_NO, E.SPG_PANJ_DT, F.SBE_TOBO_DT ";
		sql += ORDER_BY;


			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uSP_RecheckList_UF_SqlSet_001 \n";
			G_INFO += "설명 : 특검 2차 대상자 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " EXAM_SDT : " + EXAM_SDT + " \n";
			G_INFO += " EXAM_EDT : " + EXAM_EDT + " \n";
			G_INFO += " PLCE_CD : " + PLCE_CD + " \n";
			G_INFO += " CHART_NO : " + CHART_NO + " \n";
			G_INFO += " PSNL_NM : " + PSNL_NM + " \n";
			G_INFO += " PARAM_TX1 : " + PARAM_TX1 + " \n";
			G_INFO += " PARAM_TX2 : " + PARAM_TX2 + " \n";
			G_INFO += " ORDER_BY : " + ORDER_BY + " \n";
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
