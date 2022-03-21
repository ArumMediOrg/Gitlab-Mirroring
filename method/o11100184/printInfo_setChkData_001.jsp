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

select B.mark_sq from
(select eri_item_CD item_cd from et_rslt_item where eri_exam_dt = :EXAM_DT and eri_exam_sq = :EXAM_SQ) A join   
(
 select a.emi_mark_sq mark_sq, a.emi_item_cd item_cd,                                                                                 
       f_item_find('', a.emi_item_cd, 'K') item_nm,                                                   
       f_item_find('', a.emi_item_cd, 'S') prnt_nm,                                                   
       f_ocs_find(a.emi_item_cd) ocs_cd, a.emi_rslt_up item_up, a.emi_rslt_dn item_dn, a.emi_use_yn use_yn
  from et_pack_mark_item a                                                                                    
 where a.emi_mark_kd = '3' and  
       a.emi_use_yn = 'Y' and
       a.emi_mark_cd = '01'                                                                                                                               
 order by a.emi_sort_sq  
 ) B on A.item_CD = B.item_CD  
 group by B.mark_sq 
		*/

		sql = " SELECT B.MARK_SQ";
		sql += " FROM (SELECT ERI_ITEM_CD ITEM_CD";
		sql += " FROM ET_RSLT_ITEM";
		sql += " WHERE ERI_EXAM_DT = '" + EXAM_DT + "'";
		sql += " AND ERI_EXAM_SQ = '" + EXAM_SQ + "') A JOIN ( SELECT A.EMI_MARK_SQ MARK_SQ, A.EMI_ITEM_CD ITEM_CD, F_ITEM_FIND('', A.EMI_ITEM_CD, 'K') ITEM_NM, F_ITEM_FIND('', A.EMI_ITEM_CD, 'S') PRNT_NM, F_OCS_FIND(A.EMI_ITEM_CD) OCS_CD, A.EMI_RSLT_UP ITEM_UP, A.EMI_RSLT_DN ITEM_DN, A.EMI_USE_YN USE_YN";
		sql += " FROM ET_PACK_MARK_ITEM A";
		sql += " WHERE A.EMI_MARK_KD = '3'";
		sql += " AND A.EMI_USE_YN = 'Y'";
		sql += " AND A.EMI_MARK_CD = '01'";
		sql += " ORDER BY A.EMI_SORT_SQ ) B";
		sql += " ON A.ITEM_CD = B.ITEM_CD";
		sql += " GROUP BY B.MARK_SQ";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : printInfo_setChkData_001 \n";
			G_INFO += "설명 : 인쇄정보 로딩 \n";
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
		<s:AttributeType name='MARK_SQ' rs:number='1'>
			<s:datatype dt:type='string' dt:maxLength='3' rs:maybenull='false'/>
		</s:AttributeType>
		<s:extends type='rs:rowbase'/>
	</s:ElementType>
</s:Schema>
		<rs:data>
<%
		int cnt = 0;
		while(cRsList.next()) {

			cnt++;

			String MARK_SQ_T = cRsList.getString("MARK_SQ");
%>
			<z:row
<%
			if(! MARK_SQ_T.equals("")) {
%>
		 		MARK_SQ='<%= MARK_SQ_T%>'
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
