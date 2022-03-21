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

		String MARK_CLASS = htMethod.get("MARK_CLASS");

		//
		if(MARK_CLASS == null) { MARK_CLASS = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT VVM_MARK_CLASS, VVM_VIEW_SQ                                         
     , VVM_VIEW_CD1, F_ITEM_FIND('', VVM_VIEW_CD1, 'K') AS VVM_VIEW_NM1
     , VVM_VIEW_CD2, F_ITEM_FIND('', VVM_VIEW_CD2, 'K') AS VVM_VIEW_NM2
     , VVM_VIEW_CD3, F_ITEM_FIND('', VVM_VIEW_CD3, 'K') AS VVM_VIEW_NM3
     , VVM_VIEW_CD4, F_ITEM_FIND('', VVM_VIEW_CD4, 'K') AS VVM_VIEW_NM4
     , VVM_VIEW_CD5, F_ITEM_FIND('', VVM_VIEW_CD5, 'K') AS VVM_VIEW_NM5
     , VVM_VIEW_CD6, F_ITEM_FIND('', VVM_VIEW_CD6, 'K') AS VVM_VIEW_NM6
  FROM VT_VIEW_MAGE                                                        
 WHERE VVM_MARK_CLASS = :MARK_CLASS
		*/

		sql = " SELECT VVM_MARK_CLASS, VVM_VIEW_SQ , VVM_VIEW_CD1, F_ITEM_FIND('', VVM_VIEW_CD1, 'K') AS VVM_VIEW_NM1 , VVM_VIEW_CD2, F_ITEM_FIND('', VVM_VIEW_CD2, 'K') AS VVM_VIEW_NM2 , VVM_VIEW_CD3, F_ITEM_FIND('', VVM_VIEW_CD3, 'K') AS VVM_VIEW_NM3 , VVM_VIEW_CD4, F_ITEM_FIND('', VVM_VIEW_CD4, 'K') AS VVM_VIEW_NM4 , VVM_VIEW_CD5, F_ITEM_FIND('', VVM_VIEW_CD5, 'K') AS VVM_VIEW_NM5 , VVM_VIEW_CD6, F_ITEM_FIND('', VVM_VIEW_CD6, 'K') AS VVM_VIEW_NM6";
		sql += " FROM VT_VIEW_MAGE";
		sql += " WHERE VVM_MARK_CLASS = '" + MARK_CLASS + "'";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uVT1000_upSetGridColNm_001 \n";
			G_INFO += "설명 : 임상표적 검사항목 로딩 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " MARK_CLASS : " + MARK_CLASS + " \n";
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
		<s:AttributeType name='VVM_MARK_CLASS' rs:number='1' rs:writeunknown='true' rs:basetable='VT_VIEW_MAGE' rs:basecolumn='VVM_MARK_CLASS'>
			<s:datatype dt:type='string' dt:maxLength='2' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='VVM_VIEW_SQ' rs:number='2' rs:writeunknown='true' rs:basetable='VT_VIEW_MAGE' rs:basecolumn='VVM_VIEW_SQ'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='3' rs:fixedlength='true'
			 rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='VVM_VIEW_CD1' rs:number='3' rs:nullable='true' rs:writeunknown='true' rs:basetable='VT_VIEW_MAGE'
			 rs:basecolumn='VVM_VIEW_CD1'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='VVM_VIEW_NM1' rs:number='4' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='VVM_VIEW_CD2' rs:number='5' rs:nullable='true' rs:writeunknown='true' rs:basetable='VT_VIEW_MAGE'
			 rs:basecolumn='VVM_VIEW_CD2'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='VVM_VIEW_NM2' rs:number='6' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='VVM_VIEW_CD3' rs:number='7' rs:nullable='true' rs:writeunknown='true' rs:basetable='VT_VIEW_MAGE'
			 rs:basecolumn='VVM_VIEW_CD3'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='VVM_VIEW_NM3' rs:number='8' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='VVM_VIEW_CD4' rs:number='9' rs:nullable='true' rs:writeunknown='true' rs:basetable='VT_VIEW_MAGE'
			 rs:basecolumn='VVM_VIEW_CD4'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='VVM_VIEW_NM4' rs:number='10' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='VVM_VIEW_CD5' rs:number='11' rs:nullable='true' rs:writeunknown='true' rs:basetable='VT_VIEW_MAGE'
			 rs:basecolumn='VVM_VIEW_CD5'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='VVM_VIEW_NM5' rs:number='12' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='VVM_VIEW_CD6' rs:number='13' rs:nullable='true' rs:writeunknown='true' rs:basetable='VT_VIEW_MAGE'
			 rs:basecolumn='VVM_VIEW_CD6'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='VVM_VIEW_NM6' rs:number='14' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='15' rs:rowid='true' rs:basetable='VT_VIEW_MAGE' rs:basecolumn='ROWID'
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

			String VVM_MARK_CLASS_T = cRsList.getString("VVM_MARK_CLASS");
			String VVM_VIEW_SQ_T = cRsList.getString("VVM_VIEW_SQ");
			String VVM_VIEW_CD1_T = cRsList.getString("VVM_VIEW_CD1");
			String VVM_VIEW_NM1_T = cRsList.getString("VVM_VIEW_NM1");
			String VVM_VIEW_CD2_T = cRsList.getString("VVM_VIEW_CD2");
			String VVM_VIEW_NM2_T = cRsList.getString("VVM_VIEW_NM2");
			String VVM_VIEW_CD3_T = cRsList.getString("VVM_VIEW_CD3");
			String VVM_VIEW_NM3_T = cRsList.getString("VVM_VIEW_NM3");
			String VVM_VIEW_CD4_T = cRsList.getString("VVM_VIEW_CD4");
			String VVM_VIEW_NM4_T = cRsList.getString("VVM_VIEW_NM4");
			String VVM_VIEW_CD5_T = cRsList.getString("VVM_VIEW_CD5");
			String VVM_VIEW_NM5_T = cRsList.getString("VVM_VIEW_NM5");
			String VVM_VIEW_CD6_T = cRsList.getString("VVM_VIEW_CD6");
			String VVM_VIEW_NM6_T = cRsList.getString("VVM_VIEW_NM6");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! VVM_MARK_CLASS_T.equals("")) {
%>
		 		VVM_MARK_CLASS='<%= VVM_MARK_CLASS_T%>'
<%
			}

			if(! VVM_VIEW_SQ_T.equals("")) {
%>
		 		VVM_VIEW_SQ='<%= VVM_VIEW_SQ_T%>'
<%
			}

			if(! VVM_VIEW_CD1_T.equals("")) {
%>
		 		VVM_VIEW_CD1='<%= VVM_VIEW_CD1_T%>'
<%
			}

			if(! VVM_VIEW_NM1_T.equals("")) {
%>
		 		VVM_VIEW_NM1='<%= VVM_VIEW_NM1_T%>'
<%
			}

			if(! VVM_VIEW_CD2_T.equals("")) {
%>
		 		VVM_VIEW_CD2='<%= VVM_VIEW_CD2_T%>'
<%
			}

			if(! VVM_VIEW_NM2_T.equals("")) {
%>
		 		VVM_VIEW_NM2='<%= VVM_VIEW_NM2_T%>'
<%
			}

			if(! VVM_VIEW_CD3_T.equals("")) {
%>
		 		VVM_VIEW_CD3='<%= VVM_VIEW_CD3_T%>'
<%
			}

			if(! VVM_VIEW_NM3_T.equals("")) {
%>
		 		VVM_VIEW_NM3='<%= VVM_VIEW_NM3_T%>'
<%
			}

			if(! VVM_VIEW_CD4_T.equals("")) {
%>
		 		VVM_VIEW_CD4='<%= VVM_VIEW_CD4_T%>'
<%
			}

			if(! VVM_VIEW_NM4_T.equals("")) {
%>
		 		VVM_VIEW_NM4='<%= VVM_VIEW_NM4_T%>'
<%
			}

			if(! VVM_VIEW_CD5_T.equals("")) {
%>
		 		VVM_VIEW_CD5='<%= VVM_VIEW_CD5_T%>'
<%
			}

			if(! VVM_VIEW_NM5_T.equals("")) {
%>
		 		VVM_VIEW_NM5='<%= VVM_VIEW_NM5_T%>'
<%
			}

			if(! VVM_VIEW_CD6_T.equals("")) {
%>
		 		VVM_VIEW_CD6='<%= VVM_VIEW_CD6_T%>'
<%
			}

			if(! VVM_VIEW_NM6_T.equals("")) {
%>
		 		VVM_VIEW_NM6='<%= VVM_VIEW_NM6_T%>'
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
