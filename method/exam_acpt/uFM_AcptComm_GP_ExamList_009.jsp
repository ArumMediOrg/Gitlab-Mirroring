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

		String MNGT_YR = htMethod.get("MNGT_YR");
		String PRCE_DT = htMethod.get("PRCE_DT");
		String PACK_CD = htMethod.get("PACK_CD");

		//
		if(MNGT_YR == null) { MNGT_YR = ""; }
		if(PRCE_DT == null) { PRCE_DT = ""; }
		if(PACK_CD == null) { PACK_CD = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT :MNGT_YR EXAM_YR, EPK_EXAM_CD EXAM_CD, EPK_PACK_SQ EXAM_SQ, 
       EPK_EXAM_CD || EPK_PACK_SQ EXAM_DP, EPK_PACK_NM EXAM_NM, 
       '' GBHC_KD, 
       :PRCE_DT PRCE_DT, '1' CALC_CD, EPK_EXAM_CD || EPK_PACK_SQ ITEM_LT, 
        0 EXAM_PR, 0 JCSG_PR, 0 HESG_PR, 0 GBSG_PR, 0 SBSG_PR, 0 TGSG_PR
    FROM ET_PACK
   WHERE EPK_EXAM_CD || EPK_PACK_SQ = :PACK_CD
		*/

		sql = " SELECT '" + MNGT_YR + "' EXAM_YR, EPK_EXAM_CD EXAM_CD, EPK_PACK_SQ EXAM_SQ, EPK_EXAM_CD || EPK_PACK_SQ EXAM_DP, EPK_PACK_NM EXAM_NM, '' GBHC_KD, '" + PRCE_DT + "' PRCE_DT, '1' CALC_CD, EPK_EXAM_CD || EPK_PACK_SQ ITEM_LT, 0 EXAM_PR, 0 JCSG_PR, 0 HESG_PR, 0 GBSG_PR, 0 SBSG_PR, 0 TGSG_PR";
		sql += " FROM ET_PACK";
		sql += " WHERE EPK_EXAM_CD || EPK_PACK_SQ = '" + PACK_CD + "'";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uFM_AcptComm_GP_ExamList_009 \n";
			G_INFO += "설명 : 검사항목 수가 / 개별묶음 옵션 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " MNGT_YR : " + MNGT_YR + " \n";
			G_INFO += " PRCE_DT : " + PRCE_DT + " \n";
			G_INFO += " PACK_CD : " + PACK_CD + " \n";
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
		<s:AttributeType name='EXAM_YR' rs:number='1' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1004' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EXAM_CD' rs:number='2' rs:writeunknown='true' rs:basetable='ET_PACK' rs:basecolumn='EPK_EXAM_CD'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EXAM_SQ' rs:number='3' rs:writeunknown='true' rs:basetable='ET_PACK' rs:basecolumn='EPK_PACK_SQ'>
			<s:datatype dt:type='string' dt:maxLength='5' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EXAM_DP' rs:number='4' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='15'/>
		</s:AttributeType>
		<s:AttributeType name='EXAM_NM' rs:number='5' rs:writeunknown='true' rs:basetable='ET_PACK' rs:basecolumn='EPK_PACK_NM'>
			<s:datatype dt:type='string' dt:maxLength='200' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='GBHC_KD' rs:number='6' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='2' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='PRCE_DT' rs:number='7' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1004' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='CALC_CD' rs:number='8' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1004' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ITEM_LT' rs:number='9' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='15'/>
		</s:AttributeType>
		<s:AttributeType name='EXAM_PR' rs:number='10' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='JCSG_PR' rs:number='11' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='HESG_PR' rs:number='12' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='GBSG_PR' rs:number='13' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='SBSG_PR' rs:number='14' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='TGSG_PR' rs:number='15' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='16' rs:rowid='true' rs:basetable='ET_PACK' rs:basecolumn='ROWID' rs:keycolumn='true'
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

			String EXAM_YR_T = cRsList.getString("EXAM_YR");
			String EXAM_CD_T = cRsList.getString("EXAM_CD");
			String EXAM_SQ_T = cRsList.getString("EXAM_SQ");
			String EXAM_DP_T = cRsList.getString("EXAM_DP");
			String EXAM_NM_T = cRsList.getString("EXAM_NM");
			String GBHC_KD_T = cRsList.getString("GBHC_KD");
			String PRCE_DT_T = cRsList.getString("PRCE_DT");
			String CALC_CD_T = cRsList.getString("CALC_CD");
			String ITEM_LT_T = cRsList.getString("ITEM_LT");
			String EXAM_PR_T = cRsList.getString("EXAM_PR");
			String JCSG_PR_T = cRsList.getString("JCSG_PR");
			String HESG_PR_T = cRsList.getString("HESG_PR");
			String GBSG_PR_T = cRsList.getString("GBSG_PR");
			String SBSG_PR_T = cRsList.getString("SBSG_PR");
			String TGSG_PR_T = cRsList.getString("TGSG_PR");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! EXAM_YR_T.equals("")) {
%>
		 		EXAM_YR='<%= EXAM_YR_T%>'
<%
			}

			if(! EXAM_CD_T.equals("")) {
%>
		 		EXAM_CD='<%= EXAM_CD_T%>'
<%
			}

			if(! EXAM_SQ_T.equals("")) {
%>
		 		EXAM_SQ='<%= EXAM_SQ_T%>'
<%
			}

			if(! EXAM_DP_T.equals("")) {
%>
		 		EXAM_DP='<%= EXAM_DP_T%>'
<%
			}

			if(! EXAM_NM_T.equals("")) {
%>
		 		EXAM_NM='<%= EXAM_NM_T%>'
<%
			}

			if(! GBHC_KD_T.equals("")) {
%>
		 		GBHC_KD='<%= GBHC_KD_T%>'
<%
			}

			if(! PRCE_DT_T.equals("")) {
%>
		 		PRCE_DT='<%= PRCE_DT_T%>'
<%
			}

			if(! CALC_CD_T.equals("")) {
%>
		 		CALC_CD='<%= CALC_CD_T%>'
<%
			}

			if(! ITEM_LT_T.equals("")) {
%>
		 		ITEM_LT='<%= ITEM_LT_T%>'
<%
			}

			if(! EXAM_PR_T.equals("")) {
%>
		 		EXAM_PR='<%= EXAM_PR_T%>'
<%
			}

			if(! JCSG_PR_T.equals("")) {
%>
		 		JCSG_PR='<%= JCSG_PR_T%>'
<%
			}

			if(! HESG_PR_T.equals("")) {
%>
		 		HESG_PR='<%= HESG_PR_T%>'
<%
			}

			if(! GBSG_PR_T.equals("")) {
%>
		 		GBSG_PR='<%= GBSG_PR_T%>'
<%
			}

			if(! SBSG_PR_T.equals("")) {
%>
		 		SBSG_PR='<%= SBSG_PR_T%>'
<%
			}

			if(! TGSG_PR_T.equals("")) {
%>
		 		TGSG_PR='<%= TGSG_PR_T%>'
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
