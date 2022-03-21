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

		String CN_PRCE_DT = htMethod.get("CN_PRCE_DT");
		String CN_SEX_CD = htMethod.get("CN_SEX_CD");
		String CN_SMALL = htMethod.get("CN_SMALL");

		//
		if(CN_PRCE_DT == null) { CN_PRCE_DT = ""; }
		if(CN_SEX_CD == null) { CN_SEX_CD = ""; }
		if(CN_SMALL == null) { CN_SMALL = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT CCN_FULL_NM EXAM_NM, CCN_SMALL ITEM_LT, :CN_PRCE_DT PRCE_DT, 

if (SUBSTR(:CN_PRCE_DT, 1, 4) < '2018') then
begin
       F_CALL_PRICE_IN(:CN_PRCE_DT, CCN_SMALL,:CN_SEX_CD) SALE_PR, 
       F_CALL_PRICE_OUT(:CN_PRCE_DT, CCN_SMALL, :CN_SEX_CD) GRUP_PR 
end
else
begin
       F_CALL_PRICE_YEAR(:CN_PRCE_DT, CCN_SMALL, :CN_SEX_CD, '1') SALE_PR, 
       F_CALL_PRICE_YEAR(:CN_PRCE_DT, CCN_SMALL, :CN_SEX_CD, '2') GRUP_PR
end;
                          
  FROM CT_COMMON 
 WHERE CCN_LARGE = '0401'
   AND CCN_SMALL = :CN_SMALL
   AND CCN_LEVEL = '5'
   AND UPPER(CCN_USE_YN) = 'Y'
		*/

		sql = " SELECT CCN_FULL_NM EXAM_NM, CCN_SMALL ITEM_LT, '" + CN_PRCE_DT + "' PRCE_DT,";

		if(CN_PRCE_DT.compareTo("2018") < 0) {
			sql += " F_CALL_PRICE_IN('" + CN_PRCE_DT + "', CCN_SMALL,'" + CN_SEX_CD + "') SALE_PR, F_CALL_PRICE_OUT('" + CN_PRCE_DT + "', CCN_SMALL, '" + CN_SEX_CD + "') GRUP_PR";
		}
		else {
			sql += " F_CALL_PRICE_YEAR('" + CN_PRCE_DT + "', CCN_SMALL, '" + CN_SEX_CD + "', '1') SALE_PR, F_CALL_PRICE_YEAR('" + CN_PRCE_DT + "', CCN_SMALL, '" + CN_SEX_CD + "', '2') GRUP_PR";
		}

		sql += " FROM CT_COMMON";
		sql += " WHERE CCN_LARGE = '0401'";
		sql += " AND CCN_SMALL = '" + CN_SMALL + "'";
		sql += " AND CCN_LEVEL = '5'";
		sql += " AND UPPER(CCN_USE_YN) = 'Y'";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uFM_AcptComm_GP_ExamList_004 \n";
			G_INFO += "설명 : 호출검진 수가 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " CN_PRCE_DT : " + CN_PRCE_DT + " \n";
			G_INFO += " CN_SEX_CD : " + CN_SEX_CD + " \n";
			G_INFO += " CN_SMALL : " + CN_SMALL + " \n";
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
		<s:AttributeType name='EXAM_NM' rs:number='1' rs:writeunknown='true' rs:basetable='CT_COMMON' rs:basecolumn='CCN_FULL_NM'>
			<s:datatype dt:type='string' dt:maxLength='300' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ITEM_LT' rs:number='2' rs:writeunknown='true' rs:basetable='CT_COMMON' rs:basecolumn='CCN_SMALL'>
			<s:datatype dt:type='string' dt:maxLength='20' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='PRCE_DT' rs:number='3' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='8' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='SALE_PR' rs:number='4' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='GRUP_PR' rs:number='5' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='6' rs:rowid='true' rs:basetable='CT_COMMON' rs:basecolumn='ROWID'
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

			String EXAM_NM_T = cRsList.getString("EXAM_NM");
			String ITEM_LT_T = cRsList.getString("ITEM_LT");
			String PRCE_DT_T = cRsList.getString("PRCE_DT");
			String SALE_PR_T = cRsList.getString("SALE_PR");
			String GRUP_PR_T = cRsList.getString("GRUP_PR");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! EXAM_NM_T.equals("")) {
%>
		 		EXAM_NM='<%= EXAM_NM_T%>'
<%
			}

			if(! ITEM_LT_T.equals("")) {
%>
		 		ITEM_LT='<%= ITEM_LT_T%>'
<%
			}

			if(! PRCE_DT_T.equals("")) {
%>
		 		PRCE_DT='<%= PRCE_DT_T%>'
<%
			}

			if(! SALE_PR_T.equals("")) {
%>
		 		SALE_PR='<%= SALE_PR_T%>'
<%
			}

			if(! GRUP_PR_T.equals("")) {
%>
		 		GRUP_PR='<%= GRUP_PR_T%>'
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
