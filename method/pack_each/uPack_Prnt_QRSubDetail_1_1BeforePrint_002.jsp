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

select * from et_pack_optn            
 where epo_exam_cd = :exam_cd
   and epo_pack_sq = :pack_sq
 order by epo_optn_sq                 

		*/

		sql = " SELECT *";
		sql += " FROM ET_PACK_OPTN";
		sql += " WHERE EPO_EXAM_CD = '" + EXAM_CD + "'";
		sql += " AND EPO_PACK_SQ = '" + PACK_SQ + "'";
		sql += " ORDER BY EPO_OPTN_SQ";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uPack_Prnt_QRSubDetail_1_1BeforePrint_002 \n";
			G_INFO += "설명 : 묶음옵션 로딩 \n";
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
		<s:AttributeType name='EPO_EXAM_CD' rs:number='1' rs:writeunknown='true' rs:basetable='ET_PACK_OPTN' rs:basecolumn='EPO_EXAM_CD'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EPO_PACK_SQ' rs:number='2' rs:writeunknown='true' rs:basetable='ET_PACK_OPTN' rs:basecolumn='EPO_PACK_SQ'>
			<s:datatype dt:type='string' dt:maxLength='5' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EPO_OPTN_SQ' rs:number='3' rs:writeunknown='true' rs:basetable='ET_PACK_OPTN' rs:basecolumn='EPO_OPTN_SQ'>
			<s:datatype dt:type='string' dt:maxLength='2' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EPO_OPTN_NM' rs:number='4' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_PACK_OPTN'
			 rs:basecolumn='EPO_OPTN_NM'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='EPO_OPTN_PR' rs:number='5' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_PACK_OPTN'
			 rs:basecolumn='EPO_OPTN_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EPO_OPTN_CNT' rs:number='6' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_PACK_OPTN'
			 rs:basecolumn='EPO_OPTN_CNT'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EPO_OPTN_LT' rs:number='7' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_PACK_OPTN'
			 rs:basecolumn='EPO_OPTN_LT'>
			<s:datatype dt:type='string' dt:maxLength='1000'/>
		</s:AttributeType>
		<s:AttributeType name='EPO_CALC_CD' rs:number='8' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_PACK_OPTN'
			 rs:basecolumn='EPO_CALC_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EPO_PACK_DT' rs:number='9' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_PACK_OPTN'
			 rs:basecolumn='EPO_PACK_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EPO_USE_YN' rs:number='10' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_PACK_OPTN'
			 rs:basecolumn='EPO_USE_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EPO_NUSE_ID' rs:number='11' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_PACK_OPTN'
			 rs:basecolumn='EPO_NUSE_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='EPO_NUSE_DTT' rs:number='12' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_PACK_OPTN'
			 rs:basecolumn='EPO_NUSE_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EPO_INPT_ID' rs:number='13' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_PACK_OPTN'
			 rs:basecolumn='EPO_INPT_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='EPO_INPT_DTT' rs:number='14' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_PACK_OPTN'
			 rs:basecolumn='EPO_INPT_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EPO_MODI_ID' rs:number='15' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_PACK_OPTN'
			 rs:basecolumn='EPO_MODI_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='EPO_MODI_DTT' rs:number='16' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_PACK_OPTN'
			 rs:basecolumn='EPO_MODI_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EPO_TRNS_ID' rs:number='17' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_PACK_OPTN'
			 rs:basecolumn='EPO_TRNS_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='EPO_TRNS_DTT' rs:number='18' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_PACK_OPTN'
			 rs:basecolumn='EPO_TRNS_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='19' rs:rowid='true' rs:writeunknown='true' rs:basetable='ET_PACK_OPTN'
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

			String EPO_EXAM_CD_T = cRsList.getString("EPO_EXAM_CD");
			String EPO_PACK_SQ_T = cRsList.getString("EPO_PACK_SQ");
			String EPO_OPTN_SQ_T = cRsList.getString("EPO_OPTN_SQ");
			String EPO_OPTN_NM_T = cRsList.getString("EPO_OPTN_NM");
			String EPO_OPTN_PR_T = cRsList.getString("EPO_OPTN_PR");
			String EPO_OPTN_CNT_T = cRsList.getString("EPO_OPTN_CNT");
			String EPO_OPTN_LT_T = cRsList.getString("EPO_OPTN_LT");
			String EPO_CALC_CD_T = cRsList.getString("EPO_CALC_CD");
			String EPO_PACK_DT_T = cRsList.getString("EPO_PACK_DT");
			String EPO_USE_YN_T = cRsList.getString("EPO_USE_YN");
			String EPO_NUSE_ID_T = cRsList.getString("EPO_NUSE_ID");
			String EPO_NUSE_DTT_T = cRsList.getDate2("EPO_NUSE_DTT");
			String EPO_INPT_ID_T = cRsList.getString("EPO_INPT_ID");
			String EPO_INPT_DTT_T = cRsList.getDate2("EPO_INPT_DTT");
			String EPO_MODI_ID_T = cRsList.getString("EPO_MODI_ID");
			String EPO_MODI_DTT_T = cRsList.getDate2("EPO_MODI_DTT");
			String EPO_TRNS_ID_T = cRsList.getString("EPO_TRNS_ID");
			String EPO_TRNS_DTT_T = cRsList.getDate2("EPO_TRNS_DTT");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! EPO_EXAM_CD_T.equals("")) {
%>
		 		EPO_EXAM_CD='<%= EPO_EXAM_CD_T%>'
<%
			}

			if(! EPO_PACK_SQ_T.equals("")) {
%>
		 		EPO_PACK_SQ='<%= EPO_PACK_SQ_T%>'
<%
			}

			if(! EPO_OPTN_SQ_T.equals("")) {
%>
		 		EPO_OPTN_SQ='<%= EPO_OPTN_SQ_T%>'
<%
			}

			if(! EPO_OPTN_NM_T.equals("")) {
%>
		 		EPO_OPTN_NM='<%= EPO_OPTN_NM_T%>'
<%
			}

			if(! EPO_OPTN_PR_T.equals("")) {
%>
		 		EPO_OPTN_PR='<%= EPO_OPTN_PR_T%>'
<%
			}

			if(! EPO_OPTN_CNT_T.equals("")) {
%>
		 		EPO_OPTN_CNT='<%= EPO_OPTN_CNT_T%>'
<%
			}

			if(! EPO_OPTN_LT_T.equals("")) {
%>
		 		EPO_OPTN_LT='<%= EPO_OPTN_LT_T%>'
<%
			}

			if(! EPO_CALC_CD_T.equals("")) {
%>
		 		EPO_CALC_CD='<%= EPO_CALC_CD_T%>'
<%
			}

			if(! EPO_PACK_DT_T.equals("")) {
%>
		 		EPO_PACK_DT='<%= EPO_PACK_DT_T%>'
<%
			}

			if(! EPO_USE_YN_T.equals("")) {
%>
		 		EPO_USE_YN='<%= EPO_USE_YN_T%>'
<%
			}

			if(! EPO_NUSE_ID_T.equals("")) {
%>
		 		EPO_NUSE_ID='<%= EPO_NUSE_ID_T%>'
<%
			}

			if(! EPO_NUSE_DTT_T.equals("")) {
%>
		 		EPO_NUSE_DTT='<%= EPO_NUSE_DTT_T%>'
<%
			}

			if(! EPO_INPT_ID_T.equals("")) {
%>
		 		EPO_INPT_ID='<%= EPO_INPT_ID_T%>'
<%
			}

			if(! EPO_INPT_DTT_T.equals("")) {
%>
		 		EPO_INPT_DTT='<%= EPO_INPT_DTT_T%>'
<%
			}

			if(! EPO_MODI_ID_T.equals("")) {
%>
		 		EPO_MODI_ID='<%= EPO_MODI_ID_T%>'
<%
			}

			if(! EPO_MODI_DTT_T.equals("")) {
%>
		 		EPO_MODI_DTT='<%= EPO_MODI_DTT_T%>'
<%
			}

			if(! EPO_TRNS_ID_T.equals("")) {
%>
		 		EPO_TRNS_ID='<%= EPO_TRNS_ID_T%>'
<%
			}

			if(! EPO_TRNS_DTT_T.equals("")) {
%>
		 		EPO_TRNS_DTT='<%= EPO_TRNS_DTT_T%>'
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
