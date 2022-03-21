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

SELECT A.EEI_ORDER_CD, A.EEI_ITEM_CD, A.EEI_LINK_NO, A.EEI_FST_KD, A.EEI_HTSB_KD, A.EEI_CAN_KD,
       A.EEI_FST_KD||A.EEI_OPTN_KD||A.EEI_ADD_KD ||A.EEI_PRGS_KD||A.EEI_HTSB_KD||
A.EEI_CAN_KD||
       A.EEI_SPSB_KD||A.EEI_CVSB_KD||A.EEI_EMSB_KD||A.EEI_ETSB_KD||A.EEI_ORDER_CD EEI_EXAM_KD,
       A.EEI_ORG_PR,   A.EEI_FST_PR,  A.EEI_ADD_PR,  A.EEI_PRGS_PR, A.EEI_HTSB_PR,
       A.EEI_CAN_PR,   A.EEI_SPSB_PR, A.EEI_SPHT_PR, A.EEI_SPFS_PR, A.EEI_CVSB_PR,
       A.EEI_CVFS_PR,  A.EEI_EMSB_PR, A.EEI_EMFS_PR, A.EEI_ETSB_PR, A.EEI_ETFS_PR,
       B.IIM_KNME_NM     EEI_ITEM_NM, '' EEI_ORDER_NM
  FROM ET_EXAM_ITEM A, IT_ITEM B, ET_RSLT_ITEM C
 WHERE A.EEI_EXAM_DT = :EXAM_DT
   AND A.EEI_EXAM_SQ = :EXAM_SQ
   AND B.IIM_ITEM_CD = A.EEI_ITEM_CD
   AND C.ERI_EXAM_DT = A.EEI_EXAM_DT
   AND C.ERI_EXAM_SQ = A.EEI_EXAM_SQ
   AND C.ERI_ITEM_CD = A.EEI_ITEM_CD
 ORDER BY C.ERI_SORT_SQ, A.EEI_ITEM_CD, A.EEI_ORDER_DTT, A.EEI_ORDER_CD, A.EEI_LINK_NO

		*/

		sql = " SELECT A.EEI_ORDER_CD, A.EEI_ITEM_CD, A.EEI_LINK_NO, A.EEI_FST_KD, A.EEI_HTSB_KD, A.EEI_CAN_KD, A.EEI_FST_KD||A.EEI_OPTN_KD||A.EEI_ADD_KD ||A.EEI_PRGS_KD||A.EEI_HTSB_KD|| A.EEI_CAN_KD|| A.EEI_SPSB_KD||A.EEI_CVSB_KD||A.EEI_EMSB_KD||A.EEI_ETSB_KD||A.EEI_ORDER_CD EEI_EXAM_KD, A.EEI_ORG_PR, A.EEI_FST_PR, A.EEI_ADD_PR, A.EEI_PRGS_PR, A.EEI_HTSB_PR, A.EEI_CAN_PR, A.EEI_SPSB_PR, A.EEI_SPHT_PR, A.EEI_SPFS_PR, A.EEI_CVSB_PR, A.EEI_CVFS_PR, A.EEI_EMSB_PR, A.EEI_EMFS_PR, A.EEI_ETSB_PR, A.EEI_ETFS_PR, B.IIM_KNME_NM EEI_ITEM_NM, '' EEI_ORDER_NM";
		sql += " FROM ET_EXAM_ITEM A, IT_ITEM B, ET_RSLT_ITEM C";
		sql += " WHERE A.EEI_EXAM_DT = '" + EXAM_DT + "'";
		sql += " AND A.EEI_EXAM_SQ = '" + EXAM_SQ + "'";
		sql += " AND B.IIM_ITEM_CD = A.EEI_ITEM_CD";
		sql += " AND C.ERI_EXAM_DT = A.EEI_EXAM_DT";
		sql += " AND C.ERI_EXAM_SQ = A.EEI_EXAM_SQ";
		sql += " AND C.ERI_ITEM_CD = A.EEI_ITEM_CD";
		sql += " ORDER BY C.ERI_SORT_SQ, A.EEI_ITEM_CD, A.EEI_ORDER_DTT, A.EEI_ORDER_CD, A.EEI_LINK_NO";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uExam_Acpt_AlvAcptDblClick_003 \n";
			G_INFO += "설명 : 접수 검사항목수가 내역 조회 \n";
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
		<s:AttributeType name='EEI_ORDER_CD' rs:number='1' rs:writeunknown='true' rs:basetable='ET_EXAM_ITEM' rs:basecolumn='EEI_ORDER_CD'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEI_ITEM_CD' rs:number='2' rs:writeunknown='true' rs:basetable='ET_EXAM_ITEM' rs:basecolumn='EEI_ITEM_CD'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEI_LINK_NO' rs:number='3' rs:writeunknown='true' rs:basetable='ET_EXAM_ITEM' rs:basecolumn='EEI_LINK_NO'>
			<s:datatype dt:type='string' dt:maxLength='2' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEI_FST_KD' rs:number='4' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ITEM'
			 rs:basecolumn='EEI_FST_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEI_HTSB_KD' rs:number='5' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ITEM'
			 rs:basecolumn='EEI_HTSB_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEI_CAN_KD' rs:number='6' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ITEM'
			 rs:basecolumn='EEI_CAN_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEI_EXAM_KD' rs:number='7' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='EEI_ORG_PR' rs:number='8' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ITEM'
			 rs:basecolumn='EEI_ORG_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='11' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEI_FST_PR' rs:number='9' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ITEM'
			 rs:basecolumn='EEI_FST_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='11' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEI_ADD_PR' rs:number='10' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ITEM'
			 rs:basecolumn='EEI_ADD_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='11' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEI_PRGS_PR' rs:number='11' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ITEM'
			 rs:basecolumn='EEI_PRGS_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='11' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEI_HTSB_PR' rs:number='12' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ITEM'
			 rs:basecolumn='EEI_HTSB_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='11' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEI_CAN_PR' rs:number='13' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ITEM'
			 rs:basecolumn='EEI_CAN_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='11' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEI_SPSB_PR' rs:number='14' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ITEM'
			 rs:basecolumn='EEI_SPSB_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='11' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEI_SPHT_PR' rs:number='15' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ITEM'
			 rs:basecolumn='EEI_SPHT_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='11' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEI_SPFS_PR' rs:number='16' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ITEM'
			 rs:basecolumn='EEI_SPFS_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='11' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEI_CVSB_PR' rs:number='17' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ITEM'
			 rs:basecolumn='EEI_CVSB_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='11' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEI_CVFS_PR' rs:number='18' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ITEM'
			 rs:basecolumn='EEI_CVFS_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='11' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEI_EMSB_PR' rs:number='19' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ITEM'
			 rs:basecolumn='EEI_EMSB_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='11' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEI_EMFS_PR' rs:number='20' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ITEM'
			 rs:basecolumn='EEI_EMFS_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='11' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEI_ETSB_PR' rs:number='21' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ITEM'
			 rs:basecolumn='EEI_ETSB_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='11' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEI_ETFS_PR' rs:number='22' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ITEM'
			 rs:basecolumn='EEI_ETFS_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='11' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEI_ITEM_NM' rs:number='23' rs:writeunknown='true' rs:basetable='IT_ITEM' rs:basecolumn='IIM_KNME_NM'>
			<s:datatype dt:type='string' dt:maxLength='200' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEI_ORDER_NM' rs:number='24' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='2' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='25' rs:rowid='true' rs:basetable='ET_EXAM_ITEM' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c25' rs:name='ROWID' rs:number='26' rs:rowid='true' rs:basetable='IT_ITEM' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c26' rs:name='ROWID' rs:number='27' rs:rowid='true' rs:basetable='ET_RSLT_ITEM' rs:basecolumn='ROWID'
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

			String EEI_ORDER_CD_T = cRsList.getString("EEI_ORDER_CD");
			String EEI_ITEM_CD_T = cRsList.getString("EEI_ITEM_CD");
			String EEI_LINK_NO_T = cRsList.getString("EEI_LINK_NO");
			String EEI_FST_KD_T = cRsList.getString("EEI_FST_KD");
			String EEI_HTSB_KD_T = cRsList.getString("EEI_HTSB_KD");
			String EEI_CAN_KD_T = cRsList.getString("EEI_CAN_KD");
			String EEI_EXAM_KD_T = cRsList.getString("EEI_EXAM_KD");
			String EEI_ORG_PR_T = cRsList.getString("EEI_ORG_PR");
			String EEI_FST_PR_T = cRsList.getString("EEI_FST_PR");
			String EEI_ADD_PR_T = cRsList.getString("EEI_ADD_PR");
			String EEI_PRGS_PR_T = cRsList.getString("EEI_PRGS_PR");
			String EEI_HTSB_PR_T = cRsList.getString("EEI_HTSB_PR");
			String EEI_CAN_PR_T = cRsList.getString("EEI_CAN_PR");
			String EEI_SPSB_PR_T = cRsList.getString("EEI_SPSB_PR");
			String EEI_SPHT_PR_T = cRsList.getString("EEI_SPHT_PR");
			String EEI_SPFS_PR_T = cRsList.getString("EEI_SPFS_PR");
			String EEI_CVSB_PR_T = cRsList.getString("EEI_CVSB_PR");
			String EEI_CVFS_PR_T = cRsList.getString("EEI_CVFS_PR");
			String EEI_EMSB_PR_T = cRsList.getString("EEI_EMSB_PR");
			String EEI_EMFS_PR_T = cRsList.getString("EEI_EMFS_PR");
			String EEI_ETSB_PR_T = cRsList.getString("EEI_ETSB_PR");
			String EEI_ETFS_PR_T = cRsList.getString("EEI_ETFS_PR");
			String EEI_ITEM_NM_T = cRsList.getString("EEI_ITEM_NM");
			String EEI_ORDER_NM_T = cRsList.getString("EEI_ORDER_NM");
			String ROWID_T = cRsList.getString("ROWID");
			String c25_T = cRsList.getString("c25");
			String c26_T = cRsList.getString("c26");
