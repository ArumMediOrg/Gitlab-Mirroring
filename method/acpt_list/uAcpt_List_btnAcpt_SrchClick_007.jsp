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

		String EXAM_SDT = htMethod.get("EXAM_SDT");
		String EXAM_EDT = htMethod.get("EXAM_EDT");
		String PARAM_TX1 = htMethod.get("PARAM_TX1");
		String PARAM_TX2 = htMethod.get("PARAM_TX2");

		//
		if(EXAM_SDT == null) { EXAM_SDT = ""; }
		if(EXAM_EDT == null) { EXAM_EDT = ""; }
		if(PARAM_TX1 == null) { PARAM_TX1 = ""; }
		if(PARAM_TX2 == null) { PARAM_TX2 = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

Select                                                                             
B.ERI_ITEM_CD, C.IIM_KNME_NM, COUNT(B.ERI_ITEM_CD) AS ITEMCOUNT                    
From ET_EXAM_ACPT A                                                                
Inner Join ET_RSLT_ITEM B On B.ERI_EXAM_DT = A.EEA_EXAM_DT                         
                         And B.ERI_EXAM_SQ = A.EEA_EXAM_SQ                         
                         And B.ERI_CNCL_YN = 'N'                                 
Inner Join IT_ITEM C On C.IIM_ITEM_CD = B.ERI_ITEM_CD                              
                    And C.IIM_RSLT_KD <> '9'                                     
 Where A.EEA_EXAM_DT Between :EXAM_SDT And :EXAM_EDT
  And A.EEA_ORDER_YN <> 'C'                                                      

:PARAM_TX1
:PARAM_TX2

		*/

		sql = " SELECT B.ERI_ITEM_CD, C.IIM_KNME_NM, COUNT(B.ERI_ITEM_CD) AS ITEMCOUNT";
		sql += " FROM ET_EXAM_ACPT A INNER JOIN ET_RSLT_ITEM B";
		sql += " ON B.ERI_EXAM_DT = A.EEA_EXAM_DT";
		sql += " AND B.ERI_EXAM_SQ = A.EEA_EXAM_SQ";
		sql += " AND B.ERI_CNCL_YN = 'N' INNER JOIN IT_ITEM C";
		sql += " ON C.IIM_ITEM_CD = B.ERI_ITEM_CD";
		sql += " AND C.IIM_RSLT_KD <> '9'";
		sql += " WHERE A.EEA_EXAM_DT BETWEEN '" + EXAM_SDT + "'";
		sql += " AND '" + EXAM_EDT + "'";
		sql += " AND A.EEA_ORDER_YN <> 'C'";
		sql += PARAM_TX1;
		sql += PARAM_TX2;

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uAcpt_List_btnAcpt_SrchClick_007 \n";
			G_INFO += "설명 : 검사항목별 건수 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " EXAM_SDT : " + EXAM_SDT + " \n";
			G_INFO += " EXAM_EDT : " + EXAM_EDT + " \n";
			G_INFO += " PARAM_TX1 : " + PARAM_TX1 + " \n";
			G_INFO += " PARAM_TX2 : " + PARAM_TX2 + " \n";
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
		<s:AttributeType name='ERI_ITEM_CD' rs:number='1' rs:writeunknown='true' rs:basetable='ET_RSLT_ITEM' rs:basecolumn='ERI_ITEM_CD'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_KNME_NM' rs:number='2' rs:writeunknown='true' rs:basetable='IT_ITEM' rs:basecolumn='IIM_KNME_NM'>
			<s:datatype dt:type='string' dt:maxLength='200' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ITEMCOUNT' rs:number='3' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:extends type='rs:rowbase'/>
	</s:ElementType>
</s:Schema>
		<rs:data>
<%
		int cnt = 0;
		while(cRsList.next()) {

			cnt++;

			String ERI_ITEM_CD_T = cRsList.getString("ERI_ITEM_CD");
			String IIM_KNME_NM_T = cRsList.getString("IIM_KNME_NM");
			String ITEMCOUNT_T = cRsList.getString("ITEMCOUNT");
%>
			<z:row
<%
			if(! ERI_ITEM_CD_T.equals("")) {
%>
		 		ERI_ITEM_CD='<%= ERI_ITEM_CD_T%>'
<%
			}

			if(! IIM_KNME_NM_T.equals("")) {
%>
		 		IIM_KNME_NM='<%= IIM_KNME_NM_T%>'
<%
			}

			if(! ITEMCOUNT_T.equals("")) {
%>
		 		ITEMCOUNT='<%= ITEMCOUNT_T%>'
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
