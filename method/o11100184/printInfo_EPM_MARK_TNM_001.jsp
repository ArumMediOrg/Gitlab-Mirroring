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
Select distinct B.EPM_MARK_TNM , EMI_MARK_SQ From ET_PACK_MARK_ITEM A                                                   
Inner Join ET_PACK_MARK B On B.EPM_MARK_CD = A.EMI_MARK_CD                                       
                         And B.EPM_MARK_SQ = A.EMi_MARK_SQ                                       
                 And B.EPM_MARK_KD = '3'                                               
                         And B.EPM_USE_YN = 'Y'                                                
                         And B.EPM_MARK_CD = '01'                                              
Inner Join (SELECT ET_RSLT_ITEM.ERI_ITEM_CD
FROM ET_RSLT_ITEM, IT_ITEM, ET_EXAM_ACPT 
WHERE ET_RSLT_ITEM.ERI_ITEM_CD = IT_ITEM.IIM_ITEM_CD 
  AND ET_RSLT_ITEM.ERI_EXAM_DT = ET_EXAM_ACPT.EEA_EXAM_DT
  AND ET_RSLT_ITEM.ERI_EXAM_SQ = ET_EXAM_ACPT.EEA_EXAM_SQ 
  AND ET_RSLT_ITEM.ERI_EXAM_DT = :EXAM_DT
  AND ET_RSLT_ITEM.ERI_EXAM_SQ = :EXAM_SQ
  AND ET_RSLT_ITEM.ERI_CNCL_YN = 'N') C On C.ERI_ITEM_CD = A.EMI_ITEM_CD

Where EMI_MARK_KD = '3'        
order by EMI_MARK_SQ asc
		*/

		sql = " Select distinct B.EPM_MARK_TNM , EMI_MARK_SQ From ET_PACK_MARK_ITEM A  ";                                                  
		sql += " Inner Join ET_PACK_MARK B On B.EPM_MARK_CD = A.EMI_MARK_CD            ";                           
		sql += " 						And B.EPM_MARK_SQ = A.EMi_MARK_SQ              ";                         
		sql += " 				And B.EPM_MARK_KD = '3'                                ";               
		sql += " 						And B.EPM_USE_YN = 'Y'                         ";                       
		sql += " 						And B.EPM_MARK_CD = '01'                       ";                       
		sql += " Inner Join (SELECT ET_RSLT_ITEM.ERI_ITEM_CD               ";
		sql += " FROM ET_RSLT_ITEM, IT_ITEM, ET_EXAM_ACPT ";
		sql += " WHERE ET_RSLT_ITEM.ERI_ITEM_CD = IT_ITEM.IIM_ITEM_CD ";
		sql += " AND ET_RSLT_ITEM.ERI_EXAM_DT = ET_EXAM_ACPT.EEA_EXAM_DT ";
		sql += " AND ET_RSLT_ITEM.ERI_EXAM_SQ = ET_EXAM_ACPT.EEA_EXAM_SQ ";
		sql += " AND ET_RSLT_ITEM.ERI_EXAM_DT = '" + EXAM_DT + "'";
		sql += " AND ET_RSLT_ITEM.ERI_EXAM_SQ = '" + EXAM_SQ + "'";
		sql += " AND ET_RSLT_ITEM.ERI_CNCL_YN = 'N') C On C.ERI_ITEM_CD = A.EMI_ITEM_CD ";

		sql += " Where EMI_MARK_KD = '3'  ";
		sql += " order by EMI_MARK_SQ asc  ";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : printInfo_EPM_MARK_TNM_001 \n";
			G_INFO += "설명 : 순서지 출력항목 조회 \n";
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
		<s:AttributeType name='EPM_MARK_TNM' rs:number='1' rs:basetable='ET_PACK_MARK' rs:basecolumn='EPM_MARK_TNM' rs:keycolumn='true'>
			<s:datatype dt:type='string' dt:maxLength='4000' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EMI_MARK_SQ' rs:number='2' rs:basetable='ET_PACK_MARK_ITEM' rs:basecolumn='EMI_MARK_SQ' rs:keycolumn='true'>
			<s:datatype dt:type='string' dt:maxLength='4000' rs:maybenull='false'/>
		</s:AttributeType>

		<s:AttributeType name='ROWID' rs:number='3' rs:rowid='true' rs:writeunknown='true' rs:basetable='EPM_MARK_TNM'
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

			String EPM_MARK_TNM = cRsList.getString("EPM_MARK_TNM");
			String EMI_MARK_SQ = cRsList.getString("EMI_MARK_SQ");
%>
			<z:row
<%
			if(! EPM_MARK_TNM.equals("")) {
%>
		 		EPM_MARK_TNM='<%= EPM_MARK_TNM%>'
<%
			}

			if(! EMI_MARK_SQ.equals("")) {
%>
				EMI_MARK_SQ='<%= EMI_MARK_SQ%>'
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