%>
			<z:row
<%
			if(! EEI_ORDER_CD_T.equals("")) {
%>
		 		EEI_ORDER_CD='<%= EEI_ORDER_CD_T%>'
<%
			}

			if(! EEI_ITEM_CD_T.equals("")) {
%>
		 		EEI_ITEM_CD='<%= EEI_ITEM_CD_T%>'
<%
			}

			if(! EEI_LINK_NO_T.equals("")) {
%>
		 		EEI_LINK_NO='<%= EEI_LINK_NO_T%>'
<%
			}

			if(! EEI_FST_KD_T.equals("")) {
%>
		 		EEI_FST_KD='<%= EEI_FST_KD_T%>'
<%
			}

			if(! EEI_HTSB_KD_T.equals("")) {
%>
		 		EEI_HTSB_KD='<%= EEI_HTSB_KD_T%>'
<%
			}

			if(! EEI_CAN_KD_T.equals("")) {
%>
		 		EEI_CAN_KD='<%= EEI_CAN_KD_T%>'
<%
			}

			if(! EEI_EXAM_KD_T.equals("")) {
%>
		 		EEI_EXAM_KD='<%= EEI_EXAM_KD_T%>'
<%
			}

			if(! EEI_ORG_PR_T.equals("")) {
%>
		 		EEI_ORG_PR='<%= EEI_ORG_PR_T%>'
<%
			}

			if(! EEI_FST_PR_T.equals("")) {
%>
		 		EEI_FST_PR='<%= EEI_FST_PR_T%>'
<%
			}

			if(! EEI_ADD_PR_T.equals("")) {
%>
		 		EEI_ADD_PR='<%= EEI_ADD_PR_T%>'
<%
			}

			if(! EEI_PRGS_PR_T.equals("")) {
%>
		 		EEI_PRGS_PR='<%= EEI_PRGS_PR_T%>'
<%
			}

			if(! EEI_HTSB_PR_T.equals("")) {
%>
		 		EEI_HTSB_PR='<%= EEI_HTSB_PR_T%>'
<%
			}

			if(! EEI_CAN_PR_T.equals("")) {
%>
		 		EEI_CAN_PR='<%= EEI_CAN_PR_T%>'
<%
			}

			if(! EEI_SPSB_PR_T.equals("")) {
%>
		 		EEI_SPSB_PR='<%= EEI_SPSB_PR_T%>'
<%
			}

			if(! EEI_SPHT_PR_T.equals("")) {
%>
		 		EEI_SPHT_PR='<%= EEI_SPHT_PR_T%>'
<%
			}

			if(! EEI_SPFS_PR_T.equals("")) {
%>
		 		EEI_SPFS_PR='<%= EEI_SPFS_PR_T%>'
<%
			}

			if(! EEI_CVSB_PR_T.equals("")) {
%>
		 		EEI_CVSB_PR='<%= EEI_CVSB_PR_T%>'
<%
			}

			if(! EEI_CVFS_PR_T.equals("")) {
%>
		 		EEI_CVFS_PR='<%= EEI_CVFS_PR_T%>'
<%
			}

			if(! EEI_EMSB_PR_T.equals("")) {
%>
		 		EEI_EMSB_PR='<%= EEI_EMSB_PR_T%>'
<%
			}

			if(! EEI_EMFS_PR_T.equals("")) {
%>
		 		EEI_EMFS_PR='<%= EEI_EMFS_PR_T%>'
<%
			}

			if(! EEI_ETSB_PR_T.equals("")) {
%>
		 		EEI_ETSB_PR='<%= EEI_ETSB_PR_T%>'
<%
			}

			if(! EEI_ETFS_PR_T.equals("")) {
%>
		 		EEI_ETFS_PR='<%= EEI_ETFS_PR_T%>'
<%
			}

			if(! EEI_ITEM_NM_T.equals("")) {
%>
		 		EEI_ITEM_NM='<%= EEI_ITEM_NM_T%>'
<%
			}

			if(! EEI_ORDER_NM_T.equals("")) {
%>
		 		EEI_ORDER_NM='<%= EEI_ORDER_NM_T%>'
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
