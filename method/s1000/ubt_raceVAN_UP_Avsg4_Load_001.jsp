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

		String RECE_NO = htMethod.get("RECE_NO");
		String TRADEYN = htMethod.get("TRADEYN");
		String APPR_NO = htMethod.get("APPR_NO");

		//
		if(RECE_NO == null) { RECE_NO = ""; }
		if(TRADEYN == null) { TRADEYN = ""; }
		if(APPR_NO == null) { APPR_NO = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

select RCR_TID,
       RCR_TRACE_CD,
       RCR_ALLOT_MM||'개월' RCR_ALLOT_MM,
       RCR_RECE_PR,
       RCR_APPR_NO,
       RCR_APPR_DT,
       RCR_RECE_NO,
RCR_STORE_CD, RCR_ISSUE_CD, RCR_CARD_NO, RCR_INPUT_DTT, RCR_CARD_NM, RCR_DEAL_NO, RCR_XLS_DT
 from RT_CARD_RECE
where RCR_RECE_NO = :RECE_NO
if :TradeYn = 'N' then
begin
    and RCR_APPR_NO = :APPR_NO
end
order by RCR_INPUT_DTT
		*/

		sql = " SELECT RCR_TID, RCR_TRACE_CD, RCR_ALLOT_MM||'개월' RCR_ALLOT_MM, RCR_RECE_PR, RCR_APPR_NO, RCR_APPR_DT, RCR_RECE_NO, RCR_STORE_CD, RCR_ISSUE_CD, RCR_CARD_NO, RCR_INPUT_DTT, RCR_CARD_NM, RCR_DEAL_NO, RCR_XLS_DT";
		sql += " FROM RT_CARD_RECE";
		sql += " WHERE RCR_RECE_NO = '" + RECE_NO + "'";

		if(TRADEYN.equals("N")) {
			sql += " AND RCR_APPR_NO = '" + APPR_NO + "'";
		}

		sql += " ORDER BY RCR_INPUT_DTT";
			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : ubt_raceVAN_UP_Avsg4_Load_001 \n";
			G_INFO += "설명 : 카드수납테이블(승인내역)조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " RECE_NO : " + RECE_NO + " \n";
			G_INFO += " TRADEYN : " + TRADEYN + " \n";
			G_INFO += " APPR_NO : " + APPR_NO + " \n";
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
		<s:AttributeType name='RCR_TID' rs:number='1' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_CARD_RECE'
			 rs:basecolumn='RCR_TID'>
			<s:datatype dt:type='string' dt:maxLength='1004'/>
		</s:AttributeType>
		<s:AttributeType name='RCR_TRACE_CD' rs:number='2' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_CARD_RECE'
			 rs:basecolumn='RCR_TRACE_CD'>
			<s:datatype dt:type='string' dt:maxLength='1004'/>
		</s:AttributeType>
		<s:AttributeType name='RCR_ALLOT_MM' rs:number='3' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1004'/>
		</s:AttributeType>
		<s:AttributeType name='RCR_RECE_PR' rs:number='4' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_CARD_RECE'
			 rs:basecolumn='RCR_RECE_PR'>
			<s:datatype dt:type='string' dt:maxLength='1004'/>
		</s:AttributeType>
		<s:AttributeType name='RCR_APPR_NO' rs:number='5' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_CARD_RECE'
			 rs:basecolumn='RCR_APPR_NO'>
			<s:datatype dt:type='string' dt:maxLength='12'/>
		</s:AttributeType>
		<s:AttributeType name='RCR_APPR_DT' rs:number='6' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_CARD_RECE'
			 rs:basecolumn='RCR_APPR_DT'>
			<s:datatype dt:type='string' dt:maxLength='12'/>
		</s:AttributeType>
		<s:AttributeType name='RCR_RECE_NO' rs:number='7' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_CARD_RECE'
			 rs:basecolumn='RCR_RECE_NO'>
			<s:datatype dt:type='string' dt:maxLength='14'/>
		</s:AttributeType>
		<s:AttributeType name='RCR_STORE_CD' rs:number='8' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_CARD_RECE'
			 rs:basecolumn='RCR_STORE_CD'>
			<s:datatype dt:type='string' dt:maxLength='12'/>
		</s:AttributeType>
		<s:AttributeType name='RCR_ISSUE_CD' rs:number='9' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_CARD_RECE'
			 rs:basecolumn='RCR_ISSUE_CD'>
			<s:datatype dt:type='string' dt:maxLength='1004'/>
		</s:AttributeType>
		<s:AttributeType name='RCR_CARD_NO' rs:number='10' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_CARD_RECE'
			 rs:basecolumn='RCR_CARD_NO'>
			<s:datatype dt:type='string' dt:maxLength='40'/>
		</s:AttributeType>
		<s:AttributeType name='RCR_INPUT_DTT' rs:number='11' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_CARD_RECE'
			 rs:basecolumn='RCR_INPUT_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='RCR_CARD_NM' rs:number='12' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_CARD_RECE'
			 rs:basecolumn='RCR_CARD_NM'>
			<s:datatype dt:type='string' dt:maxLength='40'/>
		</s:AttributeType>
		<s:AttributeType name='RCR_DEAL_NO' rs:number='13' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_CARD_RECE'
			 rs:basecolumn='RCR_DEAL_NO'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='RCR_XLS_DT' rs:number='14' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_CARD_RECE'
			 rs:basecolumn='RCR_XLS_DT'>
			<s:datatype dt:type='string' dt:maxLength='1004'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='15' rs:rowid='true' rs:basetable='RT_CARD_RECE' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:extends type='rs:rowbase'/>
	</s:ElementType>
</s:Schema>
		<rs:data>
<%
		int cnt = 0;
		while(cRsList.next()) {

			cnt++;

			String RCR_TID_T = cRsList.getString("RCR_TID");
			String RCR_TRACE_CD_T = cRsList.getString("RCR_TRACE_CD");
			String RCR_ALLOT_MM_T = cRsList.getString("RCR_ALLOT_MM");
			String RCR_RECE_PR_T = cRsList.getString("RCR_RECE_PR");
			String RCR_APPR_NO_T = cRsList.getString("RCR_APPR_NO");
			String RCR_APPR_DT_T = cRsList.getString("RCR_APPR_DT");
			String RCR_RECE_NO_T = cRsList.getString("RCR_RECE_NO");
			String RCR_STORE_CD_T = cRsList.getString("RCR_STORE_CD");
			String RCR_ISSUE_CD_T = cRsList.getString("RCR_ISSUE_CD");
			String RCR_CARD_NO_T = cRsList.getString("RCR_CARD_NO");
			String RCR_INPUT_DTT_T = cRsList.getDate2("RCR_INPUT_DTT");
			String RCR_CARD_NM_T = cRsList.getString("RCR_CARD_NM");
			String RCR_DEAL_NO_T = cRsList.getString("RCR_DEAL_NO");
			String RCR_XLS_DT_T = cRsList.getString("RCR_XLS_DT");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! RCR_TID_T.equals("")) {
%>
		 		RCR_TID='<%= RCR_TID_T%>'
<%
			}

			if(! RCR_TRACE_CD_T.equals("")) {
%>
		 		RCR_TRACE_CD='<%= RCR_TRACE_CD_T%>'
<%
			}

			if(! RCR_ALLOT_MM_T.equals("")) {
%>
		 		RCR_ALLOT_MM='<%= RCR_ALLOT_MM_T%>'
<%
			}

			if(! RCR_RECE_PR_T.equals("")) {
%>
		 		RCR_RECE_PR='<%= RCR_RECE_PR_T%>'
<%
			}

			if(! RCR_APPR_NO_T.equals("")) {
%>
		 		RCR_APPR_NO='<%= RCR_APPR_NO_T%>'
<%
			}

			if(! RCR_APPR_DT_T.equals("")) {
%>
		 		RCR_APPR_DT='<%= RCR_APPR_DT_T%>'
<%
			}

			if(! RCR_RECE_NO_T.equals("")) {
%>
		 		RCR_RECE_NO='<%= RCR_RECE_NO_T%>'
<%
			}

			if(! RCR_STORE_CD_T.equals("")) {
%>
		 		RCR_STORE_CD='<%= RCR_STORE_CD_T%>'
<%
			}

			if(! RCR_ISSUE_CD_T.equals("")) {
%>
		 		RCR_ISSUE_CD='<%= RCR_ISSUE_CD_T%>'
<%
			}

			if(! RCR_CARD_NO_T.equals("")) {
%>
		 		RCR_CARD_NO='<%= RCR_CARD_NO_T%>'
<%
			}

			if(! RCR_INPUT_DTT_T.equals("")) {
%>
		 		RCR_INPUT_DTT='<%= RCR_INPUT_DTT_T%>'
<%
			}

			if(! RCR_CARD_NM_T.equals("")) {
%>
		 		RCR_CARD_NM='<%= RCR_CARD_NM_T%>'
<%
			}

			if(! RCR_DEAL_NO_T.equals("")) {
%>
		 		RCR_DEAL_NO='<%= RCR_DEAL_NO_T%>'
<%
			}

			if(! RCR_XLS_DT_T.equals("")) {
%>
		 		RCR_XLS_DT='<%= RCR_XLS_DT_T%>'
<%
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
