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

		String CN_LARGE = htMethod.get("CN_LARGE");
		String CN_LEVEL = htMethod.get("CN_LEVEL");
		String CN_SMALL = htMethod.get("CN_SMALL");
		String CN_OTHER = htMethod.get("CN_OTHER");
		String CN_PLACE = htMethod.get("CN_PLACE");

		//
		if(CN_LARGE == null) { CN_LARGE = ""; }
		if(CN_LEVEL == null) { CN_LEVEL = ""; }
		if(CN_SMALL == null) { CN_SMALL = ""; }
		if(CN_OTHER == null) { CN_OTHER = ""; }
		if(CN_PLACE == null) { CN_PLACE = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT CCN_SMALL, CCN_FULL_NM, CCN_SHRT_NM, CCN_SMALL||'-'||CCN_FULL_NM CCN_ADD_NM, 
       SUBSTR(CCN_SMALL, 1, 2) EXAM_KD, SUBSTR(CCN_SMALL, 1, 2)||'-'||CCN_FULL_NM CCN_EXAM_NM 
  FROM CT_COMMON 
 WHERE CCN_LARGE = :CN_LARGE
   AND CCN_LEVEL = :CN_LEVEL
   AND UPPER(CCN_USE_YN) = 'Y'

IF (:CN_SMALL <> '') THEN
   AND CCN_SMALL LIKE :CN_SMALL||'%'

IF (:CN_LARGE = '0902') AND (:CN_OTHER = 'Y') THEN
BEGIN
  IF (:CN_PLACE = '1') THEN
     AND SUBSTR(CCN_SMALL, 1, 1) IN ('1', '2')
  ELSE
     AND SUBSTR(CCN_SMALL, 1, 1) = :CN_PLACE
END;

 ORDER BY CCN_SMALL
		*/

		sql = " SELECT CCN_SMALL, CCN_FULL_NM, CCN_SHRT_NM, CCN_SMALL||'-'||CCN_FULL_NM CCN_ADD_NM, SUBSTR(CCN_SMALL, 1, 2) EXAM_KD, SUBSTR(CCN_SMALL, 1, 2)||'-'||CCN_FULL_NM CCN_EXAM_NM";
		sql += " FROM CT_COMMON";
		sql += " WHERE CCN_LARGE = '" + CN_LARGE + "'";
		sql += " AND CCN_LEVEL = '" + CN_LEVEL + "'";
		sql += " AND UPPER(CCN_USE_YN) = 'Y'";

		if(! CN_SMALL.equals("")) {
			sql += " AND CCN_SMALL LIKE '" + CN_SMALL + "%'";
		}
		if(CN_LARGE.equals("0902") && CN_OTHER.equals("Y")) {

			if(CN_PLACE.equals("1")) {
				sql += " AND SUBSTR(CCN_SMALL, 1, 1) IN ('1', '2')";
			} else {
				sql += " AND SUBSTR(CCN_SMALL, 1, 1) = '" + CN_PLACE + "'";
			}
		}

		sql += " ORDER BY CCN_SMALL";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uFM_AcptComm_GP_ComboSetting_002 \n";
			G_INFO += "설명 : 콤보박스 세팅 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " CN_LARGE : " + CN_LARGE + " \n";
			G_INFO += " CN_LEVEL : " + CN_LEVEL + " \n";
			G_INFO += " CN_SMALL : " + CN_SMALL + " \n";
			G_INFO += " CN_OTHER : " + CN_OTHER + " \n";
			G_INFO += " CN_PLACE : " + CN_PLACE + " \n";
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
