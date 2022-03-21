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

select ccn_small, ccn_full_nm, ccn_shrt_nm, ccn_small||'-'||ccn_full_nm As CCN_ADD_NM,             
       SUBSTR(ccn_small, 1, 2) exam_kd, SUBSTR(ccn_small, 1, 2)||'-'||ccn_full_nm ccn_exam_nm
from ct_common                                                                                     
where ccn_large = '0902'                                                                         
 and ccn_level = '5'                                                                             
  and upper(ccn_use_yn) = 'Y'                                                                    
order by ccn_small
		*/

		sql = " SELECT CCN_SMALL, CCN_FULL_NM, CCN_SHRT_NM, CCN_SMALL||'-'||CCN_FULL_NM AS CCN_ADD_NM, SUBSTR(CCN_SMALL, 1, 2) EXAM_KD, SUBSTR(CCN_SMALL, 1, 2)||'-'||CCN_FULL_NM CCN_EXAM_NM";
		sql += " FROM CT_COMMON";
		sql += " WHERE CCN_LARGE = '0902'";
		sql += " AND CCN_LEVEL = '5'";
		sql += " AND UPPER(CCN_USE_YN) = 'Y'";
		sql += " ORDER BY CCN_SMALL";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uCommon_XML_CCN_005 \n";
			G_INFO += "설명 : 일반공통코드조회(검진장소구분-콤보박스셋팅) \n";
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
		<s:AttributeType name='CCN_SMALL' rs:number='1' rs:writeunknown='true' rs:basetable='CT_COMMON' rs:basecolumn='CCN_SMALL'>
			<s:datatype dt:type='string' dt:maxLength='20' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='CCN_FULL_NM' rs:number='2' rs:writeunknown='true' rs:basetable='CT_COMMON' rs:basecolumn='CCN_FULL_NM'>
			<s:datatype dt:type='string' dt:maxLength='300' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='CCN_SHRT_NM' rs:number='3' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_COMMON'
			 rs:basecolumn='CCN_SHRT_NM'>
			<s:datatype dt:type='string' dt:maxLength='300'/>
		</s:AttributeType>
		<s:AttributeType name='CCN_ADD_NM' rs:number='4' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='321'/>
		</s:AttributeType>
		<s:AttributeType name='EXAM_KD' rs:number='5' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4'/>
		</s:AttributeType>
		<s:AttributeType name='CCN_EXAM_NM' rs:number='6' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='305'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='7' rs:rowid='true' rs:basetable='CT_COMMON' rs:basecolumn='ROWID'
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

			String CCN_SMALL_T = cRsList.getString("CCN_SMALL");
			String CCN_FULL_NM_T = cRsList.getString("CCN_FULL_NM");
			String CCN_SHRT_NM_T = cRsList.getString("CCN_SHRT_NM");
			String CCN_ADD_NM_T = cRsList.getString("CCN_ADD_NM");
			String EXAM_KD_T = cRsList.getString("EXAM_KD");
			String CCN_EXAM_NM_T = cRsList.getString("CCN_EXAM_NM");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! CCN_SMALL_T.equals("")) {
%>
		 		CCN_SMALL='<%= CCN_SMALL_T%>'
<%
			}

			if(! CCN_FULL_NM_T.equals("")) {
%>
		 		CCN_FULL_NM='<%= CCN_FULL_NM_T%>'
<%
			}

			if(! CCN_SHRT_NM_T.equals("")) {
%>
		 		CCN_SHRT_NM='<%= CCN_SHRT_NM_T%>'
<%
			}

			if(! CCN_ADD_NM_T.equals("")) {
%>
		 		CCN_ADD_NM='<%= CCN_ADD_NM_T%>'
<%
			}

			if(! EXAM_KD_T.equals("")) {
%>
		 		EXAM_KD='<%= EXAM_KD_T%>'
<%
			}

			if(! CCN_EXAM_NM_T.equals("")) {
%>
		 		CCN_EXAM_NM='<%= CCN_EXAM_NM_T%>'
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
