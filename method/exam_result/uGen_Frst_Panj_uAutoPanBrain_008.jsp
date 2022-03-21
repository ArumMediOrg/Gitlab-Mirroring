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

		String CHOL_KD = htMethod.get("CHOL_KD");
		String SEX_KD = htMethod.get("SEX_KD");
		String ASAGE = htMethod.get("ASAGE");

		//
		if(CHOL_KD == null) { CHOL_KD = ""; }
		if(SEX_KD == null) { SEX_KD = ""; }
		if(ASAGE == null) { ASAGE = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT * FROM CT_DANGER
 WHERE CDR_DANR_KD = '1'
   AND CDR_CHOL_KD = :CHOL_KD
   AND CDR_SEX_KD  = :SEX_KD
   AND (TO_NUMBER(CDR_LOW_AGE) <=  :asAge  AND
        TO_NUMBER(CDR_HIGH_AGE) >= :asAge ) )
		*/

		sql = " SELECT *";
		sql += " FROM CT_DANGER";
		sql += " WHERE CDR_DANR_KD = '1'";
		sql += " AND CDR_CHOL_KD = '" + CHOL_KD + "'";
		sql += " AND CDR_SEX_KD = '" + SEX_KD + "'";
		sql += " AND (TO_NUMBER(CDR_LOW_AGE) <= '" + ASAGE + "' AND TO_NUMBER(CDR_HIGH_AGE) >= '" + ASAGE + "')";
			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uGen_Frst_Panj_uAutoPanBrain_008 \n";
			G_INFO += "설명 : 뇌심혈관판정(위험도평가CT_DANGER 조회 1) \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " CHOL_KD : " + CHOL_KD + " \n";
			G_INFO += " SEX_KD : " + SEX_KD + " \n";
			G_INFO += " ASAGE : " + ASAGE + " \n";
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
		<s:AttributeType name='CDR_DANR_KD' rs:number='1' rs:writeunknown='true' rs:basetable='CT_DANGER' rs:basecolumn='CDR_DANR_KD'>
			<s:datatype dt:type='string' dt:maxLength='1' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='CDR_DANR_SQ' rs:number='2' rs:writeunknown='true' rs:basetable='CT_DANGER' rs:basecolumn='CDR_DANR_SQ'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'
			 rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='CDR_DANR_AGE' rs:number='3' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_DANGER'
			 rs:basecolumn='CDR_DANR_AGE'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='CDR_LOW_AGE' rs:number='4' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_DANGER'
			 rs:basecolumn='CDR_LOW_AGE'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='CDR_HIGH_AGE' rs:number='5' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_DANGER'
			 rs:basecolumn='CDR_HIGH_AGE'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='CDR_SEX_KD' rs:number='6' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_DANGER'
			 rs:basecolumn='CDR_SEX_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='CDR_CHOL_KD' rs:number='7' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_DANGER'
			 rs:basecolumn='CDR_CHOL_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='CDR_DANR_VL' rs:number='8' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_DANGER'
			 rs:basecolumn='CDR_DANR_VL'>
			<s:datatype dt:type='string' dt:maxLength='50'/>
		</s:AttributeType>
		<s:AttributeType name='CDR_INPT_ID' rs:number='9' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_DANGER'
			 rs:basecolumn='CDR_INPT_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='CDR_INPT_DTT' rs:number='10' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_DANGER'
			 rs:basecolumn='CDR_INPT_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='CDR_MODI_ID' rs:number='11' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_DANGER'
			 rs:basecolumn='CDR_MODI_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='CDR_MODI_DTT' rs:number='12' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_DANGER'
			 rs:basecolumn='CDR_MODI_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='CDR_USE_YN' rs:number='13' rs:writeunknown='true' rs:basetable='CT_DANGER' rs:basecolumn='CDR_USE_YN'>
			<s:datatype dt:type='string' dt:maxLength='1' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='CDR_YEAR_DT' rs:number='14' rs:writeunknown='true' rs:basetable='CT_DANGER' rs:basecolumn='CDR_YEAR_DT'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='15' rs:rowid='true' rs:writeunknown='true' rs:basetable='CT_DANGER'
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

			String CDR_DANR_KD_T = cRsList.getString("CDR_DANR_KD");
			String CDR_DANR_SQ_T = cRsList.getString("CDR_DANR_SQ");
			String CDR_DANR_AGE_T = cRsList.getString("CDR_DANR_AGE");
			String CDR_LOW_AGE_T = cRsList.getString("CDR_LOW_AGE");
			String CDR_HIGH_AGE_T = cRsList.getString("CDR_HIGH_AGE");
			String CDR_SEX_KD_T = cRsList.getString("CDR_SEX_KD");
			String CDR_CHOL_KD_T = cRsList.getString("CDR_CHOL_KD");
			String CDR_DANR_VL_T = cRsList.getString("CDR_DANR_VL");
			String CDR_INPT_ID_T = cRsList.getString("CDR_INPT_ID");
			String CDR_INPT_DTT_T = cRsList.getDate2("CDR_INPT_DTT");
			String CDR_MODI_ID_T = cRsList.getString("CDR_MODI_ID");
			String CDR_MODI_DTT_T = cRsList.getDate2("CDR_MODI_DTT");
			String CDR_USE_YN_T = cRsList.getString("CDR_USE_YN");
			String CDR_YEAR_DT_T = cRsList.getString("CDR_YEAR_DT");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! CDR_DANR_KD_T.equals("")) {
%>
		 		CDR_DANR_KD='<%= CDR_DANR_KD_T%>'
<%
			}

			if(! CDR_DANR_SQ_T.equals("")) {
%>
		 		CDR_DANR_SQ='<%= CDR_DANR_SQ_T%>'
<%
			}

			if(! CDR_DANR_AGE_T.equals("")) {
%>
		 		CDR_DANR_AGE='<%= CDR_DANR_AGE_T%>'
<%
			}

			if(! CDR_LOW_AGE_T.equals("")) {
%>
		 		CDR_LOW_AGE='<%= CDR_LOW_AGE_T%>'
<%
			}

			if(! CDR_HIGH_AGE_T.equals("")) {
%>
		 		CDR_HIGH_AGE='<%= CDR_HIGH_AGE_T%>'
<%
			}

			if(! CDR_SEX_KD_T.equals("")) {
%>
		 		CDR_SEX_KD='<%= CDR_SEX_KD_T%>'
<%
			}

			if(! CDR_CHOL_KD_T.equals("")) {
%>
		 		CDR_CHOL_KD='<%= CDR_CHOL_KD_T%>'
<%
			}

			if(! CDR_DANR_VL_T.equals("")) {
%>
		 		CDR_DANR_VL='<%= CDR_DANR_VL_T%>'
<%
			}

			if(! CDR_INPT_ID_T.equals("")) {
%>
		 		CDR_INPT_ID='<%= CDR_INPT_ID_T%>'
<%
			}

			if(! CDR_INPT_DTT_T.equals("")) {
%>
		 		CDR_INPT_DTT='<%= CDR_INPT_DTT_T%>'
<%
			}

			if(! CDR_MODI_ID_T.equals("")) {
%>
		 		CDR_MODI_ID='<%= CDR_MODI_ID_T%>'
<%
			}

			if(! CDR_MODI_DTT_T.equals("")) {
%>
		 		CDR_MODI_DTT='<%= CDR_MODI_DTT_T%>'
<%
			}

			if(! CDR_USE_YN_T.equals("")) {
%>
		 		CDR_USE_YN='<%= CDR_USE_YN_T%>'
<%
			}

			if(! CDR_YEAR_DT_T.equals("")) {
%>
		 		CDR_YEAR_DT='<%= CDR_YEAR_DT_T%>'
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
