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

		//
		if(EXAM_CD == null) { EXAM_CD = ""; }
		if(PACK_SQ == null) { PACK_SQ = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

select i.epi_sort_sq, i.epi_item_cd, F_ITEM_FIND('', i.epi_item_cd, 'K') epi_item_nm, ltrim(rtrim(a.iim_oscd_cd)) epi_ocs_cd,
       i.epi_item_pr, i.epi_sale_pr, i.epi_grup_pr, i.epi_coup_pr, i.epi_famy_pr, i.epi_mmbr_pr                                      
  from et_pack_item i, it_item a                                                                                                     
 where i.epi_exam_cd = :exam_cd 
   and i.epi_pack_sq = :pack_sq
   and a.iim_item_cd = i.epi_item_cd                                                                                                 
 order by i.epi_sort_sq                                                                                                              

		*/

		sql = " SELECT I.EPI_SORT_SQ, I.EPI_ITEM_CD, F_ITEM_FIND('', I.EPI_ITEM_CD, 'K') EPI_ITEM_NM, LTRIM(RTRIM(A.IIM_OSCD_CD)) EPI_OCS_CD, I.EPI_ITEM_PR, I.EPI_SALE_PR, I.EPI_GRUP_PR, I.EPI_COUP_PR, I.EPI_FAMY_PR, I.EPI_MMBR_PR";
		sql += " FROM ET_PACK_ITEM I, IT_ITEM A";
		sql += " WHERE I.EPI_EXAM_CD = '" + EXAM_CD + "'";
		sql += " AND I.EPI_PACK_SQ = '" + PACK_SQ + "'";
		sql += " AND A.IIM_ITEM_CD = I.EPI_ITEM_CD";
		sql += " ORDER BY I.EPI_SORT_SQ";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uPack_Prnt_QRSubDetail1BeforePrint_001 \n";
			G_INFO += "설명 : 묶음코드 로딩 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " EXAM_CD : " + EXAM_CD + " \n";
			G_INFO += " PACK_SQ : " + PACK_SQ + " \n";
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
		<s:AttributeType name='EPI_SORT_SQ' rs:number='1' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_PACK_ITEM'
			 rs:basecolumn='EPI_SORT_SQ'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EPI_ITEM_CD' rs:number='2' rs:writeunknown='true' rs:basetable='ET_PACK_ITEM' rs:basecolumn='EPI_ITEM_CD'>
			<s:datatype dt:type='string' dt:maxLength='20' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EPI_ITEM_NM' rs:number='3' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='EPI_OCS_CD' rs:number='4' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
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
		<s:AttributeType name='EPI_MMBR_PR' rs:number='10' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_PACK_ITEM'
			 rs:basecolumn='EPI_MMBR_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='11' rs:rowid='true' rs:basetable='ET_PACK_ITEM' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c11' rs:name='ROWID' rs:number='12' rs:rowid='true' rs:basetable='IT_ITEM' rs:basecolumn='ROWID'
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

			String EPI_SORT_SQ_T = cRsList.getString("EPI_SORT_SQ");
			String EPI_ITEM_CD_T = cRsList.getString("EPI_ITEM_CD");
			String EPI_ITEM_NM_T = cRsList.getString("EPI_ITEM_NM");
			String EPI_OCS_CD_T = cRsList.getString("EPI_OCS_CD");
			String EPI_ITEM_PR_T = cRsList.getString("EPI_ITEM_PR");
			String EPI_SALE_PR_T = cRsList.getString("EPI_SALE_PR");
			String EPI_GRUP_PR_T = cRsList.getString("EPI_GRUP_PR");
			String EPI_COUP_PR_T = cRsList.getString("EPI_COUP_PR");
			String EPI_FAMY_PR_T = cRsList.getString("EPI_FAMY_PR");
			String EPI_MMBR_PR_T = cRsList.getString("EPI_MMBR_PR");
			String ROWID_T = cRsList.getString("ROWID");
			String c11_T = cRsList.getString("c11");
%>
			<z:row
<%
			if(! EPI_SORT_SQ_T.equals("")) {
%>
		 		EPI_SORT_SQ='<%= EPI_SORT_SQ_T%>'
<%
			}

			if(! EPI_ITEM_CD_T.equals("")) {
%>
		 		EPI_ITEM_CD='<%= EPI_ITEM_CD_T%>'
<%
			}

			if(! EPI_ITEM_NM_T.equals("")) {
%>
		 		EPI_ITEM_NM='<%= EPI_ITEM_NM_T%>'
<%
			}

			if(! EPI_OCS_CD_T.equals("")) {
%>
		 		EPI_OCS_CD='<%= EPI_OCS_CD_T%>'
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

			if(! EPI_MMBR_PR_T.equals("")) {
%>
		 		EPI_MMBR_PR='<%= EPI_MMBR_PR_T%>'
<%
			}
%>
				ROWID='<%= cnt%>'
				c11='<%= cnt%>'
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
