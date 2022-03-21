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

		String RZRD_GBITEMINDEX = htMethod.get("RZRD_GBITEMINDEX");

		//
		if(RZRD_GBITEMINDEX == null) { RZRD_GBITEMINDEX = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

    if rzrd_gbItemIndex = ''0'' then
    begin
      SELECT * FROM  CT_COMM_FIRVIEW  where ccf_lcode =''2'' 
      ORDER BY  cast( CCF_PAN_SQ as int) 
    end
    else
    begin
      SELECT * FROM  CT_COMM_FIRVIEW where ccf_lcode =''1''  
        ORDER BY  cast( CCF_PAN_SQ as int)          
    end;
		*/

		if(RZRD_GBITEMINDEX != null && RZRD_GBITEMINDEX.equals("0")) {

			sql = " SELECT *";
			sql += " FROM CT_COMM_FIRVIEW";
			sql += " WHERE ccf_lcode ='2'";
			sql += " ORDER BY cast( CCF_PAN_SQ as int)";
		} else {
		
			sql = " SELECT *";
			sql += " FROM CT_COMM_FIRVIEW";
			sql += " WHERE ccf_lcode ='1'";
			sql += " ORDER BY cast( CCF_PAN_SQ as int)";
		}

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : UConfig_UP_COMMfIR_001 \n";
			G_INFO += "설명 : 상황에 따른 설정화면 로딩 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " RZRD_GBITEMINDEX : " + RZRD_GBITEMINDEX + " \n";
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
		<s:AttributeType name='CCF_CODENM' rs:number='1' rs:writeunknown='true' rs:basetable='CT_COMM_FIRVIEW' rs:basecolumn='CCF_CODENM'>
			<s:datatype dt:type='string' dt:maxLength='100' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='CCF_PAN_CD' rs:number='2' rs:writeunknown='true' rs:basetable='CT_COMM_FIRVIEW' rs:basecolumn='CCF_PAN_CD'>
			<s:datatype dt:type='string' dt:maxLength='3' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='CCF_PAN_SQ' rs:number='3' rs:writeunknown='true' rs:basetable='CT_COMM_FIRVIEW' rs:basecolumn='CCF_PAN_SQ'>
			<s:datatype dt:type='string' dt:maxLength='2' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='CCF_PANVIEW' rs:number='4' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_COMM_FIRVIEW'
			 rs:basecolumn='CCF_PANVIEW'>
			<s:datatype dt:type='string' dt:maxLength='500'/>
		</s:AttributeType>
		<s:AttributeType name='CCF_MEMO' rs:number='5' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_COMM_FIRVIEW'
			 rs:basecolumn='CCF_MEMO'>
			<s:datatype dt:type='string' dt:maxLength='500'/>
		</s:AttributeType>
		<s:AttributeType name='CCF_CODE' rs:number='6' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_COMM_FIRVIEW'
			 rs:basecolumn='CCF_CODE'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='CCF_LCODE' rs:number='7' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_COMM_FIRVIEW'
			 rs:basecolumn='CCF_LCODE'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='CCF_JILCD' rs:number='8' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_COMM_FIRVIEW'
			 rs:basecolumn='CCF_JILCD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='CCF_PLVCD' rs:number='9' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_COMM_FIRVIEW'
			 rs:basecolumn='CCF_PLVCD'>
			<s:datatype dt:type='string' dt:maxLength='5'/>
		</s:AttributeType>
		<s:AttributeType name='CCF_JILVIEW' rs:number='10' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_COMM_FIRVIEW'
			 rs:basecolumn='CCF_JILVIEW'>
			<s:datatype dt:type='string' dt:maxLength='500'/>
		</s:AttributeType>
		<s:AttributeType name='CCF_AUTO_YN' rs:number='11' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_COMM_FIRVIEW'
			 rs:basecolumn='CCF_AUTO_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='12' rs:rowid='true' rs:writeunknown='true' rs:basetable='CT_COMM_FIRVIEW'
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

			String CCF_CODENM_T = cRsList.getString("CCF_CODENM");
			String CCF_PAN_CD_T = cRsList.getString("CCF_PAN_CD");
			String CCF_PAN_SQ_T = cRsList.getString("CCF_PAN_SQ");
			String CCF_PANVIEW_T = cRsList.getString("CCF_PANVIEW");
			String CCF_MEMO_T = cRsList.getString("CCF_MEMO");
			String CCF_CODE_T = cRsList.getString("CCF_CODE");
			String CCF_LCODE_T = cRsList.getString("CCF_LCODE");
			String CCF_JILCD_T = cRsList.getString("CCF_JILCD");
			String CCF_PLVCD_T = cRsList.getString("CCF_PLVCD");
			String CCF_JILVIEW_T = cRsList.getString("CCF_JILVIEW");
			String CCF_AUTO_YN_T = cRsList.getString("CCF_AUTO_YN");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! CCF_CODENM_T.equals("")) {
%>
		 		CCF_CODENM='<%= CCF_CODENM_T%>'
<%
			}

			if(! CCF_PAN_CD_T.equals("")) {
%>
		 		CCF_PAN_CD='<%= CCF_PAN_CD_T%>'
<%
			}

			if(! CCF_PAN_SQ_T.equals("")) {
%>
		 		CCF_PAN_SQ='<%= CCF_PAN_SQ_T%>'
<%
			}

			if(! CCF_PANVIEW_T.equals("")) {
%>
		 		CCF_PANVIEW='<%= CCF_PANVIEW_T%>'
<%
			}

			if(! CCF_MEMO_T.equals("")) {
%>
		 		CCF_MEMO='<%= CCF_MEMO_T%>'
<%
			}

			if(! CCF_CODE_T.equals("")) {
%>
		 		CCF_CODE='<%= CCF_CODE_T%>'
<%
			}

			if(! CCF_LCODE_T.equals("")) {
%>
		 		CCF_LCODE='<%= CCF_LCODE_T%>'
<%
			}

			if(! CCF_JILCD_T.equals("")) {
%>
		 		CCF_JILCD='<%= CCF_JILCD_T%>'
<%
			}

			if(! CCF_PLVCD_T.equals("")) {
%>
		 		CCF_PLVCD='<%= CCF_PLVCD_T%>'
<%
			}

			if(! CCF_JILVIEW_T.equals("")) {
%>
		 		CCF_JILVIEW='<%= CCF_JILVIEW_T%>'
<%
			}

			if(! CCF_AUTO_YN_T.equals("")) {
%>
		 		CCF_AUTO_YN='<%= CCF_AUTO_YN_T%>'
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
