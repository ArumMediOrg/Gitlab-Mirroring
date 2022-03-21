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
		String CANAD_KD = htMethod.get("CANAD_KD");

		//
		if(EXAM_DT == null) { EXAM_DT = ""; }
		if(EXAM_SQ == null) { EXAM_SQ = ""; }
		if(CANAD_KD == null) { CANAD_KD = ""; }

		// DB객체
		stmtList = connect.createStatement();

		sql = " SELECT EEA_PLCE_CD , ECG_EXAM_DT , ECG_EXAM_SQ , ECG_CFRM_CD , REPLACE(ECG_LUEX_DT,'-','') ECG_LUEX_DT , ECG_LUEX_KD , ECG_CTDI_VL , ECG_BEFO_YN , ";
		sql += " ECG_BEFO_YY , ECG_BEFO_MM , ECG_PNRT_YN , ECG_PNRT1_YN , ECG_PNRT1IC_KD , ECG_PNRT1SL_KD , ECG_PNRT1SZ1_VL , ECG_PNRT1SZ2_VL , ECG_PNRT1FT_KD , ";
		sql += " ECG_PNRT1TR1_KD , ECG_PNRT1TR2_KD , ECG_PNRT2_YN , ECG_PNRT2IC_KD , ECG_PNRT2SL_KD , ECG_PNRT2SZ1_VL , ECG_PNRT2SZ2_VL , ECG_PNRT2FT_KD , ";
		sql += " ECG_PNRT2TR1_KD , ECG_PNRT2TR2_KD , ECG_PNRT3_YN , ECG_PNRT3IC_KD , ECG_PNRT3SL_KD , ECG_PNRT3SZ1_VL , ECG_PNRT3SZ2_VL , ECG_PNRT3FT_KD , ";
		sql += " ECG_PNRT3TR1_KD , ECG_PNRT3TR2_KD , ECG_PNRT4_YN , ECG_PNRT4IC_KD , ECG_PNRT4SL_KD , ECG_PNRT4SZ1_VL , ECG_PNRT4SZ2_VL , ECG_PNRT4FT_KD , ";
		sql += " ECG_PNRT4TR1_KD , ECG_PNRT4TR2_KD , ECG_PNRT5_YN , ECG_PNRT5IC_KD , ECG_PNRT5SL_KD , ECG_PNRT5SZ1_VL , ECG_PNRT5SZ2_VL , ECG_PNRT5FT_KD , ";
		sql += " ECG_PNRT5TR1_KD , ECG_PNRT5TR2_KD , ECG_PNRT6_YN , ECG_PNRT6IC_KD , ECG_PNRT6SL_KD , ECG_PNRT6SZ1_VL , ECG_PNRT6SZ2_VL , ECG_PNRT6FT_KD , ";
		sql += " ECG_PNRT6TR1_KD , ECG_PNRT6TR2_KD , ECG_BRLE_YN , ECG_BRLE_EX , ECG_LUCN_KD , ECG_LUCN_EX , ECG_SCRT_CD , ECG_SCRT_EX , ECG_INPT_YN , ";
		sql += " ECG_RSLT_KD , ECG_RSLT2_KD , ECG_ETC_EX , ECG_RSLT_EX , ECG_RSLT_ETC_EX , REPLACE(ECG_CFRM_DT,'-','') ECG_CFRM_DT , ECG_LUCN_YN , ";
		sql += " ECG_AFRL_EX , ECG_AFSM_EX , REPLACE(ECG_AFDT_DT,'-','') ECG_AFDT_DT , ECG_ETC_KD , ECG_AFPL_CD , ";
		sql += " ECG_SMOK_CK10 , ECG_SMOK_CK11 , ECG_SMOK_CK20 , ECG_SMOK_CK21 , ECG_SMOK_CK22 , ECG_SMOK_CK30 , ECG_SMOK_CK40 , ECG_SMOK_CK41 , ECG_SMOK_CK42, ";
		sql += " H.IAU_LICEN1_NO , H.IAU_PENL_NM , ";
		sql += " H.IAU_PENL_ID , H2.IAU_LICEN1_NO IAU_LICEN1_NO_DECI , H2.IAU_PENL_NM IAU_PENL_NM_DECI , H2.IAU_PENL_ID IAU_PENL_ID_DECI , ";
		sql += " H3.IAU_LICEN1_NO IAU_LICEN1_NO_AFTE , H3.IAU_PENL_NM IAU_PENL_NM_AFTE , H3.IAU_PENL_ID IAU_PENL_ID_AFTE, ";
		sql += " CASE WHEN F_CAN_PR(EEA_EXAM_DT, EEA_EXAM_SQ,'R0006') > 0 THEN '1' ELSE '0' END JINYN";
		sql += " FROM ET_CANCER_LUNG A LEFT OUTER JOIN ET_EXAM_ACPT F";
		sql += " ON A.ECG_EXAM_DT=F.EEA_EXAM_DT";
		sql += " AND A.ECG_EXAM_SQ=F.EEA_EXAM_SQ";
		sql += " AND EEA_LUNG_CD > '0' LEFT OUTER JOIN IT_AUTH_USER H";
		sql += " ON A.ECG_LICEN_CD =H.IAU_EMP_NO LEFT OUTER JOIN IT_AUTH_USER H2";
		sql += " ON A.ECG_DECI_LICEN_CD = H2.IAU_EMP_NO LEFT OUTER JOIN IT_AUTH_USER H3";
		sql += " ON A.ECG_AFTE_LICEN_CD = H3.IAU_EMP_NO LEFT OUTER JOIN ET_CANCER_HEADER I";
		sql += " ON A.ECG_EXAM_DT = I.ECH_EXAM_DT";
		sql += " AND A.ECG_EXAM_SQ=I.ECH_EXAM_SQ";
		sql += " WHERE ECH_CFRM_CD = '2'";
		sql += " AND EEA_EXAM_DT = '" + EXAM_DT + "'";
		sql += " AND EEA_EXAM_SQ = '" + EXAM_SQ + "'";
		sql += " AND SUBSTR(EEA_CANAD_KD,6,1) = '" + CANAD_KD + "'";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : UChungfile2020_JSON_UDP_SELLUNG_001 \n";
			G_INFO += "설명 : 청구생성(폐암) 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " EXAM_DT : " + EXAM_DT + " \n";
			G_INFO += " EXAM_SQ : " + EXAM_SQ + " \n";
			G_INFO += " CANAD_KD : " + CANAD_KD + " \n";
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
			} else if (rsmd.getColumnTypeName(colCnt).equals("DATE")){  //why doesn't working?
				//<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
				dataType = "dateTime";
				maxLength = "20";
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
