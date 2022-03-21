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

		String EXAM_DT = htMethod.get("EXAM_DT");
		String EXAM_SQ = htMethod.get("EXAM_SQ");

		//
		if(EXAM_DT == null) { EXAM_DT = ""; }
		if(EXAM_SQ == null) { EXAM_SQ = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT *
  FROM ET_DENTAL_PANJ
 WHERE EDP_EXAM_DT = :EXAM_DT
   AND EDP_EXAM_SQ = :EXAM_SQ
		*/

		sql = " SELECT *";
		sql += " FROM ET_DENTAL_PANJ";
		sql += " WHERE EDP_EXAM_DT = '" + EXAM_DT + "'";
		sql += " AND EDP_EXAM_SQ = '" + EXAM_SQ + "'";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uDental_Panj_upQstTestPanjungDsiplay_001 \n";
			G_INFO += "설명 : 구강판정(구강판정조회) \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " EXAM_DT : " + EXAM_DT + " \n";
			G_INFO += " EXAM_SQ : " + EXAM_SQ + " \n";
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
		<s:AttributeType name='EDP_EXAM_DT' rs:number='1' rs:writeunknown='true' rs:basetable='ET_DENTAL_PANJ' rs:basecolumn='EDP_EXAM_DT'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EDP_EXAM_SQ' rs:number='2' rs:writeunknown='true' rs:basetable='ET_DENTAL_PANJ' rs:basecolumn='EDP_EXAM_SQ'>
			<s:datatype dt:type='string' dt:maxLength='6' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EDP_MJ01_KD' rs:number='3' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_DENTAL_PANJ'
			 rs:basecolumn='EDP_MJ01_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EDP_MJ02_KD' rs:number='4' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_DENTAL_PANJ'
			 rs:basecolumn='EDP_MJ02_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EDP_MJ03_KD' rs:number='5' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_DENTAL_PANJ'
			 rs:basecolumn='EDP_MJ03_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EDP_MJ04_KD' rs:number='6' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_DENTAL_PANJ'
			 rs:basecolumn='EDP_MJ04_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EDP_MJ05_KD' rs:number='7' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_DENTAL_PANJ'
			 rs:basecolumn='EDP_MJ05_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EDP_MJ06_KD' rs:number='8' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_DENTAL_PANJ'
			 rs:basecolumn='EDP_MJ06_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EDP_DT01_KD' rs:number='9' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_DENTAL_PANJ'
			 rs:basecolumn='EDP_DT01_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EDP_DT02_KD' rs:number='10' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_DENTAL_PANJ'
			 rs:basecolumn='EDP_DT02_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EDP_DT03_KD' rs:number='11' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_DENTAL_PANJ'
			 rs:basecolumn='EDP_DT03_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EDP_DT04_KD' rs:number='12' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_DENTAL_PANJ'
			 rs:basecolumn='EDP_DT04_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EDP_DJ01_KD' rs:number='13' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_DENTAL_PANJ'
			 rs:basecolumn='EDP_DJ01_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EDP_DJ02_KD' rs:number='14' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_DENTAL_PANJ'
			 rs:basecolumn='EDP_DJ02_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EDP_ETAL_EX' rs:number='15' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_DENTAL_PANJ'
			 rs:basecolumn='EDP_ETAL_EX'>
			<s:datatype dt:type='string' dt:maxLength='500'/>
		</s:AttributeType>
		<s:AttributeType name='EDP_D401_VAL' rs:number='16' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_DENTAL_PANJ'
			 rs:basecolumn='EDP_D401_VAL'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='EDP_D402_VAL' rs:number='17' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_DENTAL_PANJ'
			 rs:basecolumn='EDP_D402_VAL'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='EDP_D403_VAL' rs:number='18' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_DENTAL_PANJ'
			 rs:basecolumn='EDP_D403_VAL'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='EDP_D404_VAL' rs:number='19' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_DENTAL_PANJ'
			 rs:basecolumn='EDP_D404_VAL'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='EDP_D405_VAL' rs:number='20' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_DENTAL_PANJ'
			 rs:basecolumn='EDP_D405_VAL'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='EDP_D406_VAL' rs:number='21' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_DENTAL_PANJ'
			 rs:basecolumn='EDP_D406_VAL'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='EDP_DTOT_VAL' rs:number='22' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_DENTAL_PANJ'
			 rs:basecolumn='EDP_DTOT_VAL'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='EDP_PANJ_CD' rs:number='23' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_DENTAL_PANJ'
			 rs:basecolumn='EDP_PANJ_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EDP_IMME_EX' rs:number='24' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_DENTAL_PANJ'
			 rs:basecolumn='EDP_IMME_EX'>
			<s:datatype dt:type='string' dt:maxLength='500'/>
		</s:AttributeType>
		<s:AttributeType name='EDP_ACTI_EX' rs:number='25' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_DENTAL_PANJ'
			 rs:basecolumn='EDP_ACTI_EX'>
			<s:datatype dt:type='string' dt:maxLength='500'/>
		</s:AttributeType>
		<s:AttributeType name='EDP_DOCT_CD' rs:number='26' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_DENTAL_PANJ'
			 rs:basecolumn='EDP_DOCT_CD'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='EDP_TOBO_DT' rs:number='27' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_DENTAL_PANJ'
			 rs:basecolumn='EDP_TOBO_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EDP_PANJ_DT' rs:number='28' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_DENTAL_PANJ'
			 rs:basecolumn='EDP_PANJ_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EDP_PANJ_YN' rs:number='29' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_DENTAL_PANJ'
			 rs:basecolumn='EDP_PANJ_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EDP_INPT_ID' rs:number='30' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_DENTAL_PANJ'
			 rs:basecolumn='EDP_INPT_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='EDP_INPT_DTT' rs:number='31' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_DENTAL_PANJ'
			 rs:basecolumn='EDP_INPT_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EDP_MODI_ID' rs:number='32' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_DENTAL_PANJ'
			 rs:basecolumn='EDP_MODI_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='EDP_MODI_DTT' rs:number='33' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_DENTAL_PANJ'
			 rs:basecolumn='EDP_MODI_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='34' rs:rowid='true' rs:writeunknown='true' rs:basetable='ET_DENTAL_PANJ'
			 rs:basecolumn='ROWID' rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
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

			String EDP_EXAM_DT_T = cRsList.getString("EDP_EXAM_DT");
			String EDP_EXAM_SQ_T = cRsList.getString("EDP_EXAM_SQ");
			String EDP_MJ01_KD_T = cRsList.getString("EDP_MJ01_KD");
			String EDP_MJ02_KD_T = cRsList.getString("EDP_MJ02_KD");
			String EDP_MJ03_KD_T = cRsList.getString("EDP_MJ03_KD");
			String EDP_MJ04_KD_T = cRsList.getString("EDP_MJ04_KD");
			String EDP_MJ05_KD_T = cRsList.getString("EDP_MJ05_KD");
			String EDP_MJ06_KD_T = cRsList.getString("EDP_MJ06_KD");
			String EDP_DT01_KD_T = cRsList.getString("EDP_DT01_KD");
			String EDP_DT02_KD_T = cRsList.getString("EDP_DT02_KD");
			String EDP_DT03_KD_T = cRsList.getString("EDP_DT03_KD");
			String EDP_DT04_KD_T = cRsList.getString("EDP_DT04_KD");
			String EDP_DJ01_KD_T = cRsList.getString("EDP_DJ01_KD");
			String EDP_DJ02_KD_T = cRsList.getString("EDP_DJ02_KD");
			String EDP_ETAL_EX_T = cRsList.getString("EDP_ETAL_EX");
			String EDP_D401_VAL_T = cRsList.getString("EDP_D401_VAL");
			String EDP_D402_VAL_T = cRsList.getString("EDP_D402_VAL");
			String EDP_D403_VAL_T = cRsList.getString("EDP_D403_VAL");
			String EDP_D404_VAL_T = cRsList.getString("EDP_D404_VAL");
			String EDP_D405_VAL_T = cRsList.getString("EDP_D405_VAL");
			String EDP_D406_VAL_T = cRsList.getString("EDP_D406_VAL");
			String EDP_DTOT_VAL_T = cRsList.getString("EDP_DTOT_VAL");
			String EDP_PANJ_CD_T = cRsList.getString("EDP_PANJ_CD");
			String EDP_IMME_EX_T = cRsList.getString("EDP_IMME_EX");
			String EDP_ACTI_EX_T = cRsList.getString("EDP_ACTI_EX");
			String EDP_DOCT_CD_T = cRsList.getString("EDP_DOCT_CD");
			String EDP_TOBO_DT_T = cRsList.getString("EDP_TOBO_DT");
			String EDP_PANJ_DT_T = cRsList.getString("EDP_PANJ_DT");
			String EDP_PANJ_YN_T = cRsList.getString("EDP_PANJ_YN");
			String EDP_INPT_ID_T = cRsList.getString("EDP_INPT_ID");
			String EDP_INPT_DTT_T = cRsList.getDate2("EDP_INPT_DTT");
			String EDP_MODI_ID_T = cRsList.getString("EDP_MODI_ID");
			String EDP_MODI_DTT_T = cRsList.getDate2("EDP_MODI_DTT");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! EDP_EXAM_DT_T.equals("")) {
%>
		 		EDP_EXAM_DT='<%= EDP_EXAM_DT_T%>'
<%
			}

			if(! EDP_EXAM_SQ_T.equals("")) {
%>
		 		EDP_EXAM_SQ='<%= EDP_EXAM_SQ_T%>'
<%
			}

			if(! EDP_MJ01_KD_T.equals("")) {
%>
		 		EDP_MJ01_KD='<%= EDP_MJ01_KD_T%>'
<%
			}

			if(! EDP_MJ02_KD_T.equals("")) {
%>
		 		EDP_MJ02_KD='<%= EDP_MJ02_KD_T%>'
<%
			}

			if(! EDP_MJ03_KD_T.equals("")) {
%>
		 		EDP_MJ03_KD='<%= EDP_MJ03_KD_T%>'
<%
			}

			if(! EDP_MJ04_KD_T.equals("")) {
%>
		 		EDP_MJ04_KD='<%= EDP_MJ04_KD_T%>'
<%
			}

			if(! EDP_MJ05_KD_T.equals("")) {
%>
		 		EDP_MJ05_KD='<%= EDP_MJ05_KD_T%>'
<%
			}

			if(! EDP_MJ06_KD_T.equals("")) {
%>
		 		EDP_MJ06_KD='<%= EDP_MJ06_KD_T%>'
<%
			}

			if(! EDP_DT01_KD_T.equals("")) {
%>
		 		EDP_DT01_KD='<%= EDP_DT01_KD_T%>'
<%
			}

			if(! EDP_DT02_KD_T.equals("")) {
%>
		 		EDP_DT02_KD='<%= EDP_DT02_KD_T%>'
<%
			}

			if(! EDP_DT03_KD_T.equals("")) {
%>
		 		EDP_DT03_KD='<%= EDP_DT03_KD_T%>'
<%
			}

			if(! EDP_DT04_KD_T.equals("")) {
%>
		 		EDP_DT04_KD='<%= EDP_DT04_KD_T%>'
<%
			}

			if(! EDP_DJ01_KD_T.equals("")) {
%>
		 		EDP_DJ01_KD='<%= EDP_DJ01_KD_T%>'
<%
			}

			if(! EDP_DJ02_KD_T.equals("")) {
%>
		 		EDP_DJ02_KD='<%= EDP_DJ02_KD_T%>'
<%
			}

			if(! EDP_ETAL_EX_T.equals("")) {
%>
		 		EDP_ETAL_EX='<%= EDP_ETAL_EX_T%>'
<%
			}

			if(! EDP_D401_VAL_T.equals("")) {
%>
		 		EDP_D401_VAL='<%= EDP_D401_VAL_T%>'
<%
			}

			if(! EDP_D402_VAL_T.equals("")) {
%>
		 		EDP_D402_VAL='<%= EDP_D402_VAL_T%>'
<%
			}

			if(! EDP_D403_VAL_T.equals("")) {
%>
		 		EDP_D403_VAL='<%= EDP_D403_VAL_T%>'
<%
			}

			if(! EDP_D404_VAL_T.equals("")) {
%>
		 		EDP_D404_VAL='<%= EDP_D404_VAL_T%>'
<%
			}

			if(! EDP_D405_VAL_T.equals("")) {
%>
		 		EDP_D405_VAL='<%= EDP_D405_VAL_T%>'
<%
			}

			if(! EDP_D406_VAL_T.equals("")) {
%>
		 		EDP_D406_VAL='<%= EDP_D406_VAL_T%>'
<%
			}

			if(! EDP_DTOT_VAL_T.equals("")) {
%>
		 		EDP_DTOT_VAL='<%= EDP_DTOT_VAL_T%>'
<%
			}

			if(! EDP_PANJ_CD_T.equals("")) {
%>
		 		EDP_PANJ_CD='<%= EDP_PANJ_CD_T%>'
<%
			}

			if(! EDP_IMME_EX_T.equals("")) {
%>
		 		EDP_IMME_EX='<%= EDP_IMME_EX_T%>'
<%
			}

			if(! EDP_ACTI_EX_T.equals("")) {
%>
		 		EDP_ACTI_EX='<%= EDP_ACTI_EX_T%>'
<%
			}

			if(! EDP_DOCT_CD_T.equals("")) {
%>
		 		EDP_DOCT_CD='<%= EDP_DOCT_CD_T%>'
<%
			}

			if(! EDP_TOBO_DT_T.equals("")) {
%>
		 		EDP_TOBO_DT='<%= EDP_TOBO_DT_T%>'
<%
			}

			if(! EDP_PANJ_DT_T.equals("")) {
%>
		 		EDP_PANJ_DT='<%= EDP_PANJ_DT_T%>'
<%
			}

			if(! EDP_PANJ_YN_T.equals("")) {
%>
		 		EDP_PANJ_YN='<%= EDP_PANJ_YN_T%>'
<%
			}

			if(! EDP_INPT_ID_T.equals("")) {
%>
		 		EDP_INPT_ID='<%= EDP_INPT_ID_T%>'
<%
			}

			if(! EDP_INPT_DTT_T.equals("")) {
%>
		 		EDP_INPT_DTT='<%= EDP_INPT_DTT_T%>'
<%
			}

			if(! EDP_MODI_ID_T.equals("")) {
%>
		 		EDP_MODI_ID='<%= EDP_MODI_ID_T%>'
<%
			}

			if(! EDP_MODI_DTT_T.equals("")) {
%>
		 		EDP_MODI_DTT='<%= EDP_MODI_DTT_T%>'
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
