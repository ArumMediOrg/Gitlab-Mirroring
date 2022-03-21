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

		String RSLT_LOW = htMethod.get("RSLT_LOW");
		String RSLT_HIGH = htMethod.get("RSLT_HIGH");

		//
		if(RSLT_LOW == null) { RSLT_LOW = ""; }
		if(RSLT_HIGH == null) { RSLT_HIGH = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

 SELECT * FROM CT_DANR_ITEM
  WHERE CDI_DANR_KD = '2'
    AND CDI_RSLT_LOW = :RSLT_LOW
    AND CDI_RSLT_HIGH = :RSLT_HIGH
    AND (INSTR(CDI_ITEM_CD, 'A0009') <> 0 OR INSTR(CDI_ITEM_CD, 'A0006') <> 0)
		*/

		sql = " SELECT *";
		sql += " FROM CT_DANR_ITEM";
		sql += " WHERE CDI_DANR_KD = '2'";
		sql += " AND CDI_RSLT_LOW = '" + RSLT_LOW + "'";
		sql += " AND CDI_RSLT_HIGH = '" + RSLT_HIGH + "'";
		sql += " AND (INSTR(CDI_ITEM_CD, 'A0009') <> 0 OR INSTR(CDI_ITEM_CD, 'A0006') <> 0)";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uGen_Frst_Panj_uAutoPanBrain_006 \n";
			G_INFO += "설명 : 뇌심혈관판정(위험도평가CT_DANR_ITEM 조회 3) \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " RSLT_LOW : " + RSLT_LOW + " \n";
			G_INFO += " RSLT_HIGH : " + RSLT_HIGH + " \n";
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
		<s:AttributeType name='CDI_DANR_KD' rs:number='1' rs:writeunknown='true' rs:basetable='CT_DANR_ITEM' rs:basecolumn='CDI_DANR_KD'>
			<s:datatype dt:type='string' dt:maxLength='1' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='CDI_ITEM_KD' rs:number='2' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_DANR_ITEM'
			 rs:basecolumn='CDI_ITEM_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='CDI_ITEM_CD' rs:number='3' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_DANR_ITEM'
			 rs:basecolumn='CDI_ITEM_CD'>
			<s:datatype dt:type='string' dt:maxLength='50'/>
		</s:AttributeType>
		<s:AttributeType name='CDI_DANR_SQ' rs:number='4' rs:writeunknown='true' rs:basetable='CT_DANR_ITEM' rs:basecolumn='CDI_DANR_SQ'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'
			 rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='CDI_SEX_KD' rs:number='5' rs:writeunknown='true' rs:basetable='CT_DANR_ITEM' rs:basecolumn='CDI_SEX_KD'>
			<s:datatype dt:type='string' dt:maxLength='1' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='CDI_EXPR_KD' rs:number='6' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_DANR_ITEM'
			 rs:basecolumn='CDI_EXPR_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='CDI_RSLT_LOW' rs:number='7' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_DANR_ITEM'
			 rs:basecolumn='CDI_RSLT_LOW'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='CDI_RSLT_HIGH' rs:number='8' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_DANR_ITEM'
			 rs:basecolumn='CDI_RSLT_HIGH'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='CDI_CHAR_KD' rs:number='9' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_DANR_ITEM'
			 rs:basecolumn='CDI_CHAR_KD'>
			<s:datatype dt:type='string' dt:maxLength='50'/>
		</s:AttributeType>
		<s:AttributeType name='CDI_DANR_VL' rs:number='10' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_DANR_ITEM'
			 rs:basecolumn='CDI_DANR_VL'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='CDI_DANR_NM' rs:number='11' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_DANR_ITEM'
			 rs:basecolumn='CDI_DANR_NM'>
			<s:datatype dt:type='string' dt:maxLength='30'/>
		</s:AttributeType>
		<s:AttributeType name='CDI_YEAR_DT' rs:number='12' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_DANR_ITEM'
			 rs:basecolumn='CDI_YEAR_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='CDI_INPT_DTT' rs:number='13' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_DANR_ITEM'
			 rs:basecolumn='CDI_INPT_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='CDI_INPT_ID' rs:number='14' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_DANR_ITEM'
			 rs:basecolumn='CDI_INPT_ID'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='CDI_MODI_DTT' rs:number='15' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_DANR_ITEM'
			 rs:basecolumn='CDI_MODI_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='CDI_MODI_ID' rs:number='16' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_DANR_ITEM'
			 rs:basecolumn='CDI_MODI_ID'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='CDI_AVER_KD' rs:number='17' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_DANR_ITEM'
			 rs:basecolumn='CDI_AVER_KD'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='CDI_MEDI_KD' rs:number='18' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_DANR_ITEM'
			 rs:basecolumn='CDI_MEDI_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='CDI_CHOL_KD' rs:number='19' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_DANR_ITEM'
			 rs:basecolumn='CDI_CHOL_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='20' rs:rowid='true' rs:writeunknown='true' rs:basetable='CT_DANR_ITEM'
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

			String CDI_DANR_KD_T = cRsList.getString("CDI_DANR_KD");
			String CDI_ITEM_KD_T = cRsList.getString("CDI_ITEM_KD");
			String CDI_ITEM_CD_T = cRsList.getString("CDI_ITEM_CD");
			String CDI_DANR_SQ_T = cRsList.getString("CDI_DANR_SQ");
			String CDI_SEX_KD_T = cRsList.getString("CDI_SEX_KD");
			String CDI_EXPR_KD_T = cRsList.getString("CDI_EXPR_KD");
			String CDI_RSLT_LOW_T = cRsList.getString("CDI_RSLT_LOW");
			String CDI_RSLT_HIGH_T = cRsList.getString("CDI_RSLT_HIGH");
			String CDI_CHAR_KD_T = cRsList.getString("CDI_CHAR_KD");
			String CDI_DANR_VL_T = cRsList.getString("CDI_DANR_VL");
			String CDI_DANR_NM_T = cRsList.getString("CDI_DANR_NM");
			String CDI_YEAR_DT_T = cRsList.getString("CDI_YEAR_DT");
			String CDI_INPT_DTT_T = cRsList.getDate2("CDI_INPT_DTT");
			String CDI_INPT_ID_T = cRsList.getString("CDI_INPT_ID");
			String CDI_MODI_DTT_T = cRsList.getDate2("CDI_MODI_DTT");
			String CDI_MODI_ID_T = cRsList.getString("CDI_MODI_ID");
			String CDI_AVER_KD_T = cRsList.getString("CDI_AVER_KD");
			String CDI_MEDI_KD_T = cRsList.getString("CDI_MEDI_KD");
			String CDI_CHOL_KD_T = cRsList.getString("CDI_CHOL_KD");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! CDI_DANR_KD_T.equals("")) {
%>
		 		CDI_DANR_KD='<%= CDI_DANR_KD_T%>'
<%
			}

			if(! CDI_ITEM_KD_T.equals("")) {
%>
		 		CDI_ITEM_KD='<%= CDI_ITEM_KD_T%>'
<%
			}

			if(! CDI_ITEM_CD_T.equals("")) {
%>
		 		CDI_ITEM_CD='<%= CDI_ITEM_CD_T%>'
<%
			}

			if(! CDI_DANR_SQ_T.equals("")) {
%>
		 		CDI_DANR_SQ='<%= CDI_DANR_SQ_T%>'
<%
			}

			if(! CDI_SEX_KD_T.equals("")) {
%>
		 		CDI_SEX_KD='<%= CDI_SEX_KD_T%>'
<%
			}

			if(! CDI_EXPR_KD_T.equals("")) {
%>
		 		CDI_EXPR_KD='<%= CDI_EXPR_KD_T%>'
<%
			}

			if(! CDI_RSLT_LOW_T.equals("")) {
%>
		 		CDI_RSLT_LOW='<%= CDI_RSLT_LOW_T%>'
<%
			}

			if(! CDI_RSLT_HIGH_T.equals("")) {
%>
		 		CDI_RSLT_HIGH='<%= CDI_RSLT_HIGH_T%>'
<%
			}

			if(! CDI_CHAR_KD_T.equals("")) {
%>
		 		CDI_CHAR_KD='<%= CDI_CHAR_KD_T%>'
<%
			}

			if(! CDI_DANR_VL_T.equals("")) {
%>
		 		CDI_DANR_VL='<%= CDI_DANR_VL_T%>'
<%
			}

			if(! CDI_DANR_NM_T.equals("")) {
%>
		 		CDI_DANR_NM='<%= CDI_DANR_NM_T%>'
<%
			}

			if(! CDI_YEAR_DT_T.equals("")) {
%>
		 		CDI_YEAR_DT='<%= CDI_YEAR_DT_T%>'
<%
			}

			if(! CDI_INPT_DTT_T.equals("")) {
%>
		 		CDI_INPT_DTT='<%= CDI_INPT_DTT_T%>'
<%
			}

			if(! CDI_INPT_ID_T.equals("")) {
%>
		 		CDI_INPT_ID='<%= CDI_INPT_ID_T%>'
<%
			}

			if(! CDI_MODI_DTT_T.equals("")) {
%>
		 		CDI_MODI_DTT='<%= CDI_MODI_DTT_T%>'
<%
			}

			if(! CDI_MODI_ID_T.equals("")) {
%>
		 		CDI_MODI_ID='<%= CDI_MODI_ID_T%>'
<%
			}

			if(! CDI_AVER_KD_T.equals("")) {
%>
		 		CDI_AVER_KD='<%= CDI_AVER_KD_T%>'
<%
			}

			if(! CDI_MEDI_KD_T.equals("")) {
%>
		 		CDI_MEDI_KD='<%= CDI_MEDI_KD_T%>'
<%
			}

			if(! CDI_CHOL_KD_T.equals("")) {
%>
		 		CDI_CHOL_KD='<%= CDI_CHOL_KD_T%>'
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
