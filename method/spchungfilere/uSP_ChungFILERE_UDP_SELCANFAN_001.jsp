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
		String RZCB_CHYYYY = htMethod.get("RZCB_CHYYYY");
		String RZED_CHUNGNO = htMethod.get("RZED_CHUNGNO");

		//
		if(DP_FROMDT == null) { DP_FROMDT = ""; }
		if(DP_TODT == null) { DP_TODT = ""; }
		if(RZCB_CHYYYY == null) { RZCB_CHYYYY = ""; }
		if(RZED_CHUNGNO == null) { RZED_CHUNGNO = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT BBP_CHUNG_YY,BBP_CHUNG_KD,BBP_CHUNG_DT,BBP_CHUNG_NO,BBP_BILBE_NO, BBP_BILL_FL,BBH_ACPT_NO, 
       MIN(BBP_EXAM_DT) STDT,MAX(BBP_EXAM_DT) EDDT, COUNT(*) CNT,SUM(BBP_BILLCANFN_PR) AMT 
FROM BT_BILLHN_PR  A LEFT OUTER JOIN BT_BILL_HNHIS B ON  A.BBP_BILL_FL= B.BBH_BILL_FL      
WHERE BBP_CHUNG_DT>=:dp_fromdt AND  BBP_CHUNG_DT<=:dp_todt
   AND BBP_CHUNG_KD='32'   AND  BBP_RETURN_KD='0'            
   AND BBP_CHUNG_YY=:Rzcb_chyyyy
if rzed_chungno.Text<>'' then
   AND  BBP_CHUNG_NO=:rzed_chungno
GROUP BY  BBP_CHUNG_YY,BBP_CHUNG_KD,BBP_CHUNG_DT,BBP_CHUNG_NO,BBP_BILBE_NO,BBP_BILL_FL,BBH_ACPT_NO
		*/

		sql = " SELECT BBP_CHUNG_YY,BBP_CHUNG_KD,BBP_CHUNG_DT,BBP_CHUNG_NO,BBP_BILBE_NO, BBP_BILL_FL,BBH_ACPT_NO, MIN(BBP_EXAM_DT) STDT,MAX(BBP_EXAM_DT) EDDT, COUNT(*) CNT,SUM(BBP_BILLCANFN_PR) AMT";
		sql += " FROM BT_BILLHN_PR A LEFT OUTER JOIN BT_BILL_HNHIS B";
		sql += " ON A.BBP_BILL_FL= B.BBH_BILL_FL";
		sql += " WHERE BBP_CHUNG_DT>='" + DP_FROMDT + "'";
		sql += " AND BBP_CHUNG_DT<='" + DP_TODT + "'";
		sql += " AND BBP_CHUNG_KD='32'";
		sql += " AND BBP_RETURN_KD='0'";
		sql += " AND BBP_CHUNG_YY='" + RZCB_CHYYYY + "'";

		if(!RZED_CHUNGNO.equals("")) {
			sql += " AND BBP_CHUNG_NO='" + RZED_CHUNGNO + "'";
		}
		sql += " GROUP BY BBP_CHUNG_YY,BBP_CHUNG_KD,BBP_CHUNG_DT,BBP_CHUNG_NO,BBP_BILBE_NO,BBP_BILL_FL,BBH_ACPT_NO";
			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uSP_ChungFILERE_UDP_SELCANFAN_001 \n";
			G_INFO += "설명 : 청구정보 로딩 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " DP_FROMDT : " + DP_FROMDT + " \n";
			G_INFO += " DP_TODT : " + DP_TODT + " \n";
			G_INFO += " RZCB_CHYYYY : " + RZCB_CHYYYY + " \n";
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
		<s:AttributeType name='BBP_CHUNG_YY' rs:number='1' rs:nullable='true' rs:writeunknown='true' rs:basetable='BT_BILLHN_PR'
			 rs:basecolumn='BBP_CHUNG_YY'>
			<s:datatype dt:type='string' dt:maxLength='4'/>
		</s:AttributeType>
		<s:AttributeType name='BBP_CHUNG_KD' rs:number='2' rs:writeunknown='true' rs:basetable='BT_BILLHN_PR' rs:basecolumn='BBP_CHUNG_KD'>
			<s:datatype dt:type='string' dt:maxLength='2' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='BBP_CHUNG_DT' rs:number='3' rs:nullable='true' rs:writeunknown='true' rs:basetable='BT_BILLHN_PR'
			 rs:basecolumn='BBP_CHUNG_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='BBP_CHUNG_NO' rs:number='4' rs:nullable='true' rs:writeunknown='true' rs:basetable='BT_BILLHN_PR'
			 rs:basecolumn='BBP_CHUNG_NO'>
			<s:datatype dt:type='string' dt:maxLength='14'/>
		</s:AttributeType>
		<s:AttributeType name='BBP_BILBE_NO' rs:number='5' rs:nullable='true' rs:writeunknown='true' rs:basetable='BT_BILLHN_PR'
			 rs:basecolumn='BBP_BILBE_NO'>
			<s:datatype dt:type='string' dt:maxLength='14'/>
		</s:AttributeType>
		<s:AttributeType name='BBP_BILL_FL' rs:number='6' rs:nullable='true' rs:writeunknown='true' rs:basetable='BT_BILLHN_PR'
			 rs:basecolumn='BBP_BILL_FL'>
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
		<s:extends type='rs:rowbase'/>
	</s:ElementType>
</s:Schema>		<rs:data>
<%
		int cnt = 0;
		while(cRsList.next()) {

			cnt++;

			String BBP_CHUNG_YY_T = cRsList.getString("BBP_CHUNG_YY");
			String BBP_CHUNG_KD_T = cRsList.getString("BBP_CHUNG_KD");
			String BBP_CHUNG_DT_T = cRsList.getString("BBP_CHUNG_DT");
			String BBP_CHUNG_NO_T = cRsList.getString("BBP_CHUNG_NO");
			String BBP_BILBE_NO_T = cRsList.getString("BBP_BILBE_NO");
			String BBP_BILL_FL_T = cRsList.getString("BBP_BILL_FL");
			String BBH_ACPT_NO_T = cRsList.getString("BBH_ACPT_NO");
			String STDT_T = cRsList.getString("STDT");
			String EDDT_T = cRsList.getString("EDDT");
			String CNT_T = cRsList.getString("CNT");
			String AMT_T = cRsList.getString("AMT");
%>
			<z:row
<%
			if(! BBP_CHUNG_YY_T.equals("")) {
%>
		 		BBP_CHUNG_YY='<%= BBP_CHUNG_YY_T%>'
<%
			}

			if(! BBP_CHUNG_KD_T.equals("")) {
%>
		 		BBP_CHUNG_KD='<%= BBP_CHUNG_KD_T%>'
<%
			}

			if(! BBP_CHUNG_DT_T.equals("")) {
%>
		 		BBP_CHUNG_DT='<%= BBP_CHUNG_DT_T%>'
<%
			}

			if(! BBP_CHUNG_NO_T.equals("")) {
%>
		 		BBP_CHUNG_NO='<%= BBP_CHUNG_NO_T%>'
<%
			}

			if(! BBP_BILBE_NO_T.equals("")) {
%>
		 		BBP_BILBE_NO='<%= BBP_BILBE_NO_T%>'
<%
			}

			if(! BBP_BILL_FL_T.equals("")) {
%>
		 		BBP_BILL_FL='<%= BBP_BILL_FL_T%>'
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
