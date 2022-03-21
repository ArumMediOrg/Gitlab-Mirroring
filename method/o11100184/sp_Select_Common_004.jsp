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

		String SMATTERCUT = htMethod.get("SMATTERCUT"); 
		
		//
		if(SMATTERCUT == null) { SMATTERCUT = ""; }
		
		// DB객체
		stmtList = connect.createStatement();

		/*
		Select DISTINCT                                                             
		A.CSP_JJ_NM, A.CSP_SBCD_CD, B.IIM_ITEM_CD, A.CSP_JANGGI_CD, D.EPM_MARK_SNM 
		From CT_SP_PROF A                                                           
		Left Outer Join IT_ITEM           B On B.IIM_SBCD_CD = A.CSP_SBCD_CD        
		Left Outer Join ET_PACK_MARK_ITEM C On C.EMI_ITEM_CD = B.IIM_ITEM_CD        
										And C.EMI_MARK_KD = '3'                
																					And C.EMI_USE_YN = 'Y'                 
		Left Outer Join ET_PACK_MARK      D On D.EPM_MARK_KD = C.EMI_MARK_KD        
										And D.EPM_MARK_CD = C.EMI_MARK_CD        
																					And D.EPM_MARK_SQ = C.EMI_MARK_SQ        
		Where A.CSP_CHASU = '1'                                                   
		And A.CSP_USE_YN = 'Y'                                                   
		And ( || :sMatterCut  ||) 

		*/
	

		sql = " Select DISTINCT   ";                                                          
		sql += " A.CSP_JJ_NM, A.CSP_SBCD_CD, B.IIM_ITEM_CD, A.CSP_JANGGI_CD, D.EPM_MARK_SNM ";
		sql += " From CT_SP_PROF A                                                           ";
		sql += " Left Outer Join IT_ITEM           B On B.IIM_SBCD_CD = A.CSP_SBCD_CD        ";
		sql += " Left Outer Join ET_PACK_MARK_ITEM C On C.EMI_ITEM_CD = B.IIM_ITEM_CD        ";
		sql += " 								And C.EMI_MARK_KD = '3'                ";
		sql += " 																			And C.EMI_USE_YN = 'Y'     ";            
		sql += " Left Outer Join ET_PACK_MARK      D On D.EPM_MARK_KD = C.EMI_MARK_KD        ";
		sql += " 								And D.EPM_MARK_CD = C.EMI_MARK_CD        ";
		sql += " 																			And D.EPM_MARK_SQ = C.EMI_MARK_SQ    ";    
		sql += " Where A.CSP_CHASU = '1'                                                   ";
		sql += " And A.CSP_USE_YN = 'Y'                                                   ";
		sql += " And ( " + SMATTERCUT + " ) ";

		//
		G_INFO += "<!-- \n";
		G_INFO += "서비스명 : sp_Select_Common_004 \n";
		G_INFO += "설명 : 표적장기명 조회 \n";
		G_INFO += "\n\n";

		G_INFO += "전달인자 : \n";
		G_INFO += " sMatterCut : " + SMATTERCUT + " \n";
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
		<s:AttributeType name='CSP_JJ_NM' rs:number='1' rs:basetable='CT_SP_PROF' rs:basecolumn='CSP_JJ_NM' rs:keycolumn='true'>
			<s:datatype dt:type='string' dt:maxLength='4000' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='CSP_SBCD_CD' rs:number='2' rs:basetable='CT_SP_PROF' rs:basecolumn='CSP_SBCD_CD' rs:keycolumn='true'>
			<s:datatype dt:type='string' dt:maxLength='4000' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_ITEM_CD' rs:number='3' rs:basetable='IT_ITEM' rs:basecolumn='IIM_ITEM_CD' rs:keycolumn='true'>
			<s:datatype dt:type='string' dt:maxLength='4000' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='CSP_JANGGI_CD' rs:number='4' rs:basetable='CT_SP_PROF' rs:basecolumn='CSP_JANGGI_CD' rs:keycolumn='true'>
			<s:datatype dt:type='string' dt:maxLength='4000' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EPM_MARK_SNM' rs:number='5' rs:basetable='ET_PACK_MARK' rs:basecolumn='EPM_MARK_SNM' rs:keycolumn='true'>
			<s:datatype dt:type='string' dt:maxLength='4000' rs:nullable='true' rs:writeunknown='true'/>
		</s:AttributeType>
		
		<s:AttributeType name='ROWID' rs:number='6' rs:rowid='true' rs:writeunknown='true' rs:basetable='CT_SP_PROF'
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

			String CSP_JJ_NM = cRsList.getString("CSP_JJ_NM");
			String CSP_SBCD_CD = cRsList.getString("CSP_SBCD_CD");
			String IIM_ITEM_CD = cRsList.getString("IIM_ITEM_CD");
			String CSP_JANGGI_CD = cRsList.getString("CSP_JANGGI_CD");
			String EPM_MARK_SNM = cRsList.getString("EPM_MARK_SNM");
			
%>
			<z:row
<%
			if(! CSP_JJ_NM.equals("")) {
%>
		 		CSP_JJ_NM='<%= CSP_JJ_NM%>'
<%
			}

			if(! CSP_SBCD_CD.equals("")) {
%>
				CSP_SBCD_CD='<%= CSP_SBCD_CD%>'
<%
			}

			if(! IIM_ITEM_CD.equals("")) {
%>
				IIM_ITEM_CD='<%= IIM_ITEM_CD%>'
<%
			}

			if(! CSP_JANGGI_CD.equals("")) {
%>
				CSP_JANGGI_CD='<%= CSP_JANGGI_CD%>'
<%
			}

			if(! EPM_MARK_SNM.equals("")) {
%>
				EPM_MARK_SNM='<%= EPM_MARK_SNM%>'
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
