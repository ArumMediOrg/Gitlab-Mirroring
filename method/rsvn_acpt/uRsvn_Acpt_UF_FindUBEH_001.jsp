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
		String RSVN_YN = htMethod.get("RSVN_YN");
		String COMP_CD = htMethod.get("COMP_CD");
		String TARG_NM = htMethod.get("TARG_NM");
		String PSNL_ID = htMethod.get("PSNL_ID");

		//
		if(EXAM_DT == null) { EXAM_DT = ""; }
		if(EXAM_SQ == null) { EXAM_SQ = ""; }
		if(RSVN_YN == null) { RSVN_YN = ""; }
		if(COMP_CD == null) { COMP_CD = ""; }
		if(TARG_NM == null) { TARG_NM = ""; }
		if(PSNL_ID == null) { PSNL_ID = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT A.*, B.RRT_EXAM_DT
  FROM UB_RSVT_ACPT A LEFT OUTER JOIN RT_RSVT B 
    ON B.RRT_RSVN_NO = A.URA_RSVN_NO
 WHERE 1 = 1
 
if (:EXAM_DT <> '') then 
   AND A.URA_EXAM_DT = :EXAM_DT
   AND A.URA_EXAM_SQ = :EXAM_SQ

if (:RSVN_YN = 'N') then
   AND NVL(URA_RSVN_YN, 'N') = 'N'
   
if (:COMP_CD <> '') then
   AND URA_COMP_CD = :COMP_CD
   
if (:TARG_NM <> '') then
   AND URA_TARG_NM LIKE '%'||:TARG_NM||'%'

if (:PSNL_ID <> '') then
   AND URA_PSNL_ID LIKE :PSNL_ID||'%'
		*/

		sql = " SELECT A.*, B.RRT_EXAM_DT";
		sql += " FROM UB_RSVT_ACPT A LEFT OUTER JOIN RT_RSVT B";
		sql += " ON B.RRT_RSVN_NO = A.URA_RSVN_NO";
		sql += " WHERE 1 = 1";

		if(! EXAM_DT.equals("")) {
			sql += " AND A.URA_EXAM_DT = '" + EXAM_DT + "'";
			sql += " AND A.URA_EXAM_SQ = '" + EXAM_SQ + "'";
		}
		if(RSVN_YN.equals("N")) {
			sql += " AND NVL(URA_RSVN_YN, 'N') = 'N'";
		}
		if(! COMP_CD.equals("")) {
			sql += " AND URA_COMP_CD = '" + COMP_CD + "'";
		}
		if(! TARG_NM.equals("")) {
			sql += " AND URA_TARG_NM LIKE '%" + TARG_NM + "%'";
		}
		if(! PSNL_ID.equals("")) {
			sql += " AND URA_PSNL_ID LIKE '" + PSNL_ID + "%'";
		}

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uRsvn_Acpt_UF_FindUBEH_001 \n";
			G_INFO += "설명 : 에버헬스 예약 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " EXAM_DT : " + EXAM_DT + " \n";
			G_INFO += " EXAM_SQ : " + EXAM_SQ + " \n";
			G_INFO += " RSVN_YN : " + RSVN_YN + " \n";
			G_INFO += " COMP_CD : " + COMP_CD + " \n";
			G_INFO += " TARG_NM : " + TARG_NM + " \n";
			G_INFO += " PSNL_ID : " + PSNL_ID + " \n";
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
		<s:AttributeType name='URA_EXAM_DT' rs:number='1' rs:writeunknown='true' rs:basetable='UB_RSVT_ACPT' rs:basecolumn='URA_EXAM_DT'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='URA_EXAM_SQ' rs:number='2' rs:writeunknown='true' rs:basetable='UB_RSVT_ACPT' rs:basecolumn='URA_EXAM_SQ'>
			<s:datatype dt:type='string' dt:maxLength='6' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='URA_USER_ID' rs:number='3' rs:nullable='true' rs:writeunknown='true' rs:basetable='UB_RSVT_ACPT'
			 rs:basecolumn='URA_USER_ID'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='URA_RESE_ID' rs:number='4' rs:nullable='true' rs:writeunknown='true' rs:basetable='UB_RSVT_ACPT'
			 rs:basecolumn='URA_RESE_ID'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='URA_USER_NM' rs:number='5' rs:nullable='true' rs:writeunknown='true' rs:basetable='UB_RSVT_ACPT'
			 rs:basecolumn='URA_USER_NM'>
			<s:datatype dt:type='string' dt:maxLength='25'/>
		</s:AttributeType>
		<s:AttributeType name='URA_TARG_NM' rs:number='6' rs:nullable='true' rs:writeunknown='true' rs:basetable='UB_RSVT_ACPT'
			 rs:basecolumn='URA_TARG_NM'>
			<s:datatype dt:type='string' dt:maxLength='25'/>
		</s:AttributeType>
		<s:AttributeType name='URA_EMPL_NO' rs:number='7' rs:nullable='true' rs:writeunknown='true' rs:basetable='UB_RSVT_ACPT'
			 rs:basecolumn='URA_EMPL_NO'>
			<s:datatype dt:type='string' dt:maxLength='15'/>
		</s:AttributeType>
		<s:AttributeType name='URA_BIRT_DT' rs:number='8' rs:nullable='true' rs:writeunknown='true' rs:basetable='UB_RSVT_ACPT'
			 rs:basecolumn='URA_BIRT_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='URA_RESE_DT' rs:number='9' rs:nullable='true' rs:writeunknown='true' rs:basetable='UB_RSVT_ACPT'
			 rs:basecolumn='URA_RESE_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='URA_RESE_AP' rs:number='10' rs:nullable='true' rs:writeunknown='true' rs:basetable='UB_RSVT_ACPT'
			 rs:basecolumn='URA_RESE_AP'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='URA_COMM_TX' rs:number='11' rs:nullable='true' rs:writeunknown='true' rs:basetable='UB_RSVT_ACPT'
			 rs:basecolumn='URA_COMM_TX'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='URA_PACK_ID' rs:number='12' rs:nullable='true' rs:writeunknown='true' rs:basetable='UB_RSVT_ACPT'
			 rs:basecolumn='URA_PACK_ID'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='URA_COMP_PR' rs:number='13' rs:nullable='true' rs:writeunknown='true' rs:basetable='UB_RSVT_ACPT'
			 rs:basecolumn='URA_COMP_PR'>
			<s:datatype dt:type='string' dt:maxLength='7'/>
		</s:AttributeType>
		<s:AttributeType name='URA_ADD_PR' rs:number='14' rs:nullable='true' rs:writeunknown='true' rs:basetable='UB_RSVT_ACPT'
			 rs:basecolumn='URA_ADD_PR'>
			<s:datatype dt:type='string' dt:maxLength='7'/>
		</s:AttributeType>
		<s:AttributeType name='URA_MOBL_NO' rs:number='15' rs:nullable='true' rs:writeunknown='true' rs:basetable='UB_RSVT_ACPT'
			 rs:basecolumn='URA_MOBL_NO'>
			<s:datatype dt:type='string' dt:maxLength='14'/>
		</s:AttributeType>
		<s:AttributeType name='URA_TEL_NO' rs:number='16' rs:nullable='true' rs:writeunknown='true' rs:basetable='UB_RSVT_ACPT'
			 rs:basecolumn='URA_TEL_NO'>
			<s:datatype dt:type='string' dt:maxLength='14'/>
		</s:AttributeType>
		<s:AttributeType name='URA_EMAIL_AR' rs:number='17' rs:nullable='true' rs:writeunknown='true' rs:basetable='UB_RSVT_ACPT'
			 rs:basecolumn='URA_EMAIL_AR'>
			<s:datatype dt:type='string' dt:maxLength='50'/>
		</s:AttributeType>
		<s:AttributeType name='URA_ZIP_CD' rs:number='18' rs:nullable='true' rs:writeunknown='true' rs:basetable='UB_RSVT_ACPT'
			 rs:basecolumn='URA_ZIP_CD'>
			<s:datatype dt:type='string' dt:maxLength='5'/>
		</s:AttributeType>
		<s:AttributeType name='URA_MAIN_AR' rs:number='19' rs:nullable='true' rs:writeunknown='true' rs:basetable='UB_RSVT_ACPT'
			 rs:basecolumn='URA_MAIN_AR'>
			<s:datatype dt:type='string' dt:maxLength='150'/>
		</s:AttributeType>
		<s:AttributeType name='URA_DETL_AR' rs:number='20' rs:nullable='true' rs:writeunknown='true' rs:basetable='UB_RSVT_ACPT'
			 rs:basecolumn='URA_DETL_AR'>
			<s:datatype dt:type='string' dt:maxLength='150'/>
		</s:AttributeType>
		<s:AttributeType name='URA_RECE_YN' rs:number='21' rs:nullable='true' rs:writeunknown='true' rs:basetable='UB_RSVT_ACPT'
			 rs:basecolumn='URA_RECE_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='URA_SHAR_YN' rs:number='22' rs:nullable='true' rs:writeunknown='true' rs:basetable='UB_RSVT_ACPT'
			 rs:basecolumn='URA_SHAR_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='URA_TRET_TX' rs:number='23' rs:nullable='true' rs:writeunknown='true' rs:basetable='UB_RSVT_ACPT'
			 rs:basecolumn='URA_TRET_TX'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='URA_SPEC_YN' rs:number='24' rs:nullable='true' rs:writeunknown='true' rs:basetable='UB_RSVT_ACPT'
			 rs:basecolumn='URA_SPEC_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='URA_GRAD_NM' rs:number='25' rs:nullable='true' rs:writeunknown='true' rs:basetable='UB_RSVT_ACPT'
			 rs:basecolumn='URA_GRAD_NM'>
			<s:datatype dt:type='string' dt:maxLength='30'/>
		</s:AttributeType>
		<s:AttributeType name='URA_SEND_CD' rs:number='26' rs:nullable='true' rs:writeunknown='true' rs:basetable='UB_RSVT_ACPT'
			 rs:basecolumn='URA_SEND_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='URA_SERV_CD' rs:number='27' rs:nullable='true' rs:writeunknown='true' rs:basetable='UB_RSVT_ACPT'
			 rs:basecolumn='URA_SERV_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='URA_PACK_PR' rs:number='28' rs:nullable='true' rs:writeunknown='true' rs:basetable='UB_RSVT_ACPT'
			 rs:basecolumn='URA_PACK_PR'>
			<s:datatype dt:type='string' dt:maxLength='7'/>
		</s:AttributeType>
		<s:AttributeType name='URA_REST_DT' rs:number='29' rs:nullable='true' rs:writeunknown='true' rs:basetable='UB_RSVT_ACPT'
			 rs:basecolumn='URA_REST_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='URA_REEN_DT' rs:number='30' rs:nullable='true' rs:writeunknown='true' rs:basetable='UB_RSVT_ACPT'
			 rs:basecolumn='URA_REEN_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='URA_CHST_DT' rs:number='31' rs:nullable='true' rs:writeunknown='true' rs:basetable='UB_RSVT_ACPT'
			 rs:basecolumn='URA_CHST_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='URA_CHEN_DT' rs:number='32' rs:nullable='true' rs:writeunknown='true' rs:basetable='UB_RSVT_ACPT'
			 rs:basecolumn='URA_CHEN_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='URA_RSVN_NO' rs:number='33' rs:nullable='true' rs:writeunknown='true' rs:basetable='UB_RSVT_ACPT'
			 rs:basecolumn='URA_RSVN_NO'>
			<s:datatype dt:type='string' dt:maxLength='14'/>
		</s:AttributeType>
		<s:AttributeType name='URA_ADD_ITEM' rs:number='34' rs:nullable='true' rs:writeunknown='true' rs:basetable='UB_RSVT_ACPT'
			 rs:basecolumn='URA_ADD_ITEM'>
			<s:datatype dt:type='string' dt:maxLength='350'/>
		</s:AttributeType>
		<s:AttributeType name='URA_CHOI_ITEM' rs:number='35' rs:nullable='true' rs:writeunknown='true' rs:basetable='UB_RSVT_ACPT'
			 rs:basecolumn='URA_CHOI_ITEM'>
			<s:datatype dt:type='string' dt:maxLength='350'/>
		</s:AttributeType>
		<s:AttributeType name='URA_FIRST_DT' rs:number='36' rs:nullable='true' rs:writeunknown='true' rs:basetable='UB_RSVT_ACPT'
			 rs:basecolumn='URA_FIRST_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='URA_SECOND_DT' rs:number='37' rs:nullable='true' rs:writeunknown='true' rs:basetable='UB_RSVT_ACPT'
			 rs:basecolumn='URA_SECOND_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='URA_FIRST_AP' rs:number='38' rs:nullable='true' rs:writeunknown='true' rs:basetable='UB_RSVT_ACPT'
			 rs:basecolumn='URA_FIRST_AP'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='URA_SECOND_AP' rs:number='39' rs:nullable='true' rs:writeunknown='true' rs:basetable='UB_RSVT_ACPT'
			 rs:basecolumn='URA_SECOND_AP'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='URA_COMP_CD' rs:number='40' rs:nullable='true' rs:writeunknown='true' rs:basetable='UB_RSVT_ACPT'
			 rs:basecolumn='URA_COMP_CD'>
			<s:datatype dt:type='string' dt:maxLength='12'/>
		</s:AttributeType>
		<s:AttributeType name='URA_PSNL_ID' rs:number='41' rs:nullable='true' rs:writeunknown='true' rs:basetable='UB_RSVT_ACPT'
			 rs:basecolumn='URA_PSNL_ID'>
			<s:datatype dt:type='string' dt:maxLength='7'/>
		</s:AttributeType>
		<s:AttributeType name='ARUM_STATUS' rs:number='42' rs:nullable='true' rs:writeunknown='true' rs:basetable='UB_RSVT_ACPT'
			 rs:basecolumn='ARUM_STATUS'>
			<s:datatype dt:type='string' dt:maxLength='1500'/>
		</s:AttributeType>
		<s:AttributeType name='URA_PERS_PR' rs:number='43' rs:nullable='true' rs:writeunknown='true' rs:basetable='UB_RSVT_ACPT'
			 rs:basecolumn='URA_PERS_PR'>
			<s:datatype dt:type='string' dt:maxLength='7'/>
		</s:AttributeType>
		<s:AttributeType name='URA_COMADD_PR' rs:number='44' rs:nullable='true' rs:writeunknown='true' rs:basetable='UB_RSVT_ACPT'
			 rs:basecolumn='URA_COMADD_PR'>
			<s:datatype dt:type='string' dt:maxLength='7'/>
		</s:AttributeType>
		<s:AttributeType name='URA_RSVN_YN' rs:number='45' rs:nullable='true' rs:writeunknown='true' rs:basetable='UB_RSVT_ACPT'
			 rs:basecolumn='URA_RSVN_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='RRT_EXAM_DT' rs:number='46' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT'
			 rs:basecolumn='RRT_EXAM_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='47' rs:rowid='true' rs:basetable='UB_RSVT_ACPT' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c47' rs:name='ROWID' rs:number='48' rs:rowid='true' rs:basetable='RT_RSVT' rs:basecolumn='ROWID'
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

			String URA_EXAM_DT_T = cRsList.getString("URA_EXAM_DT");
			String URA_EXAM_SQ_T = cRsList.getString("URA_EXAM_SQ");
			String URA_USER_ID_T = cRsList.getString("URA_USER_ID");
			String URA_RESE_ID_T = cRsList.getString("URA_RESE_ID");
			String URA_USER_NM_T = cRsList.getString("URA_USER_NM");
			String URA_TARG_NM_T = cRsList.getString("URA_TARG_NM");
			String URA_EMPL_NO_T = cRsList.getString("URA_EMPL_NO");
			String URA_BIRT_DT_T = cRsList.getString("URA_BIRT_DT");
			String URA_RESE_DT_T = cRsList.getString("URA_RESE_DT");
			String URA_RESE_AP_T = cRsList.getString("URA_RESE_AP");
			String URA_COMM_TX_T = cRsList.getString("URA_COMM_TX");
			String URA_PACK_ID_T = cRsList.getString("URA_PACK_ID");
			String URA_COMP_PR_T = cRsList.getString("URA_COMP_PR");
			String URA_ADD_PR_T = cRsList.getString("URA_ADD_PR");
			String URA_MOBL_NO_T = cRsList.getString("URA_MOBL_NO");
			String URA_TEL_NO_T = cRsList.getString("URA_TEL_NO");
			String URA_EMAIL_AR_T = cRsList.getString("URA_EMAIL_AR");
			String URA_ZIP_CD_T = cRsList.getString("URA_ZIP_CD");
			String URA_MAIN_AR_T = cRsList.getString("URA_MAIN_AR");
			String URA_DETL_AR_T = cRsList.getString("URA_DETL_AR");
			String URA_RECE_YN_T = cRsList.getString("URA_RECE_YN");
			String URA_SHAR_YN_T = cRsList.getString("URA_SHAR_YN");
			String URA_TRET_TX_T = cRsList.getString("URA_TRET_TX");
			String URA_SPEC_YN_T = cRsList.getString("URA_SPEC_YN");
			String URA_GRAD_NM_T = cRsList.getString("URA_GRAD_NM");
			String URA_SEND_CD_T = cRsList.getString("URA_SEND_CD");
			String URA_SERV_CD_T = cRsList.getString("URA_SERV_CD");
			String URA_PACK_PR_T = cRsList.getString("URA_PACK_PR");
			String URA_REST_DT_T = cRsList.getString("URA_REST_DT");
			String URA_REEN_DT_T = cRsList.getString("URA_REEN_DT");
			String URA_CHST_DT_T = cRsList.getString("URA_CHST_DT");
			String URA_CHEN_DT_T = cRsList.getString("URA_CHEN_DT");
			String URA_RSVN_NO_T = cRsList.getString("URA_RSVN_NO");
			String URA_ADD_ITEM_T = cRsList.getString("URA_ADD_ITEM");
			String URA_CHOI_ITEM_T = cRsList.getString("URA_CHOI_ITEM");
			String URA_FIRST_DT_T = cRsList.getString("URA_FIRST_DT");
			String URA_SECOND_DT_T = cRsList.getString("URA_SECOND_DT");
			String URA_FIRST_AP_T = cRsList.getString("URA_FIRST_AP");
			String URA_SECOND_AP_T = cRsList.getString("URA_SECOND_AP");
			String URA_COMP_CD_T = cRsList.getString("URA_COMP_CD");
			String URA_PSNL_ID_T = cRsList.getString("URA_PSNL_ID");
			String ARUM_STATUS_T = cRsList.getString("ARUM_STATUS");
			String URA_PERS_PR_T = cRsList.getString("URA_PERS_PR");
			String URA_COMADD_PR_T = cRsList.getString("URA_COMADD_PR");
			String URA_RSVN_YN_T = cRsList.getString("URA_RSVN_YN");
			String RRT_EXAM_DT_T = cRsList.getString("RRT_EXAM_DT");
			String ROWID_T = cRsList.getString("ROWID");
			String c47_T = cRsList.getString("c47");
%>
			<z:row
<%
			if(! URA_EXAM_DT_T.equals("")) {
%>
		 		URA_EXAM_DT='<%= URA_EXAM_DT_T%>'
<%
			}

			if(! URA_EXAM_SQ_T.equals("")) {
%>
		 		URA_EXAM_SQ='<%= URA_EXAM_SQ_T%>'
<%
			}

			if(! URA_USER_ID_T.equals("")) {
%>
		 		URA_USER_ID='<%= URA_USER_ID_T%>'
<%
			}

			if(! URA_RESE_ID_T.equals("")) {
%>
		 		URA_RESE_ID='<%= URA_RESE_ID_T%>'
<%
			}

			if(! URA_USER_NM_T.equals("")) {
%>
		 		URA_USER_NM='<%= URA_USER_NM_T%>'
<%
			}

			if(! URA_TARG_NM_T.equals("")) {
%>
		 		URA_TARG_NM='<%= URA_TARG_NM_T%>'
<%
			}

			if(! URA_EMPL_NO_T.equals("")) {
%>
		 		URA_EMPL_NO='<%= URA_EMPL_NO_T%>'
<%
			}

			if(! URA_BIRT_DT_T.equals("")) {
%>
		 		URA_BIRT_DT='<%= URA_BIRT_DT_T%>'
<%
			}

			if(! URA_RESE_DT_T.equals("")) {
%>
		 		URA_RESE_DT='<%= URA_RESE_DT_T%>'
<%
			}

			if(! URA_RESE_AP_T.equals("")) {
%>
		 		URA_RESE_AP='<%= URA_RESE_AP_T%>'
<%
			}

			if(! URA_COMM_TX_T.equals("")) {
%>
		 		URA_COMM_TX='<%= URA_COMM_TX_T%>'
<%
			}

			if(! URA_PACK_ID_T.equals("")) {
%>
		 		URA_PACK_ID='<%= URA_PACK_ID_T%>'
<%
			}

			if(! URA_COMP_PR_T.equals("")) {
%>
		 		URA_COMP_PR='<%= URA_COMP_PR_T%>'
<%
			}

			if(! URA_ADD_PR_T.equals("")) {
%>
		 		URA_ADD_PR='<%= URA_ADD_PR_T%>'
<%
			}

			if(! URA_MOBL_NO_T.equals("")) {
%>
		 		URA_MOBL_NO='<%= URA_MOBL_NO_T%>'
<%
			}

			if(! URA_TEL_NO_T.equals("")) {
%>
		 		URA_TEL_NO='<%= URA_TEL_NO_T%>'
<%
			}

			if(! URA_EMAIL_AR_T.equals("")) {
%>
		 		URA_EMAIL_AR='<%= URA_EMAIL_AR_T%>'
<%
			}

			if(! URA_ZIP_CD_T.equals("")) {
%>
		 		URA_ZIP_CD='<%= URA_ZIP_CD_T%>'
<%
			}

			if(! URA_MAIN_AR_T.equals("")) {
%>
		 		URA_MAIN_AR='<%= URA_MAIN_AR_T%>'
<%
			}

			if(! URA_DETL_AR_T.equals("")) {
%>
		 		URA_DETL_AR='<%= URA_DETL_AR_T%>'
<%
			}

			if(! URA_RECE_YN_T.equals("")) {
%>
		 		URA_RECE_YN='<%= URA_RECE_YN_T%>'
<%
			}

			if(! URA_SHAR_YN_T.equals("")) {
%>
		 		URA_SHAR_YN='<%= URA_SHAR_YN_T%>'
<%
			}

			if(! URA_TRET_TX_T.equals("")) {
%>
		 		URA_TRET_TX='<%= URA_TRET_TX_T%>'
<%
			}

			if(! URA_SPEC_YN_T.equals("")) {
%>
		 		URA_SPEC_YN='<%= URA_SPEC_YN_T%>'
<%
			}

			if(! URA_GRAD_NM_T.equals("")) {
%>
		 		URA_GRAD_NM='<%= URA_GRAD_NM_T%>'
<%
			}

			if(! URA_SEND_CD_T.equals("")) {
%>
		 		URA_SEND_CD='<%= URA_SEND_CD_T%>'
<%
			}

			if(! URA_SERV_CD_T.equals("")) {
%>
		 		URA_SERV_CD='<%= URA_SERV_CD_T%>'
<%
			}

			if(! URA_PACK_PR_T.equals("")) {
%>
		 		URA_PACK_PR='<%= URA_PACK_PR_T%>'
<%
			}

			if(! URA_REST_DT_T.equals("")) {
%>
		 		URA_REST_DT='<%= URA_REST_DT_T%>'
<%
			}

			if(! URA_REEN_DT_T.equals("")) {
%>
		 		URA_REEN_DT='<%= URA_REEN_DT_T%>'
<%
			}

			if(! URA_CHST_DT_T.equals("")) {
%>
		 		URA_CHST_DT='<%= URA_CHST_DT_T%>'
<%
			}

			if(! URA_CHEN_DT_T.equals("")) {
%>
		 		URA_CHEN_DT='<%= URA_CHEN_DT_T%>'
<%
			}

			if(! URA_RSVN_NO_T.equals("")) {
%>
		 		URA_RSVN_NO='<%= URA_RSVN_NO_T%>'
<%
			}

			if(! URA_ADD_ITEM_T.equals("")) {
%>
		 		URA_ADD_ITEM='<%= URA_ADD_ITEM_T%>'
<%
			}

			if(! URA_CHOI_ITEM_T.equals("")) {
%>
		 		URA_CHOI_ITEM='<%= URA_CHOI_ITEM_T%>'
<%
			}

			if(! URA_FIRST_DT_T.equals("")) {
%>
		 		URA_FIRST_DT='<%= URA_FIRST_DT_T%>'
<%
			}

			if(! URA_SECOND_DT_T.equals("")) {
%>
		 		URA_SECOND_DT='<%= URA_SECOND_DT_T%>'
<%
			}

			if(! URA_FIRST_AP_T.equals("")) {
%>
		 		URA_FIRST_AP='<%= URA_FIRST_AP_T%>'
<%
			}

			if(! URA_SECOND_AP_T.equals("")) {
%>
		 		URA_SECOND_AP='<%= URA_SECOND_AP_T%>'
<%
			}

			if(! URA_COMP_CD_T.equals("")) {
%>
		 		URA_COMP_CD='<%= URA_COMP_CD_T%>'
<%
			}

			if(! URA_PSNL_ID_T.equals("")) {
%>
		 		URA_PSNL_ID='<%= URA_PSNL_ID_T%>'
<%
			}

			if(! ARUM_STATUS_T.equals("")) {
%>
		 		ARUM_STATUS='<%= ARUM_STATUS_T%>'
<%
			}

			if(! URA_PERS_PR_T.equals("")) {
%>
		 		URA_PERS_PR='<%= URA_PERS_PR_T%>'
<%
			}

			if(! URA_COMADD_PR_T.equals("")) {
%>
		 		URA_COMADD_PR='<%= URA_COMADD_PR_T%>'
<%
			}

			if(! URA_RSVN_YN_T.equals("")) {
%>
		 		URA_RSVN_YN='<%= URA_RSVN_YN_T%>'
<%
			}

			if(! RRT_EXAM_DT_T.equals("")) {
%>
		 		RRT_EXAM_DT='<%= RRT_EXAM_DT_T%>'
<%
			}
%>
				ROWID='<%= cnt%>'
				c47='<%= cnt%>'
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
