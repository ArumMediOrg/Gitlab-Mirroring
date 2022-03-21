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


		//

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT * FROM ET_PACK_MARK 
 WHERE EPM_MARK_KD = '3'
   AND EPM_MARK_CD = '01'
   AND EPM_USE_YN  = ''Y'

		*/

		sql = " SELECT *";
		sql += " FROM ET_PACK_MARK";
		sql += " WHERE EPM_MARK_KD = '3'";
		sql += " AND EPM_MARK_CD = '01'";
		sql += " AND EPM_USE_YN = 'Y'";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uExam_Cnt_UP_GirdSet_001 \n";
			G_INFO += "설명 : 검사항목 표기 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
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
		<s:AttributeType name='EPM_MARK_KD' rs:number='1' rs:writeunknown='true' rs:basetable='ET_PACK_MARK' rs:basecolumn='EPM_MARK_KD'>
			<s:datatype dt:type='string' dt:maxLength='1' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EPM_MARK_CD' rs:number='2' rs:writeunknown='true' rs:basetable='ET_PACK_MARK' rs:basecolumn='EPM_MARK_CD'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EPM_MARK_SQ' rs:number='3' rs:writeunknown='true' rs:basetable='ET_PACK_MARK' rs:basecolumn='EPM_MARK_SQ'>
			<s:datatype dt:type='string' dt:maxLength='3' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EPM_MARK_TNM' rs:number='4' rs:writeunknown='true' rs:basetable='ET_PACK_MARK' rs:basecolumn='EPM_MARK_TNM'>
			<s:datatype dt:type='string' dt:maxLength='200' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EPM_MARK_HNM' rs:number='5' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_PACK_MARK'
			 rs:basecolumn='EPM_MARK_HNM'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='EPM_MARK_SNM' rs:number='6' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_PACK_MARK'
			 rs:basecolumn='EPM_MARK_SNM'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='EPM_MARK_ENM' rs:number='7' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_PACK_MARK'
			 rs:basecolumn='EPM_MARK_ENM'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='EPM_MARK_CNM' rs:number='8' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_PACK_MARK'
			 rs:basecolumn='EPM_MARK_CNM'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='EPM_MARK_JNM' rs:number='9' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_PACK_MARK'
			 rs:basecolumn='EPM_MARK_JNM'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='EPM_MARK_RNM' rs:number='10' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_PACK_MARK'
			 rs:basecolumn='EPM_MARK_RNM'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='EPM_BODY_CD' rs:number='11' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_PACK_MARK'
			 rs:basecolumn='EPM_BODY_CD'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='EPM_HLTH_YN' rs:number='12' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_PACK_MARK'
			 rs:basecolumn='EPM_HLTH_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EPM_SPCL_YN' rs:number='13' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_PACK_MARK'
			 rs:basecolumn='EPM_SPCL_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EPM_PRNT_PG' rs:number='14' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_PACK_MARK'
			 rs:basecolumn='EPM_PRNT_PG'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EPM_PRNT_SQ' rs:number='15' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_PACK_MARK'
			 rs:basecolumn='EPM_PRNT_SQ'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EPM_PRNT_FST' rs:number='16' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_PACK_MARK'
			 rs:basecolumn='EPM_PRNT_FST'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EPM_USE_YN' rs:number='17' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_PACK_MARK'
			 rs:basecolumn='EPM_USE_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EPM_NUSE_ID' rs:number='18' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_PACK_MARK'
			 rs:basecolumn='EPM_NUSE_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='EPM_NUSE_DTT' rs:number='19' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_PACK_MARK'
			 rs:basecolumn='EPM_NUSE_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EPM_INPT_ID' rs:number='20' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_PACK_MARK'
			 rs:basecolumn='EPM_INPT_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='EPM_INPT_DTT' rs:number='21' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_PACK_MARK'
			 rs:basecolumn='EPM_INPT_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EPM_MODI_ID' rs:number='22' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_PACK_MARK'
			 rs:basecolumn='EPM_MODI_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='EPM_MODI_DTT' rs:number='23' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_PACK_MARK'
			 rs:basecolumn='EPM_MODI_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='24' rs:rowid='true' rs:writeunknown='true' rs:basetable='ET_PACK_MARK'
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

			String EPM_MARK_KD_T = cRsList.getString("EPM_MARK_KD");
			String EPM_MARK_CD_T = cRsList.getString("EPM_MARK_CD");
			String EPM_MARK_SQ_T = cRsList.getString("EPM_MARK_SQ");
			String EPM_MARK_TNM_T = cRsList.getString("EPM_MARK_TNM");
			String EPM_MARK_HNM_T = cRsList.getString("EPM_MARK_HNM");
			String EPM_MARK_SNM_T = cRsList.getString("EPM_MARK_SNM");
			String EPM_MARK_ENM_T = cRsList.getString("EPM_MARK_ENM");
			String EPM_MARK_CNM_T = cRsList.getString("EPM_MARK_CNM");
			String EPM_MARK_JNM_T = cRsList.getString("EPM_MARK_JNM");
			String EPM_MARK_RNM_T = cRsList.getString("EPM_MARK_RNM");
			String EPM_BODY_CD_T = cRsList.getString("EPM_BODY_CD");
			String EPM_HLTH_YN_T = cRsList.getString("EPM_HLTH_YN");
			String EPM_SPCL_YN_T = cRsList.getString("EPM_SPCL_YN");
			String EPM_PRNT_PG_T = cRsList.getString("EPM_PRNT_PG");
			String EPM_PRNT_SQ_T = cRsList.getString("EPM_PRNT_SQ");
			String EPM_PRNT_FST_T = cRsList.getString("EPM_PRNT_FST");
			String EPM_USE_YN_T = cRsList.getString("EPM_USE_YN");
			String EPM_NUSE_ID_T = cRsList.getString("EPM_NUSE_ID");
			String EPM_NUSE_DTT_T = cRsList.getDate2("EPM_NUSE_DTT");
			String EPM_INPT_ID_T = cRsList.getString("EPM_INPT_ID");
			String EPM_INPT_DTT_T = cRsList.getDate2("EPM_INPT_DTT");
			String EPM_MODI_ID_T = cRsList.getString("EPM_MODI_ID");
			String EPM_MODI_DTT_T = cRsList.getDate2("EPM_MODI_DTT");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! EPM_MARK_KD_T.equals("")) {
%>
		 		EPM_MARK_KD='<%= EPM_MARK_KD_T%>'
<%
			}

			if(! EPM_MARK_CD_T.equals("")) {
%>
		 		EPM_MARK_CD='<%= EPM_MARK_CD_T%>'
<%
			}

			if(! EPM_MARK_SQ_T.equals("")) {
%>
		 		EPM_MARK_SQ='<%= EPM_MARK_SQ_T%>'
<%
			}

			if(! EPM_MARK_TNM_T.equals("")) {
%>
		 		EPM_MARK_TNM='<%= EPM_MARK_TNM_T%>'
<%
			}

			if(! EPM_MARK_HNM_T.equals("")) {
%>
		 		EPM_MARK_HNM='<%= EPM_MARK_HNM_T%>'
<%
			}

			if(! EPM_MARK_SNM_T.equals("")) {
%>
		 		EPM_MARK_SNM='<%= EPM_MARK_SNM_T%>'
<%
			}

			if(! EPM_MARK_ENM_T.equals("")) {
%>
		 		EPM_MARK_ENM='<%= EPM_MARK_ENM_T%>'
<%
			}

			if(! EPM_MARK_CNM_T.equals("")) {
%>
		 		EPM_MARK_CNM='<%= EPM_MARK_CNM_T%>'
<%
			}

			if(! EPM_MARK_JNM_T.equals("")) {
%>
		 		EPM_MARK_JNM='<%= EPM_MARK_JNM_T%>'
<%
			}

			if(! EPM_MARK_RNM_T.equals("")) {
%>
		 		EPM_MARK_RNM='<%= EPM_MARK_RNM_T%>'
<%
			}

			if(! EPM_BODY_CD_T.equals("")) {
%>
		 		EPM_BODY_CD='<%= EPM_BODY_CD_T%>'
<%
			}

			if(! EPM_HLTH_YN_T.equals("")) {
%>
		 		EPM_HLTH_YN='<%= EPM_HLTH_YN_T%>'
<%
			}

			if(! EPM_SPCL_YN_T.equals("")) {
%>
		 		EPM_SPCL_YN='<%= EPM_SPCL_YN_T%>'
<%
			}

			if(! EPM_PRNT_PG_T.equals("")) {
%>
		 		EPM_PRNT_PG='<%= EPM_PRNT_PG_T%>'
<%
			}

			if(! EPM_PRNT_SQ_T.equals("")) {
%>
		 		EPM_PRNT_SQ='<%= EPM_PRNT_SQ_T%>'
<%
			}

			if(! EPM_PRNT_FST_T.equals("")) {
%>
		 		EPM_PRNT_FST='<%= EPM_PRNT_FST_T%>'
<%
			}

			if(! EPM_USE_YN_T.equals("")) {
%>
		 		EPM_USE_YN='<%= EPM_USE_YN_T%>'
<%
			}

			if(! EPM_NUSE_ID_T.equals("")) {
%>
		 		EPM_NUSE_ID='<%= EPM_NUSE_ID_T%>'
<%
			}

			if(! EPM_NUSE_DTT_T.equals("")) {
%>
		 		EPM_NUSE_DTT='<%= EPM_NUSE_DTT_T%>'
<%
			}

			if(! EPM_INPT_ID_T.equals("")) {
%>
		 		EPM_INPT_ID='<%= EPM_INPT_ID_T%>'
<%
			}

			if(! EPM_INPT_DTT_T.equals("")) {
%>
		 		EPM_INPT_DTT='<%= EPM_INPT_DTT_T%>'
<%
			}

			if(! EPM_MODI_ID_T.equals("")) {
%>
		 		EPM_MODI_ID='<%= EPM_MODI_ID_T%>'
<%
			}

			if(! EPM_MODI_DTT_T.equals("")) {
%>
		 		EPM_MODI_DTT='<%= EPM_MODI_DTT_T%>'
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
