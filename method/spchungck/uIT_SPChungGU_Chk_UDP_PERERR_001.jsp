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

		String PENCRT_KD = htMethod.get("PENCRT_KD");
		String EXAM_SDT = htMethod.get("EXAM_SDT");
		String EXAM_EDT = htMethod.get("EXAM_EDT");
		String COMP_CD = htMethod.get("COMP_CD");
		String MNGT_YR = htMethod.get("MNGT_YR");
		String PSNL_NM = htMethod.get("PSNL_NM");
		String PARAM_TX1 = htMethod.get("PARAM_TX1");
		String PARAM_TX2 = htMethod.get("PARAM_TX2");


		//
		if(PENCRT_KD == null) { PENCRT_KD = ""; }
		if(EXAM_SDT == null) { EXAM_SDT = ""; }
		if(EXAM_EDT == null) { EXAM_EDT = ""; }
		if(COMP_CD == null) { COMP_CD = ""; }
		if(MNGT_YR == null) { MNGT_YR = ""; }
		if(PSNL_NM == null) { PSNL_NM = ""; }
		if(PARAM_TX1 == null) { PARAM_TX1 = ""; }
		if(PARAM_TX2 == null) { PARAM_TX2 = ""; }

		// DB객체
		stmtList = connect.createStatement();

		sql = " SELECT CASE '" + PENCRT_KD + "' WHEN '1' THEN F_PERID_FIND1(A.EEA_EXAM_DT, A.EEA_EXAM_SQ, '1') ";
		sql += " 							ELSE F_PERID_FIND1(EEA_EXAM_DT, EEA_EXAM_SQ, '0') END ICR_PENL_ID, ";
		sql += " 	EEA_EXAM_DT, EEA_EXAM_SQ, EEA_PSNL_NM, SBE_EXAM_DT, SBE_TOBO_DT, ";
		sql += " 	CASE WHEN EEA_DIVI_CD='3' THEN '2' ELSE EEA_DIVI_CD END EEA_DIVI_CD ,EEA_ENTRY_DT,SBE_JUIP_DT, ";
		sql += " 	SBE_NCPN_LT,SBE_NCHR_HH,SBE_GOJU_CD,EEA_DEPT_NM, SBE_SAHU_YN, ";
		sql += " 	(select Max(SSM_SYSQ_NM) SSM_SYSQ_NM from ST_SYMPTOM  where SSM_EXAM_DT=A.EEA_EXAM_DT  AND SSM_EXAM_SQ=A.EEA_EXAM_SQ and SSM_SYSQ_CD='1' and SSM_SYMP_CD='3' ) JOB, ";
		sql += " 	(select Max(SSM_SYSQ_NM) SSM_SYSQ_NM from ST_SYMPTOM  where SSM_EXAM_DT=A.EEA_EXAM_DT  AND SSM_EXAM_SQ=A.EEA_EXAM_SQ and SSM_SYSQ_CD='3' and SSM_SYMP_CD='3' ) SMDR, ";
		sql += " 	CASE WHEN SBE_DDOC_CD = '' OR SBE_DDOC_CD IS NULL THEN '0' ELSE '1' END DSGR_RQEST_YN, ";
		sql += " 	CASE WHEN EEA_SEX_CD='1' then 'M' else 'W' end SEXDSTN, ";
		sql += " 	B.SBE_NOT_REG, B.SBE_SLNS_DELAY, C.ICR_NTNA_CD,  A.EEA_COMP_CD, D.SBP_BILL_FL, E.ICY_COMP_NM  ";
		sql += " FROM ET_EXAM_ACPT A ";
		sql += " LEFT OUTER JOIN ST_BASE B ON A.EEA_EXAM_DT = B.SBE_EXAM_DT  AND A.EEA_EXAM_SQ =B.SBE_EXAM_SQ ";
		sql += " Inner Join IT_CUSTOMER C On C.ICR_CUST_NO = A.EEA_CUST_NO ";
		sql += " Left Outer Join ST_BILLHN_PR D On D.SBP_EXAM_DT = A.EEA_EXAM_DT And D.SBP_EXAM_SQ = A.EEA_EXAM_SQ And D.SBP_RETURN_KD = '0' ";
		sql += " LEFT OUTER Join IT_COMPANY   E On E.ICY_COMP_CD = A.EEA_COMP_CD ";
		sql += " WHERE 0=0 ";

		if(!COMP_CD.equals("")){
			sql += " AND A.EEA_COMP_CD = '" + COMP_CD + "' ";
		}

		sql += " AND SUBSTR(EEA_MNGT_SPYM,1,4)='" + MNGT_YR + "' ";
		sql += " AND A.EEA_ORDER_YN <> 'C' ";
		sql += " AND SBE_PANJ_YN='Y' ";
		sql += " AND SBE_EXAM_CHA='1' ";
		sql += " AND A.EEA_EXAM_DT>= '" + EXAM_SDT + "' ";
		sql += " AND A.EEA_EXAM_DT <= '" + EXAM_EDT + "' ";

		if(!PSNL_NM.equals("")) {
			sql += " AND A.EEA_PSNL_NM = '" + PSNL_NM + "' ";
		}



		sql += PARAM_TX1;
		sql += PARAM_TX2;

		sql += " ORDER BY A.EEA_EXAM_DT, A.EEA_EXAM_SQ ";
			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uIT_SPChungGU_Chk_UDP_PERERR_001 \n";
			G_INFO += "설명 : 개인정보 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " PENCRT_KD : " + PENCRT_KD + " \n";
			G_INFO += " EXAM_SDT : " + EXAM_SDT + " \n";
			G_INFO += " EXAM_EDT : " + EXAM_EDT + " \n";
			G_INFO += " COMP_CD : " + COMP_CD + " \n";
			G_INFO += " MNGT_YR : " + MNGT_YR + " \n";
			G_INFO += " PSNL_NM : " + PSNL_NM + " \n";
			G_INFO += " PARAM_TX1 : " + PARAM_TX1 + " \n";
			G_INFO += " PARAM_TX2 : " + PARAM_TX2 + " \n";
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
