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

SELECT B.IAU_PENL_NM, B.IAU_LICEN1_CD, B.IAU_LICEN1_NO, B.IAU_LICEN2_CD, B.IAU_LICEN2_NO, A.* 
FROM DT_CCDT_PANJ A left outer join IT_AUTH_USER B ON A.DCP_DOCT_CD = B.IAU_EMP_NO          
WHERE DCP_EXAM_DT = :EXAM_DT
   AND DCP_EXAM_SQ = :EXAM_SQ

		*/

		sql = " SELECT B.IAU_PENL_NM, B.IAU_LICEN1_CD, B.IAU_LICEN1_NO, B.IAU_LICEN2_CD, B.IAU_LICEN2_NO, A.*";
		sql += " FROM DT_CCDT_PANJ A LEFT OUTER JOIN IT_AUTH_USER B";
		sql += " ON A.DCP_DOCT_CD = B.IAU_EMP_NO";
		sql += " WHERE DCP_EXAM_DT = '" + EXAM_DT + "'";
		sql += " AND DCP_EXAM_SQ = '" + EXAM_SQ + "'";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uDT_CCDT_RSLT_UP_GridDisplay_003 \n";
			G_INFO += "설명 : 판정정보 로딩 \n";
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
		<s:AttributeType name='IAU_PENL_NM' rs:number='1' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_PENL_NM'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_LICEN1_CD' rs:number='2' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_LICEN1_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_LICEN1_NO' rs:number='3' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_LICEN1_NO'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_LICEN2_CD' rs:number='4' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_LICEN2_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_LICEN2_NO' rs:number='5' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_LICEN2_NO'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='DCP_EXAM_DT' rs:number='6' rs:writeunknown='true' rs:basetable='DT_CCDT_PANJ' rs:basecolumn='DCP_EXAM_DT'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='DCP_EXAM_SQ' rs:number='7' rs:writeunknown='true' rs:basetable='DT_CCDT_PANJ' rs:basecolumn='DCP_EXAM_SQ'>
			<s:datatype dt:type='string' dt:maxLength='6' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='DCP_SMOK_YN' rs:number='8' rs:nullable='true' rs:writeunknown='true' rs:basetable='DT_CCDT_PANJ'
			 rs:basecolumn='DCP_SMOK_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='DCP_DRINK_YN' rs:number='9' rs:nullable='true' rs:writeunknown='true' rs:basetable='DT_CCDT_PANJ'
			 rs:basecolumn='DCP_DRINK_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='DCP_SPORT_KD' rs:number='10' rs:nullable='true' rs:writeunknown='true' rs:basetable='DT_CCDT_PANJ'
			 rs:basecolumn='DCP_SPORT_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='DCP_PAST_LT' rs:number='11' rs:nullable='true' rs:writeunknown='true' rs:basetable='DT_CCDT_PANJ'
			 rs:basecolumn='DCP_PAST_LT'>
			<s:datatype dt:type='string' dt:maxLength='1000'/>
		</s:AttributeType>
		<s:AttributeType name='DCP_FMGN_KD' rs:number='12' rs:nullable='true' rs:writeunknown='true' rs:basetable='DT_CCDT_PANJ'
			 rs:basecolumn='DCP_FMGN_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='DCP_FMAG_INT' rs:number='13' rs:nullable='true' rs:writeunknown='true' rs:basetable='DT_CCDT_PANJ'
			 rs:basecolumn='DCP_FMAG_INT'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='DCP_FMSC_KD' rs:number='14' rs:nullable='true' rs:writeunknown='true' rs:basetable='DT_CCDT_PANJ'
			 rs:basecolumn='DCP_FMSC_KD'>
			<s:datatype dt:type='string' dt:maxLength='3'/>
		</s:AttributeType>
		<s:AttributeType name='DCP_TARG_KD' rs:number='15' rs:nullable='true' rs:writeunknown='true' rs:basetable='DT_CCDT_PANJ'
			 rs:basecolumn='DCP_TARG_KD'>
			<s:datatype dt:type='string' dt:maxLength='4'/>
		</s:AttributeType>
		<s:AttributeType name='DCP_SICK_KD' rs:number='16' rs:nullable='true' rs:writeunknown='true' rs:basetable='DT_CCDT_PANJ'
			 rs:basecolumn='DCP_SICK_KD'>
			<s:datatype dt:type='string' dt:maxLength='4'/>
		</s:AttributeType>
		<s:AttributeType name='DCP_PAN_KD' rs:number='17' rs:nullable='true' rs:writeunknown='true' rs:basetable='DT_CCDT_PANJ'
			 rs:basecolumn='DCP_PAN_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='DCP_WORK_KD' rs:number='18' rs:nullable='true' rs:writeunknown='true' rs:basetable='DT_CCDT_PANJ'
			 rs:basecolumn='DCP_WORK_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='DCP_SOKUN_LT' rs:number='19' rs:nullable='true' rs:writeunknown='true' rs:basetable='DT_CCDT_PANJ'
			 rs:basecolumn='DCP_SOKUN_LT'>
			<s:datatype dt:type='string' dt:maxLength='1000'/>
		</s:AttributeType>
		<s:AttributeType name='DCP_INJA_CNT' rs:number='20' rs:nullable='true' rs:writeunknown='true' rs:basetable='DT_CCDT_PANJ'
			 rs:basecolumn='DCP_INJA_CNT'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='DCP_INJA_LT' rs:number='21' rs:nullable='true' rs:writeunknown='true' rs:basetable='DT_CCDT_PANJ'
			 rs:basecolumn='DCP_INJA_LT'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='DCP_BD_LT' rs:number='22' rs:nullable='true' rs:writeunknown='true' rs:basetable='DT_CCDT_PANJ'
			 rs:basecolumn='DCP_BD_LT'>
			<s:datatype dt:type='string' dt:maxLength='50'/>
		</s:AttributeType>
		<s:AttributeType name='DCP_PAN_DT' rs:number='23' rs:nullable='true' rs:writeunknown='true' rs:basetable='DT_CCDT_PANJ'
			 rs:basecolumn='DCP_PAN_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='DCP_DOCT_CD' rs:number='24' rs:nullable='true' rs:writeunknown='true' rs:basetable='DT_CCDT_PANJ'
			 rs:basecolumn='DCP_DOCT_CD'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='DCP_COMP_YN' rs:number='25' rs:nullable='true' rs:writeunknown='true' rs:basetable='DT_CCDT_PANJ'
			 rs:basecolumn='DCP_COMP_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='DCP_INPT_ID' rs:number='26' rs:nullable='true' rs:writeunknown='true' rs:basetable='DT_CCDT_PANJ'
			 rs:basecolumn='DCP_INPT_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='DCP_INPT_DTT' rs:number='27' rs:nullable='true' rs:writeunknown='true' rs:basetable='DT_CCDT_PANJ'
			 rs:basecolumn='DCP_INPT_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='DCP_MODI_ID' rs:number='28' rs:nullable='true' rs:writeunknown='true' rs:basetable='DT_CCDT_PANJ'
			 rs:basecolumn='DCP_MODI_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='DCP_MODI_DTT' rs:number='29' rs:nullable='true' rs:writeunknown='true' rs:basetable='DT_CCDT_PANJ'
			 rs:basecolumn='DCP_MODI_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='DCP_FMSEX_CD' rs:number='30' rs:nullable='true' rs:writeunknown='true' rs:basetable='DT_CCDT_PANJ'
			 rs:basecolumn='DCP_FMSEX_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='31' rs:rowid='true' rs:basetable='DT_CCDT_PANJ' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c31' rs:name='ROWID' rs:number='32' rs:rowid='true' rs:basetable='IT_AUTH_USER' rs:basecolumn='ROWID'
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

			String IAU_PENL_NM_T = cRsList.getString("IAU_PENL_NM");
			String IAU_LICEN1_CD_T = cRsList.getString("IAU_LICEN1_CD");
			String IAU_LICEN1_NO_T = cRsList.getString("IAU_LICEN1_NO");
			String IAU_LICEN2_CD_T = cRsList.getString("IAU_LICEN2_CD");
			String IAU_LICEN2_NO_T = cRsList.getString("IAU_LICEN2_NO");
			String DCP_EXAM_DT_T = cRsList.getString("DCP_EXAM_DT");
			String DCP_EXAM_SQ_T = cRsList.getString("DCP_EXAM_SQ");
			String DCP_SMOK_YN_T = cRsList.getString("DCP_SMOK_YN");
			String DCP_DRINK_YN_T = cRsList.getString("DCP_DRINK_YN");
			String DCP_SPORT_KD_T = cRsList.getString("DCP_SPORT_KD");
			String DCP_PAST_LT_T = cRsList.getString("DCP_PAST_LT");
			String DCP_FMGN_KD_T = cRsList.getString("DCP_FMGN_KD");
			String DCP_FMAG_INT_T = cRsList.getString("DCP_FMAG_INT");
			String DCP_FMSC_KD_T = cRsList.getString("DCP_FMSC_KD");
			String DCP_TARG_KD_T = cRsList.getString("DCP_TARG_KD");
			String DCP_SICK_KD_T = cRsList.getString("DCP_SICK_KD");
			String DCP_PAN_KD_T = cRsList.getString("DCP_PAN_KD");
			String DCP_WORK_KD_T = cRsList.getString("DCP_WORK_KD");
			String DCP_SOKUN_LT_T = cRsList.getString("DCP_SOKUN_LT");
			String DCP_INJA_CNT_T = cRsList.getString("DCP_INJA_CNT");
			String DCP_INJA_LT_T = cRsList.getString("DCP_INJA_LT");
			String DCP_BD_LT_T = cRsList.getString("DCP_BD_LT");
			String DCP_PAN_DT_T = cRsList.getString("DCP_PAN_DT");
			String DCP_DOCT_CD_T = cRsList.getString("DCP_DOCT_CD");
			String DCP_COMP_YN_T = cRsList.getString("DCP_COMP_YN");
			String DCP_INPT_ID_T = cRsList.getString("DCP_INPT_ID");
			String DCP_INPT_DTT_T = cRsList.getDate2("DCP_INPT_DTT");
			String DCP_MODI_ID_T = cRsList.getString("DCP_MODI_ID");
			String DCP_MODI_DTT_T = cRsList.getDate2("DCP_MODI_DTT");
			String DCP_FMSEX_CD_T = cRsList.getString("DCP_FMSEX_CD");
			String ROWID_T = cRsList.getString("ROWID");
			String c31_T = cRsList.getString("c31");
