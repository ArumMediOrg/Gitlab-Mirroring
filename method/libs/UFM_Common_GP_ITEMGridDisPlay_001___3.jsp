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

		String SVALUE1 = htMethod.get("SVALUE1");
		String SVALUE2 = htMethod.get("SVALUE2");
		String SVALUE3 = htMethod.get("SVALUE3");

		//
		if(SVALUE1 == null) { SVALUE1 = ""; }
		if(SVALUE2 == null) { SVALUE2 = ""; }
		if(SVALUE3 == null) { SVALUE3 = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

       SELECT CASE WHEN NVL(CQN_ANSR_CD, ' ') = ' ' THEN CQN_ANSR_CD else '[' || CQN_ANSR_CD || ']' || GetCOMMON_LvCdToNm('0415',CQN_ANSR_CD,'5',1) END CQN_ANSR_NM, A.*
                      FROM CT_QUESTION A WHERE 0 = 0 
      if sValue1 <> '0'       then AND CQN_EXEM_CD = :sValue1
      if sValue2 <> '00'     then AND CQN_QSKD_CD = :sValue2
      if Trim(sValue3) <> '' then AND CQN_QSTN_NM LIKE '%' || :sValue3 || '%'
      AND CQN_USE_YN = 'Y'
      ORDER BY CQN_EXEM_CD, CQN_QSKD_CD, CQN_QSTN_SQ, CQN_QSTN_LV 

		*/

		sql = " SELECT CASE WHEN NVL(CQN_ANSR_CD, ' ') = ' ' THEN CQN_ANSR_CD ELSE '[' || CQN_ANSR_CD || ']' || GETCOMMON_LVCDTONM('0415',CQN_ANSR_CD,'5',1) END CQN_ANSR_NM, A.*";
		sql += " FROM CT_QUESTION A";
		sql += " WHERE 0 = 0";

		if(!SVALUE1.equals("0")) {
			sql += " AND CQN_EXEM_CD = '" + SVALUE1 + "'";
		}
		
		if(!SVALUE2.equals("00")) {
			sql += " AND CQN_QSKD_CD = '" + SVALUE2 + "'";
		}
		
		if(!SVALUE3.trim().equals("")) {
			sql += " AND CQN_QSTN_NM LIKE '%" + SVALUE3 + "%'";
		}

		sql += " AND CQN_USE_YN = 'Y'";
		sql += " ORDER BY CQN_EXEM_CD, CQN_QSKD_CD, CQN_QSTN_SQ, CQN_QSTN_LV";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : UFM_Common_GP_ITEMGridDisPlay_001___3 \n";
			G_INFO += "설명 : 구분값에 따른 그리드 정보 로딩___3 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " SVALUE1 : " + SVALUE1 + " \n";
			G_INFO += " SVALUE2 : " + SVALUE2 + " \n";
			G_INFO += " SVALUE3 : " + SVALUE3 + " \n";
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
		<s:AttributeType name='CQN_ANSR_NM' rs:number='1' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_QUESTION'
			 rs:basecolumn='CQN_ANSR_NM'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='CQN_QSTN_CD' rs:number='2' rs:writeunknown='true' rs:basetable='CT_QUESTION' rs:basecolumn='CQN_QSTN_CD'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'
			 rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='CQN_EXEM_CD' rs:number='3' rs:writeunknown='true' rs:basetable='CT_QUESTION' rs:basecolumn='CQN_EXEM_CD'>
			<s:datatype dt:type='string' dt:maxLength='2' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='CQN_QSKD_CD' rs:number='4' rs:writeunknown='true' rs:basetable='CT_QUESTION' rs:basecolumn='CQN_QSKD_CD'>
			<s:datatype dt:type='string' dt:maxLength='4' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='CQN_QSTN_SQ' rs:number='5' rs:writeunknown='true' rs:basetable='CT_QUESTION' rs:basecolumn='CQN_QSTN_SQ'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'
			 rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='CQN_QSTN_LV' rs:number='6' rs:writeunknown='true' rs:basetable='CT_QUESTION' rs:basecolumn='CQN_QSTN_LV'>
			<s:datatype dt:type='string' dt:maxLength='4' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='CQN_QSTN_NM' rs:number='7' rs:writeunknown='true' rs:basetable='CT_QUESTION' rs:basecolumn='CQN_QSTN_NM'>
			<s:datatype dt:type='string' dt:maxLength='500' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='CQN_ANSR_CD' rs:number='8' rs:writeunknown='true' rs:basetable='CT_QUESTION' rs:basecolumn='CQN_ANSR_CD'>
			<s:datatype dt:type='string' dt:maxLength='1' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='CQN_ANSE_EX' rs:number='9' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_QUESTION'
			 rs:basecolumn='CQN_ANSE_EX'>
			<s:datatype dt:type='string' dt:maxLength='500'/>
		</s:AttributeType>
		<s:AttributeType name='CQN_QSTN_CP' rs:number='10' rs:writeunknown='true' rs:basetable='CT_QUESTION' rs:basecolumn='CQN_QSTN_CP'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'
			 rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='CQN_DEFULT' rs:number='11' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_QUESTION'
			 rs:basecolumn='CQN_DEFULT'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='CQN_SCOR_YN' rs:number='12' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_QUESTION'
			 rs:basecolumn='CQN_SCOR_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='CQN_SCOR_CNT' rs:number='13' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_QUESTION'
			 rs:basecolumn='CQN_SCOR_CNT'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='CQN_SCOR_NO' rs:number='14' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_QUESTION'
			 rs:basecolumn='CQN_SCOR_NO'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='CQN_SCOR_SCR' rs:number='15' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_QUESTION'
			 rs:basecolumn='CQN_SCOR_SCR'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='CQN_USE_YN' rs:number='16' rs:writeunknown='true' rs:basetable='CT_QUESTION' rs:basecolumn='CQN_USE_YN'>
			<s:datatype dt:type='string' dt:maxLength='1' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='CQN_NUSE_ID' rs:number='17' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_QUESTION'
			 rs:basecolumn='CQN_NUSE_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='CQN_NUSE_DTT' rs:number='18' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_QUESTION'
			 rs:basecolumn='CQN_NUSE_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='CQN_INPT_ID' rs:number='19' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_QUESTION'
			 rs:basecolumn='CQN_INPT_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='CQN_INPT_DTT' rs:number='20' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_QUESTION'
			 rs:basecolumn='CQN_INPT_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='CQN_MODI_ID' rs:number='21' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_QUESTION'
			 rs:basecolumn='CQN_MODI_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='CQN_MODI_DTT' rs:number='22' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_QUESTION'
			 rs:basecolumn='CQN_MODI_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='FSF' rs:number='23' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_QUESTION'
			 rs:basecolumn='FSF'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='24' rs:rowid='true' rs:basetable='CT_QUESTION' rs:basecolumn='ROWID'
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

			String CQN_ANSR_NM_T = cRsList.getString("CQN_ANSR_NM");
			String CQN_QSTN_CD_T = cRsList.getString("CQN_QSTN_CD");
			String CQN_EXEM_CD_T = cRsList.getString("CQN_EXEM_CD");
			String CQN_QSKD_CD_T = cRsList.getString("CQN_QSKD_CD");
			String CQN_QSTN_SQ_T = cRsList.getString("CQN_QSTN_SQ");
			String CQN_QSTN_LV_T = cRsList.getString("CQN_QSTN_LV");
			String CQN_QSTN_NM_T = cRsList.getString("CQN_QSTN_NM");
			String CQN_ANSR_CD_T = cRsList.getString("CQN_ANSR_CD");
			String CQN_ANSE_EX_T = cRsList.getString("CQN_ANSE_EX");
			String CQN_QSTN_CP_T = cRsList.getString("CQN_QSTN_CP");
			String CQN_DEFULT_T = cRsList.getString("CQN_DEFULT");
			String CQN_SCOR_YN_T = cRsList.getString("CQN_SCOR_YN");
			String CQN_SCOR_CNT_T = cRsList.getString("CQN_SCOR_CNT");
			String CQN_SCOR_NO_T = cRsList.getString("CQN_SCOR_NO");
			String CQN_SCOR_SCR_T = cRsList.getString("CQN_SCOR_SCR");
			String CQN_USE_YN_T = cRsList.getString("CQN_USE_YN");
			String CQN_NUSE_ID_T = cRsList.getString("CQN_NUSE_ID");
			String CQN_NUSE_DTT_T = cRsList.getDate2("CQN_NUSE_DTT");
			String CQN_INPT_ID_T = cRsList.getString("CQN_INPT_ID");
			String CQN_INPT_DTT_T = cRsList.getDate2("CQN_INPT_DTT");
			String CQN_MODI_ID_T = cRsList.getString("CQN_MODI_ID");
			String CQN_MODI_DTT_T = cRsList.getDate2("CQN_MODI_DTT");
			String FSF_T = cRsList.getString("FSF");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! CQN_ANSR_NM_T.equals("")) {
%>
		 		CQN_ANSR_NM='<%= CQN_ANSR_NM_T%>'
<%
			}

			if(! CQN_QSTN_CD_T.equals("")) {
%>
		 		CQN_QSTN_CD='<%= CQN_QSTN_CD_T%>'
<%
			}

			if(! CQN_EXEM_CD_T.equals("")) {
%>
		 		CQN_EXEM_CD='<%= CQN_EXEM_CD_T%>'
<%
			}

			if(! CQN_QSKD_CD_T.equals("")) {
%>
		 		CQN_QSKD_CD='<%= CQN_QSKD_CD_T%>'
<%
			}

			if(! CQN_QSTN_SQ_T.equals("")) {
%>
		 		CQN_QSTN_SQ='<%= CQN_QSTN_SQ_T%>'
<%
			}

			if(! CQN_QSTN_LV_T.equals("")) {
%>
		 		CQN_QSTN_LV='<%= CQN_QSTN_LV_T%>'
<%
			}

			if(! CQN_QSTN_NM_T.equals("")) {
%>
		 		CQN_QSTN_NM='<%= CQN_QSTN_NM_T%>'
<%
			}

			if(! CQN_ANSR_CD_T.equals("")) {
%>
		 		CQN_ANSR_CD='<%= CQN_ANSR_CD_T%>'
<%
			}

			if(! CQN_ANSE_EX_T.equals("")) {
%>
		 		CQN_ANSE_EX='<%= CQN_ANSE_EX_T%>'
<%
			}

			if(! CQN_QSTN_CP_T.equals("")) {
%>
		 		CQN_QSTN_CP='<%= CQN_QSTN_CP_T%>'
<%
			}

			if(! CQN_DEFULT_T.equals("")) {
%>
		 		CQN_DEFULT='<%= CQN_DEFULT_T%>'
<%
			}

			if(! CQN_SCOR_YN_T.equals("")) {
%>
		 		CQN_SCOR_YN='<%= CQN_SCOR_YN_T%>'
<%
			}

			if(! CQN_SCOR_CNT_T.equals("")) {
%>
		 		CQN_SCOR_CNT='<%= CQN_SCOR_CNT_T%>'
<%
			}

			if(! CQN_SCOR_NO_T.equals("")) {
%>
		 		CQN_SCOR_NO='<%= CQN_SCOR_NO_T%>'
<%
			}

			if(! CQN_SCOR_SCR_T.equals("")) {
%>
		 		CQN_SCOR_SCR='<%= CQN_SCOR_SCR_T%>'
<%
			}

			if(! CQN_USE_YN_T.equals("")) {
%>
		 		CQN_USE_YN='<%= CQN_USE_YN_T%>'
<%
			}

			if(! CQN_NUSE_ID_T.equals("")) {
%>
		 		CQN_NUSE_ID='<%= CQN_NUSE_ID_T%>'
<%
			}

			if(! CQN_NUSE_DTT_T.equals("")) {
%>
		 		CQN_NUSE_DTT='<%= CQN_NUSE_DTT_T%>'
<%
			}

			if(! CQN_INPT_ID_T.equals("")) {
%>
		 		CQN_INPT_ID='<%= CQN_INPT_ID_T%>'
<%
			}

			if(! CQN_INPT_DTT_T.equals("")) {
%>
		 		CQN_INPT_DTT='<%= CQN_INPT_DTT_T%>'
<%
			}

			if(! CQN_MODI_ID_T.equals("")) {
%>
		 		CQN_MODI_ID='<%= CQN_MODI_ID_T%>'
<%
			}

			if(! CQN_MODI_DTT_T.equals("")) {
%>
		 		CQN_MODI_DTT='<%= CQN_MODI_DTT_T%>'
<%
			}

			if(! FSF_T.equals("")) {
%>
		 		FSF='<%= FSF_T%>'
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
