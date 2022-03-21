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

	try {
%>
<%@ include file="/inc_prg/connect.jsp"%>
<%
		// 전달자료
		htData = (HashMap<String, Object>)request.getAttribute("htData");
		htMethod = (HashMap<String, String>)request.getAttribute("htMethod_1");

		String DP_FROMDT = htMethod.get("DP_FROMDT");
		String DP_TODT = htMethod.get("DP_TODT");
		String V_CHUNGKD = htMethod.get("V_CHUNGKD");
		String RZCB_CHYYYY = htMethod.get("RZCB_CHYYYY");
		String MSKEDTCOMP_CD = htMethod.get("MSKEDTCOMP_CD");
		String RZED_CHUNGNO = htMethod.get("RZED_CHUNGNO");

		//
		if(DP_FROMDT == null) { DP_FROMDT = ""; }
		if(DP_TODT == null) { DP_TODT = ""; }
		if(V_CHUNGKD == null) { V_CHUNGKD = ""; }
		if(RZCB_CHYYYY == null) { RZCB_CHYYYY = ""; }
		if(MSKEDTCOMP_CD == null) { MSKEDTCOMP_CD = ""; }
		if(RZED_CHUNGNO == null) { RZED_CHUNGNO = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT SBP_CHUNG_YY,SBP_CHUNG_KD,SBP_CHUNG_DT,SBP_CHUNG_NO,SBP_BILBE_NO,SBP_BILL_FL,BBH_ACPT_NO,
       MIN(SBP_EXAM_DT) STDT,MAX(SBP_EXAM_DT) EDDT, COUNT(*) CNT,SUM(SBP_BILL_PR) AMT,         
       f_comp_find(MAX(SPB_COMP_CD)) ICY_COMP_NM, SPB_COMP_CD                              
FROM ST_BILLHN_PR  A LEFT OUTER JOIN BT_BILL_HNHIS B ON  A.SBP_BILL_FL= B.BBH_BILL_FL          
WHERE SBP_CHUNG_DT>=:dp_fromdt AND SBP_CHUNG_DT<=:dp_todt
   AND SBP_CHUNG_KD = :v_chungkd     AND SBP_RETURN_KD='0'                              
   AND SBP_CHUNG_YY = :Rzcb_chyyyy

if :MskEdtCOMP_CD <> '' then
   And SPB_COMP_CD = :MskEdtCOMP_CD

if :rzed_chungno <> '' then
   AND  SBP_CHUNG_NO = :rzed_chungno
GROUP BY  SBP_CHUNG_YY,SBP_CHUNG_KD,SBP_CHUNG_DT,SBP_CHUNG_NO,SBP_BILBE_NO,SBP_BILL_FL ,BBH_ACPT_NO, SPB_COMP_CD 

		*/

		sql = " SELECT SBP_CHUNG_YY,SBP_CHUNG_KD,SBP_CHUNG_DT,SBP_CHUNG_NO,SBP_BILBE_NO,SBP_BILL_FL,BBH_ACPT_NO, MIN(SBP_EXAM_DT) STDT,MAX(SBP_EXAM_DT) EDDT, COUNT(*) CNT,SUM(SBP_BILL_PR) AMT, F_COMP_FIND(MAX(SPB_COMP_CD)) ICY_COMP_NM, SPB_COMP_CD";
		sql += " FROM ST_BILLHN_PR A LEFT OUTER JOIN BT_BILL_HNHIS B";
		sql += " ON A.SBP_BILL_FL= B.BBH_BILL_FL";
		sql += " WHERE SBP_CHUNG_DT>='" + DP_FROMDT + "'";
		sql += " AND SBP_CHUNG_DT<='" + DP_TODT + "'";
		sql += " AND SBP_CHUNG_KD = '" + V_CHUNGKD + "'";
		sql += " AND SBP_RETURN_KD='0'";
		sql += " AND SBP_CHUNG_YY = '" + RZCB_CHYYYY + "'";

		if(!MSKEDTCOMP_CD.equals("")) {
			sql += " AND SPB_COMP_CD = '" + MSKEDTCOMP_CD + "'";
		}
		
		if(!RZED_CHUNGNO.equals("")) {
			sql += " AND SBP_CHUNG_NO = '" + RZED_CHUNGNO + "'";
		}

		sql += " GROUP BY SBP_CHUNG_YY,SBP_CHUNG_KD,SBP_CHUNG_DT,SBP_CHUNG_NO,SBP_BILBE_NO,SBP_BILL_FL ,BBH_ACPT_NO, SPB_COMP_CD";
			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uSP_ChungFILERE_UDP_SELSAN_001 \n";
			G_INFO += "설명 : 청구정보 로딩 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " DP_FROMDT : " + DP_FROMDT + " \n";
			G_INFO += " DP_TODT : " + DP_TODT + " \n";
			G_INFO += " V_CHUNGKD : " + V_CHUNGKD + " \n";
			G_INFO += " RZCB_CHYYYY : " + RZCB_CHYYYY + " \n";
			G_INFO += " MSKEDTCOMP_CD : " + MSKEDTCOMP_CD + " \n";
			G_INFO += " RZED_CHUNGNO : " + RZED_CHUNGNO + " \n";
			G_INFO += "\n\n";

			G_INFO += "질의문 : " + sql + " \n";
			G_INFO += "-->";

		rsList = stmtList.executeQuery(sql);
		cRsList = new CRs(rsList);

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
		<s:AttributeType name='SBP_CHUNG_YY' rs:number='1' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_BILLHN_PR'
			 rs:basecolumn='SBP_CHUNG_YY'>
			<s:datatype dt:type='string' dt:maxLength='4'/>
		</s:AttributeType>
		<s:AttributeType name='SBP_CHUNG_KD' rs:number='2' rs:writeunknown='true' rs:basetable='ST_BILLHN_PR' rs:basecolumn='SBP_CHUNG_KD'>
			<s:datatype dt:type='string' dt:maxLength='2' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='SBP_CHUNG_DT' rs:number='3' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_BILLHN_PR'
			 rs:basecolumn='SBP_CHUNG_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='SBP_CHUNG_NO' rs:number='4' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_BILLHN_PR'
			 rs:basecolumn='SBP_CHUNG_NO'>
			<s:datatype dt:type='string' dt:maxLength='14'/>
		</s:AttributeType>
		<s:AttributeType name='SBP_BILBE_NO' rs:number='5' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_BILLHN_PR'
			 rs:basecolumn='SBP_BILBE_NO'>
			<s:datatype dt:type='string' dt:maxLength='14'/>
		</s:AttributeType>
		<s:AttributeType name='SBP_BILL_FL' rs:number='6' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_BILLHN_PR'
			 rs:basecolumn='SBP_BILL_FL'>
			<s:datatype dt:type='string' dt:maxLength='50'/>
		</s:AttributeType>
		<s:AttributeType name='BBH_ACPT_NO' rs:number='7' rs:nullable='true' rs:writeunknown='true' rs:basetable='BT_BILL_HNHIS'
			 rs:basecolumn='BBH_ACPT_NO'>
			<s:datatype dt:type='string' dt:maxLength='6'/>
		</s:AttributeType>
		<s:AttributeType name='STDT' rs:number='8' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EDDT' rs:number='9' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='CNT' rs:number='10' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='AMT' rs:number='11' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_COMP_NM' rs:number='12' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='SPB_COMP_CD' rs:number='13' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_BILLHN_PR'
			 rs:basecolumn='SPB_COMP_CD'>
			<s:datatype dt:type='string' dt:maxLength='12'/>
		</s:AttributeType>
		<s:extends type='rs:rowbase'/>
	</s:ElementType>
</s:Schema>
		<rs:data>
<%
		int cnt = 0;
		while(cRsList.next()) {

			cnt++;

			String SBP_CHUNG_YY_T = cRsList.getString("SBP_CHUNG_YY");
			String SBP_CHUNG_KD_T = cRsList.getString("SBP_CHUNG_KD");
			String SBP_CHUNG_DT_T = cRsList.getString("SBP_CHUNG_DT");
			String SBP_CHUNG_NO_T = cRsList.getString("SBP_CHUNG_NO");
			String SBP_BILBE_NO_T = cRsList.getString("SBP_BILBE_NO");
			String SBP_BILL_FL_T = cRsList.getString("SBP_BILL_FL");
			String BBH_ACPT_NO_T = cRsList.getString("BBH_ACPT_NO");
			String STDT_T = cRsList.getString("STDT");
			String EDDT_T = cRsList.getString("EDDT");
			String CNT_T = cRsList.getString("CNT");
			String AMT_T = cRsList.getString("AMT");
			String ICY_COMP_NM_T = cRsList.getString("ICY_COMP_NM");
			String SPB_COMP_CD_T = cRsList.getString("SPB_COMP_CD");
%>
			<z:row
<%
			if(! SBP_CHUNG_YY_T.equals("")) {
%>
		 		SBP_CHUNG_YY='<%= SBP_CHUNG_YY_T%>'
<%
			}

			if(! SBP_CHUNG_KD_T.equals("")) {
%>
		 		SBP_CHUNG_KD='<%= SBP_CHUNG_KD_T%>'
<%
			}

			if(! SBP_CHUNG_DT_T.equals("")) {
%>
		 		SBP_CHUNG_DT='<%= SBP_CHUNG_DT_T%>'
<%
			}

			if(! SBP_CHUNG_NO_T.equals("")) {
%>
		 		SBP_CHUNG_NO='<%= SBP_CHUNG_NO_T%>'
<%
			}

			if(! SBP_BILBE_NO_T.equals("")) {
%>
		 		SBP_BILBE_NO='<%= SBP_BILBE_NO_T%>'
<%
			}

			if(! SBP_BILL_FL_T.equals("")) {
%>
		 		SBP_BILL_FL='<%= SBP_BILL_FL_T%>'
<%
			}

			if(! BBH_ACPT_NO_T.equals("")) {
%>
		 		BBH_ACPT_NO='<%= BBH_ACPT_NO_T%>'
<%
			}

			if(! STDT_T.equals("")) {
%>
		 		STDT='<%= STDT_T%>'
<%
			}

			if(! EDDT_T.equals("")) {
%>
		 		EDDT='<%= EDDT_T%>'
<%
			}

			if(! CNT_T.equals("")) {
%>
		 		CNT='<%= CNT_T%>'
<%
			}

			if(! AMT_T.equals("")) {
%>
		 		AMT='<%= AMT_T%>'
<%
			}

			if(! ICY_COMP_NM_T.equals("")) {
%>
		 		ICY_COMP_NM='<%= ICY_COMP_NM_T%>'
<%
			}

			if(! SPB_COMP_CD_T.equals("")) {
%>
		 		SPB_COMP_CD='<%= SPB_COMP_CD_T%>'
<%
			}
%>
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
