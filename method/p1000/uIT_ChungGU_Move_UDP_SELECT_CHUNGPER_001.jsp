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

		String AFROMDT = htMethod.get("AFROMDT");
		String ATODT = htMethod.get("ATODT");
		String ACOMPCD = htMethod.get("ACOMPCD");
		String AGBN = htMethod.get("AGBN");
		String TIBEROYN = htMethod.get("TIBEROYN");
		String AEXAMCD = htMethod.get("AEXAMCD");
		String AGUMGUBN = htMethod.get("AGUMGUBN");
		String AETC = htMethod.get("AETC");

		//
		if(AFROMDT == null) { AFROMDT = ""; }
		if(ATODT == null) { ATODT = ""; }
		if(ACOMPCD == null) { ACOMPCD = ""; }
		if(AGBN == null) { AGBN = ""; }
		if(TIBEROYN == null) { TIBEROYN = ""; }
		if(AEXAMCD == null) { AEXAMCD = ""; }
		if(AGUMGUBN == null) { AGUMGUBN = ""; }
		if(AETC == null) { AETC = ""; }

		// DB객체
		stmtList = connect.createStatement();


		sql = " SELECT ROW_NUMBER() OVER (ORDER BY EEA_COMP_CD DESC) ROW_NUM";
		sql += ", EEA_COMP_CD, ICY_COMP_NM, EEA_CUST_NO, EEA_PSNL_NM, IAU_PENL_NM, EEA_EXAM_DT,EEA_EXAM_SQ, ICR_PENL_ID, CHUNGGB, SUM(CHUNGAMT) CHUNGAMT, SUM(NVL(EEP_PSNL_PR, 0)) EEP_PSNL_PR";
		sql += " FROM (";
		sql += "	SELECT EEA_COMP_CD, ICY_COMP_NM, EEA_CUST_NO, EEA_PSNL_NM, EEA_SPCL_CD, IAU_PENL_NM , EEA_EXAM_DT,EEA_EXAM_SQ,ICR_PENL_ID";
		sql += "	, CASE WHEN CHUNGGB IN('일반' ,'학생') THEN EEP_CDMD_DT ELSE NULL END EEP_CDMD_DT";
		sql += "	, CASE WHEN CHUNGGB='특검' THEN EEP_CDMDS_DT ELSE NULL END EEP_CDMDS_DT, CHUNGGB, CHUNGAMT";
		sql += "	, CASE WHEN CHUNGGB IN('일반','학생','전체') then EEP_PSNL_PR  end EEP_PSNL_PR";
		sql += " 	FROM (";
		sql += "		SELECT EEA_COMP_CD, EEA_EXAM_DT,EEA_EXAM_SQ,ICR_PENL_ID, ICY_COMP_NM, EEA_CUST_NO, EEA_PSNL_NM, EEA_SPCL_CD, IAU_PENL_NM , EEP_CDMD_DT, EEP_CDMDS_DT, SUM(EEP_COMP_PR) 일반, SUM(EEP_COMPS_PR) 특검 , SUM(EEP_COMP_PR+EEP_COMPS_PR) 학생 , SUM(EEP_COMP_PR+EEP_COMPS_PR) 전체";
		sql += "		, CASE WHEN Sum( EEP_COMP_PR)> 0 then   sum(EEP_PSNL_PR) else sum(EEP_PSNL_PR) end EEP_PSNL_PR ";
		sql += " 		FROM (";
		sql += "			SELECT A.EEA_COMP_CD, EEA_EXAM_DT,EEA_EXAM_SQ,ICR_PENL_ID, C.ICY_COMP_NM, A.EEA_CUST_NO, A.EEA_PSNL_NM, A.EEA_SPCL_CD, D.IAU_PENL_NM , B.EEP_CDMD_DT, B.EEP_CDMDS_DT, (B.EEP_COMP_PR) EEP_COMP_PR, (B.EEP_COMPS_PR) EEP_COMPS_PR, (B.EEP_PSNLP_PR) EEP_PSNLP_PR";
		sql += "			, CASE WHEN EEA_RECE_KD<>'2' THEN EEP_PSNL_PR ELSE 0 END EEP_PSNL_PR ";
		sql += " 			FROM ET_EXAM_ACPT A LEFT OUTER JOIN ET_EXAM_PRICE B";
		sql += " 			ON A.EEA_EXAM_DT = B.EEP_EXAM_DT";
		sql += " 			AND A.EEA_EXAM_SQ = B.EEP_EXAM_SQ LEFT OUTER JOIN IT_COMPANY C";
		sql += " 			ON A.EEA_COMP_CD = C.ICY_COMP_CD LEFT OUTER JOIN IT_AUTH_USER D";
		sql += " 			ON C.ICY_SALE_ID = D.IAU_EMP_NO LEFT OUTER JOIN IT_CUSTOMER E";
		sql += " 			ON A.EEA_CUST_NO=E.ICR_CUST_NO";
		sql += " 			WHERE NVL(A.EEA_COMP_CD, ' ') <> ' '";
		sql += " 			AND EEA_ORDER_YN<>'C'";
		sql += " 			AND EEA_EXAM_DT >= '" + AFROMDT + "'";
		sql += " 			AND EEA_EXAM_DT <= '" + ATODT + "'";
		sql += " 			AND EEA_COMP_CD LIKE '" + ACOMPCD + "%'";
		sql += " 			AND EEA_ORDER_YN <> 'C'";

		if (! AETC.equals("")) {
			sql += AETC;
		}

		if (! AGUMGUBN.equals("")) {
			sql += " AND SUBSTR(EEA_EXAM_CD,1,2) = '" + AEXAMCD + "' ";
		}

		sql += "		) LAST_G";
		sql += " 		GROUP BY EEA_COMP_CD, ICY_COMP_NM, EEA_CUST_NO, EEA_PSNL_NM, EEA_SPCL_CD, IAU_PENL_NM , EEP_CDMD_DT, EEP_CDMDS_DT,EEA_EXAM_DT,EEA_EXAM_SQ,ICR_PENL_ID";

		if (TIBEROYN.equals("Y")) {
			sql += "	) UNPIVOT(CHUNGAMT for CHUNGGB IN (일반,특검,학생,전체)) UNPVT ";
		} else {
			sql += "	) P UNPIVOT(CHUNGAMT FOR CHUNGGB IN (일반,특검,학생,전체)) UNPVT ";
		}

		sql += "	WHERE 0=0";
		sql += "	AND CASE WHEN CHUNGGB IN('일반','학생') THEN EEP_CDMD_DT ELSE NULL END IS NULL";
		sql += "	AND CASE WHEN CHUNGGB='특검' THEN EEP_CDMDS_DT ELSE NULL END IS NULL";
		sql += "	AND CHUNGGB = '" + AGBN + "'";
		sql += "	AND CASE WHEN CHUNGGB IN('일반') THEN (";
		sql += "        Select MAX(BCL_BILL_KD) BCL_BILL_KD  From BT_BILL_COMP_LIST T  ";
		sql += "        Where EEA_EXAM_DT = T.BCL_EXAM_DT and EEA_EXAM_SQ = T.BCL_EXAM_SQ  and T.BCL_BILL_KD = '31' ";
		sql += "	) WHEN CHUNGGB IN('특검') THEN (";
		sql += "        Select MAX(BCL_BILL_KD) BCL_BILL_KD  From BT_BILL_COMP_LIST T  ";
		sql += "        Where EEA_EXAM_DT = T.BCL_EXAM_DT and EEA_EXAM_SQ = T.BCL_EXAM_SQ  and T.BCL_BILL_KD = '32' ";
		sql += "	) ELSE (";
		sql += "        Select MAX(BCL_BILL_KD) BCL_BILL_KD From BT_BILL_COMP_LIST T  ";
		sql += "        Where EEA_EXAM_DT = T.BCL_EXAM_DT and EEA_EXAM_SQ = T.BCL_EXAM_SQ ";
		sql += "	) END IS NULL";
		sql += "	AND EEA_COMP_CD LIKE '" + ACOMPCD + "%'";
		sql += ") LAST_T";
		sql += " WHERE CHUNGAMT > 0";
		sql += " GROUP BY EEA_COMP_CD, ICY_COMP_NM, EEA_CUST_NO, EEA_PSNL_NM, EEA_SPCL_CD, IAU_PENL_NM , CHUNGGB, EEA_EXAM_DT, EEA_EXAM_SQ, ICR_PENL_ID ";
		sql += " ORDER BY CHUNGGB";
			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uIT_ChungGU_Move_UDP_SELECT_CHUNGPER_001 \n";
			G_INFO += "설명 : 사업장 청구정보 로딩 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " AFROMDT : " + AFROMDT + " \n";
			G_INFO += " ATODT : " + ATODT + " \n";
			G_INFO += " ACOMPCD : " + ACOMPCD + " \n";
			G_INFO += " AGBN : " + AGBN + " \n";
			G_INFO += " TIBEROYN : " + TIBEROYN + " \n";
			G_INFO += " AETC : " + AETC + " \n";
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
