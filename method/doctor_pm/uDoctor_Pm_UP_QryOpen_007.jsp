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

SELECT A.* FROM ET_CANCER_CRVC A
if :cmbPlaceFlg = '1' then
begin
        Inner Join ET_EXAM_ACPT B On B.EEA_EXAM_DT = A.ECV_EXAM_DT         
                And B.EEA_EXAM_SQ = A.ECV_EXAM_SQ                       
                And B.EEA_ORDER_YN <> 'C'                                    
                And SUBSTR(B.EEA_PLCE_CD, 1, 2)= :cmbPlace
end;
WHERE 0=0 ';
        AND A.ECV_EXAM_DT >= :DTEdtEXAM_SDT
        AND A.ECV_EXAM_DT <= :DTEdtEXAM_EDT
        AND NVL(A.ECV_LICEN_CD, ' ') <> ' ' 
		*/

		sql = " SELECT A.*";
		sql += " FROM ET_CANCER_CRVC A";

		if(CMBPLACEFLG.equals("1")) {
			sql += " INNER JOIN ET_EXAM_ACPT B";
			sql += " ON B.EEA_EXAM_DT = A.ECV_EXAM_DT";
			sql += " AND B.EEA_EXAM_SQ = A.ECV_EXAM_SQ";
			sql += " AND B.EEA_ORDER_YN <> 'C'";
			sql += " AND SUBSTR(B.EEA_PLCE_CD, 1, 2)= '" + CMBPLACE + "'";
		}

		sql += " WHERE 0=0";
		sql += " AND A.ECV_EXAM_DT >= '" + DTEDTEXAM_SDT + "'";
		sql += " AND A.ECV_EXAM_DT <= '" + DTEDTEXAM_EDT + "'";
		sql += " AND NVL(A.ECV_LICEN_CD, ' ') <> ' '";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uDoctor_Pm_UP_QryOpen_007 \n";
			G_INFO += "설명 : 자궁암 검진정보 로딩 \n";
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
		<s:AttributeType name='ECV_EXAM_DT' rs:number='1' rs:writeunknown='true' rs:basetable='ET_CANCER_CRVC' rs:basecolumn='ECV_EXAM_DT'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ECV_EXAM_SQ' rs:number='2' rs:writeunknown='true' rs:basetable='ET_CANCER_CRVC' rs:basecolumn='ECV_EXAM_SQ'>
			<s:datatype dt:type='string' dt:maxLength='6' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ECV_CFRM_CD' rs:number='3' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_CRVC'
			 rs:basecolumn='ECV_CFRM_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECV_CVEX_DT' rs:number='4' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_CRVC'
			 rs:basecolumn='ECV_CVEX_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ECV_DBCV_KD' rs:number='5' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_CRVC'
			 rs:basecolumn='ECV_DBCV_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECV_CVSP1_KD' rs:number='6' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_CRVC'
			 rs:basecolumn='ECV_CVSP1_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECV_CELL1_KD' rs:number='7' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_CRVC'
			 rs:basecolumn='ECV_CELL1_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECV_CVRT1_KD' rs:number='8' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_CRVC'
			 rs:basecolumn='ECV_CVRT1_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECV_SQRT1_KD' rs:number='9' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_CRVC'
			 rs:basecolumn='ECV_SQRT1_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECV_NHRT1_KD' rs:number='10' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_CRVC'
			 rs:basecolumn='ECV_NHRT1_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECV_EPRT1_KD' rs:number='11' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_CRVC'
			 rs:basecolumn='ECV_EPRT1_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECV_EPET1_EX' rs:number='12' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_CRVC'
			 rs:basecolumn='ECV_EPET1_EX'>
			<s:datatype dt:type='string' dt:maxLength='40'/>
		</s:AttributeType>
		<s:AttributeType name='ECV_RTET1_EX' rs:number='13' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_CRVC'
			 rs:basecolumn='ECV_RTET1_EX'>
			<s:datatype dt:type='string' dt:maxLength='40'/>
		</s:AttributeType>
		<s:AttributeType name='ECV_ETCRT1_KD' rs:number='14' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_CRVC'
			 rs:basecolumn='ECV_ETCRT1_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECV_ETCEX1_EX' rs:number='15' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_CRVC'
			 rs:basecolumn='ECV_ETCEX1_EX'>
			<s:datatype dt:type='string' dt:maxLength='40'/>
		</s:AttributeType>
		<s:AttributeType name='ECV_CVSP2_KD' rs:number='16' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_CRVC'
			 rs:basecolumn='ECV_CVSP2_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECV_CELL2_KD' rs:number='17' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_CRVC'
			 rs:basecolumn='ECV_CELL2_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECV_CVRT2_KD' rs:number='18' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_CRVC'
			 rs:basecolumn='ECV_CVRT2_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECV_SQRT2_KD' rs:number='19' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_CRVC'
			 rs:basecolumn='ECV_SQRT2_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECV_NHRT2_KD' rs:number='20' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_CRVC'
			 rs:basecolumn='ECV_NHRT2_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECV_EPRT2_KD' rs:number='21' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_CRVC'
			 rs:basecolumn='ECV_EPRT2_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECV_EPET2_EX' rs:number='22' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_CRVC'
			 rs:basecolumn='ECV_EPET2_EX'>
			<s:datatype dt:type='string' dt:maxLength='40'/>
		</s:AttributeType>
		<s:AttributeType name='ECV_RTET2_EX' rs:number='23' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_CRVC'
			 rs:basecolumn='ECV_RTET2_EX'>
			<s:datatype dt:type='string' dt:maxLength='40'/>
		</s:AttributeType>
		<s:AttributeType name='ECV_ETCRT2_KD' rs:number='24' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_CRVC'
			 rs:basecolumn='ECV_ETCRT2_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECV_ETCEX2_EX' rs:number='25' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_CRVC'
			 rs:basecolumn='ECV_ETCEX2_EX'>
			<s:datatype dt:type='string' dt:maxLength='40'/>
		</s:AttributeType>
		<s:AttributeType name='ECV_RSLT_KD' rs:number='26' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_CRVC'
			 rs:basecolumn='ECV_RSLT_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECV_ETC_EX' rs:number='27' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_CRVC'
			 rs:basecolumn='ECV_ETC_EX'>
			<s:datatype dt:type='string' dt:maxLength='40'/>
		</s:AttributeType>
		<s:AttributeType name='ECV_CVCN_YN' rs:number='28' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_CRVC'
			 rs:basecolumn='ECV_CVCN_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECV_RSLT_EX' rs:number='29' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_CRVC'
			 rs:basecolumn='ECV_RSLT_EX'>
			<s:datatype dt:type='string' dt:maxLength='1200'/>
		</s:AttributeType>
		<s:AttributeType name='ECV_RPT_DT' rs:number='30' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_CRVC'
			 rs:basecolumn='ECV_RPT_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ECV_CFRM_DT' rs:number='31' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_CRVC'
			 rs:basecolumn='ECV_CFRM_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ECV_LICEN_CD' rs:number='32' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_CRVC'
			 rs:basecolumn='ECV_LICEN_CD'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ECV_INPUT_DTT' rs:number='33' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_CRVC'
			 rs:basecolumn='ECV_INPUT_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ECV_INPUT_ID' rs:number='34' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_CRVC'
			 rs:basecolumn='ECV_INPUT_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ECV_MODI_DTT' rs:number='35' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_CRVC'
			 rs:basecolumn='ECV_MODI_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ECV_MODI_ID' rs:number='36' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_CRVC'
			 rs:basecolumn='ECV_MODI_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ECV_NHEP1_KD' rs:number='37' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_CRVC'
			 rs:basecolumn='ECV_NHEP1_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECV_NHEP2_KD' rs:number='38' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_CRVC'
			 rs:basecolumn='ECV_NHEP2_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECV_COLL_LICEN_CD' rs:number='39' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_CRVC'
			 rs:basecolumn='ECV_COLL_LICEN_CD'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ECV_PATH_LICEN_CD' rs:number='40' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_CRVC'
			 rs:basecolumn='ECV_PATH_LICEN_CD'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='41' rs:rowid='true' rs:writeunknown='true' rs:basetable='ET_CANCER_CRVC'
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

			String ECV_EXAM_DT_T = cRsList.getString("ECV_EXAM_DT");
			String ECV_EXAM_SQ_T = cRsList.getString("ECV_EXAM_SQ");
			String ECV_CFRM_CD_T = cRsList.getString("ECV_CFRM_CD");
			String ECV_CVEX_DT_T = cRsList.getString("ECV_CVEX_DT");
			String ECV_DBCV_KD_T = cRsList.getString("ECV_DBCV_KD");
			String ECV_CVSP1_KD_T = cRsList.getString("ECV_CVSP1_KD");
			String ECV_CELL1_KD_T = cRsList.getString("ECV_CELL1_KD");
			String ECV_CVRT1_KD_T = cRsList.getString("ECV_CVRT1_KD");
			String ECV_SQRT1_KD_T = cRsList.getString("ECV_SQRT1_KD");
			String ECV_NHRT1_KD_T = cRsList.getString("ECV_NHRT1_KD");
			String ECV_EPRT1_KD_T = cRsList.getString("ECV_EPRT1_KD");
			String ECV_EPET1_EX_T = cRsList.getString("ECV_EPET1_EX");
			String ECV_RTET1_EX_T = cRsList.getString("ECV_RTET1_EX");
			String ECV_ETCRT1_KD_T = cRsList.getString("ECV_ETCRT1_KD");
			String ECV_ETCEX1_EX_T = cRsList.getString("ECV_ETCEX1_EX");
			String ECV_CVSP2_KD_T = cRsList.getString("ECV_CVSP2_KD");
			String ECV_CELL2_KD_T = cRsList.getString("ECV_CELL2_KD");
			String ECV_CVRT2_KD_T = cRsList.getString("ECV_CVRT2_KD");
			String ECV_SQRT2_KD_T = cRsList.getString("ECV_SQRT2_KD");
			String ECV_NHRT2_KD_T = cRsList.getString("ECV_NHRT2_KD");
			String ECV_EPRT2_KD_T = cRsList.getString("ECV_EPRT2_KD");
			String ECV_EPET2_EX_T = cRsList.getString("ECV_EPET2_EX");
			String ECV_RTET2_EX_T = cRsList.getString("ECV_RTET2_EX");
			String ECV_ETCRT2_KD_T = cRsList.getString("ECV_ETCRT2_KD");
			String ECV_ETCEX2_EX_T = cRsList.getString("ECV_ETCEX2_EX");
			String ECV_RSLT_KD_T = cRsList.getString("ECV_RSLT_KD");
			String ECV_ETC_EX_T = cRsList.getString("ECV_ETC_EX");
			String ECV_CVCN_YN_T = cRsList.getString("ECV_CVCN_YN");
			String ECV_RSLT_EX_T = cRsList.getString("ECV_RSLT_EX");
			String ECV_RPT_DT_T = cRsList.getString("ECV_RPT_DT");
			String ECV_CFRM_DT_T = cRsList.getString("ECV_CFRM_DT");
			String ECV_LICEN_CD_T = cRsList.getString("ECV_LICEN_CD");
			String ECV_INPUT_DTT_T = cRsList.getDate2("ECV_INPUT_DTT");
			String ECV_INPUT_ID_T = cRsList.getString("ECV_INPUT_ID");
			String ECV_MODI_DTT_T = cRsList.getDate2("ECV_MODI_DTT");
			String ECV_MODI_ID_T = cRsList.getString("ECV_MODI_ID");
			String ECV_NHEP1_KD_T = cRsList.getString("ECV_NHEP1_KD");
			String ECV_NHEP2_KD_T = cRsList.getString("ECV_NHEP2_KD");
			String ECV_COLL_LICEN_CD_T = cRsList.getString("ECV_COLL_LICEN_CD");
			String ECV_PATH_LICEN_CD_T = cRsList.getString("ECV_PATH_LICEN_CD");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! ECV_EXAM_DT_T.equals("")) {
%>
		 		ECV_EXAM_DT='<%= ECV_EXAM_DT_T%>'
<%
			}

			if(! ECV_EXAM_SQ_T.equals("")) {
%>
		 		ECV_EXAM_SQ='<%= ECV_EXAM_SQ_T%>'
<%
			}

			if(! ECV_CFRM_CD_T.equals("")) {
%>
		 		ECV_CFRM_CD='<%= ECV_CFRM_CD_T%>'
<%
			}

			if(! ECV_CVEX_DT_T.equals("")) {
%>
		 		ECV_CVEX_DT='<%= ECV_CVEX_DT_T%>'
<%
			}

			if(! ECV_DBCV_KD_T.equals("")) {
%>
		 		ECV_DBCV_KD='<%= ECV_DBCV_KD_T%>'
<%
			}

			if(! ECV_CVSP1_KD_T.equals("")) {
%>
		 		ECV_CVSP1_KD='<%= ECV_CVSP1_KD_T%>'
<%
			}

			if(! ECV_CELL1_KD_T.equals("")) {
%>
		 		ECV_CELL1_KD='<%= ECV_CELL1_KD_T%>'
<%
			}

			if(! ECV_CVRT1_KD_T.equals("")) {
%>
		 		ECV_CVRT1_KD='<%= ECV_CVRT1_KD_T%>'
<%
			}

			if(! ECV_SQRT1_KD_T.equals("")) {
%>
		 		ECV_SQRT1_KD='<%= ECV_SQRT1_KD_T%>'
<%
			}

			if(! ECV_NHRT1_KD_T.equals("")) {
%>
		 		ECV_NHRT1_KD='<%= ECV_NHRT1_KD_T%>'
<%
			}

			if(! ECV_EPRT1_KD_T.equals("")) {
%>
		 		ECV_EPRT1_KD='<%= ECV_EPRT1_KD_T%>'
<%
			}

			if(! ECV_EPET1_EX_T.equals("")) {
%>
		 		ECV_EPET1_EX='<%= ECV_EPET1_EX_T%>'
<%
			}

			if(! ECV_RTET1_EX_T.equals("")) {
%>
		 		ECV_RTET1_EX='<%= ECV_RTET1_EX_T%>'
<%
			}

			if(! ECV_ETCRT1_KD_T.equals("")) {
%>
		 		ECV_ETCRT1_KD='<%= ECV_ETCRT1_KD_T%>'
<%
			}

			if(! ECV_ETCEX1_EX_T.equals("")) {
%>
		 		ECV_ETCEX1_EX='<%= ECV_ETCEX1_EX_T%>'
<%
			}

			if(! ECV_CVSP2_KD_T.equals("")) {
%>
		 		ECV_CVSP2_KD='<%= ECV_CVSP2_KD_T%>'
<%
			}

			if(! ECV_CELL2_KD_T.equals("")) {
%>
		 		ECV_CELL2_KD='<%= ECV_CELL2_KD_T%>'
<%
			}

			if(! ECV_CVRT2_KD_T.equals("")) {
%>
		 		ECV_CVRT2_KD='<%= ECV_CVRT2_KD_T%>'
<%
			}

			if(! ECV_SQRT2_KD_T.equals("")) {
%>
		 		ECV_SQRT2_KD='<%= ECV_SQRT2_KD_T%>'
<%
			}

			if(! ECV_NHRT2_KD_T.equals("")) {
%>
		 		ECV_NHRT2_KD='<%= ECV_NHRT2_KD_T%>'
<%
			}

			if(! ECV_EPRT2_KD_T.equals("")) {
%>
		 		ECV_EPRT2_KD='<%= ECV_EPRT2_KD_T%>'
<%
			}

			if(! ECV_EPET2_EX_T.equals("")) {
%>
		 		ECV_EPET2_EX='<%= ECV_EPET2_EX_T%>'
<%
			}

			if(! ECV_RTET2_EX_T.equals("")) {
%>
		 		ECV_RTET2_EX='<%= ECV_RTET2_EX_T%>'
<%
			}

			if(! ECV_ETCRT2_KD_T.equals("")) {
%>
		 		ECV_ETCRT2_KD='<%= ECV_ETCRT2_KD_T%>'
<%
			}

			if(! ECV_ETCEX2_EX_T.equals("")) {
%>
		 		ECV_ETCEX2_EX='<%= ECV_ETCEX2_EX_T%>'
<%
			}

			if(! ECV_RSLT_KD_T.equals("")) {
%>
		 		ECV_RSLT_KD='<%= ECV_RSLT_KD_T%>'
<%
			}

			if(! ECV_ETC_EX_T.equals("")) {
%>
		 		ECV_ETC_EX='<%= ECV_ETC_EX_T%>'
<%
			}

			if(! ECV_CVCN_YN_T.equals("")) {
%>
		 		ECV_CVCN_YN='<%= ECV_CVCN_YN_T%>'
<%
			}

			if(! ECV_RSLT_EX_T.equals("")) {
%>
		 		ECV_RSLT_EX='<%= ECV_RSLT_EX_T%>'
<%
			}

			if(! ECV_RPT_DT_T.equals("")) {
%>
		 		ECV_RPT_DT='<%= ECV_RPT_DT_T%>'
<%
			}

			if(! ECV_CFRM_DT_T.equals("")) {
%>
		 		ECV_CFRM_DT='<%= ECV_CFRM_DT_T%>'
<%
			}

			if(! ECV_LICEN_CD_T.equals("")) {
%>
		 		ECV_LICEN_CD='<%= ECV_LICEN_CD_T%>'
<%
			}

			if(! ECV_INPUT_DTT_T.equals("")) {
%>
		 		ECV_INPUT_DTT='<%= ECV_INPUT_DTT_T%>'
<%
			}

			if(! ECV_INPUT_ID_T.equals("")) {
%>
		 		ECV_INPUT_ID='<%= ECV_INPUT_ID_T%>'
<%
			}

			if(! ECV_MODI_DTT_T.equals("")) {
%>
		 		ECV_MODI_DTT='<%= ECV_MODI_DTT_T%>'
<%
			}

			if(! ECV_MODI_ID_T.equals("")) {
%>
		 		ECV_MODI_ID='<%= ECV_MODI_ID_T%>'
<%
			}

			if(! ECV_NHEP1_KD_T.equals("")) {
%>
		 		ECV_NHEP1_KD='<%= ECV_NHEP1_KD_T%>'
<%
			}

			if(! ECV_NHEP2_KD_T.equals("")) {
%>
		 		ECV_NHEP2_KD='<%= ECV_NHEP2_KD_T%>'
<%
			}

			if(! ECV_COLL_LICEN_CD_T.equals("")) {
%>
		 		ECV_COLL_LICEN_CD='<%= ECV_COLL_LICEN_CD_T%>'
<%
			}

			if(! ECV_PATH_LICEN_CD_T.equals("")) {
%>
		 		ECV_PATH_LICEN_CD='<%= ECV_PATH_LICEN_CD_T%>'
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
