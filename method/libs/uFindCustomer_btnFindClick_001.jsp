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

		String DTEDTICR_BIRH_DT = htMethod.get("DTEDTICR_BIRH_DT");
		String EDTICR_PENL_NM = htMethod.get("EDTICR_PENL_NM");

		//
		if(DTEDTICR_BIRH_DT == null) { DTEDTICR_BIRH_DT = ""; }
		if(EDTICR_PENL_NM == null) { EDTICR_PENL_NM = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT ICR_CUST_NO, ICR_PENL_NM,                                                                                             
       (SUBSTR(ICR_PENL_ID,1,2) || '.' || SUBSTR(ICR_PENL_ID,3,2) || '.' || SUBSTR(ICR_PENL_ID,5,2)) AS ICR_BIRH_DT,
       (SELECT ICY_COMP_NM FROM IT_COMPANY WHERE ICY_COMP_CD = ICR_COMP_CD) AS ICR_COMP_NM,                                  
       ICR_MOBL_NO  FROM IT_CUSTOMER WHERE 0 = 0                                                                             
    if :DTEdtICR_BIRH_DT <> '' then AND ICR_BIRH_DT = :DTEdtICR_BIRH_DT 
    if :EdtICR_PENL_NM <> ''   then AND ICR_PENL_NM LIKE '%' || :EdtICR_PENL_NM.Text || '%''
     ORDER BY ICR_PENL_NM, ICR_CUST_NO 

		*/

		sql = " SELECT ICR_CUST_NO, ICR_PENL_NM, (SUBSTR(ICR_PENL_ID,1,2) || '.' || SUBSTR(ICR_PENL_ID,3,2) || '.' || SUBSTR(ICR_PENL_ID,5,2)) AS ICR_BIRH_DT";
		sql += ", (";
		sql += "	SELECT ICY_COMP_NM";
		sql += " 	FROM IT_COMPANY";
		sql += " 	WHERE ICY_COMP_CD = ICR_COMP_CD";
		sql += " ) AS ICR_COMP_NM, ICR_MOBL_NO";
		sql += " FROM IT_CUSTOMER";
		sql += " WHERE 0 = 0";

		if(!DTEDTICR_BIRH_DT.equals("")) {
			sql += " AND ICR_BIRH_DT = '" + DTEDTICR_BIRH_DT + "'";
		}
		if(!EDTICR_PENL_NM.equals("")) {
			sql += " AND ICR_PENL_NM LIKE '%" + EDTICR_PENL_NM + "%'";
		}		
		sql += " ORDER BY ICR_PENL_NM, ICR_CUST_NO";
			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uFindCustomer_btnFindClick_001 \n";
			G_INFO += "설명 : 고객 정보 검색 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " DTEDTICR_BIRH_DT : " + DTEDTICR_BIRH_DT + " \n";
			G_INFO += " EDTICR_PENL_NM : " + EDTICR_PENL_NM + " \n";
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
		<s:AttributeType name='ICR_CUST_NO' rs:number='1' rs:writeunknown='true' rs:basetable='IT_CUSTOMER' rs:basecolumn='ICR_CUST_NO'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_PENL_NM' rs:number='2' rs:writeunknown='true' rs:basetable='IT_CUSTOMER' rs:basecolumn='ICR_PENL_NM'>
			<s:datatype dt:type='string' dt:maxLength='100' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_BIRH_DT' rs:number='3' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='14'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_COMP_NM' rs:number='4' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_MOBL_NO' rs:number='5' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_MOBL_NO'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='6' rs:rowid='true' rs:basetable='IT_CUSTOMER' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:extends type='rs:rowbase'/>
	</s:ElementType>
</s:Schema>		<rs:data>
<%
		int cnt = 0;
		while(cRsList.next()) {

			cnt++;

			String ICR_CUST_NO_T = cRsList.getString("ICR_CUST_NO");
			String ICR_PENL_NM_T = cRsList.getString("ICR_PENL_NM");
			String ICR_BIRH_DT_T = cRsList.getString("ICR_BIRH_DT");
			String ICR_COMP_NM_T = cRsList.getString("ICR_COMP_NM");
			String ICR_MOBL_NO_T = cRsList.getString("ICR_MOBL_NO");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! ICR_CUST_NO_T.equals("")) {
%>
		 		ICR_CUST_NO='<%= ICR_CUST_NO_T%>'
<%
			}

			if(! ICR_PENL_NM_T.equals("")) {
%>
		 		ICR_PENL_NM='<%= ICR_PENL_NM_T%>'
<%
			}

			if(! ICR_BIRH_DT_T.equals("")) {
%>
		 		ICR_BIRH_DT='<%= ICR_BIRH_DT_T%>'
<%
			}

			if(! ICR_COMP_NM_T.equals("")) {
%>
		 		ICR_COMP_NM='<%= ICR_COMP_NM_T%>'
<%
			}

			if(! ICR_MOBL_NO_T.equals("")) {
%>
		 		ICR_MOBL_NO='<%= ICR_MOBL_NO_T%>'
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
