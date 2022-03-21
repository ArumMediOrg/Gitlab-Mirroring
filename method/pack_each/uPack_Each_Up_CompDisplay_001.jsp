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

		String PCOMP_CD = htMethod.get("PCOMP_CD");
		String PMNGT_YR = htMethod.get("PMNGT_YR");
		String PCNRT_SQ = htMethod.get("PCNRT_SQ");
		String PPROF_SQ = htMethod.get("PPROF_SQ");
		String PPACK_DT = htMethod.get("PPACK_DT");

		//
		if(PCOMP_CD == null) { PCOMP_CD = ""; }
		if(PMNGT_YR == null) { PMNGT_YR = ""; }
		if(PCNRT_SQ == null) { PCNRT_SQ = ""; }
		if(PPROF_SQ == null) { PPROF_SQ = ""; }
		if(PPACK_DT == null) { PPACK_DT = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

select i.*, ltrim(rtrim(a.iim_item_cd)) item_cd, 
       ltrim(rtrim(a.iim_knme_nm)) item_nm, ltrim(rtrim(a.iim_oscd_cd)) oscd_cd, 
       nvl(b.iip_jcsg_pr, 0) item_jc, 
       nvl(b.iip_gbsg_pr, 0) item_gb, 
       nvl(b.iip_hesg_pr, 0) item_he 
  from et_comp_cnrt_prof_item i, it_item a, it_item_price b 
 where i.eci_comp_cd = :pComp_Cd
   and i.eci_mngt_yr = :pMngt_Yr
   and i.eci_cnrt_sq = :pCnrt_Sq
   and i.eci_prof_sq = :pProf_Sq
   and a.iim_item_cd = i.eci_item_cd 
   and b.iip_aply_dt = GetITEM_PRICE_ApplyDate(a.iim_item_cd, :pPack_Dt, 'ITEM_CD') 
   and b.iip_item_cd = a.iim_item_cd 
   and upper(b.iip_use_yn) = 'Y' 
 order by i.eci_sort_sq 

		*/

		sql = " SELECT I.*, LTRIM(RTRIM(A.IIM_ITEM_CD)) ITEM_CD, LTRIM(RTRIM(A.IIM_KNME_NM)) ITEM_NM, LTRIM(RTRIM(A.IIM_OSCD_CD)) OSCD_CD, NVL(B.IIP_JCSG_PR, 0) ITEM_JC, NVL(B.IIP_GBSG_PR, 0) ITEM_GB, NVL(B.IIP_HESG_PR, 0) ITEM_HE";
		sql += " FROM ET_COMP_CNRT_PROF_ITEM I, IT_ITEM A, IT_ITEM_PRICE B";
		sql += " WHERE I.ECI_COMP_CD = '" + PCOMP_CD + "'";
		sql += " AND I.ECI_MNGT_YR = '" + PMNGT_YR + "'";
		sql += " AND I.ECI_CNRT_SQ = '" + PCNRT_SQ + "'";
		sql += " AND I.ECI_PROF_SQ = '" + PPROF_SQ + "'";
		sql += " AND A.IIM_ITEM_CD = I.ECI_ITEM_CD";
		sql += " AND B.IIP_APLY_DT = GETITEM_PRICE_APPLYDATE(A.IIM_ITEM_CD, '" + PPACK_DT + "', 'ITEM_CD')";
		sql += " AND B.IIP_ITEM_CD = A.IIM_ITEM_CD";
		sql += " AND UPPER(B.IIP_USE_YN) = 'Y'";
		sql += " ORDER BY I.ECI_SORT_SQ";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uPack_Each_Up_CompDisplay_001 \n";
			G_INFO += "설명 : 사업장 묶음정보 로딩 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " PCOMP_CD : " + PCOMP_CD + " \n";
			G_INFO += " PMNGT_YR : " + PMNGT_YR + " \n";
			G_INFO += " PCNRT_SQ : " + PCNRT_SQ + " \n";
			G_INFO += " PPROF_SQ : " + PPROF_SQ + " \n";
			G_INFO += " PPACK_DT : " + PPACK_DT + " \n";
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
		<s:AttributeType name='ECI_COMP_CD' rs:number='1' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_PROF_ITEM'
			 rs:basecolumn='ECI_COMP_CD'>
			<s:datatype dt:type='string' dt:maxLength='12' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ECI_MNGT_YR' rs:number='2' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_PROF_ITEM'
			 rs:basecolumn='ECI_MNGT_YR'>
			<s:datatype dt:type='string' dt:maxLength='4' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ECI_CNRT_SQ' rs:number='3' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_PROF_ITEM'
			 rs:basecolumn='ECI_CNRT_SQ'>
			<s:datatype dt:type='string' dt:maxLength='2' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ECI_PROF_SQ' rs:number='4' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_PROF_ITEM'
			 rs:basecolumn='ECI_PROF_SQ'>
			<s:datatype dt:type='string' dt:maxLength='2' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ECI_ITEM_CD' rs:number='5' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_PROF_ITEM'
			 rs:basecolumn='ECI_ITEM_CD'>
			<s:datatype dt:type='string' dt:maxLength='20' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ECI_SORT_SQ' rs:number='6' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_PROF_ITEM'
			 rs:basecolumn='ECI_SORT_SQ'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ECI_ITEM_PR' rs:number='7' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_PROF_ITEM'
			 rs:basecolumn='ECI_ITEM_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ECI_CNRT_PR' rs:number='8' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_PROF_ITEM'
			 rs:basecolumn='ECI_CNRT_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ECI_INPT_ID' rs:number='9' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_PROF_ITEM'
			 rs:basecolumn='ECI_INPT_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ECI_INPT_DTT' rs:number='10' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_PROF_ITEM'
			 rs:basecolumn='ECI_INPT_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ITEM_CD' rs:number='11' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ITEM_NM' rs:number='12' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='OSCD_CD' rs:number='13' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ITEM_JC' rs:number='14' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='ITEM_GB' rs:number='15' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='ITEM_HE' rs:number='16' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='17' rs:rowid='true' rs:basetable='ET_COMP_CNRT_PROF_ITEM' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c17' rs:name='ROWID' rs:number='18' rs:rowid='true' rs:basetable='IT_ITEM' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c18' rs:name='ROWID' rs:number='19' rs:rowid='true' rs:basetable='IT_ITEM_PRICE' rs:basecolumn='ROWID'
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

			String ECI_COMP_CD_T = cRsList.getString("ECI_COMP_CD");
			String ECI_MNGT_YR_T = cRsList.getString("ECI_MNGT_YR");
			String ECI_CNRT_SQ_T = cRsList.getString("ECI_CNRT_SQ");
			String ECI_PROF_SQ_T = cRsList.getString("ECI_PROF_SQ");
			String ECI_ITEM_CD_T = cRsList.getString("ECI_ITEM_CD");
			String ECI_SORT_SQ_T = cRsList.getString("ECI_SORT_SQ");
			String ECI_ITEM_PR_T = cRsList.getString("ECI_ITEM_PR");
			String ECI_CNRT_PR_T = cRsList.getString("ECI_CNRT_PR");
			String ECI_INPT_ID_T = cRsList.getString("ECI_INPT_ID");
			String ECI_INPT_DTT_T = cRsList.getDate2("ECI_INPT_DTT");
			String ITEM_CD_T = cRsList.getString("ITEM_CD");
			String ITEM_NM_T = cRsList.getString("ITEM_NM");
			String OSCD_CD_T = cRsList.getString("OSCD_CD");
			String ITEM_JC_T = cRsList.getString("ITEM_JC");
			String ITEM_GB_T = cRsList.getString("ITEM_GB");
			String ITEM_HE_T = cRsList.getString("ITEM_HE");
			String ROWID_T = cRsList.getString("ROWID");
			String c17_T = cRsList.getString("c17");
			String c18_T = cRsList.getString("c18");
%>
			<z:row
<%
			if(! ECI_COMP_CD_T.equals("")) {
%>
		 		ECI_COMP_CD='<%= ECI_COMP_CD_T%>'
<%
			}

			if(! ECI_MNGT_YR_T.equals("")) {
%>
		 		ECI_MNGT_YR='<%= ECI_MNGT_YR_T%>'
<%
			}

			if(! ECI_CNRT_SQ_T.equals("")) {
%>
		 		ECI_CNRT_SQ='<%= ECI_CNRT_SQ_T%>'
<%
			}

			if(! ECI_PROF_SQ_T.equals("")) {
%>
		 		ECI_PROF_SQ='<%= ECI_PROF_SQ_T%>'
<%
			}

			if(! ECI_ITEM_CD_T.equals("")) {
%>
		 		ECI_ITEM_CD='<%= ECI_ITEM_CD_T%>'
<%
			}

			if(! ECI_SORT_SQ_T.equals("")) {
%>
		 		ECI_SORT_SQ='<%= ECI_SORT_SQ_T%>'
<%
			}

			if(! ECI_ITEM_PR_T.equals("")) {
%>
		 		ECI_ITEM_PR='<%= ECI_ITEM_PR_T%>'
<%
			}

			if(! ECI_CNRT_PR_T.equals("")) {
%>
		 		ECI_CNRT_PR='<%= ECI_CNRT_PR_T%>'
<%
			}

			if(! ECI_INPT_ID_T.equals("")) {
%>
		 		ECI_INPT_ID='<%= ECI_INPT_ID_T%>'
<%
			}

			if(! ECI_INPT_DTT_T.equals("")) {
%>
		 		ECI_INPT_DTT='<%= ECI_INPT_DTT_T%>'
<%
			}

			if(! ITEM_CD_T.equals("")) {
%>
		 		ITEM_CD='<%= ITEM_CD_T%>'
<%
			}

			if(! ITEM_NM_T.equals("")) {
%>
		 		ITEM_NM='<%= ITEM_NM_T%>'
<%
			}

			if(! OSCD_CD_T.equals("")) {
%>
		 		OSCD_CD='<%= OSCD_CD_T%>'
<%
			}

			if(! ITEM_JC_T.equals("")) {
%>
		 		ITEM_JC='<%= ITEM_JC_T%>'
<%
			}

			if(! ITEM_GB_T.equals("")) {
%>
		 		ITEM_GB='<%= ITEM_GB_T%>'
<%
			}

			if(! ITEM_HE_T.equals("")) {
%>
		 		ITEM_HE='<%= ITEM_HE_T%>'
<%
			}
%>
				ROWID='<%= cnt%>'
				c17='<%= cnt%>'
				c18='<%= cnt%>'
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
