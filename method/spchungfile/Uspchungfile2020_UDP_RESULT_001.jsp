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

		String EXAM_DT1 = htMethod.get("EXAM_DT1");
		String COMP_CD = htMethod.get("COMP_CD");
		String MNGT_SPYM = htMethod.get("MNGT_SPYM");
		String SSQL_ADD = htMethod.get("SSQL_ADD");

		//
		if(EXAM_DT1 == null) { EXAM_DT1 = ""; }
		if(COMP_CD == null) { COMP_CD = ""; }
		if(MNGT_SPYM == null) { MNGT_SPYM = ""; }
		if(SSQL_ADD == null) { SSQL_ADD = ""; }

		// DB객체
		stmtList = connect.createStatement();

		sql = " SELECT ERI_SPCL_KD,IIM_RSLT_KD,EEA_EXAM_DT,EEA_EXAM_SQ,F_PERID_FIND1(EEA_EXAM_DT,EEA_EXAM_SQ,'0') ID, CASE WHEN SUBSTR(EEA_EXAM_CD,1,1) <>'4' THEN EEA_SPSB_CD ELSE EEA_EXAM_CD END FIRSTGBN , ERI_ITEM_CD,IIM_SBCD_CD,ERI_RSLT_VL,ERI_SPRT_CD, CASE WHEN ERI_VLDT_LH IN('L','H','*') THEN '2' ELSE '1' END INSPCT_RESULT, ERI_VLDT_LH ,IIM_TRLT_CD, F_ITEM_VLDT_FIND(ERI_ITEM_CD,EEA_SEX_CD,'1','0', SUBSTR(NVL(ERI_SPSB_PANJ, 'XX'),2,1),EEA_EXAM_DT) LOW, F_ITEM_VLDT_FIND(ERI_ITEM_CD,EEA_SEX_CD,'2','0', SUBSTR(NVL(ERI_SPSB_PANJ, 'XX'),2,1),EEA_EXAM_DT) HIGH, CASE WHEN EEA_SPHT_CD='2' THEN IIP_SBSG_PR WHEN EEA_SPHT_CD='1' THEN CASE WHEN (ERI_ITEM_CD='BA014')";
		sql += " AND (ERI_HLTH_KD='1') THEN IIP_SBSG_PR - IIP_GBSG_PR ELSE IIP_SBSG_PR END ELSE IIP_SBSG_PR END SLNS_MCCHRG , ERI_HLTH_KD, EEA_SPHT_CD, '' EXCEPT_FOR_CLAIM ,IIM_THPR_YN,SIH_HIPR_CD, SIH_HIPR_LT ,SIC_CANC_LT,'' INSPCT_REMARK ,'' HM_PKTBUK_KND, '' REQUIRE_CHK, F_ITEM_VLDT_FIND(ERI_ITEM_CD,EEA_SEX_CD,'0','2', SUBSTR(NVL(ERI_SPSB_PANJ, 'XX'),2,1),EEA_EXAM_DT) IIV_RSLT_UNIT, IIM_SANBO_KD , IIM_SANBO_CD , IIM_SANBO_CAL, CASE WHEN IIM_SUTK_YN = 'Y' THEN IIM_SUTK_CD ELSE '' END IIM_SUTK_CD";
		sql += " FROM ET_EXAM_ACPT A LEFT OUTER JOIN ET_RSLT_ITEM B";
		sql += " ON A.EEA_EXAM_DT = B.ERI_EXAM_DT";
		sql += " AND A.EEA_EXAM_SQ = B.ERI_EXAM_SQ LEFT OUTER JOIN ST_ITEM_HIGHPRICE D";
		sql += " ON A.EEA_EXAM_DT = D.SIH_EXAM_DT";
		sql += " AND A.EEA_EXAM_SQ = D.SIH_EXAM_SQ";
		sql += " AND B.ERI_ITEM_CD = D.SIH_ITEM_CD LEFT OUTER JOIN IT_ITEM C";
		sql += " ON B.ERI_ITEM_CD = C.IIM_ITEM_CD LEFT OUTER JOIN IT_ITEM_PRICE E";
		sql += " ON E.IIP_APLY_DT = GETITEM_PRICE_APPLYDATE(B.ERI_ITEM_CD, '" + EXAM_DT1 + "' , 'ITEM_CD')";
		sql += " AND B.ERI_ITEM_CD = E.IIP_ITEM_CD LEFT OUTER JOIN ST_ITEM_CANCEL F";
		sql += " ON A.EEA_EXAM_DT = F.SIC_EXAM_DT";
		sql += " AND A.EEA_EXAM_SQ = F.SIC_EXAM_SQ";
		sql += " AND B.ERI_ITEM_CD = F.SIC_ITEM_CD LEFT OUTER JOIN ST_BASE H";
		sql += " ON H.SBE_EXAM_DT = A.EEA_EXAM_DT";
		sql += " AND H.SBE_EXAM_SQ = A.EEA_EXAM_SQ LEFT OUTER JOIN IT_COMPANY I";
		sql += " ON A.EEA_COMP_CD = I.ICY_COMP_CD";
		sql += " WHERE 0=0";
		sql += " AND (A.EEA_EXAM_CD IN ('41001','42001')";
		sql += " OR A.EEA_SPSB_CD IN ('41001','42001'))";
		sql += " AND A.EEA_COMP_CD = '" + COMP_CD + "'";
		sql += " AND A.EEA_MNGT_SPYM LIKE '" + MNGT_SPYM + "'||'%'";
		sql += " AND SBE_PANJ_YN = 'Y'";
		sql += " AND IIM_TSND_YN = 'Y'";
		sql += " AND IIM_TUSE_YN = 'Y'";
		sql += SSQL_ADD;
			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : Uspchungfile2020_UDP_RESULT_001 \n";
			G_INFO += "설명 : 특검청구 검진결과 조회(2차) \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " EXAM_DT1 : " + EXAM_DT1 + " \n";
			G_INFO += " COMP_CD : " + COMP_CD + " \n";
			G_INFO += " MNGT_SPYM : " + MNGT_SPYM + " \n";
			G_INFO += " SSQL_ADD : " + SSQL_ADD + " \n";
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
