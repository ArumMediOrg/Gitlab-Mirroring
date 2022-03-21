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

		String EXAM_CD = htMethod.get("EXAM_CD");
		String PACK_SQ = htMethod.get("PACK_SQ");
		String PPACK_DT = htMethod.get("PPACK_DT");

		//
		if(EXAM_CD == null) { EXAM_CD = ""; }
		if(PACK_SQ == null) { PACK_SQ = ""; }
		if(PPACK_DT == null) { PPACK_DT = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

select i.*, ltrim(rtrim(a.iim_item_cd)) item_cd, 
       ltrim(rtrim(a.iim_knme_nm)) item_nm,      ltrim(rtrim(a.iim_oscd_cd)) oscd_cd, 
       nvl(b.iip_jcsg_pr, 0) item_jc, 
       nvl(b.iip_gbsg_pr, 0) item_gb, 
       nvl(b.iip_hesg_pr, 0) item_he 
  from et_pack_item i, it_item a, it_item_price b 
 where i.epi_exam_cd = :exam_cd 
   and i.epi_pack_sq = :pack_sq
   and a.iim_item_cd = i.epi_item_cd 
   and b.iip_aply_dt = GetITEM_PRICE_ApplyDate(a.iim_item_cd, :pPack_Dt, 'ITEM_CD') 
   and b.iip_item_cd = a.iim_item_cd 
   and upper(b.iip_use_yn) = 'Y' 
 order by i.epi_sort_sq 

		*/

		sql = " SELECT I.*, LTRIM(RTRIM(A.IIM_ITEM_CD)) ITEM_CD, LTRIM(RTRIM(A.IIM_KNME_NM)) ITEM_NM, LTRIM(RTRIM(A.IIM_OSCD_CD)) OSCD_CD, NVL(B.IIP_JCSG_PR, 0) ITEM_JC, NVL(B.IIP_GBSG_PR, 0) ITEM_GB, NVL(B.IIP_HESG_PR, 0) ITEM_HE";
		sql += " FROM ET_PACK_ITEM I, IT_ITEM A, IT_ITEM_PRICE B";
		sql += " WHERE I.EPI_EXAM_CD = '" + EXAM_CD + "'";
		sql += " AND I.EPI_PACK_SQ = '" + PACK_SQ + "'";
		sql += " AND A.IIM_ITEM_CD = I.EPI_ITEM_CD";
		sql += " AND B.IIP_APLY_DT = GETITEM_PRICE_APPLYDATE(A.IIM_ITEM_CD, '" + PPACK_DT + "', 'ITEM_CD')";
		sql += " AND B.IIP_ITEM_CD = A.IIM_ITEM_CD";
		sql += " AND UPPER(B.IIP_USE_YN) = 'Y'";
		sql += " ORDER BY I.EPI_SORT_SQ";
			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uPack_Each_Up_ItemDisplay_001 \n";
			G_INFO += "설명 : 묶음에 대한 아이템 정보 로딩 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " EXAM_CD : " + EXAM_CD + " \n";
			G_INFO += " PACK_SQ : " + PACK_SQ + " \n";
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
		<s:AttributeType name='EPI_EXAM_CD' rs:number='1' rs:writeunknown='true' rs:basetable='ET_PACK_ITEM' rs:basecolumn='EPI_EXAM_CD'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EPI_PACK_SQ' rs:number='2' rs:writeunknown='true' rs:basetable='ET_PACK_ITEM' rs:basecolumn='EPI_PACK_SQ'>
			<s:datatype dt:type='string' dt:maxLength='5' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EPI_ITEM_CD' rs:number='3' rs:writeunknown='true' rs:basetable='ET_PACK_ITEM' rs:basecolumn='EPI_ITEM_CD'>
			<s:datatype dt:type='string' dt:maxLength='20' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EPI_SORT_SQ' rs:number='4' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_PACK_ITEM'
			 rs:basecolumn='EPI_SORT_SQ'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EPI_ITEM_PR' rs:number='5' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_PACK_ITEM'
			 rs:basecolumn='EPI_ITEM_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EPI_SALE_PR' rs:number='6' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_PACK_ITEM'
			 rs:basecolumn='EPI_SALE_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EPI_GRUP_PR' rs:number='7' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_PACK_ITEM'
			 rs:basecolumn='EPI_GRUP_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EPI_COUP_PR' rs:number='8' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_PACK_ITEM'
			 rs:basecolumn='EPI_COUP_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EPI_FAMY_PR' rs:number='9' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_PACK_ITEM'
			 rs:basecolumn='EPI_FAMY_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EPI_CUPN_PR' rs:number='10' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_PACK_ITEM'
			 rs:basecolumn='EPI_CUPN_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EPI_MMBR_PR' rs:number='11' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_PACK_ITEM'
			 rs:basecolumn='EPI_MMBR_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EPI_USE_YN' rs:number='12' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_PACK_ITEM'
			 rs:basecolumn='EPI_USE_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EPI_NUSE_ID' rs:number='13' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_PACK_ITEM'
			 rs:basecolumn='EPI_NUSE_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='EPI_NUSE_DTT' rs:number='14' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_PACK_ITEM'
			 rs:basecolumn='EPI_NUSE_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EPI_INPT_ID' rs:number='15' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_PACK_ITEM'
			 rs:basecolumn='EPI_INPT_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='EPI_INPT_DTT' rs:number='16' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_PACK_ITEM'
			 rs:basecolumn='EPI_INPT_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EPI_MODI_ID' rs:number='17' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_PACK_ITEM'
			 rs:basecolumn='EPI_MODI_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='EPI_MODI_DTT' rs:number='18' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_PACK_ITEM'
			 rs:basecolumn='EPI_MODI_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ITEM_CD' rs:number='19' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ITEM_NM' rs:number='20' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='OSCD_CD' rs:number='21' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ITEM_JC' rs:number='22' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='ITEM_GB' rs:number='23' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='ITEM_HE' rs:number='24' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='25' rs:rowid='true' rs:basetable='ET_PACK_ITEM' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c25' rs:name='ROWID' rs:number='26' rs:rowid='true' rs:basetable='IT_ITEM' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c26' rs:name='ROWID' rs:number='27' rs:rowid='true' rs:basetable='IT_ITEM_PRICE' rs:basecolumn='ROWID'
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

			String EPI_EXAM_CD_T = cRsList.getString("EPI_EXAM_CD");
			String EPI_PACK_SQ_T = cRsList.getString("EPI_PACK_SQ");
			String EPI_ITEM_CD_T = cRsList.getString("EPI_ITEM_CD");
			String EPI_SORT_SQ_T = cRsList.getString("EPI_SORT_SQ");
			String EPI_ITEM_PR_T = cRsList.getString("EPI_ITEM_PR");
			String EPI_SALE_PR_T = cRsList.getString("EPI_SALE_PR");
			String EPI_GRUP_PR_T = cRsList.getString("EPI_GRUP_PR");
			String EPI_COUP_PR_T = cRsList.getString("EPI_COUP_PR");
			String EPI_FAMY_PR_T = cRsList.getString("EPI_FAMY_PR");
			String EPI_CUPN_PR_T = cRsList.getString("EPI_CUPN_PR");
			String EPI_MMBR_PR_T = cRsList.getString("EPI_MMBR_PR");
			String EPI_USE_YN_T = cRsList.getString("EPI_USE_YN");
			String EPI_NUSE_ID_T = cRsList.getString("EPI_NUSE_ID");
			String EPI_NUSE_DTT_T = cRsList.getDate2("EPI_NUSE_DTT");
			String EPI_INPT_ID_T = cRsList.getString("EPI_INPT_ID");
			String EPI_INPT_DTT_T = cRsList.getDate2("EPI_INPT_DTT");
			String EPI_MODI_ID_T = cRsList.getString("EPI_MODI_ID");
			String EPI_MODI_DTT_T = cRsList.getDate2("EPI_MODI_DTT");
			String ITEM_CD_T = cRsList.getString("ITEM_CD");
			String ITEM_NM_T = cRsList.getString("ITEM_NM");
			String OSCD_CD_T = cRsList.getString("OSCD_CD");
			String ITEM_JC_T = cRsList.getString("ITEM_JC");
			String ITEM_GB_T = cRsList.getString("ITEM_GB");
			String ITEM_HE_T = cRsList.getString("ITEM_HE");
			String ROWID_T = cRsList.getString("ROWID");
			String c25_T = cRsList.getString("c25");
			String c26_T = cRsList.getString("c26");
%>
			<z:row
<%
			if(! EPI_EXAM_CD_T.equals("")) {
%>
		 		EPI_EXAM_CD='<%= EPI_EXAM_CD_T%>'
<%
			}

			if(! EPI_PACK_SQ_T.equals("")) {
%>
		 		EPI_PACK_SQ='<%= EPI_PACK_SQ_T%>'
<%
			}

			if(! EPI_ITEM_CD_T.equals("")) {
%>
		 		EPI_ITEM_CD='<%= EPI_ITEM_CD_T%>'
<%
			}

			if(! EPI_SORT_SQ_T.equals("")) {
%>
		 		EPI_SORT_SQ='<%= EPI_SORT_SQ_T%>'
<%
			}

			if(! EPI_ITEM_PR_T.equals("")) {
%>
		 		EPI_ITEM_PR='<%= EPI_ITEM_PR_T%>'
<%
			}

			if(! EPI_SALE_PR_T.equals("")) {
%>
		 		EPI_SALE_PR='<%= EPI_SALE_PR_T%>'
<%
			}

			if(! EPI_GRUP_PR_T.equals("")) {
%>
		 		EPI_GRUP_PR='<%= EPI_GRUP_PR_T%>'
<%
			}

			if(! EPI_COUP_PR_T.equals("")) {
%>
		 		EPI_COUP_PR='<%= EPI_COUP_PR_T%>'
<%
			}

			if(! EPI_FAMY_PR_T.equals("")) {
%>
		 		EPI_FAMY_PR='<%= EPI_FAMY_PR_T%>'
<%
			}

			if(! EPI_CUPN_PR_T.equals("")) {
%>
		 		EPI_CUPN_PR='<%= EPI_CUPN_PR_T%>'
<%
			}

			if(! EPI_MMBR_PR_T.equals("")) {
%>
		 		EPI_MMBR_PR='<%= EPI_MMBR_PR_T%>'
<%
			}

			if(! EPI_USE_YN_T.equals("")) {
%>
		 		EPI_USE_YN='<%= EPI_USE_YN_T%>'
<%
			}

			if(! EPI_NUSE_ID_T.equals("")) {
%>
		 		EPI_NUSE_ID='<%= EPI_NUSE_ID_T%>'
<%
			}

			if(! EPI_NUSE_DTT_T.equals("")) {
%>
		 		EPI_NUSE_DTT='<%= EPI_NUSE_DTT_T%>'
<%
			}

			if(! EPI_INPT_ID_T.equals("")) {
%>
		 		EPI_INPT_ID='<%= EPI_INPT_ID_T%>'
<%
			}

			if(! EPI_INPT_DTT_T.equals("")) {
%>
		 		EPI_INPT_DTT='<%= EPI_INPT_DTT_T%>'
<%
			}

			if(! EPI_MODI_ID_T.equals("")) {
%>
		 		EPI_MODI_ID='<%= EPI_MODI_ID_T%>'
<%
			}

			if(! EPI_MODI_DTT_T.equals("")) {
%>
		 		EPI_MODI_DTT='<%= EPI_MODI_DTT_T%>'
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
<%
			if(! c25_T.equals("")) {
%>
		 		c25='<%= c25_T%>'
<%
			}

			if(! c26_T.equals("")) {
%>
		 		c26='<%= c26_T%>'
<%
			}
%>
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
