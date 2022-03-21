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

		String IIA_ITEM_CD = htMethod.get("IIA_ITEM_CD");

		//
		if(IIA_ITEM_CD == null) { IIA_ITEM_CD = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT CASE WHEN IIA_SEX_CD = ''1'' THEN ''남''
            WHEN IIA_SEX_CD = ''2'' THEN ''여'' END AS SEX_CD
     , IIA_APLY_DT
     , IIA_SEX_CD
     , IIA_AGE_FR
     , IIA_AGE_TO
     , IIA_PRE_CD1
     , IIA_PRE_CD2
     , IIA_PRE_CD3
     , IIA_PRE_CD4
     , IIA_PRE_CD5
     , IIA_PRE_CD6
     , IIA_ACAL_NM
     , IIA_USE_YN
     , A.IIM_KNME_NM AS PRE1
     , B.IIM_KNME_NM AS PRE2
     , C.IIM_KNME_NM AS PRE3
     , D.IIM_KNME_NM AS PRE4
     , E.IIM_KNME_NM AS PRE5
     , F.IIM_KNME_NM AS PRE6
  FROM IT_ITEM_ACAL
  LEFT OUTER JOIN IT_ITEM A ON
       A.IIM_ITEM_CD = IIA_PRE_CD1
  LEFT OUTER JOIN IT_ITEM B ON
       B.IIM_ITEM_CD = IIA_PRE_CD2
  LEFT OUTER JOIN IT_ITEM C ON
       C.IIM_ITEM_CD = IIA_PRE_CD3
  LEFT OUTER JOIN IT_ITEM D ON
       D.IIM_ITEM_CD = IIA_PRE_CD4
  LEFT OUTER JOIN IT_ITEM E ON
       E.IIM_ITEM_CD = IIA_PRE_CD5
  LEFT OUTER JOIN IT_ITEM F ON
       F.IIM_ITEM_CD = IIA_PRE_CD6
 WHERE IIA_ITEM_CD = :IIA_ITEM_CD 
 ORDER BY IIA_APLY_DT DESC, IIA_SEX_CD
		*/

		sql = " SELECT CASE WHEN IIA_SEX_CD = '1' THEN '남' WHEN IIA_SEX_CD = '2' THEN '여' END AS SEX_CD , IIA_APLY_DT , IIA_SEX_CD , IIA_AGE_FR , IIA_AGE_TO , IIA_PRE_CD1 , IIA_PRE_CD2 , IIA_PRE_CD3 , IIA_PRE_CD4 , IIA_PRE_CD5 , IIA_PRE_CD6 , IIA_ACAL_NM , IIA_USE_YN , A.IIM_KNME_NM AS PRE1 , B.IIM_KNME_NM AS PRE2 , C.IIM_KNME_NM AS PRE3 , D.IIM_KNME_NM AS PRE4 , E.IIM_KNME_NM AS PRE5 , F.IIM_KNME_NM AS PRE6";
		sql += " FROM IT_ITEM_ACAL LEFT OUTER JOIN IT_ITEM A";
		sql += " ON A.IIM_ITEM_CD = IIA_PRE_CD1 LEFT OUTER JOIN IT_ITEM B";
		sql += " ON B.IIM_ITEM_CD = IIA_PRE_CD2 LEFT OUTER JOIN IT_ITEM C";
		sql += " ON C.IIM_ITEM_CD = IIA_PRE_CD3 LEFT OUTER JOIN IT_ITEM D";
		sql += " ON D.IIM_ITEM_CD = IIA_PRE_CD4 LEFT OUTER JOIN IT_ITEM E";
		sql += " ON E.IIM_ITEM_CD = IIA_PRE_CD5 LEFT OUTER JOIN IT_ITEM F";
		sql += " ON F.IIM_ITEM_CD = IIA_PRE_CD6";
		sql += " WHERE IIA_ITEM_CD = '" + IIA_ITEM_CD + "'";
		sql += " ORDER BY IIA_APLY_DT DESC, IIA_SEX_CD";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uItem_Acal_gpGetItemAcal_001 \n";
			G_INFO += "설명 : 검사항목 자동계산 수식 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " IIA_ITEM_CD : " + IIA_ITEM_CD + " \n";
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
		<s:AttributeType name='SEX_CD' rs:number='1' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_ACAL'
			 rs:basecolumn='IIA_APLY_DT'>
			<s:datatype dt:type='string' dt:maxLength='2' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='IIA_APLY_DT' rs:number='2' rs:writeunknown='true' rs:basetable='IT_ITEM_ACAL' rs:basecolumn='IIA_SEX_CD'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='IIA_SEX_CD' rs:number='3' rs:writeunknown='true' rs:basetable='IT_ITEM_ACAL' rs:basecolumn='IIA_AGE_FR'>
			<s:datatype dt:type='string' dt:maxLength='1' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='IIA_AGE_FR' rs:number='4' rs:writeunknown='true' rs:basetable='IT_ITEM_ACAL' rs:basecolumn='IIA_AGE_TO'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'
			 rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='IIA_AGE_TO' rs:number='5' rs:writeunknown='true' rs:basetable='IT_ITEM_ACAL' rs:basecolumn='IIA_PRE_CD1'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'
			 rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='IIA_PRE_CD1' rs:number='6' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_ACAL'
			 rs:basecolumn='IIA_PRE_CD2'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='IIA_PRE_CD2' rs:number='7' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_ACAL'
			 rs:basecolumn='IIA_PRE_CD3'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='IIA_PRE_CD3' rs:number='8' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_ACAL'
			 rs:basecolumn='IIA_PRE_CD4'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='IIA_PRE_CD4' rs:number='9' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_ACAL'
			 rs:basecolumn='IIA_PRE_CD5'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='IIA_PRE_CD5' rs:number='10' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_ACAL'
			 rs:basecolumn='IIA_PRE_CD6'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='IIA_PRE_CD6' rs:number='11' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_ACAL'
			 rs:basecolumn='IIA_ACAL_NM'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='IIA_ACAL_NM' rs:number='12' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_ACAL'
			 rs:basecolumn='IIA_USE_YN'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='IIA_USE_YN' rs:number='13' rs:writeunknown='true' rs:basetable='IT_ITEM' rs:basecolumn='IIM_KNME_NM'>
			<s:datatype dt:type='string' dt:maxLength='1' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='PRE1' rs:number='14' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_KNME_NM'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='PRE2' rs:number='15' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_KNME_NM'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='PRE3' rs:number='16' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_KNME_NM'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='PRE4' rs:number='17' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_KNME_NM'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='PRE5' rs:number='18' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_KNME_NM'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='PRE6' rs:number='19' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_ACAL'
			 rs:basecolumn='ROWID'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='20' rs:rowid='true' rs:basetable='IT_ITEM' rs:basecolumn='ROWID' rs:keycolumn='true'
			 rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c20' rs:name='ROWID' rs:number='21' rs:rowid='true' rs:basetable='IT_ITEM' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c21' rs:name='ROWID' rs:number='22' rs:rowid='true' rs:basetable='IT_ITEM' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c22' rs:name='ROWID' rs:number='23' rs:rowid='true' rs:basetable='IT_ITEM' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c23' rs:name='ROWID' rs:number='24' rs:rowid='true' rs:basetable='IT_ITEM' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c24' rs:name='ROWID' rs:number='25' rs:rowid='true' rs:basetable='IT_ITEM' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c25' rs:name='ROWID' rs:number='26' rs:rowid='true' rs:hidden='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:extends type='rs:rowbase'/>
	</s:ElementType>
</s:Schema>		<rs:data>
<%
		int cnt = 0;
		while(cRsList.next()) {

			cnt++;

			String SEX_CD_T = cRsList.getString("SEX_CD");
			String IIA_APLY_DT_T = cRsList.getString("IIA_APLY_DT");
			String IIA_SEX_CD_T = cRsList.getString("IIA_SEX_CD");
			String IIA_AGE_FR_T = cRsList.getString("IIA_AGE_FR");
			String IIA_AGE_TO_T = cRsList.getString("IIA_AGE_TO");
			String IIA_PRE_CD1_T = cRsList.getString("IIA_PRE_CD1");
			String IIA_PRE_CD2_T = cRsList.getString("IIA_PRE_CD2");
			String IIA_PRE_CD3_T = cRsList.getString("IIA_PRE_CD3");
			String IIA_PRE_CD4_T = cRsList.getString("IIA_PRE_CD4");
			String IIA_PRE_CD5_T = cRsList.getString("IIA_PRE_CD5");
			String IIA_PRE_CD6_T = cRsList.getString("IIA_PRE_CD6");
			String IIA_ACAL_NM_T = cRsList.getString("IIA_ACAL_NM");
			String IIA_USE_YN_T = cRsList.getString("IIA_USE_YN");
			String PRE1_T = cRsList.getString("PRE1");
			String PRE2_T = cRsList.getString("PRE2");
			String PRE3_T = cRsList.getString("PRE3");
			String PRE4_T = cRsList.getString("PRE4");
			String PRE5_T = cRsList.getString("PRE5");
			String PRE6_T = cRsList.getString("PRE6");
			String ROWID_T = cRsList.getString("ROWID");
			String c20_T = cRsList.getString("c20");
			String c21_T = cRsList.getString("c21");
			String c22_T = cRsList.getString("c22");
			String c23_T = cRsList.getString("c23");
			String c24_T = cRsList.getString("c24");
			String c25_T = cRsList.getString("c25");
%>
			<z:row
<%
			if(! SEX_CD_T.equals("")) {
%>
		 		SEX_CD='<%= SEX_CD_T%>'
<%
			}

			if(! IIA_APLY_DT_T.equals("")) {
%>
		 		IIA_APLY_DT='<%= IIA_APLY_DT_T%>'
<%
			}

			if(! IIA_SEX_CD_T.equals("")) {
%>
		 		IIA_SEX_CD='<%= IIA_SEX_CD_T%>'
<%
			}

			if(! IIA_AGE_FR_T.equals("")) {
%>
		 		IIA_AGE_FR='<%= IIA_AGE_FR_T%>'
<%
			}

			if(! IIA_AGE_TO_T.equals("")) {
%>
		 		IIA_AGE_TO='<%= IIA_AGE_TO_T%>'
<%
			}

			if(! IIA_PRE_CD1_T.equals("")) {
%>
		 		IIA_PRE_CD1='<%= IIA_PRE_CD1_T%>'
<%
			}

			if(! IIA_PRE_CD2_T.equals("")) {
%>
		 		IIA_PRE_CD2='<%= IIA_PRE_CD2_T%>'
<%
			}

			if(! IIA_PRE_CD3_T.equals("")) {
%>
		 		IIA_PRE_CD3='<%= IIA_PRE_CD3_T%>'
<%
			}

			if(! IIA_PRE_CD4_T.equals("")) {
%>
		 		IIA_PRE_CD4='<%= IIA_PRE_CD4_T%>'
<%
			}

			if(! IIA_PRE_CD5_T.equals("")) {
%>
		 		IIA_PRE_CD5='<%= IIA_PRE_CD5_T%>'
<%
			}

			if(! IIA_PRE_CD6_T.equals("")) {
%>
		 		IIA_PRE_CD6='<%= IIA_PRE_CD6_T%>'
<%
			}

			if(! IIA_ACAL_NM_T.equals("")) {
%>
		 		IIA_ACAL_NM='<%= IIA_ACAL_NM_T%>'
<%
			}

			if(! IIA_USE_YN_T.equals("")) {
%>
		 		IIA_USE_YN='<%= IIA_USE_YN_T%>'
<%
			}

			if(! PRE1_T.equals("")) {
%>
		 		PRE1='<%= PRE1_T%>'
<%
			}

			if(! PRE2_T.equals("")) {
%>
		 		PRE2='<%= PRE2_T%>'
<%
			}

			if(! PRE3_T.equals("")) {
%>
		 		PRE3='<%= PRE3_T%>'
<%
			}

			if(! PRE4_T.equals("")) {
%>
		 		PRE4='<%= PRE4_T%>'
<%
			}

			if(! PRE5_T.equals("")) {
%>
		 		PRE5='<%= PRE5_T%>'
<%
			}
%>
				PRE6='<%= cnt%>'
				ROWID='<%= cnt%>'
				c20='<%= cnt%>'
				c21='<%= cnt%>'
				c22='<%= cnt%>'
				c23='<%= cnt%>'
				c24='<%= cnt%>'
<%
			if(! c25_T.equals("")) {
%>
		 		c25='<%= c25_T%>'
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