%>
			<z:row
<%
			if(! IAU_PENL_NM_T.equals("")) {
%>
		 		IAU_PENL_NM='<%= IAU_PENL_NM_T%>'
<%
			}

			if(! IAU_LICEN1_CD_T.equals("")) {
%>
		 		IAU_LICEN1_CD='<%= IAU_LICEN1_CD_T%>'
<%
			}

			if(! IAU_LICEN1_NO_T.equals("")) {
%>
		 		IAU_LICEN1_NO='<%= IAU_LICEN1_NO_T%>'
<%
			}

			if(! IAU_LICEN2_CD_T.equals("")) {
%>
		 		IAU_LICEN2_CD='<%= IAU_LICEN2_CD_T%>'
<%
			}

			if(! IAU_LICEN2_NO_T.equals("")) {
%>
		 		IAU_LICEN2_NO='<%= IAU_LICEN2_NO_T%>'
<%
			}

			if(! DCP_EXAM_DT_T.equals("")) {
%>
		 		DCP_EXAM_DT='<%= DCP_EXAM_DT_T%>'
<%
			}

			if(! DCP_EXAM_SQ_T.equals("")) {
%>
		 		DCP_EXAM_SQ='<%= DCP_EXAM_SQ_T%>'
<%
			}

			if(! DCP_SMOK_YN_T.equals("")) {
%>
		 		DCP_SMOK_YN='<%= DCP_SMOK_YN_T%>'
<%
			}

			if(! DCP_DRINK_YN_T.equals("")) {
%>
		 		DCP_DRINK_YN='<%= DCP_DRINK_YN_T%>'
<%
			}

			if(! DCP_SPORT_KD_T.equals("")) {
%>
		 		DCP_SPORT_KD='<%= DCP_SPORT_KD_T%>'
<%
			}

			if(! DCP_PAST_LT_T.equals("")) {
%>
		 		DCP_PAST_LT='<%= DCP_PAST_LT_T%>'
<%
			}

			if(! DCP_FMGN_KD_T.equals("")) {
%>
		 		DCP_FMGN_KD='<%= DCP_FMGN_KD_T%>'
<%
			}

			if(! DCP_FMAG_INT_T.equals("")) {
%>
		 		DCP_FMAG_INT='<%= DCP_FMAG_INT_T%>'
<%
			}

			if(! DCP_FMSC_KD_T.equals("")) {
%>
		 		DCP_FMSC_KD='<%= DCP_FMSC_KD_T%>'
<%
			}

			if(! DCP_TARG_KD_T.equals("")) {
%>
		 		DCP_TARG_KD='<%= DCP_TARG_KD_T%>'
<%
			}

			if(! DCP_SICK_KD_T.equals("")) {
%>
		 		DCP_SICK_KD='<%= DCP_SICK_KD_T%>'
<%
			}

			if(! DCP_PAN_KD_T.equals("")) {
%>
		 		DCP_PAN_KD='<%= DCP_PAN_KD_T%>'
<%
			}

			if(! DCP_WORK_KD_T.equals("")) {
%>
		 		DCP_WORK_KD='<%= DCP_WORK_KD_T%>'
<%
			}

			if(! DCP_SOKUN_LT_T.equals("")) {
%>
		 		DCP_SOKUN_LT='<%= DCP_SOKUN_LT_T%>'
<%
			}

			if(! DCP_INJA_CNT_T.equals("")) {
%>
		 		DCP_INJA_CNT='<%= DCP_INJA_CNT_T%>'
<%
			}

			if(! DCP_INJA_LT_T.equals("")) {
%>
		 		DCP_INJA_LT='<%= DCP_INJA_LT_T%>'
<%
			}

			if(! DCP_BD_LT_T.equals("")) {
%>
		 		DCP_BD_LT='<%= DCP_BD_LT_T%>'
<%
			}

			if(! DCP_PAN_DT_T.equals("")) {
%>
		 		DCP_PAN_DT='<%= DCP_PAN_DT_T%>'
<%
			}

			if(! DCP_DOCT_CD_T.equals("")) {
%>
		 		DCP_DOCT_CD='<%= DCP_DOCT_CD_T%>'
<%
			}

			if(! DCP_COMP_YN_T.equals("")) {
%>
		 		DCP_COMP_YN='<%= DCP_COMP_YN_T%>'
<%
			}

			if(! DCP_INPT_ID_T.equals("")) {
%>
		 		DCP_INPT_ID='<%= DCP_INPT_ID_T%>'
<%
			}

			if(! DCP_INPT_DTT_T.equals("")) {
%>
		 		DCP_INPT_DTT='<%= DCP_INPT_DTT_T%>'
<%
			}

			if(! DCP_MODI_ID_T.equals("")) {
%>
		 		DCP_MODI_ID='<%= DCP_MODI_ID_T%>'
<%
			}

			if(! DCP_MODI_DTT_T.equals("")) {
%>
		 		DCP_MODI_DTT='<%= DCP_MODI_DTT_T%>'
<%
			}

			if(! DCP_FMSEX_CD_T.equals("")) {
%>
		 		DCP_FMSEX_CD='<%= DCP_FMSEX_CD_T%>'
<%
			}
%>
				ROWID='<%= cnt%>'
				c31='<%= cnt%>'
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
