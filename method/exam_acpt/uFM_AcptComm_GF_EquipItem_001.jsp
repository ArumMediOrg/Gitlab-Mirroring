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

		String ITEM_LT = htMethod.get("ITEM_LT");
		String EQUI_CD = htMethod.get("EQUI_CD");
		String EQUI_NM = htMethod.get("EQUI_NM");
		String EXAM_TM = htMethod.get("EXAM_TM");

		//
		if(ITEM_LT == null) { ITEM_LT = ""; }
		if(EQUI_CD == null) { EQUI_CD = ""; }
		if(EQUI_NM == null) { EQUI_NM = ""; }
		if(EXAM_TM == null) { EXAM_TM = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT RRE_EQUI_CD, RRE_EQUI_NM, RRE_ITEM_LT,
       F_ITEM_FIND('', :ITEM_LT, 'K') AS RRE_ITEM_NM 
  FROM RT_RSVT_EQUIP 
 WHERE RRE_ITEM_LT LIKE '%'||:ITEM_LT||'%'
   AND UPPER(RRE_USE_YN) = 'Y';

if (:EQUI_CD = '0X') then
   AND RRE_EQUI_CD <> '00'

if (:EQUI_NM <> '') then
   AND RRE_EQUI_NM = :EQUI_NM

if (:EXAM_TM <> '') then
begin
   AND ((RRE_WDAM_STM <= :EXAM_TM AND RRE_WDAM_ETM >= :EXAM_TM
    OR  (RRE_WDPM_STM <= :EXAM_TM AND RRE_WDPM_ETM >= :EXAM_TM
    OR  (RRE_WKAM_STM <= :EXAM_TM AND RRE_WKAM_ETM >= :EXAM_TM
end;

 ORDER BY RRE_EQUI_CD;

		*/

		sql = " SELECT RRE_EQUI_CD, RRE_EQUI_NM, RRE_ITEM_LT, F_ITEM_FIND('', '" + ITEM_LT + "', 'K') AS RRE_ITEM_NM";
		sql += " FROM RT_RSVT_EQUIP";
		sql += " WHERE RRE_ITEM_LT LIKE '%" + ITEM_LT + "%'";
		sql += " AND UPPER(RRE_USE_YN) = 'Y'";

		if(EQUI_CD.equals("0X")) {
			sql += " AND RRE_EQUI_CD <> '00'";
		}

		if(! EQUI_NM.equals("")) {
			sql += " AND RRE_EQUI_NM = '" + EQUI_NM + "'";
		}

		if(! EXAM_TM.equals("")) {
			sql += " AND (";
			sql += "	   (RRE_WDAM_STM <= '" + EXAM_TM + "' AND RRE_WDAM_ETM >= '" + EXAM_TM + "')";
			sql += "	OR (RRE_WDPM_STM <= '" + EXAM_TM + "' AND RRE_WDPM_ETM >= '" + EXAM_TM + "')";
			sql += " 	OR (RRE_WKAM_STM <= '" + EXAM_TM + "' AND RRE_WKAM_ETM >= '" + EXAM_TM + "')";
			sql += " )";
		}

		sql += "ORDER BY RRE_EQUI_CD";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uFM_AcptComm_GF_EquipItem_001 \n";
			G_INFO += "설명 : 예약장비항목조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " ITEM_LT : " + ITEM_LT + " \n";
			G_INFO += " EQUI_CD : " + EQUI_CD + " \n";
			G_INFO += " EQUI_NM : " + EQUI_NM + " \n";
			G_INFO += " EXAM_TM : " + EXAM_TM + " \n";
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
		<s:AttributeType name='RRE_EQUI_CD' rs:number='1' rs:writeunknown='true' rs:basetable='RT_RSVT_EQUIP' rs:basecolumn='RRE_EQUI_CD'>
			<s:datatype dt:type='string' dt:maxLength='2' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='RRE_EQUI_NM' rs:number='2' rs:writeunknown='true' rs:basetable='RT_RSVT_EQUIP' rs:basecolumn='RRE_EQUI_NM'>
			<s:datatype dt:type='string' dt:maxLength='100' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='RRE_ITEM_LT' rs:number='3' rs:writeunknown='true' rs:basetable='RT_RSVT_EQUIP' rs:basecolumn='RRE_ITEM_LT'>
			<s:datatype dt:type='string' dt:maxLength='400' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='RRE_ITEM_NM' rs:number='4' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='5' rs:rowid='true' rs:basetable='RT_RSVT_EQUIP' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:extends type='rs:rowbase'/>
	</s:ElementType>
</s:Schema>		<rs:data>
<%
		int cnt = 0;
		while(cRsList.next()) {

			cnt++;

			String RRE_EQUI_CD_T = cRsList.getString("RRE_EQUI_CD");
			String RRE_EQUI_NM_T = cRsList.getString("RRE_EQUI_NM");
			String RRE_ITEM_LT_T = cRsList.getString("RRE_ITEM_LT");
			String RRE_ITEM_NM_T = cRsList.getString("RRE_ITEM_NM");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! RRE_EQUI_CD_T.equals("")) {
%>
		 		RRE_EQUI_CD='<%= RRE_EQUI_CD_T%>'
<%
			}

			if(! RRE_EQUI_NM_T.equals("")) {
%>
		 		RRE_EQUI_NM='<%= RRE_EQUI_NM_T%>'
<%
			}

			if(! RRE_ITEM_LT_T.equals("")) {
%>
		 		RRE_ITEM_LT='<%= RRE_ITEM_LT_T%>'
<%
			}

			if(! RRE_ITEM_NM_T.equals("")) {
%>
		 		RRE_ITEM_NM='<%= RRE_ITEM_NM_T%>'
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
