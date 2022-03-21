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

		String IIM_ITEM_CD = htMethod.get("IIM_ITEM_CD");
		
		//
		if(IIM_ITEM_CD == null) { IIM_ITEM_CD = ""; }
		
		// DB객체
		stmtList = connect.createStatement();

		/*
		Select B.EPM_MARK_TNM From ET_PACK_MARK_ITEM A                                                   
		Inner Join ET_PACK_MARK B On B.EPM_MARK_CD = A.EMI_MARK_CD                                       
								And B.EPM_MARK_SQ = A.EMi_MARK_SQ                                       
													And B.EPM_MARK_KD = '3'                                               
								And B.EPM_USE_YN = 'Y'                                                
								And B.EPM_MARK_CD = '01'                                              
		Where A.EMI_ITEM_CD = :IIM_ITEM_CD
		And EMI_MARK_KD = '3'                                                                          

		*/
	

		sql = " Select B.EPM_MARK_TNM From ET_PACK_MARK_ITEM A ";
		sql += "Inner Join ET_PACK_MARK B On B.EPM_MARK_CD = A.EMI_MARK_CD  ";
		sql += "						And B.EPM_MARK_SQ = A.EMi_MARK_SQ ";
		sql += " 											And B.EPM_MARK_KD = '3'";
		sql += "						And B.EPM_USE_YN = 'Y' ";
		sql += "						And B.EPM_MARK_CD = '01' ";
		sql += "Where A.EMI_ITEM_CD = '" + IIM_ITEM_CD + "' ";
		sql += "And EMI_MARK_KD = '3' ";

		//
		G_INFO += "<!-- \n";
		G_INFO += "서비스명 : sp_Select_Common_003 \n";
		G_INFO += "설명 : 대표명칭 조회 \n";
		G_INFO += "\n\n";

		G_INFO += "전달인자 : \n";
		G_INFO += " IIM_ITEM_CD : " + IIM_ITEM_CD + " \n";
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
		<s:AttributeType name='EPM_MARK_TNM' rs:number='1' rs:basetable='ET_PACK_MARK_ITEM' rs:basecolumn='EPM_MARK_TNM' rs:keycolumn='true'>
			<s:datatype dt:type='string' dt:maxLength='4000' rs:maybenull='false'/>
		</s:AttributeType>
		
		
		<s:AttributeType name='ROWID' rs:number='2' rs:rowid='true' rs:writeunknown='true' rs:basetable='ET_PACK_MARK_ITEM'
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
			/*
				SELECT A.CSM_LARGE, A.CSM_MATT_CD, A.CSM_MATT_NM, B.CSC_ETC1_NM, B.CSC_ETC1_CD,
			B.CSC_ETC2_NM, B.CSC_ETC2_CD,      
				(SELECT CSC_FULL_NM FROM CT_SP_COMMON WHERE CSC_LARGE = 'HM06B' AND CSC_SMALL = A.CSM_INJA_CD) CSM_INJA_NM                         
		FROM CT_SP_MATTER A 
		INNER JOIN CT_SP_COMMON B ON A.CSM_COMM_CD = B.CSC_SMALL   
		WHERE   B.CSC_LARGE   = 'HM99A'                                              
		AND  ( || :sSQL_ADD || ) 
		*/

			String EPM_MARK_TNM = cRsList.getString("EPM_MARK_TNM");
			
			
%>
			<z:row
<%
			if(! EPM_MARK_TNM.equals("")) {
%>
		 		EPM_MARK_TNM='<%= EPM_MARK_TNM%>'
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
