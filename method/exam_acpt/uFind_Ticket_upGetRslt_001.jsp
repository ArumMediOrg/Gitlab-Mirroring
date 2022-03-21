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

		String PUB_CD = htMethod.get("PUB_CD");
		String ISSUE_DT = htMethod.get("ISSUE_DT");
		String COMP_NM = htMethod.get("COMP_NM");
		String PSNL_NM = htMethod.get("PSNL_NM");
		String USE_YN = htMethod.get("USE_YN");
		String PARAM_TX = htMethod.get("PARAM_TX");

		//
		if(PUB_CD == null) { PUB_CD = ""; }
		if(ISSUE_DT == null) { ISSUE_DT = ""; }
		if(COMP_NM == null) { COMP_NM = ""; }
		if(PSNL_NM == null) { PSNL_NM = ""; }
		if(USE_YN == null) { USE_YN = ""; }
		if(PARAM_TX == null) { PARAM_TX = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT A.*, B.EEA_EXAM_DT, B.EEA_PSNL_NM 
  FROM IT_TICKET A LEFT OUTER JOIN ET_EXAM_ACPT B 
    ON B.EEA_CUPN_NO = A.ITK_PUB_CD 
   AND B.EEA_ORDER_YN <> 'C' 
 WHERE 1 = 1

if (:PUB_CD <> '') then
   AND A.ITK_PUB_CD LIKE :PUB_CD || '%'

if (:ISSUE_DT <> '') then
   AND A.ITK_S_DT LIKE :ISSUE_DT || '%'

if (:COMP_NM <> '') then
   AND A.ITK_PUB_COMP_NM LIKE :COMP_NM || '%'

if (:PSNL_NM <> '') then
   AND A.ITK_CUST_NM LIKE :PSNL_NM || '%'

if (:USE_YN <> '') then
   AND A.ITK_USE_YN = :USE_YN

:PARAM_TX

		*/

		sql = " SELECT A.*, B.EEA_EXAM_DT, B.EEA_PSNL_NM";
		sql += " FROM IT_TICKET A LEFT OUTER JOIN ET_EXAM_ACPT B";
		sql += " ON B.EEA_CUPN_NO = A.ITK_PUB_CD";
		sql += " AND B.EEA_ORDER_YN <> 'C'";
		sql += " WHERE 1 = 1";

		if(! PUB_CD.equals("")) {
			sql += " AND A.ITK_PUB_CD LIKE '" + PUB_CD + "%'";
		}

		if(! ISSUE_DT.equals("")) {
			sql += " AND A.ITK_S_DT LIKE '" + ISSUE_DT + "%'";
		}

		if(! COMP_NM.equals("")) {
			sql += " AND A.ITK_PUB_COMP_NM LIKE '" + COMP_NM + "%'";
		}

		if(! PSNL_NM.equals("")) {
			sql += " AND A.ITK_CUST_NM LIKE '" + PSNL_NM + "%'";
		}

		if(! USE_YN.equals("")) {
			sql += " AND A.ITK_USE_YN = '" + USE_YN + "'";
		}

		sql += PARAM_TX;

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uFind_Ticket_upGetRslt_001 \n";
			G_INFO += "설명 : 검진권 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " PUB_CD : " + PUB_CD + " \n";
			G_INFO += " ISSUE_DT : " + ISSUE_DT + " \n";
			G_INFO += " COMP_NM : " + COMP_NM + " \n";
			G_INFO += " PSNL_NM : " + PSNL_NM + " \n";
			G_INFO += " USE_YN : " + USE_YN + " \n";
			G_INFO += " PARAM_TX : " + PARAM_TX + " \n";
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
		<s:AttributeType name='ITK_PUB_CD' rs:number='1' rs:writeunknown='true' rs:basetable='IT_TICKET' rs:basecolumn='ITK_PUB_CD'>
			<s:datatype dt:type='string' dt:maxLength='12' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ITK_PUB_COMP_CD' rs:number='2' rs:writeunknown='true' rs:basetable='IT_TICKET' rs:basecolumn='ITK_PUB_COMP_CD'>
			<s:datatype dt:type='string' dt:maxLength='1004' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ITK_CUST_NM' rs:number='3' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_TICKET'
			 rs:basecolumn='ITK_CUST_NM'>
			<s:datatype dt:type='string' dt:maxLength='50'/>
		</s:AttributeType>
		<s:AttributeType name='ITK_CUST_BIRTH' rs:number='4' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_TICKET'
			 rs:basecolumn='ITK_CUST_BIRTH'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ITK_CUST_SEX' rs:number='5' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_TICKET'
			 rs:basecolumn='ITK_CUST_SEX'>
			<s:datatype dt:type='string' dt:maxLength='1004'/>
		</s:AttributeType>
		<s:AttributeType name='ITK_PUB_COMP_NM' rs:number='6' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_TICKET'
			 rs:basecolumn='ITK_PUB_COMP_NM'>
			<s:datatype dt:type='string' dt:maxLength='60'/>
		</s:AttributeType>
		<s:AttributeType name='ITK_PUB_NM' rs:number='7' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_TICKET'
			 rs:basecolumn='ITK_PUB_NM'>
			<s:datatype dt:type='string' dt:maxLength='50'/>
		</s:AttributeType>
		<s:AttributeType name='ITK_S_DT' rs:number='8' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_TICKET'
			 rs:basecolumn='ITK_S_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ITK_E_DT' rs:number='9' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_TICKET'
			 rs:basecolumn='ITK_E_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ITK_USE_YN' rs:number='10' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_TICKET'
			 rs:basecolumn='ITK_USE_YN'>
			<s:datatype dt:type='string' dt:maxLength='1004'/>
		</s:AttributeType>
		<s:AttributeType name='ITK_INPT_ID' rs:number='11' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_TICKET'
			 rs:basecolumn='ITK_INPT_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ITK_INPT_DTT' rs:number='12' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_TICKET'
			 rs:basecolumn='ITK_INPT_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ITK_MODI_ID' rs:number='13' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_TICKET'
			 rs:basecolumn='ITK_MODI_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ITK_MODI_DTT' rs:number='14' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_TICKET'
			 rs:basecolumn='ITK_MODI_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_EXAM_DT' rs:number='15' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_EXAM_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_PSNL_NM' rs:number='16' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_PSNL_NM'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='17' rs:rowid='true' rs:basetable='IT_TICKET' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c17' rs:name='ROWID' rs:number='18' rs:rowid='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='ROWID'
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

			String ITK_PUB_CD_T = cRsList.getString("ITK_PUB_CD");
			String ITK_PUB_COMP_CD_T = cRsList.getString("ITK_PUB_COMP_CD");
			String ITK_CUST_NM_T = cRsList.getString("ITK_CUST_NM");
			String ITK_CUST_BIRTH_T = cRsList.getString("ITK_CUST_BIRTH");
			String ITK_CUST_SEX_T = cRsList.getString("ITK_CUST_SEX");
			String ITK_PUB_COMP_NM_T = cRsList.getString("ITK_PUB_COMP_NM");
			String ITK_PUB_NM_T = cRsList.getString("ITK_PUB_NM");
			String ITK_S_DT_T = cRsList.getString("ITK_S_DT");
			String ITK_E_DT_T = cRsList.getString("ITK_E_DT");
			String ITK_USE_YN_T = cRsList.getString("ITK_USE_YN");
			String ITK_INPT_ID_T = cRsList.getString("ITK_INPT_ID");
			String ITK_INPT_DTT_T = cRsList.getDate2("ITK_INPT_DTT");
			String ITK_MODI_ID_T = cRsList.getString("ITK_MODI_ID");
			String ITK_MODI_DTT_T = cRsList.getDate2("ITK_MODI_DTT");
			String EEA_EXAM_DT_T = cRsList.getString("EEA_EXAM_DT");
			String EEA_PSNL_NM_T = cRsList.getString("EEA_PSNL_NM");
			String ROWID_T = cRsList.getString("ROWID");
			String c17_T = cRsList.getString("c17");
%>
			<z:row
<%
			if(! ITK_PUB_CD_T.equals("")) {
%>
		 		ITK_PUB_CD='<%= ITK_PUB_CD_T%>'
<%
			}

			if(! ITK_PUB_COMP_CD_T.equals("")) {
%>
		 		ITK_PUB_COMP_CD='<%= ITK_PUB_COMP_CD_T%>'
<%
			}

			if(! ITK_CUST_NM_T.equals("")) {
%>
		 		ITK_CUST_NM='<%= ITK_CUST_NM_T%>'
<%
			}

			if(! ITK_CUST_BIRTH_T.equals("")) {
%>
		 		ITK_CUST_BIRTH='<%= ITK_CUST_BIRTH_T%>'
<%
			}

			if(! ITK_CUST_SEX_T.equals("")) {
%>
		 		ITK_CUST_SEX='<%= ITK_CUST_SEX_T%>'
<%
			}

			if(! ITK_PUB_COMP_NM_T.equals("")) {
%>
		 		ITK_PUB_COMP_NM='<%= ITK_PUB_COMP_NM_T%>'
<%
			}

			if(! ITK_PUB_NM_T.equals("")) {
%>
		 		ITK_PUB_NM='<%= ITK_PUB_NM_T%>'
<%
			}

			if(! ITK_S_DT_T.equals("")) {
%>
		 		ITK_S_DT='<%= ITK_S_DT_T%>'
<%
			}

			if(! ITK_E_DT_T.equals("")) {
%>
		 		ITK_E_DT='<%= ITK_E_DT_T%>'
<%
			}

			if(! ITK_USE_YN_T.equals("")) {
%>
		 		ITK_USE_YN='<%= ITK_USE_YN_T%>'
<%
			}

			if(! ITK_INPT_ID_T.equals("")) {
%>
		 		ITK_INPT_ID='<%= ITK_INPT_ID_T%>'
<%
			}

			if(! ITK_INPT_DTT_T.equals("")) {
%>
		 		ITK_INPT_DTT='<%= ITK_INPT_DTT_T%>'
<%
			}

			if(! ITK_MODI_ID_T.equals("")) {
%>
		 		ITK_MODI_ID='<%= ITK_MODI_ID_T%>'
<%
			}

			if(! ITK_MODI_DTT_T.equals("")) {
%>
		 		ITK_MODI_DTT='<%= ITK_MODI_DTT_T%>'
<%
			}

			if(! EEA_EXAM_DT_T.equals("")) {
%>
		 		EEA_EXAM_DT='<%= EEA_EXAM_DT_T%>'
<%
			}

			if(! EEA_PSNL_NM_T.equals("")) {
%>
		 		EEA_PSNL_NM='<%= EEA_PSNL_NM_T%>'
<%
			}
%>
				ROWID='<%= cnt%>'
<%
			if(! c17_T.equals("")) {
%>
		 		c17='<%= c17_T%>'
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
