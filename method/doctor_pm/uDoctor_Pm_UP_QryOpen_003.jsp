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

		String CMBPLACEFLG = htMethod.get("CMBPLACEFLG");
		String CMBPLACE = htMethod.get("CMBPLACE");
		String DTEDTEXAM_SDT = htMethod.get("DTEDTEXAM_SDT");
		String DTEDTEXAM_EDT = htMethod.get("DTEDTEXAM_EDT");

		//
		if(CMBPLACEFLG == null) { CMBPLACEFLG = ""; }
		if(CMBPLACE == null) { CMBPLACE = ""; }
		if(DTEDTEXAM_SDT == null) { DTEDTEXAM_SDT = ""; }
		if(DTEDTEXAM_EDT == null) { DTEDTEXAM_EDT = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT A.* FROM ET_CANCER_STMC A

if :cmbPlaceFlg = '1' then
begin
  Inner Join ET_EXAM_ACPT B On B.EEA_EXAM_DT = A.ECS_EXAM_DT       
    And B.EEA_EXAM_SQ = A.ECS_EXAM_SQ                              
    And B.EEA_ORDER_YN <> 'C'                                    
    And SUBSTR(B.EEA_PLCE_CD, 1, 2)= :cmbPlace
end;

WHERE 0=0 
  AND A.ECS_EXAM_DT >= :DTEdtEXAM_SDT 
  AND A.ECS_EXAM_DT <= :DTEdtEXAM_EDT
  AND NVL(A.ECS_LICEN_CD, ' ') <> ' ' 


		*/

		sql = " SELECT A.*";
		sql += " FROM ET_CANCER_STMC A";

		if(CMBPLACEFLG.equals("1")) {
			sql += " INNER JOIN ET_EXAM_ACPT B";
			sql += " ON B.EEA_EXAM_DT = A.ECS_EXAM_DT";
			sql += " AND B.EEA_EXAM_SQ = A.ECS_EXAM_SQ";
			sql += " AND B.EEA_ORDER_YN <> 'C'";
			sql += " AND SUBSTR(B.EEA_PLCE_CD, 1, 2)= '" + CMBPLACE + "'";
		}

		sql += " WHERE 0=0";
		sql += " AND A.ECS_EXAM_DT >= '" + DTEDTEXAM_SDT + "'";
		sql += " AND A.ECS_EXAM_DT <= '" + DTEDTEXAM_EDT + "'";
		sql += " AND NVL(A.ECS_LICEN_CD, ' ') <> ' '";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uDoctor_Pm_UP_QryOpen_003 \n";
			G_INFO += "설명 : 위암 검진정보 로딩 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " CMBPLACEFLG : " + CMBPLACEFLG + " \n";
			G_INFO += " CMBPLACE : " + CMBPLACE + " \n";
			G_INFO += " DTEDTEXAM_SDT : " + DTEDTEXAM_SDT + " \n";
			G_INFO += " DTEDTEXAM_EDT : " + DTEDTEXAM_EDT + " \n";
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
		<s:AttributeType name='ECS_EXAM_DT' rs:number='1' rs:writeunknown='true' rs:basetable='ET_CANCER_STMC' rs:basecolumn='ECS_EXAM_DT'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ECS_EXAM_SQ' rs:number='2' rs:writeunknown='true' rs:basetable='ET_CANCER_STMC' rs:basecolumn='ECS_EXAM_SQ'>
			<s:datatype dt:type='string' dt:maxLength='6' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ECS_CFRM_CD' rs:number='3' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_STMC'
			 rs:basecolumn='ECS_CFRM_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECS_GIEX_DT' rs:number='4' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_STMC'
			 rs:basecolumn='ECS_GIEX_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ECS_GIEX_KD' rs:number='5' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_STMC'
			 rs:basecolumn='ECS_GIEX_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECS_GIRT1_KD' rs:number='6' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_STMC'
			 rs:basecolumn='ECS_GIRT1_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECS_GIRT1S_KD' rs:number='7' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_STMC'
			 rs:basecolumn='ECS_GIRT1S_KD'>
			<s:datatype dt:type='string' dt:maxLength='8'/>
		</s:AttributeType>
		<s:AttributeType name='ECS_GIRT2_KD' rs:number='8' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_STMC'
			 rs:basecolumn='ECS_GIRT2_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECS_GIRT2S_KD' rs:number='9' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_STMC'
			 rs:basecolumn='ECS_GIRT2S_KD'>
			<s:datatype dt:type='string' dt:maxLength='8'/>
		</s:AttributeType>
		<s:AttributeType name='ECS_GIRT3_KD' rs:number='10' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_STMC'
			 rs:basecolumn='ECS_GIRT3_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECS_GIRT3S_KD' rs:number='11' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_STMC'
			 rs:basecolumn='ECS_GIRT3S_KD'>
			<s:datatype dt:type='string' dt:maxLength='8'/>
		</s:AttributeType>
		<s:AttributeType name='ECS_GIETC_KD' rs:number='12' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_STMC'
			 rs:basecolumn='ECS_GIETC_KD'>
			<s:datatype dt:type='string' dt:maxLength='8'/>
		</s:AttributeType>
		<s:AttributeType name='ECS_GIRT_EX' rs:number='13' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_STMC'
			 rs:basecolumn='ECS_GIRT_EX'>
			<s:datatype dt:type='string' dt:maxLength='40'/>
		</s:AttributeType>
		<s:AttributeType name='ECS_ENEX_DT' rs:number='14' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_STMC'
			 rs:basecolumn='ECS_ENEX_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ECS_ENRT1_KD' rs:number='15' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_STMC'
			 rs:basecolumn='ECS_ENRT1_KD'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='ECS_ENRT1S_KD' rs:number='16' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_STMC'
			 rs:basecolumn='ECS_ENRT1S_KD'>
			<s:datatype dt:type='string' dt:maxLength='8'/>
		</s:AttributeType>
		<s:AttributeType name='ECS_ENRT2_KD' rs:number='17' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_STMC'
			 rs:basecolumn='ECS_ENRT2_KD'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='ECS_ENRT2S_KD' rs:number='18' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_STMC'
			 rs:basecolumn='ECS_ENRT2S_KD'>
			<s:datatype dt:type='string' dt:maxLength='8'/>
		</s:AttributeType>
		<s:AttributeType name='ECS_ENRT3_KD' rs:number='19' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_STMC'
			 rs:basecolumn='ECS_ENRT3_KD'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='ECS_ENRT3S_KD' rs:number='20' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_STMC'
			 rs:basecolumn='ECS_ENRT3S_KD'>
			<s:datatype dt:type='string' dt:maxLength='8'/>
		</s:AttributeType>
		<s:AttributeType name='ECS_ENETC_KD' rs:number='21' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_STMC'
			 rs:basecolumn='ECS_ENETC_KD'>
			<s:datatype dt:type='string' dt:maxLength='8'/>
		</s:AttributeType>
		<s:AttributeType name='ECS_ENRT_EX' rs:number='22' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_STMC'
			 rs:basecolumn='ECS_ENRT_EX'>
			<s:datatype dt:type='string' dt:maxLength='40'/>
		</s:AttributeType>
		<s:AttributeType name='ECS_BIEX_YN' rs:number='23' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_STMC'
			 rs:basecolumn='ECS_BIEX_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECS_FOCP_KD' rs:number='24' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_STMC'
			 rs:basecolumn='ECS_FOCP_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECS_BIRT_KD' rs:number='25' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_STMC'
			 rs:basecolumn='ECS_BIRT_KD'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='ECS_BICT_KD' rs:number='26' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_STMC'
			 rs:basecolumn='ECS_BICT_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECS_BICNCR_KD' rs:number='27' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_STMC'
			 rs:basecolumn='ECS_BICNCR_KD'>
			<s:datatype dt:type='string' dt:maxLength='14'/>
		</s:AttributeType>
		<s:AttributeType name='ECS_BICNCR_EX' rs:number='28' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_STMC'
			 rs:basecolumn='ECS_BICNCR_EX'>
			<s:datatype dt:type='string' dt:maxLength='40'/>
		</s:AttributeType>
		<s:AttributeType name='ECS_BIETC_KD' rs:number='29' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_STMC'
			 rs:basecolumn='ECS_BIETC_KD'>
			<s:datatype dt:type='string' dt:maxLength='8'/>
		</s:AttributeType>
		<s:AttributeType name='ECS_BIETC_EX' rs:number='30' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_STMC'
			 rs:basecolumn='ECS_BIETC_EX'>
			<s:datatype dt:type='string' dt:maxLength='40'/>
		</s:AttributeType>
		<s:AttributeType name='ECS_RSLT_KD' rs:number='31' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_STMC'
			 rs:basecolumn='ECS_RSLT_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECS_STCN_YN' rs:number='32' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_STMC'
			 rs:basecolumn='ECS_STCN_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECS_ETC_EX' rs:number='33' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_STMC'
			 rs:basecolumn='ECS_ETC_EX'>
			<s:datatype dt:type='string' dt:maxLength='40'/>
		</s:AttributeType>
		<s:AttributeType name='ECS_RSLT_EX' rs:number='34' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_STMC'
			 rs:basecolumn='ECS_RSLT_EX'>
			<s:datatype dt:type='string' dt:maxLength='1200'/>
		</s:AttributeType>
		<s:AttributeType name='ECS_RPT_DT' rs:number='35' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_STMC'
			 rs:basecolumn='ECS_RPT_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ECS_CFRM_DT' rs:number='36' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_STMC'
			 rs:basecolumn='ECS_CFRM_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ECS_LICEN_CD' rs:number='37' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_STMC'
			 rs:basecolumn='ECS_LICEN_CD'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ECS_INPUT_DTT' rs:number='38' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_STMC'
			 rs:basecolumn='ECS_INPUT_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ECS_INPUT_ID' rs:number='39' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_STMC'
			 rs:basecolumn='ECS_INPUT_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ECS_MODI_DTT' rs:number='40' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_STMC'
			 rs:basecolumn='ECS_MODI_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ECS_MODI_ID' rs:number='41' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_STMC'
			 rs:basecolumn='ECS_MODI_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ECS_DECI_LICEN_CD' rs:number='42' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_STMC'
			 rs:basecolumn='ECS_DECI_LICEN_CD'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ECS_CKUP_LICEN_CD' rs:number='43' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_STMC'
			 rs:basecolumn='ECS_CKUP_LICEN_CD'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ECS_PATH_LICEN_CD' rs:number='44' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_STMC'
			 rs:basecolumn='ECS_PATH_LICEN_CD'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ECS_GICM_KD' rs:number='45' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_STMC'
			 rs:basecolumn='ECS_GICM_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='46' rs:rowid='true' rs:writeunknown='true' rs:basetable='ET_CANCER_STMC'
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

			String ECS_EXAM_DT_T = cRsList.getString("ECS_EXAM_DT");
			String ECS_EXAM_SQ_T = cRsList.getString("ECS_EXAM_SQ");
			String ECS_CFRM_CD_T = cRsList.getString("ECS_CFRM_CD");
			String ECS_GIEX_DT_T = cRsList.getString("ECS_GIEX_DT");
			String ECS_GIEX_KD_T = cRsList.getString("ECS_GIEX_KD");
			String ECS_GIRT1_KD_T = cRsList.getString("ECS_GIRT1_KD");
			String ECS_GIRT1S_KD_T = cRsList.getString("ECS_GIRT1S_KD");
			String ECS_GIRT2_KD_T = cRsList.getString("ECS_GIRT2_KD");
			String ECS_GIRT2S_KD_T = cRsList.getString("ECS_GIRT2S_KD");
			String ECS_GIRT3_KD_T = cRsList.getString("ECS_GIRT3_KD");
			String ECS_GIRT3S_KD_T = cRsList.getString("ECS_GIRT3S_KD");
			String ECS_GIETC_KD_T = cRsList.getString("ECS_GIETC_KD");
			String ECS_GIRT_EX_T = cRsList.getString("ECS_GIRT_EX");
			String ECS_ENEX_DT_T = cRsList.getString("ECS_ENEX_DT");
			String ECS_ENRT1_KD_T = cRsList.getString("ECS_ENRT1_KD");
			String ECS_ENRT1S_KD_T = cRsList.getString("ECS_ENRT1S_KD");
			String ECS_ENRT2_KD_T = cRsList.getString("ECS_ENRT2_KD");
			String ECS_ENRT2S_KD_T = cRsList.getString("ECS_ENRT2S_KD");
			String ECS_ENRT3_KD_T = cRsList.getString("ECS_ENRT3_KD");
			String ECS_ENRT3S_KD_T = cRsList.getString("ECS_ENRT3S_KD");
			String ECS_ENETC_KD_T = cRsList.getString("ECS_ENETC_KD");
			String ECS_ENRT_EX_T = cRsList.getString("ECS_ENRT_EX");
			String ECS_BIEX_YN_T = cRsList.getString("ECS_BIEX_YN");
			String ECS_FOCP_KD_T = cRsList.getString("ECS_FOCP_KD");
			String ECS_BIRT_KD_T = cRsList.getString("ECS_BIRT_KD");
			String ECS_BICT_KD_T = cRsList.getString("ECS_BICT_KD");
			String ECS_BICNCR_KD_T = cRsList.getString("ECS_BICNCR_KD");
			String ECS_BICNCR_EX_T = cRsList.getString("ECS_BICNCR_EX");
			String ECS_BIETC_KD_T = cRsList.getString("ECS_BIETC_KD");
			String ECS_BIETC_EX_T = cRsList.getString("ECS_BIETC_EX");
			String ECS_RSLT_KD_T = cRsList.getString("ECS_RSLT_KD");
			String ECS_STCN_YN_T = cRsList.getString("ECS_STCN_YN");
			String ECS_ETC_EX_T = cRsList.getString("ECS_ETC_EX");
			String ECS_RSLT_EX_T = cRsList.getString("ECS_RSLT_EX");
			String ECS_RPT_DT_T = cRsList.getString("ECS_RPT_DT");
			String ECS_CFRM_DT_T = cRsList.getString("ECS_CFRM_DT");
			String ECS_LICEN_CD_T = cRsList.getString("ECS_LICEN_CD");
			String ECS_INPUT_DTT_T = cRsList.getDate2("ECS_INPUT_DTT");
			String ECS_INPUT_ID_T = cRsList.getString("ECS_INPUT_ID");
			String ECS_MODI_DTT_T = cRsList.getDate2("ECS_MODI_DTT");
			String ECS_MODI_ID_T = cRsList.getString("ECS_MODI_ID");
			String ECS_DECI_LICEN_CD_T = cRsList.getString("ECS_DECI_LICEN_CD");
			String ECS_CKUP_LICEN_CD_T = cRsList.getString("ECS_CKUP_LICEN_CD");
			String ECS_PATH_LICEN_CD_T = cRsList.getString("ECS_PATH_LICEN_CD");
			String ECS_GICM_KD_T = cRsList.getString("ECS_GICM_KD");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! ECS_EXAM_DT_T.equals("")) {
%>
		 		ECS_EXAM_DT='<%= ECS_EXAM_DT_T%>'
<%
			}

			if(! ECS_EXAM_SQ_T.equals("")) {
%>
		 		ECS_EXAM_SQ='<%= ECS_EXAM_SQ_T%>'
<%
			}

			if(! ECS_CFRM_CD_T.equals("")) {
%>
		 		ECS_CFRM_CD='<%= ECS_CFRM_CD_T%>'
<%
			}

			if(! ECS_GIEX_DT_T.equals("")) {
%>
		 		ECS_GIEX_DT='<%= ECS_GIEX_DT_T%>'
<%
			}

			if(! ECS_GIEX_KD_T.equals("")) {
%>
		 		ECS_GIEX_KD='<%= ECS_GIEX_KD_T%>'
<%
			}

			if(! ECS_GIRT1_KD_T.equals("")) {
%>
		 		ECS_GIRT1_KD='<%= ECS_GIRT1_KD_T%>'
<%
			}

			if(! ECS_GIRT1S_KD_T.equals("")) {
%>
		 		ECS_GIRT1S_KD='<%= ECS_GIRT1S_KD_T%>'
<%
			}

			if(! ECS_GIRT2_KD_T.equals("")) {
%>
		 		ECS_GIRT2_KD='<%= ECS_GIRT2_KD_T%>'
<%
			}

			if(! ECS_GIRT2S_KD_T.equals("")) {
%>
		 		ECS_GIRT2S_KD='<%= ECS_GIRT2S_KD_T%>'
<%
			}

			if(! ECS_GIRT3_KD_T.equals("")) {
%>
		 		ECS_GIRT3_KD='<%= ECS_GIRT3_KD_T%>'
<%
			}

			if(! ECS_GIRT3S_KD_T.equals("")) {
%>
		 		ECS_GIRT3S_KD='<%= ECS_GIRT3S_KD_T%>'
<%
			}

			if(! ECS_GIETC_KD_T.equals("")) {
%>
		 		ECS_GIETC_KD='<%= ECS_GIETC_KD_T%>'
<%
			}

			if(! ECS_GIRT_EX_T.equals("")) {
%>
		 		ECS_GIRT_EX='<%= ECS_GIRT_EX_T%>'
<%
			}

			if(! ECS_ENEX_DT_T.equals("")) {
%>
		 		ECS_ENEX_DT='<%= ECS_ENEX_DT_T%>'
<%
			}

			if(! ECS_ENRT1_KD_T.equals("")) {
%>
		 		ECS_ENRT1_KD='<%= ECS_ENRT1_KD_T%>'
<%
			}

			if(! ECS_ENRT1S_KD_T.equals("")) {
%>
		 		ECS_ENRT1S_KD='<%= ECS_ENRT1S_KD_T%>'
<%
			}

			if(! ECS_ENRT2_KD_T.equals("")) {
%>
		 		ECS_ENRT2_KD='<%= ECS_ENRT2_KD_T%>'
<%
			}

			if(! ECS_ENRT2S_KD_T.equals("")) {
%>
		 		ECS_ENRT2S_KD='<%= ECS_ENRT2S_KD_T%>'
<%
			}

			if(! ECS_ENRT3_KD_T.equals("")) {
%>
		 		ECS_ENRT3_KD='<%= ECS_ENRT3_KD_T%>'
<%
			}

			if(! ECS_ENRT3S_KD_T.equals("")) {
%>
		 		ECS_ENRT3S_KD='<%= ECS_ENRT3S_KD_T%>'
<%
			}

			if(! ECS_ENETC_KD_T.equals("")) {
%>
		 		ECS_ENETC_KD='<%= ECS_ENETC_KD_T%>'
<%
			}

			if(! ECS_ENRT_EX_T.equals("")) {
%>
		 		ECS_ENRT_EX='<%= ECS_ENRT_EX_T%>'
<%
			}

			if(! ECS_BIEX_YN_T.equals("")) {
%>
		 		ECS_BIEX_YN='<%= ECS_BIEX_YN_T%>'
<%
			}

			if(! ECS_FOCP_KD_T.equals("")) {
%>
		 		ECS_FOCP_KD='<%= ECS_FOCP_KD_T%>'
<%
			}

			if(! ECS_BIRT_KD_T.equals("")) {
%>
		 		ECS_BIRT_KD='<%= ECS_BIRT_KD_T%>'
<%
			}

			if(! ECS_BICT_KD_T.equals("")) {
%>
		 		ECS_BICT_KD='<%= ECS_BICT_KD_T%>'
<%
			}

			if(! ECS_BICNCR_KD_T.equals("")) {
%>
		 		ECS_BICNCR_KD='<%= ECS_BICNCR_KD_T%>'
<%
			}

			if(! ECS_BICNCR_EX_T.equals("")) {
%>
		 		ECS_BICNCR_EX='<%= ECS_BICNCR_EX_T%>'
<%
			}

			if(! ECS_BIETC_KD_T.equals("")) {
%>
		 		ECS_BIETC_KD='<%= ECS_BIETC_KD_T%>'
<%
			}

			if(! ECS_BIETC_EX_T.equals("")) {
%>
		 		ECS_BIETC_EX='<%= ECS_BIETC_EX_T%>'
<%
			}

			if(! ECS_RSLT_KD_T.equals("")) {
%>
		 		ECS_RSLT_KD='<%= ECS_RSLT_KD_T%>'
<%
			}

			if(! ECS_STCN_YN_T.equals("")) {
%>
		 		ECS_STCN_YN='<%= ECS_STCN_YN_T%>'
<%
			}

			if(! ECS_ETC_EX_T.equals("")) {
%>
		 		ECS_ETC_EX='<%= ECS_ETC_EX_T%>'
<%
			}

			if(! ECS_RSLT_EX_T.equals("")) {
%>
		 		ECS_RSLT_EX='<%= ECS_RSLT_EX_T%>'
<%
			}

			if(! ECS_RPT_DT_T.equals("")) {
%>
		 		ECS_RPT_DT='<%= ECS_RPT_DT_T%>'
<%
			}

			if(! ECS_CFRM_DT_T.equals("")) {
%>
		 		ECS_CFRM_DT='<%= ECS_CFRM_DT_T%>'
<%
			}

			if(! ECS_LICEN_CD_T.equals("")) {
%>
		 		ECS_LICEN_CD='<%= ECS_LICEN_CD_T%>'
<%
			}

			if(! ECS_INPUT_DTT_T.equals("")) {
%>
		 		ECS_INPUT_DTT='<%= ECS_INPUT_DTT_T%>'
<%
			}

			if(! ECS_INPUT_ID_T.equals("")) {
%>
		 		ECS_INPUT_ID='<%= ECS_INPUT_ID_T%>'
<%
			}

			if(! ECS_MODI_DTT_T.equals("")) {
%>
		 		ECS_MODI_DTT='<%= ECS_MODI_DTT_T%>'
<%
			}

			if(! ECS_MODI_ID_T.equals("")) {
%>
		 		ECS_MODI_ID='<%= ECS_MODI_ID_T%>'
<%
			}

			if(! ECS_DECI_LICEN_CD_T.equals("")) {
%>
		 		ECS_DECI_LICEN_CD='<%= ECS_DECI_LICEN_CD_T%>'
<%
			}

			if(! ECS_CKUP_LICEN_CD_T.equals("")) {
%>
		 		ECS_CKUP_LICEN_CD='<%= ECS_CKUP_LICEN_CD_T%>'
<%
			}

			if(! ECS_PATH_LICEN_CD_T.equals("")) {
%>
		 		ECS_PATH_LICEN_CD='<%= ECS_PATH_LICEN_CD_T%>'
<%
			}

			if(! ECS_GICM_KD_T.equals("")) {
%>
		 		ECS_GICM_KD='<%= ECS_GICM_KD_T%>'
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
