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

		String PEXAM_DTS = htMethod.get("PEXAM_DTS");
		String PEXAM_DTE = htMethod.get("PEXAM_DTE");
		String PCOMP_CD = htMethod.get("PCOMP_CD");
		String PDIVI_CS = htMethod.get("PDIVI_CS");
		String PCLSS_KD = htMethod.get("PCLSS_KD");
		String PDIVI_NO = htMethod.get("PDIVI_NO");
		String PPSNL_NM = htMethod.get("PPSNL_NM");
		String PSEX_GB = htMethod.get("PSEX_GB");
		String PCHUNG_KD = htMethod.get("PCHUNG_KD");
		String PCHUNG_CASE = htMethod.get("PCHUNG_CASE");

		//
		if(PEXAM_DTS == null) { PEXAM_DTS = ""; }
		if(PEXAM_DTE == null) { PEXAM_DTE = ""; }
		if(PCOMP_CD == null) { PCOMP_CD = ""; }
		if(PDIVI_CS == null) { PDIVI_CS = ""; }
		if(PCLSS_KD == null) { PCLSS_KD = ""; }
		if(PDIVI_NO == null) { PDIVI_NO = ""; }
		if(PPSNL_NM == null) { PPSNL_NM = ""; }
		if(PSEX_GB == null) { PSEX_GB = ""; }
		if(PCHUNG_KD == null) { PCHUNG_KD = ""; }
		if(PCHUNG_CASE == null) { PCHUNG_CASE = ""; }

		// DB객체
		stmtList = connect.createStatement();

		//
		sql =  " SELECT IIM_KNME_NM, IIP_JCSG_PR, SUM(MAN_CNT) MAN_CNT, SUM(WOMAN_CNT) WOMAN_CNT, SUM(TCNT) TCNT FROM ";
		sql += " (SELECT DISTINCT CASE WHEN NVL(IIM_SNME_NM, ' ') <> ' ' THEN IIM_SNME_NM ELSE IIM_KNME_NM END IIM_KNME_NM, ";
		sql += " IIP_JCSG_PR, COUNT(CASE WHEN EEA_SEX_CD = '1' THEN 1 END) MAN_CNT, ";
		sql += " COUNT(CASE WHEN EEA_SEX_CD = '2' THEN 1 END) WOMAN_CNT, COUNT(*) TCNT ";
		sql += " FROM ET_RSLT_ITEM ";
		sql += " INNER JOIN ET_EXAM_ACPT ON EEA_EXAM_DT = ERI_EXAM_DT AND EEA_EXAM_SQ = ERI_EXAM_SQ ";
		sql += " INNER JOIN ET_STDT_PNJN ON ESP_EXAM_DT = ERI_EXAM_DT AND ESP_EXAM_SQ = ERI_EXAM_SQ ";
		sql += " INNER JOIN IT_COMPANY ON ICY_COMP_CD = EEA_COMP_CD ";
		sql += " INNER JOIN IT_ITEM ON IIM_ITEM_CD = ERI_ITEM_CD ";
		sql += " INNER JOIN IT_ITEM_PRICE ON IIP_ITEM_CD = IIM_ITEM_CD ";
		sql += " AND IIP_APLY_DT = GETITEM_PRICE_APPLYDATE(IIM_ITEM_CD, ERI_EXAM_DT, 'ITEM_CD') ";
		sql += " AND IIP_USE_YN = 'Y' ";
		sql += " WHERE ERI_EXAM_DT BETWEEN '" + PEXAM_DTS + "' AND '" + PEXAM_DTE + "'";
		sql += " AND EEA_ORDER_YN <> 'C' ";
		sql += " AND EEA_EXAM_CD = '31001' AND ICY_COMP_CD = '" + PCOMP_CD + "'";
		sql += " AND (NVL(ESP_EIFRM_DT, ' ') <> ' ' OR NVL(ESP_OIFRM_DT, ' ') <> ' ') ";
		sql += " AND ERI_STDT_KD = '9' ";


		if(!PDIVI_CS.equals("")){
			sql += " AND EEA_DIVI_CS = '" + PDIVI_CS + "'";
		}

		if(!PCLSS_KD.equals("")) {
			sql += " AND EEA_CLSS_KD = PCLSS_KD ";
		}
		if (!PDIVI_NO.equals("")) {
			sql += " AND EEA_DIVI_NO = '" + PDIVI_NO + "'";
		}
		if (!PPSNL_NM.equals("")) {
			sql += " AND EEA_PSNL_NM LIKE '%" + PPSNL_NM + "%'";
		}
		if(PSEX_GB.equals("1")) {
			sql += " AND EEA_SEX_CD = '1'";
		}
		if(PSEX_GB.equals("2")) {
			sql += " AND EEA_SEX_CD = '2' ";
		}
		if(PCHUNG_KD.equals("1")) {
			sql += " AND ESP_CHUNG_YN = 'Y' ";
		}
		if(PCHUNG_CASE.equals("1")) {
			sql += " AND EEA_ORAL_YN <> '3' ";
		}
		if(PCHUNG_CASE.equals("2")) {
			sql += " AND EEA_ORAL_YN <> '2' ";
		}
		sql += " GROUP BY IIM_KNME_NM, IIM_SNME_NM, IIP_JCSG_PR) A GROUP BY IIM_KNME_NM, IIP_JCSG_PR ";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uRtStudChung_UP_Print_002 \n";
			G_INFO += "설명 : 학생비용추가청구 정보 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " PEXAM_DTS : " + PEXAM_DTS + " \n";
			G_INFO += " PEXAM_DTE : " + PEXAM_DTE + " \n";
			G_INFO += " PCOMP_CD : " + PCOMP_CD + " \n";
			G_INFO += " PDIVI_CS : " + PDIVI_CS + " \n";
			G_INFO += " PCLSS_KD : " + PCLSS_KD + " \n";
			G_INFO += " PDIVI_NO : " + PDIVI_NO + " \n";
			G_INFO += " PPSNL_NM : " + PPSNL_NM + " \n";
			G_INFO += " PSEX_GB : " + PSEX_GB + " \n";
			G_INFO += " PCHUNG_KD : " + PCHUNG_KD + " \n";
			G_INFO += " PCHUNG_CASE : " + PCHUNG_CASE + " \n";
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

