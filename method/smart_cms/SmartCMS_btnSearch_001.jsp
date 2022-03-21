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


		String SDATE = htMethod.get("SDATE");
		String EDATE = htMethod.get("EDATE");
		String CB4VALUE = htMethod.get("CB4VALUE");
		String COMCD = htMethod.get("COMCD");
		String CB3TEXT = htMethod.get("CB3TEXT");
		String GGBNINDX = htMethod.get("GGBNINDX");
		String CB2INDX = htMethod.get("CB2INDX");
		String SPLCE = htMethod.get("SPLCE");

		//
		if(SDATE == null) { SDATE = ""; }
		if(EDATE == null) { EDATE = ""; }
		if(CB4VALUE == null) { CB4VALUE = ""; }
		if(COMCD == null) { COMCD = ""; }
		if(CB3TEXT == null) { CB3TEXT = ""; }
		if(GGBNINDX == null) { GGBNINDX = ""; }
		if(CB2INDX == null) { CB2INDX = ""; }
		if(SPLCE == null) { SPLCE = ""; }

		// DB객체
		stmtList = connect.createStatement();

		sql = " Select DISTINCT  ";
		sql += " Acpt.EEA_EXAM_DT,  Acpt.EEA_EXAM_SQ,  Acpt.EEA_PSNL_NM,   Customer.ICR_PENL_ID,  ";
		sql += " P1.PFP_FIX_YN,     P2.PSP_FIX_YN,     HEADER.ECH_CFRM_CD, DT.EDP_PANJ_YN,        ";
		sql += " C1.ECS_CFRM_DT,    C2.ECC_CFRM_DT,    C3.ECL_CFRM_DT,     C4.ECB_CFRM_DT,       C5.ECV_CFRM_DT, ";
		sql += " P1.PFP_DOCTORFIR,  P2.PSP_DOCTORSED,  C1.ECS_LICEN_CD,    C2.ECC_LICEN_CD,      C3.ECL_LICEN_CD, ";
		sql += " C4.ECB_LICEN_CD,   C5.ECV_LICEN_CD,   DT.EDP_DOCT_CD,     STP.ESP_EXAM_DR,                       ";
		sql += " STP.ESP_ORAL_DR,   SP.SPG_DOCT_CD,    SP.SPG_EXAM_CHA,    SB.SBE_PANJ_YN,                        ";
		sql += " C6.ECG_CFRM_DT,    C6.ECG_LICEN_CD,   C6.ECG_AFDT_DT,     C6.ECG_Afte_LICEN_CD,                  ";
		sql += " SL.*                                                                                             ";
		sql += " From  ET_EXAM_ACPT Acpt                                                                           ";
		sql += " Inner Join IT_CUSTOMER Customer On Customer.ICR_CUST_NO = Acpt.EEA_CUST_NO                                     ";
		sql += " Left Outer Join PT_FIR_PANJUNG  P1 On P1.PFP_EXAM_DT = Acpt.EEA_EXAM_DT And P1.PFP_EXAM_SQ = Acpt.EEA_EXAM_SQ   ";
		sql += " 								And P1.PFP_FIX_YN = 'Y'                                                   ";
		sql += " Left Outer Join PT_SED_PANJUNG  P2 On P2.PSP_EXAM_DT = Acpt.EEA_EXAM_DT And P2.PSP_EXAM_SQ = Acpt.EEA_EXAM_SQ  ";
		sql += " 								And P2.PSP_FIX_YN = 'Y'                                                    ";
		sql += " Left Outer Join ET_CANCER_HEADER HEADER On HEADER.ECH_EXAM_DT = Acpt.EEA_EXAM_DT                                ";
		sql += " 									And HEADER.ECH_EXAM_SQ = Acpt.EEA_EXAM_SQ                             ";
		sql += " 									And HEADER.ECH_CFRM_CD = '2'                                       ";
		sql += " Left Outer Join ET_CANCER_STMC  C1 On C1.ECS_EXAM_DT = Acpt.EEA_EXAM_DT And C1.ECS_EXAM_SQ = Acpt.EEA_EXAM_SQ  ";
		sql += " Left Outer Join ET_CANCER_COLO  C2 On C2.ECC_EXAM_DT = Acpt.EEA_EXAM_DT And C2.ECC_EXAM_SQ = Acpt.EEA_EXAM_SQ  ";
		sql += " Left Outer Join ET_CANCER_LIVER C3 On C3.ECL_EXAM_DT = Acpt.EEA_EXAM_DT And C3.ECL_EXAM_SQ = Acpt.EEA_EXAM_SQ  ";
		sql += " Left Outer Join ET_CANCER_BRST  C4 On C4.ECB_EXAM_DT = Acpt.EEA_EXAM_DT And C4.ECB_EXAM_SQ = Acpt.EEA_EXAM_SQ  ";
		sql += " Left Outer Join ET_CANCER_CRVC  C5 On C5.ECV_EXAM_DT = Acpt.EEA_EXAM_DT And C5.ECV_EXAM_SQ = Acpt.EEA_EXAM_SQ  ";
		sql += " Left Outer Join ET_CANCER_LUNG  C6 On C6.ECG_EXAM_DT = Acpt.EEA_EXAM_DT And C6.ECG_EXAM_SQ = Acpt.EEA_EXAM_SQ   ";
		sql += " Left Outer Join ET_DENTAL_PANJ  DT On DT.EDP_EXAM_DT = Acpt.EEA_EXAM_DT And DT.EDP_EXAM_SQ = Acpt.EEA_EXAM_SQ  ";
		sql += " 								And DT.EDP_PANJ_YN = 'Y'                                               ";
		sql += " Left Outer Join ET_STDT_PNJN    STP On STP.ESP_EXAM_DT = Acpt.EEA_EXAM_DT And STP.ESP_EXAM_SQ = Acpt.EEA_EXAM_SQ";
		sql += " 								And (STP.ESP_EIFRM_DT <> '' Or STP.ESP_OIFRM_DT <> '')         ";
		sql += " Left Outer Join ST_PANJUNG      SP On SP.SPG_EXAM_DT = Acpt.EEA_EXAM_DT And SP.SPG_EXAM_SQ = Acpt.EEA_EXAM_SQ  ";
		sql += " Left Outer Join ST_BASE         SB On SB.SBE_EXAM_DT = Acpt.EEA_EXAM_DT And SB.SBE_EXAM_SQ = Acpt.EEA_EXAM_SQ   ";
		sql += " Left Outer Join SL_SIGNLIST     SL On SL.SL_EXAM_DATE = Acpt.EEA_EXAM_DT And SL.SL_EXAM_SQ = Acpt.EEA_EXAM_SQ   ";
		sql += " Where Acpt.EEA_EXAM_DT BetWeen '" + SDATE + "' And '" + EDATE + "' ";

		if (GGBNINDX.equals("0")) {
			sql += " And P1.PFP_DOCTORFIR = '" + CB4VALUE + "' ";
		} else if (GGBNINDX.equals("1")) {
			sql += " And P2.PSP_DOCTORSED = '" + CB4VALUE + "' ";
		} else if (GGBNINDX.equals("2")) {
			sql += " And (C1.ECS_LICEN_CD = '" + CB4VALUE + "' Or ";
			sql += " 	C2.ECC_LICEN_CD = '" + CB4VALUE + "' Or ";
			sql += " 	C3.ECL_LICEN_CD = '" + CB4VALUE + "' Or ";
			sql += " 	C4.ECB_LICEN_CD = '" + CB4VALUE + "' Or ";
			sql += " 	C5.ECV_LICEN_CD = '" + CB4VALUE + "' Or ";
			sql += " 	C6.ECG_LICEN_CD = '" + CB4VALUE + "' Or ";
			sql += " 	C6.ECG_Afte_LICEN_CD = '" + CB4VALUE + "')";
		} else if (GGBNINDX.equals("3")) {
			sql += " And DT.EDP_DOCT_CD = '" + CB4VALUE + "' ";
		} else if (GGBNINDX.equals("4")) {
			sql += " And STP.ESP_EXAM_DR = '" + CB4VALUE + "' ";
		} else if (GGBNINDX.equals("5")) {
			sql += " And STP.ESP_ORAL_DR = '" + CB4VALUE + "' ";
		} else if (GGBNINDX.equals("6")) {
			sql += " And (SP.SPG_DOCT_CD = '" + CB4VALUE + "' And ";
			sql += "	  SP.SPG_EXAM_CHA = '1') ";
		} else if (GGBNINDX.equals("7")) {
			sql += " And (SP.SPG_DOCT_CD = '" + CB4VALUE + "' And ";
			sql += " 	SP.SPG_EXAM_CHA = '2') ";
		}

		if (! COMCD.equals("")) {
			sql += " And Acpt.EEA_COMP_CD = '" + COMCD + "' ";
		}

		if (GGBNINDX.equals("0")){
			if (CB3TEXT.equals("미인증")){
				sql += "And (SL.SL_P1_CD = ' ' Or SL.SL_P1_CD Is Null) ";
			} else if (CB3TEXT.equals("인  증")){
				sql += "And (SL.SL_P1_CD <> ' ' And SL.SL_P1_CD Is Not Null)";
			}
		} else if (GGBNINDX.equals("1")) {
			if (CB3TEXT.equals("미인증")){
				sql += "And (SL.SL_P2_CD = ' ' Or SL.SL_P2_CD Is Null) ";
			} else if (CB3TEXT.equals("인  증")){
				sql += "And (SL.SL_P2_CD <> ' ' And SL.SL_P2_CD Is Not Null)";
			}
		} else if (GGBNINDX.equals("2")) {
			if (CB3TEXT.equals("미인증")){
				sql += " And ( ";
				sql += " 	((C1.ECS_LICEN_CD = '" + CB4VALUE + "') and (SL.SL_C1_CD = ' ' Or SL.SL_C1_CD Is Null)) Or ";
				sql += " 	((C2.ECC_LICEN_CD = '" + CB4VALUE + "') and (SL.SL_C2_CD = ' ' Or SL.SL_C2_CD Is Null)) Or ";
				sql += " 	((C3.ECL_LICEN_CD = '" + CB4VALUE + "') and (SL.SL_C3_CD = ' ' Or SL.SL_C3_CD Is Null)) Or ";
				sql += " 	((C4.ECB_LICEN_CD = '" + CB4VALUE + "') and (SL.SL_C4_CD = ' ' Or SL.SL_C4_CD Is Null)) Or ";
				sql += " 	((C5.ECV_LICEN_CD = '" + CB4VALUE + "') and (SL.SL_C5_CD = ' ' Or SL.SL_C5_CD Is Null)) Or ";
				sql += " 	((C6.ECG_LICEN_CD = '" + CB4VALUE + "') and (SL.SL_C6_CD = ' ' Or SL.SL_C6_CD Is Null)) Or ";
				sql += " 	((ECG_Afte_LICEN_CD = '" + CB4VALUE + "') and (SL.SL_C7_CD = ' ' Or SL.SL_C7_CD Is Null)) ";
				sql += " 	) ";
			} else if (CB3TEXT.equals("인  증")){
				sql += " And ( ";
				sql += " 	((C1.ECS_LICEN_CD = '" + CB4VALUE + "') and (SL.SL_C1_CD <> ' ' And SL.SL_C1_CD Is Not Null)) Or ";
				sql += " 	((C2.ECC_LICEN_CD = '" + CB4VALUE + "') and (SL.SL_C2_CD <> ' ' And SL.SL_C2_CD Is Not Null)) Or ";
				sql += " 	((C3.ECL_LICEN_CD = '" + CB4VALUE + "') and (SL.SL_C3_CD <> ' ' And SL.SL_C3_CD Is Not Null)) Or ";
				sql += " 	((C4.ECB_LICEN_CD = '" + CB4VALUE + "') and (SL.SL_C4_CD <> ' ' And SL.SL_C4_CD Is Not Null)) Or ";
				sql += " 	((C5.ECV_LICEN_CD = '" + CB4VALUE + "') and (SL.SL_C5_CD <> ' ' And SL.SL_C5_CD Is Not Null)) Or ";
				sql += " 	((C6.ECG_LICEN_CD = '" + CB4VALUE + "') and (SL.SL_C6_CD <> ' ' And SL.SL_C6_CD Is Not Null)) Or ";
				sql += " 	((ECG_Afte_LICEN_CD = '" + CB4VALUE + "') and (SL.SL_C7_CD <> ' ' And SL.SL_C7_CD Is Not Null)) ";
				sql += " 	) ";
			}
		} else if (GGBNINDX.equals("3")) {
			if (CB3TEXT.equals("미인증")){
				sql += "And (SL.SL_DT_CD = ' ' Or SL.SL_DT_CD Is Null) ";
			} else if (CB3TEXT.equals("인  증")){
				sql += "And (SL.SL_DT_CD <> ' ' And SL.SL_DT_CD Is Not Null)";
			}
		} else if (GGBNINDX.equals("4")) {
			if (CB3TEXT.equals("미인증")){
				sql += "And (SL.SL_STP_CD = ' ' Or SL.SL_STP_CD Is Null) ";
			} else if (CB3TEXT.equals("인  증")){
				sql += "And (SL.SL_STP_CD <> ' ' And SL.SL_STP_CD Is Not Null) ";
			}
		} else if (GGBNINDX.equals("5")) {
			if (CB3TEXT.equals("미인증")){
				sql += "And (SL.SL_STD_CD = ' ' Or SL.SL_STD_CD Is Null) ";
			} else if (CB3TEXT.equals("인  증")){
				sql += "And (SL.SL_STD_CD <> ' ' And SL.SL_STD_CD Is Not Null) ";
			}
		} else if (GGBNINDX.equals("6")) {
			if (CB3TEXT.equals("미인증")){
				sql += "And (SL.SL_SP1_CD = ' ' Or SL.SL_SP1_CD Is Null)";
			} else if (CB3TEXT.equals("인  증")){
				sql += "And (SL.SL_SP1_CD <> ' ' And SL.SL_SP1_CD Is Not Null)";
			}
		} else if (GGBNINDX.equals("7")) {
			if (CB3TEXT.equals("미인증")){
				sql += "And (SL.SL_SP2_CD = ' ' Or SL.SL_SP2_CD Is Null) ";
			} else if (CB3TEXT.equals("인  증")){
				sql += "And (SL.SL_SP2_CD <> ' ' And SL.SL_SP2_CD Is Not Null)";
			}
		}

		if (! SPLCE.equals("00")) {
			sql += "And Acpt.EEA_PLCE_CD = '" + SPLCE + "' ";
		}


		if (CB2INDX.equals("0")){
			sql += "Order By Acpt.EEA_EXAM_DT, Acpt.EEA_EXAM_SQ ";
		} else if (CB2INDX.equals("1")){
			sql += "Order By Acpt.EEA_PSNL_NM ";
		}
						//
		G_INFO += "<!-- \n";
		G_INFO += "서비스명 : SmartCMS_btnSearch_001 \n";
		G_INFO += "설명 : 수검자 조회 \n";
		G_INFO += "\n\n";

		G_INFO += "전달인자 : \n";
		G_INFO += "SDATE : " + SDATE + " \n";
		G_INFO += "EDATE : " + EDATE + " \n";
		G_INFO += "CB4VALUE : " + CB4VALUE + " \n";
		G_INFO += "COMCD : " + COMCD + " \n";
		G_INFO += "CB3TEXT : " + CB3TEXT + " \n";
		G_INFO += "GGBNINDX : " + GGBNINDX + " \n";
		G_INFO += "CB2INDX : " + CB2INDX + " \n";
		G_INFO += "SPLCE : " + SPLCE + " \n";
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