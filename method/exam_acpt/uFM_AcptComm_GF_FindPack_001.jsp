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
		String USE_YN = htMethod.get("USE_YN");

		//
		if(EXAM_CD == null) { EXAM_CD = ""; }
		if(PACK_SQ == null) { PACK_SQ = ""; }
		if(USE_YN == null) { USE_YN = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT EPK_EXAM_CD,  EPK_PACK_SQ,  EPK_PACK_NM, EPK_SEX_CD,
          EPK_PACK_SDT, EPK_PACK_EDT, EPK_SALE_PR, EPK_USE_YN
  FROM ET_PACK 
 WHERE 1 = 1

if (:EXAM_CD <> '') then
   AND EPK_EXAM_CD = :EXAM_CD

if (:PACK_SQ <> '') then
   AND EPK_PACK_SQ = :PACK_SQ

if (:USE_YN <> '') then
   AND NVL(EPK_USE_YN, 'Y') = :USE_YN

 ORDER BY EPK_EXAM_CD, EPK_PACK_SQ

		*/

		sql = " SELECT EPK_EXAM_CD, EPK_PACK_SQ, EPK_PACK_NM, EPK_SEX_CD, EPK_PACK_SDT, EPK_PACK_EDT, EPK_SALE_PR, EPK_USE_YN";
		sql += " FROM ET_PACK";
		sql += " WHERE 1 = 1";
		if(! EXAM_CD.equals("")) {
			sql += " AND EPK_EXAM_CD = '" + EXAM_CD + "'";
		}
		if(! PACK_SQ.equals("")) {
			sql += " AND EPK_PACK_SQ = '" + PACK_SQ + "'";
		}
		if(! USE_YN.equals("")) {
			sql += " AND NVL(EPK_USE_YN, 'Y') = '" + USE_YN + "'";
		}
		sql += " ORDER BY EPK_EXAM_CD, EPK_PACK_SQ";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uFM_AcptComm_GF_FindPack_001 \n";
			G_INFO += "설명 : 개별묶음 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " EXAM_CD : " + EXAM_CD + " \n";
			G_INFO += " PACK_SQ : " + PACK_SQ + " \n";
			G_INFO += " USE_YN : " + USE_YN + " \n";
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
		<s:AttributeType name='EPK_EXAM_CD' rs:number='1' rs:writeunknown='true' rs:basetable='ET_PACK' rs:basecolumn='EPK_EXAM_CD'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EPK_PACK_SQ' rs:number='2' rs:writeunknown='true' rs:basetable='ET_PACK' rs:basecolumn='EPK_PACK_SQ'>
			<s:datatype dt:type='string' dt:maxLength='5' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EPK_PACK_NM' rs:number='3' rs:writeunknown='true' rs:basetable='ET_PACK' rs:basecolumn='EPK_PACK_NM'>
			<s:datatype dt:type='string' dt:maxLength='200' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EPK_SEX_CD' rs:number='4' rs:writeunknown='true' rs:basetable='ET_PACK' rs:basecolumn='EPK_SEX_CD'>
			<s:datatype dt:type='string' dt:maxLength='1' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EPK_PACK_SDT' rs:number='5' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_PACK'
			 rs:basecolumn='EPK_PACK_SDT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EPK_PACK_EDT' rs:number='6' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_PACK'
			 rs:basecolumn='EPK_PACK_EDT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EPK_SALE_PR' rs:number='7' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_PACK'
			 rs:basecolumn='EPK_SALE_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EPK_USE_YN' rs:number='8' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_PACK'
			 rs:basecolumn='EPK_USE_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='9' rs:rowid='true' rs:basetable='ET_PACK' rs:basecolumn='ROWID' rs:keycolumn='true'
			 rs:hidden='true' rs:autoincrement='true'>
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

			String EPK_EXAM_CD_T = cRsList.getString("EPK_EXAM_CD");
			String EPK_PACK_SQ_T = cRsList.getString("EPK_PACK_SQ");
			String EPK_PACK_NM_T = cRsList.getString("EPK_PACK_NM");
			String EPK_SEX_CD_T = cRsList.getString("EPK_SEX_CD");
			String EPK_PACK_SDT_T = cRsList.getString("EPK_PACK_SDT");
			String EPK_PACK_EDT_T = cRsList.getString("EPK_PACK_EDT");
			String EPK_SALE_PR_T = cRsList.getString("EPK_SALE_PR");
			String EPK_USE_YN_T = cRsList.getString("EPK_USE_YN");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! EPK_EXAM_CD_T.equals("")) {
%>
		 		EPK_EXAM_CD='<%= EPK_EXAM_CD_T%>'
<%
			}

			if(! EPK_PACK_SQ_T.equals("")) {
%>
		 		EPK_PACK_SQ='<%= EPK_PACK_SQ_T%>'
<%
			}

			if(! EPK_PACK_NM_T.equals("")) {
%>
		 		EPK_PACK_NM='<%= EPK_PACK_NM_T%>'
<%
			}

			if(! EPK_SEX_CD_T.equals("")) {
%>
		 		EPK_SEX_CD='<%= EPK_SEX_CD_T%>'
<%
			}

			if(! EPK_PACK_SDT_T.equals("")) {
%>
		 		EPK_PACK_SDT='<%= EPK_PACK_SDT_T%>'
<%
			}

			if(! EPK_PACK_EDT_T.equals("")) {
%>
		 		EPK_PACK_EDT='<%= EPK_PACK_EDT_T%>'
<%
			}

			if(! EPK_SALE_PR_T.equals("")) {
%>
		 		EPK_SALE_PR='<%= EPK_SALE_PR_T%>'
<%
			}

			if(! EPK_USE_YN_T.equals("")) {
%>
		 		EPK_USE_YN='<%= EPK_USE_YN_T%>'
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
