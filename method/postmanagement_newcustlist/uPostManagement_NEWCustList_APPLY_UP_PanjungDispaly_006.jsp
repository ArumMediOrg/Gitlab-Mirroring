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

Select CASE WHEN A.ECB_RSLT_KD = '1' then '이상소견없음'      
            WHEN A.ECB_RSLT_KD = '2' then '양성질환'          
            WHEN A.ECB_RSLT_KD = '3' then '유방암 의심'       
            WHEN A.ECB_RSLT_KD = '4' then '판정유보'          
            Else '' END ECB_RSLT_KD,                            
       A.*, B.IAU_PENL_NM                                         
  From ET_CANCER_BRST A                                           
  Left Outer Join IT_AUTH_USER B On B.IAU_EMP_NO  = A.ECB_LICEN_CD
 Where A.ECB_EXAM_DT = :EXAM_DT                
   And A.ECB_EXAM_SQ = :EXAM_SQ  
		*/

		sql = " SELECT CASE WHEN A.ECB_RSLT_KD = '1' THEN '이상소견없음' WHEN A.ECB_RSLT_KD = '2' THEN '양성질환' WHEN A.ECB_RSLT_KD = '3' THEN '유방암 의심' WHEN A.ECB_RSLT_KD = '4' THEN '판정유보' ELSE '' END ECB_RSLT_KD, A.*, B.IAU_PENL_NM";
		sql += " FROM ET_CANCER_BRST A LEFT OUTER JOIN IT_AUTH_USER B";
		sql += " ON B.IAU_EMP_NO = A.ECB_LICEN_CD";
		sql += " WHERE A.ECB_EXAM_DT = '" + EXAM_DT + "'";
		sql += " AND A.ECB_EXAM_SQ = '" + EXAM_SQ + "'";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uPostManagement_NEWCustList_APPLY_UP_PanjungDispaly_006 \n";
			G_INFO += "설명 : 유방암정보 로딩 \n";
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
		<s:AttributeType name='ECB_RSLT_KD' rs:number='1' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_BRST'
			 rs:basecolumn='ECB_RSLT_KD'>
			<s:datatype dt:type='string' dt:maxLength='12'/>
		</s:AttributeType>
		<s:AttributeType name='ECB_EXAM_DT' rs:number='2' rs:writeunknown='true' rs:basetable='ET_CANCER_BRST' rs:basecolumn='ECB_EXAM_DT'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ECB_EXAM_SQ' rs:number='3' rs:writeunknown='true' rs:basetable='ET_CANCER_BRST' rs:basecolumn='ECB_EXAM_SQ'>
			<s:datatype dt:type='string' dt:maxLength='6' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ECB_CFRM_CD' rs:number='4' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_BRST'
			 rs:basecolumn='ECB_CFRM_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECB_MGEX_DT' rs:number='5' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_BRST'
			 rs:basecolumn='ECB_MGEX_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ECB_MGDS_KD' rs:number='6' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_BRST'
			 rs:basecolumn='ECB_MGDS_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECB_MGEX_KD' rs:number='7' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_BRST'
			 rs:basecolumn='ECB_MGEX_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECB_MGRT1_KD' rs:number='8' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_BRST'
			 rs:basecolumn='ECB_MGRT1_KD'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='ECB_MGRT1SR_KD' rs:number='9' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_BRST'
			 rs:basecolumn='ECB_MGRT1SR_KD'>
			<s:datatype dt:type='string' dt:maxLength='7'/>
		</s:AttributeType>
		<s:AttributeType name='ECB_MGRT1R_EX' rs:number='10' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_BRST'
			 rs:basecolumn='ECB_MGRT1R_EX'>
			<s:datatype dt:type='string' dt:maxLength='40'/>
		</s:AttributeType>
		<s:AttributeType name='ECB_MGRT1SL_KD' rs:number='11' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_BRST'
			 rs:basecolumn='ECB_MGRT1SL_KD'>
			<s:datatype dt:type='string' dt:maxLength='7'/>
		</s:AttributeType>
		<s:AttributeType name='ECB_MGRT1L_EX' rs:number='12' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_BRST'
			 rs:basecolumn='ECB_MGRT1L_EX'>
			<s:datatype dt:type='string' dt:maxLength='40'/>
		</s:AttributeType>
		<s:AttributeType name='ECB_MGRT2_KD' rs:number='13' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_BRST'
			 rs:basecolumn='ECB_MGRT2_KD'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='ECB_MGRT2SR_KD' rs:number='14' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_BRST'
			 rs:basecolumn='ECB_MGRT2SR_KD'>
			<s:datatype dt:type='string' dt:maxLength='7'/>
		</s:AttributeType>
		<s:AttributeType name='ECB_MGRT2R_EX' rs:number='15' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_BRST'
			 rs:basecolumn='ECB_MGRT2R_EX'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ECB_MGRT2SL_KD' rs:number='16' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_BRST'
			 rs:basecolumn='ECB_MGRT2SL_KD'>
			<s:datatype dt:type='string' dt:maxLength='7'/>
		</s:AttributeType>
		<s:AttributeType name='ECB_MGRT2L_EX' rs:number='17' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_BRST'
			 rs:basecolumn='ECB_MGRT2L_EX'>
			<s:datatype dt:type='string' dt:maxLength='40'/>
		</s:AttributeType>
		<s:AttributeType name='ECB_MGRT3_KD' rs:number='18' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_BRST'
			 rs:basecolumn='ECB_MGRT3_KD'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='ECB_MGRT3SR_KD' rs:number='19' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_BRST'
			 rs:basecolumn='ECB_MGRT3SR_KD'>
			<s:datatype dt:type='string' dt:maxLength='7'/>
		</s:AttributeType>
		<s:AttributeType name='ECB_MGRT3R_EX' rs:number='20' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_BRST'
			 rs:basecolumn='ECB_MGRT3R_EX'>
			<s:datatype dt:type='string' dt:maxLength='40'/>
		</s:AttributeType>
		<s:AttributeType name='ECB_MGRT3SL_KD' rs:number='21' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_BRST'
			 rs:basecolumn='ECB_MGRT3SL_KD'>
			<s:datatype dt:type='string' dt:maxLength='7'/>
		</s:AttributeType>
		<s:AttributeType name='ECB_MGRT3L_EX' rs:number='22' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_BRST'
			 rs:basecolumn='ECB_MGRT3L_EX'>
			<s:datatype dt:type='string' dt:maxLength='40'/>
		</s:AttributeType>
		<s:AttributeType name='ECB_MGRT_EX' rs:number='23' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_BRST'
			 rs:basecolumn='ECB_MGRT_EX'>
			<s:datatype dt:type='string' dt:maxLength='40'/>
		</s:AttributeType>
		<s:AttributeType name='c23' rs:name='ECB_RSLT_KD' rs:number='24' rs:nullable='true' rs:writeunknown='true'
			 rs:basetable='ET_CANCER_BRST' rs:basecolumn='ECB_RSLT_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECB_BRCN_YN' rs:number='25' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_BRST'
			 rs:basecolumn='ECB_BRCN_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECB_RSLT_EX' rs:number='26' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_BRST'
			 rs:basecolumn='ECB_RSLT_EX'>
			<s:datatype dt:type='string' dt:maxLength='1200'/>
		</s:AttributeType>
		<s:AttributeType name='ECB_RPT_DT' rs:number='27' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_BRST'
			 rs:basecolumn='ECB_RPT_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ECB_CFRM_DT' rs:number='28' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_BRST'
			 rs:basecolumn='ECB_CFRM_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ECB_LICEN_CD' rs:number='29' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_BRST'
			 rs:basecolumn='ECB_LICEN_CD'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ECB_INPUT_DTT' rs:number='30' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_BRST'
			 rs:basecolumn='ECB_INPUT_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ECB_INPUT_ID' rs:number='31' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_BRST'
			 rs:basecolumn='ECB_INPUT_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ECB_MODI_DTT' rs:number='32' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_BRST'
			 rs:basecolumn='ECB_MODI_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ECB_MODI_ID' rs:number='33' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_BRST'
			 rs:basecolumn='ECB_MODI_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ECB_MGPT_KD' rs:number='34' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_BRST'
			 rs:basecolumn='ECB_MGPT_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECB_DECI_LICEN_CD' rs:number='35' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_BRST'
			 rs:basecolumn='ECB_DECI_LICEN_CD'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_PENL_NM' rs:number='36' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='37' rs:rowid='true' rs:basetable='ET_CANCER_BRST' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c37' rs:name='ROWID' rs:number='38' rs:rowid='true' rs:basetable='IT_AUTH_USER' rs:basecolumn='ROWID'
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

			String ECB_RSLT_KD_T = cRsList.getString("ECB_RSLT_KD");
			String ECB_EXAM_DT_T = cRsList.getString("ECB_EXAM_DT");
			String ECB_EXAM_SQ_T = cRsList.getString("ECB_EXAM_SQ");
			String ECB_CFRM_CD_T = cRsList.getString("ECB_CFRM_CD");
			String ECB_MGEX_DT_T = cRsList.getString("ECB_MGEX_DT");
			String ECB_MGDS_KD_T = cRsList.getString("ECB_MGDS_KD");
			String ECB_MGEX_KD_T = cRsList.getString("ECB_MGEX_KD");
			String ECB_MGRT1_KD_T = cRsList.getString("ECB_MGRT1_KD");
			String ECB_MGRT1SR_KD_T = cRsList.getString("ECB_MGRT1SR_KD");
			String ECB_MGRT1R_EX_T = cRsList.getString("ECB_MGRT1R_EX");
			String ECB_MGRT1SL_KD_T = cRsList.getString("ECB_MGRT1SL_KD");
			String ECB_MGRT1L_EX_T = cRsList.getString("ECB_MGRT1L_EX");
			String ECB_MGRT2_KD_T = cRsList.getString("ECB_MGRT2_KD");
			String ECB_MGRT2SR_KD_T = cRsList.getString("ECB_MGRT2SR_KD");
			String ECB_MGRT2R_EX_T = cRsList.getString("ECB_MGRT2R_EX");
			String ECB_MGRT2SL_KD_T = cRsList.getString("ECB_MGRT2SL_KD");
			String ECB_MGRT2L_EX_T = cRsList.getString("ECB_MGRT2L_EX");
			String ECB_MGRT3_KD_T = cRsList.getString("ECB_MGRT3_KD");
			String ECB_MGRT3SR_KD_T = cRsList.getString("ECB_MGRT3SR_KD");
			String ECB_MGRT3R_EX_T = cRsList.getString("ECB_MGRT3R_EX");
			String ECB_MGRT3SL_KD_T = cRsList.getString("ECB_MGRT3SL_KD");
			String ECB_MGRT3L_EX_T = cRsList.getString("ECB_MGRT3L_EX");
			String ECB_MGRT_EX_T = cRsList.getString("ECB_MGRT_EX");
			String c23_T = cRsList.getString("c23");
			String ECB_BRCN_YN_T = cRsList.getString("ECB_BRCN_YN");
			String ECB_RSLT_EX_T = cRsList.getString("ECB_RSLT_EX");
			String ECB_RPT_DT_T = cRsList.getString("ECB_RPT_DT");
			String ECB_CFRM_DT_T = cRsList.getString("ECB_CFRM_DT");
			String ECB_LICEN_CD_T = cRsList.getString("ECB_LICEN_CD");
			String ECB_INPUT_DTT_T = cRsList.getDate2("ECB_INPUT_DTT");
			String ECB_INPUT_ID_T = cRsList.getString("ECB_INPUT_ID");
			String ECB_MODI_DTT_T = cRsList.getDate2("ECB_MODI_DTT");
			String ECB_MODI_ID_T = cRsList.getString("ECB_MODI_ID");
			String ECB_MGPT_KD_T = cRsList.getString("ECB_MGPT_KD");
			String ECB_DECI_LICEN_CD_T = cRsList.getString("ECB_DECI_LICEN_CD");
			String IAU_PENL_NM_T = cRsList.getString("IAU_PENL_NM");
			String ROWID_T = cRsList.getString("ROWID");
			String c37_T = cRsList.getString("c37");
