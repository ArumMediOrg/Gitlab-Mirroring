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

		String DIRT_YN = htMethod.get("DIRT_YN");
		String PRO_CD = htMethod.get("PRO_CD");
		String PRO_NM = htMethod.get("PRO_NM");

		//
		if(DIRT_YN == null) { DIRT_YN = ""; }
		if(PRO_CD == null) { PRO_CD = ""; }
		if(PRO_NM == null) { PRO_NM = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT * 
  FROM ARUM_PACKAGE 
 WHERE UPPER(ARUM_USE_YN)  = 'Y'
   AND UPPER(UB_USE_YN) = 'Y'

if (:DIRT_YN <> '') then
   AND UPPER(UB_DIRECT_YN) =:DIRT_YN

if (:PRO_CD <> '') then
   AND ARUM_PRO_CD IN (:PRO_CD)

if (:PRO_NM <> '') then
   AND ARUM_PACK_NM || ARUM_TYPE_NM IN (:PRO_NM)

 ORDER BY ARUM_PRO_CD

		*/

		sql = " SELECT *";
		sql += " FROM ARUM_PACKAGE";
		sql += " WHERE UPPER(ARUM_USE_YN) = 'Y'";
		sql += " AND UPPER(UB_USE_YN) = 'Y'";

		if(! DIRT_YN.equals("")) {
			sql += " AND UPPER(UB_DIRECT_YN) ='" + DIRT_YN + "'";
		}
		if(! PRO_CD.equals("")) {
			sql += " AND ARUM_PRO_CD IN ('" + PRO_CD + "')";
		}
		if(! PRO_NM.equals("")) {
			sql += " AND ARUM_PACK_NM || ARUM_TYPE_NM IN ('" + PRO_NM + "')";
		}

		sql += " ORDER BY ARUM_PRO_CD";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uRsvn_Acpt_SelectUBAPIList_001 \n";
			G_INFO += "설명 : 에버헬스 패키지 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " DIRT_YN : " + DIRT_YN + " \n";
			G_INFO += " PRO_CD : " + PRO_CD + " \n";
			G_INFO += " PRO_NM : " + PRO_NM + " \n";
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
		<s:AttributeType name='ARUM_PACK_CD' rs:number='1' rs:writeunknown='true' rs:basetable='ARUM_PACKAGE' rs:basecolumn='ARUM_PACK_CD'>
			<s:datatype dt:type='string' dt:maxLength='18' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ARUM_PACK_NM' rs:number='2' rs:nullable='true' rs:writeunknown='true' rs:basetable='ARUM_PACKAGE'
			 rs:basecolumn='ARUM_PACK_NM'>
			<s:datatype dt:type='string' dt:maxLength='50'/>
		</s:AttributeType>
		<s:AttributeType name='ARUM_PACK_TX' rs:number='3' rs:nullable='true' rs:writeunknown='true' rs:basetable='ARUM_PACKAGE'
			 rs:basecolumn='ARUM_PACK_TX'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='ARUM_TYPE_NM' rs:number='4' rs:nullable='true' rs:writeunknown='true' rs:basetable='ARUM_PACKAGE'
			 rs:basecolumn='ARUM_TYPE_NM'>
			<s:datatype dt:type='string' dt:maxLength='50'/>
		</s:AttributeType>
		<s:AttributeType name='ARUM_TYPE_TX' rs:number='5' rs:nullable='true' rs:writeunknown='true' rs:basetable='ARUM_PACKAGE'
			 rs:basecolumn='ARUM_TYPE_TX'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='ARUM_CHOICE1_NO' rs:number='6' rs:nullable='true' rs:writeunknown='true' rs:basetable='ARUM_PACKAGE'
			 rs:basecolumn='ARUM_CHOICE1_NO'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='ARUM_CHOICE1_CD' rs:number='7' rs:nullable='true' rs:writeunknown='true' rs:basetable='ARUM_PACKAGE'
			 rs:basecolumn='ARUM_CHOICE1_CD'>
			<s:datatype dt:type='string' dt:maxLength='1000'/>
		</s:AttributeType>
		<s:AttributeType name='ARUM_CHOICE2_NO' rs:number='8' rs:nullable='true' rs:writeunknown='true' rs:basetable='ARUM_PACKAGE'
			 rs:basecolumn='ARUM_CHOICE2_NO'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='ARUM_CHOICE2_CD' rs:number='9' rs:nullable='true' rs:writeunknown='true' rs:basetable='ARUM_PACKAGE'
			 rs:basecolumn='ARUM_CHOICE2_CD'>
			<s:datatype dt:type='string' dt:maxLength='1000'/>
		</s:AttributeType>
		<s:AttributeType name='ARUM_CHOICE3_NO' rs:number='10' rs:nullable='true' rs:writeunknown='true' rs:basetable='ARUM_PACKAGE'
			 rs:basecolumn='ARUM_CHOICE3_NO'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='ARUM_CHOICE3_CD' rs:number='11' rs:nullable='true' rs:writeunknown='true' rs:basetable='ARUM_PACKAGE'
			 rs:basecolumn='ARUM_CHOICE3_CD'>
			<s:datatype dt:type='string' dt:maxLength='1000'/>
		</s:AttributeType>
		<s:AttributeType name='ARUM_CHOICE4_NO' rs:number='12' rs:nullable='true' rs:writeunknown='true' rs:basetable='ARUM_PACKAGE'
			 rs:basecolumn='ARUM_CHOICE4_NO'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='ARUM_CHOICE4_CD' rs:number='13' rs:nullable='true' rs:writeunknown='true' rs:basetable='ARUM_PACKAGE'
			 rs:basecolumn='ARUM_CHOICE4_CD'>
			<s:datatype dt:type='string' dt:maxLength='1000'/>
		</s:AttributeType>
		<s:AttributeType name='ARUM_CHOICE5_NO' rs:number='14' rs:nullable='true' rs:writeunknown='true' rs:basetable='ARUM_PACKAGE'
			 rs:basecolumn='ARUM_CHOICE5_NO'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='ARUM_CHOICE5_CD' rs:number='15' rs:nullable='true' rs:writeunknown='true' rs:basetable='ARUM_PACKAGE'
			 rs:basecolumn='ARUM_CHOICE5_CD'>
			<s:datatype dt:type='string' dt:maxLength='1000'/>
		</s:AttributeType>
		<s:AttributeType name='ARUM_ADD_CD' rs:number='16' rs:nullable='true' rs:writeunknown='true' rs:basetable='ARUM_PACKAGE'
			 rs:basecolumn='ARUM_ADD_CD'>
			<s:datatype dt:type='string' dt:maxLength='1000'/>
		</s:AttributeType>
		<s:AttributeType name='ARUM_PRO_CD' rs:number='17' rs:nullable='true' rs:writeunknown='true' rs:basetable='ARUM_PACKAGE'
			 rs:basecolumn='ARUM_PRO_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ARUM_COM_CD' rs:number='18' rs:nullable='true' rs:writeunknown='true' rs:basetable='ARUM_PACKAGE'
			 rs:basecolumn='ARUM_COM_CD'>
			<s:datatype dt:type='string' dt:maxLength='12'/>
		</s:AttributeType>
		<s:AttributeType name='ARUM_PRICE' rs:number='19' rs:nullable='true' rs:writeunknown='true' rs:basetable='ARUM_PACKAGE'
			 rs:basecolumn='ARUM_PRICE'>
			<s:datatype dt:type='string' dt:maxLength='7'/>
		</s:AttributeType>
		<s:AttributeType name='UB_SEX' rs:number='20' rs:nullable='true' rs:writeunknown='true' rs:basetable='ARUM_PACKAGE'
			 rs:basecolumn='UB_SEX'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='UB_YEAR' rs:number='21' rs:nullable='true' rs:writeunknown='true' rs:basetable='ARUM_PACKAGE'
			 rs:basecolumn='UB_YEAR'>
			<s:datatype dt:type='string' dt:maxLength='4'/>
		</s:AttributeType>
		<s:AttributeType name='ARUM_SP_YN' rs:number='22' rs:nullable='true' rs:writeunknown='true' rs:basetable='ARUM_PACKAGE'
			 rs:basecolumn='ARUM_SP_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ARUM_USE_YN' rs:number='23' rs:nullable='true' rs:writeunknown='true' rs:basetable='ARUM_PACKAGE'
			 rs:basecolumn='ARUM_USE_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='UB_USE_YN' rs:number='24' rs:nullable='true' rs:writeunknown='true' rs:basetable='ARUM_PACKAGE'
			 rs:basecolumn='UB_USE_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='UB_DIRECT_YN' rs:number='25' rs:nullable='true' rs:writeunknown='true' rs:basetable='ARUM_PACKAGE'
			 rs:basecolumn='UB_DIRECT_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='UB_DIRECT_JONGGUM_YN' rs:number='26' rs:nullable='true' rs:writeunknown='true' rs:basetable='ARUM_PACKAGE'
			 rs:basecolumn='UB_DIRECT_JONGGUM_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='UB_DIRECT_DATE_FROM' rs:number='27' rs:nullable='true' rs:writeunknown='true' rs:basetable='ARUM_PACKAGE'
			 rs:basecolumn='UB_DIRECT_DATE_FROM'>
			<s:datatype dt:type='string' dt:maxLength='8'/>
		</s:AttributeType>
		<s:AttributeType name='UB_DIRECT_DATE_TO' rs:number='28' rs:nullable='true' rs:writeunknown='true' rs:basetable='ARUM_PACKAGE'
			 rs:basecolumn='UB_DIRECT_DATE_TO'>
			<s:datatype dt:type='string' dt:maxLength='8'/>
		</s:AttributeType>
		<s:AttributeType name='UB_DIRECT_GUM_YN' rs:number='29' rs:nullable='true' rs:writeunknown='true' rs:basetable='ARUM_PACKAGE'
			 rs:basecolumn='UB_DIRECT_GUM_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='UB_DIRECT_SEND_YN' rs:number='30' rs:nullable='true' rs:writeunknown='true' rs:basetable='ARUM_PACKAGE'
			 rs:basecolumn='UB_DIRECT_SEND_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='UB_CARE_PACKAGE_TYPE' rs:number='31' rs:nullable='true' rs:writeunknown='true' rs:basetable='ARUM_PACKAGE'
			 rs:basecolumn='UB_CARE_PACKAGE_TYPE'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='UB_CARE_MIN_CNT' rs:number='32' rs:nullable='true' rs:writeunknown='true' rs:basetable='ARUM_PACKAGE'
			 rs:basecolumn='UB_CARE_MIN_CNT'>
			<s:datatype dt:type='string' dt:maxLength='5'/>
		</s:AttributeType>
		<s:AttributeType name='UB_CARE_SELECT_COMP' rs:number='33' rs:nullable='true' rs:writeunknown='true' rs:basetable='ARUM_PACKAGE'
			 rs:basecolumn='UB_CARE_SELECT_COMP'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='UB_USE_YN2' rs:number='34' rs:nullable='true' rs:writeunknown='true' rs:basetable='ARUM_PACKAGE'
			 rs:basecolumn='UB_USE_YN2'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='35' rs:rowid='true' rs:writeunknown='true' rs:basetable='ARUM_PACKAGE'
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

			String ARUM_PACK_CD_T = cRsList.getString("ARUM_PACK_CD");
			String ARUM_PACK_NM_T = cRsList.getString("ARUM_PACK_NM");
			String ARUM_PACK_TX_T = cRsList.getString("ARUM_PACK_TX");
			String ARUM_TYPE_NM_T = cRsList.getString("ARUM_TYPE_NM");
			String ARUM_TYPE_TX_T = cRsList.getString("ARUM_TYPE_TX");
			String ARUM_CHOICE1_NO_T = cRsList.getString("ARUM_CHOICE1_NO");
			String ARUM_CHOICE1_CD_T = cRsList.getString("ARUM_CHOICE1_CD");
			String ARUM_CHOICE2_NO_T = cRsList.getString("ARUM_CHOICE2_NO");
			String ARUM_CHOICE2_CD_T = cRsList.getString("ARUM_CHOICE2_CD");
			String ARUM_CHOICE3_NO_T = cRsList.getString("ARUM_CHOICE3_NO");
			String ARUM_CHOICE3_CD_T = cRsList.getString("ARUM_CHOICE3_CD");
			String ARUM_CHOICE4_NO_T = cRsList.getString("ARUM_CHOICE4_NO");
			String ARUM_CHOICE4_CD_T = cRsList.getString("ARUM_CHOICE4_CD");
			String ARUM_CHOICE5_NO_T = cRsList.getString("ARUM_CHOICE5_NO");
			String ARUM_CHOICE5_CD_T = cRsList.getString("ARUM_CHOICE5_CD");
			String ARUM_ADD_CD_T = cRsList.getString("ARUM_ADD_CD");
			String ARUM_PRO_CD_T = cRsList.getString("ARUM_PRO_CD");
			String ARUM_COM_CD_T = cRsList.getString("ARUM_COM_CD");
			String ARUM_PRICE_T = cRsList.getString("ARUM_PRICE");
			String UB_SEX_T = cRsList.getString("UB_SEX");
			String UB_YEAR_T = cRsList.getString("UB_YEAR");
			String ARUM_SP_YN_T = cRsList.getString("ARUM_SP_YN");
			String ARUM_USE_YN_T = cRsList.getString("ARUM_USE_YN");
			String UB_USE_YN_T = cRsList.getString("UB_USE_YN");
			String UB_DIRECT_YN_T = cRsList.getString("UB_DIRECT_YN");
			String UB_DIRECT_JONGGUM_YN_T = cRsList.getString("UB_DIRECT_JONGGUM_YN");
			String UB_DIRECT_DATE_FROM_T = cRsList.getString("UB_DIRECT_DATE_FROM");
			String UB_DIRECT_DATE_TO_T = cRsList.getString("UB_DIRECT_DATE_TO");
			String UB_DIRECT_GUM_YN_T = cRsList.getString("UB_DIRECT_GUM_YN");
			String UB_DIRECT_SEND_YN_T = cRsList.getString("UB_DIRECT_SEND_YN");
			String UB_CARE_PACKAGE_TYPE_T = cRsList.getString("UB_CARE_PACKAGE_TYPE");
			String UB_CARE_MIN_CNT_T = cRsList.getString("UB_CARE_MIN_CNT");
			String UB_CARE_SELECT_COMP_T = cRsList.getString("UB_CARE_SELECT_COMP");
			String UB_USE_YN2_T = cRsList.getString("UB_USE_YN2");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! ARUM_PACK_CD_T.equals("")) {
%>
		 		ARUM_PACK_CD='<%= ARUM_PACK_CD_T%>'
<%
			}

			if(! ARUM_PACK_NM_T.equals("")) {
%>
		 		ARUM_PACK_NM='<%= ARUM_PACK_NM_T%>'
<%
			}

			if(! ARUM_PACK_TX_T.equals("")) {
%>
		 		ARUM_PACK_TX='<%= ARUM_PACK_TX_T%>'
<%
			}

			if(! ARUM_TYPE_NM_T.equals("")) {
%>
		 		ARUM_TYPE_NM='<%= ARUM_TYPE_NM_T%>'
<%
			}

			if(! ARUM_TYPE_TX_T.equals("")) {
%>
		 		ARUM_TYPE_TX='<%= ARUM_TYPE_TX_T%>'
<%
			}

			if(! ARUM_CHOICE1_NO_T.equals("")) {
%>
		 		ARUM_CHOICE1_NO='<%= ARUM_CHOICE1_NO_T%>'
<%
			}

			if(! ARUM_CHOICE1_CD_T.equals("")) {
%>
		 		ARUM_CHOICE1_CD='<%= ARUM_CHOICE1_CD_T%>'
<%
			}

			if(! ARUM_CHOICE2_NO_T.equals("")) {
%>
		 		ARUM_CHOICE2_NO='<%= ARUM_CHOICE2_NO_T%>'
<%
			}

			if(! ARUM_CHOICE2_CD_T.equals("")) {
%>
		 		ARUM_CHOICE2_CD='<%= ARUM_CHOICE2_CD_T%>'
<%
			}

			if(! ARUM_CHOICE3_NO_T.equals("")) {
%>
		 		ARUM_CHOICE3_NO='<%= ARUM_CHOICE3_NO_T%>'
<%
			}

			if(! ARUM_CHOICE3_CD_T.equals("")) {
%>
		 		ARUM_CHOICE3_CD='<%= ARUM_CHOICE3_CD_T%>'
<%
			}

			if(! ARUM_CHOICE4_NO_T.equals("")) {
%>
		 		ARUM_CHOICE4_NO='<%= ARUM_CHOICE4_NO_T%>'
<%
			}

			if(! ARUM_CHOICE4_CD_T.equals("")) {
%>
		 		ARUM_CHOICE4_CD='<%= ARUM_CHOICE4_CD_T%>'
<%
			}

			if(! ARUM_CHOICE5_NO_T.equals("")) {
%>
		 		ARUM_CHOICE5_NO='<%= ARUM_CHOICE5_NO_T%>'
<%
			}

			if(! ARUM_CHOICE5_CD_T.equals("")) {
%>
		 		ARUM_CHOICE5_CD='<%= ARUM_CHOICE5_CD_T%>'
<%
			}

			if(! ARUM_ADD_CD_T.equals("")) {
%>
		 		ARUM_ADD_CD='<%= ARUM_ADD_CD_T%>'
<%
			}

			if(! ARUM_PRO_CD_T.equals("")) {
%>
		 		ARUM_PRO_CD='<%= ARUM_PRO_CD_T%>'
<%
			}

			if(! ARUM_COM_CD_T.equals("")) {
%>
		 		ARUM_COM_CD='<%= ARUM_COM_CD_T%>'
<%
			}

			if(! ARUM_PRICE_T.equals("")) {
%>
		 		ARUM_PRICE='<%= ARUM_PRICE_T%>'
<%
			}

			if(! UB_SEX_T.equals("")) {
%>
		 		UB_SEX='<%= UB_SEX_T%>'
<%
			}

			if(! UB_YEAR_T.equals("")) {
%>
		 		UB_YEAR='<%= UB_YEAR_T%>'
<%
			}

			if(! ARUM_SP_YN_T.equals("")) {
%>
		 		ARUM_SP_YN='<%= ARUM_SP_YN_T%>'
<%
			}

			if(! ARUM_USE_YN_T.equals("")) {
%>
		 		ARUM_USE_YN='<%= ARUM_USE_YN_T%>'
<%
			}

			if(! UB_USE_YN_T.equals("")) {
%>
		 		UB_USE_YN='<%= UB_USE_YN_T%>'
<%
			}

			if(! UB_DIRECT_YN_T.equals("")) {
%>
		 		UB_DIRECT_YN='<%= UB_DIRECT_YN_T%>'
<%
			}

			if(! UB_DIRECT_JONGGUM_YN_T.equals("")) {
%>
		 		UB_DIRECT_JONGGUM_YN='<%= UB_DIRECT_JONGGUM_YN_T%>'
<%
			}

			if(! UB_DIRECT_DATE_FROM_T.equals("")) {
%>
		 		UB_DIRECT_DATE_FROM='<%= UB_DIRECT_DATE_FROM_T%>'
<%
			}

			if(! UB_DIRECT_DATE_TO_T.equals("")) {
%>
		 		UB_DIRECT_DATE_TO='<%= UB_DIRECT_DATE_TO_T%>'
<%
			}

			if(! UB_DIRECT_GUM_YN_T.equals("")) {
%>
		 		UB_DIRECT_GUM_YN='<%= UB_DIRECT_GUM_YN_T%>'
<%
			}

			if(! UB_DIRECT_SEND_YN_T.equals("")) {
%>
		 		UB_DIRECT_SEND_YN='<%= UB_DIRECT_SEND_YN_T%>'
<%
			}

			if(! UB_CARE_PACKAGE_TYPE_T.equals("")) {
%>
		 		UB_CARE_PACKAGE_TYPE='<%= UB_CARE_PACKAGE_TYPE_T%>'
<%
			}

			if(! UB_CARE_MIN_CNT_T.equals("")) {
%>
		 		UB_CARE_MIN_CNT='<%= UB_CARE_MIN_CNT_T%>'
<%
			}

			if(! UB_CARE_SELECT_COMP_T.equals("")) {
%>
		 		UB_CARE_SELECT_COMP='<%= UB_CARE_SELECT_COMP_T%>'
<%
			}

			if(! UB_USE_YN2_T.equals("")) {
%>
		 		UB_USE_YN2='<%= UB_USE_YN2_T%>'
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
