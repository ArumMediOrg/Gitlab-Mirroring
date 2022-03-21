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

		String COMP_CD = htMethod.get("COMP_CD");
		String MNGT_YR = htMethod.get("MNGT_YR");
		String EXAM_CD = htMethod.get("EXAM_CD");
		String EDPACK_NM = htMethod.get("EDPACK_NM");

		//
		if(COMP_CD == null) { COMP_CD = ""; }
		if(MNGT_YR == null) { MNGT_YR = ""; }
		if(EXAM_CD == null) { EXAM_CD = ""; }
		if(EDPACK_NM == null) { EDPACK_NM = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

      select ecp_mngt_yr||'-'||ecp_cnrt_sq||'-'||ecp_prof_sq epk_pack_no, ecp_exam_cd epk_exam_cd, 
                       ecp_prof_nm||'-'||ecp_prof_tl epk_pack_nm, ecp_mngt_yr, ecp_cnrt_sq, ecp_prof_sq 
                  from et_comp_cnrt_prof 
                  where ecp_comp_cd = :comp_cd
                  and ecp_mngt_yr = :mngt_yr
                  and ecp_exam_cd like :exam_cd||'%'
      if :edPack_Nm <> '' then
          and ecp_prof_nm||ecp_prof_tl like '%'||:edPack_Nm||'%'

                  and upper(ecp_use_yn) = 'Y'
                  order by ecp_cnrt_sq, ecp_prof_sq 

		*/

		sql = " SELECT ECP_MNGT_YR||'-'||ECP_CNRT_SQ||'-'||ECP_PROF_SQ EPK_PACK_NO, ECP_EXAM_CD EPK_EXAM_CD, ECP_PROF_NM||'-'||ECP_PROF_TL EPK_PACK_NM, ECP_MNGT_YR, ECP_CNRT_SQ, ECP_PROF_SQ";
		sql += " FROM ET_COMP_CNRT_PROF";
		sql += " WHERE ECP_COMP_CD = '" + COMP_CD + "'";
		sql += " AND ECP_MNGT_YR = '" + MNGT_YR + "'";
		sql += " AND ECP_EXAM_CD LIKE '" + EXAM_CD + "%'";

		if(!EDPACK_NM.equals("")) {
			sql += " AND ECP_PROF_NM||ECP_PROF_TL LIKE '%" + EDPACK_NM + "%'";
		}

		sql += " AND UPPER(ECP_USE_YN) = 'Y'";
		sql += " ORDER BY ECP_CNRT_SQ, ECP_PROF_SQ";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uCopy_Item_UP_ExamSearching_001___1 \n";
			G_INFO += "설명 : 묶음코드 로딩___1 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " COMP_CD : " + COMP_CD + " \n";
			G_INFO += " MNGT_YR : " + MNGT_YR + " \n";
			G_INFO += " EXAM_CD : " + EXAM_CD + " \n";
			G_INFO += " EDPACK_NM : " + EDPACK_NM + " \n";
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
		<s:AttributeType name='EPK_PACK_NO' rs:number='1' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EPK_EXAM_CD' rs:number='2' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_PROF' rs:basecolumn='ECP_EXAM_CD'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EPK_PACK_NM' rs:number='3' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='201'/>
		</s:AttributeType>
		<s:AttributeType name='ECP_MNGT_YR' rs:number='4' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_PROF' rs:basecolumn='ECP_MNGT_YR'>
			<s:datatype dt:type='string' dt:maxLength='4' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ECP_CNRT_SQ' rs:number='5' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_PROF' rs:basecolumn='ECP_CNRT_SQ'>
			<s:datatype dt:type='string' dt:maxLength='2' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ECP_PROF_SQ' rs:number='6' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_PROF' rs:basecolumn='ECP_PROF_SQ'>
			<s:datatype dt:type='string' dt:maxLength='2' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='7' rs:rowid='true' rs:basetable='ET_COMP_CNRT_PROF' rs:basecolumn='ROWID'
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

			String EPK_PACK_NO_T = cRsList.getString("EPK_PACK_NO");
			String EPK_EXAM_CD_T = cRsList.getString("EPK_EXAM_CD");
			String EPK_PACK_NM_T = cRsList.getString("EPK_PACK_NM");
			String ECP_MNGT_YR_T = cRsList.getString("ECP_MNGT_YR");
			String ECP_CNRT_SQ_T = cRsList.getString("ECP_CNRT_SQ");
			String ECP_PROF_SQ_T = cRsList.getString("ECP_PROF_SQ");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! EPK_PACK_NO_T.equals("")) {
%>
		 		EPK_PACK_NO='<%= EPK_PACK_NO_T%>'
<%
			}

			if(! EPK_EXAM_CD_T.equals("")) {
%>
		 		EPK_EXAM_CD='<%= EPK_EXAM_CD_T%>'
<%
			}

			if(! EPK_PACK_NM_T.equals("")) {
%>
		 		EPK_PACK_NM='<%= EPK_PACK_NM_T%>'
<%
			}

			if(! ECP_MNGT_YR_T.equals("")) {
%>
		 		ECP_MNGT_YR='<%= ECP_MNGT_YR_T%>'
<%
			}

			if(! ECP_CNRT_SQ_T.equals("")) {
%>
		 		ECP_CNRT_SQ='<%= ECP_CNRT_SQ_T%>'
<%
			}

			if(! ECP_PROF_SQ_T.equals("")) {
%>
		 		ECP_PROF_SQ='<%= ECP_PROF_SQ_T%>'
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