%>
			<z:row
<%
			if(! ECB_RSLT_KD_T.equals("")) {
%>
		 		ECB_RSLT_KD='<%= ECB_RSLT_KD_T%>'
<%
			}

			if(! ECB_EXAM_DT_T.equals("")) {
%>
		 		ECB_EXAM_DT='<%= ECB_EXAM_DT_T%>'
<%
			}

			if(! ECB_EXAM_SQ_T.equals("")) {
%>
		 		ECB_EXAM_SQ='<%= ECB_EXAM_SQ_T%>'
<%
			}

			if(! ECB_CFRM_CD_T.equals("")) {
%>
		 		ECB_CFRM_CD='<%= ECB_CFRM_CD_T%>'
<%
			}

			if(! ECB_MGEX_DT_T.equals("")) {
%>
		 		ECB_MGEX_DT='<%= ECB_MGEX_DT_T%>'
<%
			}

			if(! ECB_MGDS_KD_T.equals("")) {
%>
		 		ECB_MGDS_KD='<%= ECB_MGDS_KD_T%>'
<%
			}

			if(! ECB_MGEX_KD_T.equals("")) {
%>
		 		ECB_MGEX_KD='<%= ECB_MGEX_KD_T%>'
<%
			}

			if(! ECB_MGRT1_KD_T.equals("")) {
%>
		 		ECB_MGRT1_KD='<%= ECB_MGRT1_KD_T%>'
<%
			}

			if(! ECB_MGRT1SR_KD_T.equals("")) {
%>
		 		ECB_MGRT1SR_KD='<%= ECB_MGRT1SR_KD_T%>'
<%
			}

			if(! ECB_MGRT1R_EX_T.equals("")) {
%>
		 		ECB_MGRT1R_EX='<%= ECB_MGRT1R_EX_T%>'
<%
			}

			if(! ECB_MGRT1SL_KD_T.equals("")) {
%>
		 		ECB_MGRT1SL_KD='<%= ECB_MGRT1SL_KD_T%>'
<%
			}

			if(! ECB_MGRT1L_EX_T.equals("")) {
%>
		 		ECB_MGRT1L_EX='<%= ECB_MGRT1L_EX_T%>'
<%
			}

			if(! ECB_MGRT2_KD_T.equals("")) {
%>
		 		ECB_MGRT2_KD='<%= ECB_MGRT2_KD_T%>'
<%
			}

			if(! ECB_MGRT2SR_KD_T.equals("")) {
%>
		 		ECB_MGRT2SR_KD='<%= ECB_MGRT2SR_KD_T%>'
<%
			}

			if(! ECB_MGRT2R_EX_T.equals("")) {
%>
		 		ECB_MGRT2R_EX='<%= ECB_MGRT2R_EX_T%>'
<%
			}

			if(! ECB_MGRT2SL_KD_T.equals("")) {
%>
		 		ECB_MGRT2SL_KD='<%= ECB_MGRT2SL_KD_T%>'
<%
			}

			if(! ECB_MGRT2L_EX_T.equals("")) {
%>
		 		ECB_MGRT2L_EX='<%= ECB_MGRT2L_EX_T%>'
<%
			}

			if(! ECB_MGRT3_KD_T.equals("")) {
%>
		 		ECB_MGRT3_KD='<%= ECB_MGRT3_KD_T%>'
<%
			}

			if(! ECB_MGRT3SR_KD_T.equals("")) {
%>
		 		ECB_MGRT3SR_KD='<%= ECB_MGRT3SR_KD_T%>'
<%
			}

			if(! ECB_MGRT3R_EX_T.equals("")) {
%>
		 		ECB_MGRT3R_EX='<%= ECB_MGRT3R_EX_T%>'
<%
			}

			if(! ECB_MGRT3SL_KD_T.equals("")) {
%>
		 		ECB_MGRT3SL_KD='<%= ECB_MGRT3SL_KD_T%>'
<%
			}

			if(! ECB_MGRT3L_EX_T.equals("")) {
%>
		 		ECB_MGRT3L_EX='<%= ECB_MGRT3L_EX_T%>'
<%
			}

			if(! ECB_MGRT_EX_T.equals("")) {
%>
		 		ECB_MGRT_EX='<%= ECB_MGRT_EX_T%>'
<%
			}

			if(! c23_T.equals("")) {
%>
		 		c23='<%= c23_T%>'
<%
			}

			if(! ECB_BRCN_YN_T.equals("")) {
%>
		 		ECB_BRCN_YN='<%= ECB_BRCN_YN_T%>'
<%
			}

			if(! ECB_RSLT_EX_T.equals("")) {
%>
		 		ECB_RSLT_EX='<%= ECB_RSLT_EX_T%>'
<%
			}

			if(! ECB_RPT_DT_T.equals("")) {
%>
		 		ECB_RPT_DT='<%= ECB_RPT_DT_T%>'
<%
			}

			if(! ECB_CFRM_DT_T.equals("")) {
%>
		 		ECB_CFRM_DT='<%= ECB_CFRM_DT_T%>'
<%
			}

			if(! ECB_LICEN_CD_T.equals("")) {
%>
		 		ECB_LICEN_CD='<%= ECB_LICEN_CD_T%>'
<%
			}

			if(! ECB_INPUT_DTT_T.equals("")) {
%>
		 		ECB_INPUT_DTT='<%= ECB_INPUT_DTT_T%>'
<%
			}

			if(! ECB_INPUT_ID_T.equals("")) {
%>
		 		ECB_INPUT_ID='<%= ECB_INPUT_ID_T%>'
<%
			}

			if(! ECB_MODI_DTT_T.equals("")) {
%>
		 		ECB_MODI_DTT='<%= ECB_MODI_DTT_T%>'
<%
			}

			if(! ECB_MODI_ID_T.equals("")) {
%>
		 		ECB_MODI_ID='<%= ECB_MODI_ID_T%>'
<%
			}

			if(! ECB_MGPT_KD_T.equals("")) {
%>
		 		ECB_MGPT_KD='<%= ECB_MGPT_KD_T%>'
<%
			}

			if(! ECB_DECI_LICEN_CD_T.equals("")) {
%>
		 		ECB_DECI_LICEN_CD='<%= ECB_DECI_LICEN_CD_T%>'
<%
			}

			if(! IAU_PENL_NM_T.equals("")) {
%>
		 		IAU_PENL_NM='<%= IAU_PENL_NM_T%>'
<%
			}
%>
				ROWID='<%= cnt%>'
				c37='<%= cnt%>'
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
