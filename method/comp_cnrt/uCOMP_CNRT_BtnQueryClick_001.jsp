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

		String COMP_CD = htMethod.get("COMP_CD");
		String MNGT_YR = htMethod.get("MNGT_YR");
		String CHKBOXUSE = htMethod.get("CHKBOXUSE");

		//
		if(COMP_CD == null) { COMP_CD = ""; }
		if(MNGT_YR == null) { MNGT_YR = ""; }
		if(CHKBOXUSE == null) { CHKBOXUSE = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT CAST(ROWID AS CHAR(18)) AS LOGID,
       ECC_COMP_CD, ECC_MNGT_YR, ECC_CNRT_SQ, ECC_CNRT_NM, ECC_CNRT_SDT,
       ECC_CNRT_EDT,ECC_SALE_ID, ECC_CNRT_TX, ECC_USE_YN,
 (SELECT IAU_PENL_NM FROM IT_AUTH_USER WHERE IAU_EMP_NO = ECC_SALE_ID) ECC_SALE_NM,
 (SELECT ICY_COMP_NM FROM IT_COMPANY WHERE ICY_COMP_CD = ECC_COMP_CD) ECC_COMP_NM,
       CASE WHEN ECC_SALE_ID IS NULL OR ECC_SALE_ID  = '' THEN ECC_SALE_ID
                 ELSE '[' || ECC_SALE_ID  || ']' ||
 (SELECT IAU_PENL_NM FROM IT_AUTH_USER WHERE IAU_EMP_NO = ECC_SALE_ID) END ECC_SALE_FNM
  FROM ET_COMP_CNRT
 WHERE ECC_COMP_CD = :COMP_CD
   AND ECC_MNGT_YR = :MNGT_YR

if :ChkBoxUSE =  False then
begin
   AND ECC_USE_YN = 'Y'
end
 ORDER BY ECC_COMP_CD, ECC_MNGT_YR, ECC_CNRT_SQ
		*/

		sql = " SELECT CAST(ROWID AS CHAR(18)) AS LOGID, ECC_COMP_CD, ECC_MNGT_YR, ECC_CNRT_SQ, ECC_CNRT_NM, ECC_CNRT_SDT, ECC_CNRT_EDT,ECC_SALE_ID, ECC_CNRT_TX, ECC_USE_YN";
		sql += ", (SELECT IAU_PENL_NM FROM IT_AUTH_USER WHERE IAU_EMP_NO = ECC_SALE_ID) ECC_SALE_NM";
		sql += ", (SELECT ICY_COMP_NM FROM IT_COMPANY WHERE ICY_COMP_CD = ECC_COMP_CD) ECC_COMP_NM";
		sql += ", CASE WHEN ECC_SALE_ID IS NULL OR ECC_SALE_ID = '' THEN ECC_SALE_ID ELSE '[' || ECC_SALE_ID || ']'";
		sql += " || (SELECT IAU_PENL_NM FROM IT_AUTH_USER WHERE IAU_EMP_NO = ECC_SALE_ID) END ECC_SALE_FNM";
		sql += " FROM ET_COMP_CNRT";
		sql += " WHERE ECC_COMP_CD = '" + COMP_CD + "'";
		sql += " AND ECC_MNGT_YR = '" + MNGT_YR + "'";

		if(CHKBOXUSE.equals("0")) {
			sql += " AND ECC_USE_YN = 'Y'";
		}
		sql += " ORDER BY ECC_COMP_CD, ECC_MNGT_YR, ECC_CNRT_SQ";
			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uCOMP_CNRT_BtnQueryClick_001 \n";
			G_INFO += "설명 : 사업장계약등록 내역 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " COMP_CD : " + COMP_CD + " \n";
			G_INFO += " MNGT_YR : " + MNGT_YR + " \n";
			G_INFO += " CHKBOXUSE : " + CHKBOXUSE + " \n";
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
		<s:AttributeType name='LOGID' rs:number='1' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ECC_COMP_CD' rs:number='2' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT' rs:basecolumn='ECC_COMP_CD'>
			<s:datatype dt:type='string' dt:maxLength='12' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ECC_MNGT_YR' rs:number='3' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT' rs:basecolumn='ECC_MNGT_YR'>
			<s:datatype dt:type='string' dt:maxLength='4' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ECC_CNRT_SQ' rs:number='4' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT' rs:basecolumn='ECC_CNRT_SQ'>
			<s:datatype dt:type='string' dt:maxLength='2' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ECC_CNRT_NM' rs:number='5' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT' rs:basecolumn='ECC_CNRT_NM'>
			<s:datatype dt:type='string' dt:maxLength='100' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ECC_CNRT_SDT' rs:number='6' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT' rs:basecolumn='ECC_CNRT_SDT'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ECC_CNRT_EDT' rs:number='7' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT' rs:basecolumn='ECC_CNRT_EDT'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ECC_SALE_ID' rs:number='8' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT'
			 rs:basecolumn='ECC_SALE_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ECC_CNRT_TX' rs:number='9' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT'
			 rs:basecolumn='ECC_CNRT_TX'>
			<s:datatype dt:type='string' dt:maxLength='2000'/>
		</s:AttributeType>
		<s:AttributeType name='ECC_USE_YN' rs:number='10' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT' rs:basecolumn='ECC_USE_YN'>
			<s:datatype dt:type='string' dt:maxLength='1' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ECC_SALE_NM' rs:number='11' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='ECC_COMP_NM' rs:number='12' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='ECC_SALE_FNM' rs:number='13' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT'
			 rs:basecolumn='ECC_SALE_FNM'>
			<s:datatype dt:type='string' dt:maxLength='122'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='14' rs:rowid='true' rs:basetable='ET_COMP_CNRT' rs:basecolumn='ROWID'
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

			String LOGID_T = cRsList.getString("LOGID");
			String ECC_COMP_CD_T = cRsList.getString("ECC_COMP_CD");
			String ECC_MNGT_YR_T = cRsList.getString("ECC_MNGT_YR");
			String ECC_CNRT_SQ_T = cRsList.getString("ECC_CNRT_SQ");
			String ECC_CNRT_NM_T = cRsList.getString("ECC_CNRT_NM");
			String ECC_CNRT_SDT_T = cRsList.getString("ECC_CNRT_SDT");
			String ECC_CNRT_EDT_T = cRsList.getString("ECC_CNRT_EDT");
			String ECC_SALE_ID_T = cRsList.getString("ECC_SALE_ID");
			String ECC_CNRT_TX_T = cRsList.getString("ECC_CNRT_TX");
			String ECC_USE_YN_T = cRsList.getString("ECC_USE_YN");
			String ECC_SALE_NM_T = cRsList.getString("ECC_SALE_NM");
			String ECC_COMP_NM_T = cRsList.getString("ECC_COMP_NM");
			String ECC_SALE_FNM_T = cRsList.getString("ECC_SALE_FNM");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! LOGID_T.equals("")) {
%>
		 		LOGID='<%= LOGID_T%>'
<%
			}

			if(! ECC_COMP_CD_T.equals("")) {
%>
		 		ECC_COMP_CD='<%= ECC_COMP_CD_T%>'
<%
			}

			if(! ECC_MNGT_YR_T.equals("")) {
%>
		 		ECC_MNGT_YR='<%= ECC_MNGT_YR_T%>'
<%
			}

			if(! ECC_CNRT_SQ_T.equals("")) {
%>
		 		ECC_CNRT_SQ='<%= ECC_CNRT_SQ_T%>'
<%
			}

			if(! ECC_CNRT_NM_T.equals("")) {
%>
		 		ECC_CNRT_NM='<%= ECC_CNRT_NM_T%>'
<%
			}

			if(! ECC_CNRT_SDT_T.equals("")) {
%>
		 		ECC_CNRT_SDT='<%= ECC_CNRT_SDT_T%>'
<%
			}

			if(! ECC_CNRT_EDT_T.equals("")) {
%>
		 		ECC_CNRT_EDT='<%= ECC_CNRT_EDT_T%>'
<%
			}

			if(! ECC_SALE_ID_T.equals("")) {
%>
		 		ECC_SALE_ID='<%= ECC_SALE_ID_T%>'
<%
			}

			if(! ECC_CNRT_TX_T.equals("")) {
%>
		 		ECC_CNRT_TX='<%= ECC_CNRT_TX_T%>'
<%
			}

			if(! ECC_USE_YN_T.equals("")) {
%>
		 		ECC_USE_YN='<%= ECC_USE_YN_T%>'
<%
			}

			if(! ECC_SALE_NM_T.equals("")) {
%>
		 		ECC_SALE_NM='<%= ECC_SALE_NM_T%>'
<%
			}

			if(! ECC_COMP_NM_T.equals("")) {
%>
		 		ECC_COMP_NM='<%= ECC_COMP_NM_T%>'
<%
			}

			if(! ECC_SALE_FNM_T.equals("")) {
%>
		 		ECC_SALE_FNM='<%= ECC_SALE_FNM_T%>'
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
