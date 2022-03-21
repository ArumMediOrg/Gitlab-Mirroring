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
		String RZ_CHKD = htMethod.get("RZ_CHKD");

		//
		if(MARK_CLASS == null) { MARK_CLASS = ""; }
		if(RZ_CHKD == null) { RZ_CHKD = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

 SELECT                                                                                                                                                        
    VVM_MARK_CLASS, VVM_VIEW_SQ,                                                                                                                               
    VVM_VIEW_CD1,VVM_VIEW_CD2,VVM_VIEW_CD3,VVM_VIEW_CD4,VVM_VIEW_CD5,VVM_VIEW_CD6,VVM_VIEW_NO,                                                                 
    VVM_VIEW_TY,VVM_VIEW_MEMO_KR,VVM_ITEM_CNT,                                                                                                                 
    (SELECT CCN_SMALL||'-'||CCN_FULL_NM from CT_COMMON WHERE CCN_LARGE = '0219' AND SUBSTR(CCN_SMALL,2,1) = VVM_FOR_KD AND CCN_LEVEL = '5' ) VVM_FOR_KD,
    (select CCN_SMALL||'-'||CCN_FULL_NM from CT_COMMON where CCN_LARGE = '0216' and CCN_SMALL = VVM_AFTE_CD) VVM_AFTE_CD ,                                   
    (select SUBSTR(CCN_SMALL,3,2)||'-'||CCN_FULL_NM from CT_COMMON where CCN_LARGE = '0217' and CCN_SMALL = VVM_AFTE_CD||VVM_CLIC_CD) VVM_CLIC_CD,         
    VVM_EQUP_TR,VVM_AFTE_MON,VVM_MEMO_REF,VVM_USE_YN,VVM_AUTO_YN,                                                                                              
    VVM_NUSE_ID,VVM_NUSE_DTT,VVM_INPT_ID,VVM_INPT_DTT,VVM_MODI_ID,VVM_MODI_DTT,                                                                                
    VVM_MARK_ADD_TX,VVM_DEV_ADD_TX,VVM_FOR_RATE                                                                                                                
 FROM VT_VIEW_MAGE                                                                                                                                              
 WHERE VVM_MARK_CLASS = :MARK_CLASS
 if :rz_chkd = '1' then
    AND VVM_USE_YN = 'Y'
else if :rz_chkd = '2' then
    AND VVM_USE_YN = 'N'
 order by VVM_MARK_CLASS,VVM_VIEW_CD1,VVM_VIEW_CD2,VVM_VIEW_CD3,VVM_VIEW_CD4,VVM_VIEW_CD5,VVM_VIEW_CD6,VVM_VIEW_NO 

		*/

		sql = " SELECT VVM_MARK_CLASS, VVM_VIEW_SQ, VVM_VIEW_CD1,VVM_VIEW_CD2,VVM_VIEW_CD3,VVM_VIEW_CD4,VVM_VIEW_CD5,VVM_VIEW_CD6,VVM_VIEW_NO, VVM_VIEW_TY,VVM_VIEW_MEMO_KR,VVM_ITEM_CNT";
		sql += ", (";
		sql += "	SELECT CCN_SMALL||'-'||CCN_FULL_NM";
		sql += " 	FROM CT_COMMON";
		sql += " 	WHERE CCN_LARGE = '0219'";
		sql += " 	AND SUBSTR(CCN_SMALL,2,1) = VVM_FOR_KD";
		sql += " 	AND CCN_LEVEL = '5'";
		sql += ") VVM_FOR_KD";
		sql += ", (";
		sql += "	SELECT CCN_SMALL||'-'||CCN_FULL_NM";
		sql += " 	FROM CT_COMMON";
		sql += " 	WHERE CCN_LARGE = '0216'";
		sql += " 	AND CCN_SMALL = VVM_AFTE_CD";
		sql += ") VVM_AFTE_CD";
		sql += ", (";
		sql += "	SELECT SUBSTR(CCN_SMALL,3,2)||'-'||CCN_FULL_NM";
		sql += " 	FROM CT_COMMON";
		sql += " 	WHERE CCN_LARGE = '0217'";
		sql += " 	AND CCN_SMALL = VVM_AFTE_CD||VVM_CLIC_CD";
		sql += ") VVM_CLIC_CD";
		sql += ", VVM_EQUP_TR,VVM_AFTE_MON,VVM_MEMO_REF,VVM_USE_YN,VVM_AUTO_YN, VVM_NUSE_ID,VVM_NUSE_DTT,VVM_INPT_ID,VVM_INPT_DTT,VVM_MODI_ID,VVM_MODI_DTT, VVM_MARK_ADD_TX,VVM_DEV_ADD_TX,VVM_FOR_RATE";
		sql += " FROM VT_VIEW_MAGE";
		sql += " WHERE VVM_MARK_CLASS = '" + MARK_CLASS + "'";

   
		if(RZ_CHKD.equals("1")) {
			sql += " AND VVM_USE_YN = 'Y'";
		}
		else if(RZ_CHKD.equals("2")) {
			sql += " AND VVM_USE_YN = 'N'";
		}

		sql += " ORDER BY VVM_MARK_CLASS,VVM_VIEW_CD1,VVM_VIEW_CD2,VVM_VIEW_CD3,VVM_VIEW_CD4,VVM_VIEW_CD5,VVM_VIEW_CD6,VVM_VIEW_NO";
			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uVT1000_upGetFinding_001 \n";
			G_INFO += "설명 : 임상결과값 로딩 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " MARK_CLASS : " + MARK_CLASS + " \n";
			G_INFO += " RZ_CHKD : " + RZ_CHKD + " \n";
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
		<s:AttributeType name='VVM_VIEW_CD2' rs:number='4' rs:nullable='true' rs:writeunknown='true' rs:basetable='VT_VIEW_MAGE'
			 rs:basecolumn='VVM_VIEW_CD2'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='VVM_VIEW_CD3' rs:number='5' rs:nullable='true' rs:writeunknown='true' rs:basetable='VT_VIEW_MAGE'
			 rs:basecolumn='VVM_VIEW_CD3'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='VVM_VIEW_CD4' rs:number='6' rs:nullable='true' rs:writeunknown='true' rs:basetable='VT_VIEW_MAGE'
			 rs:basecolumn='VVM_VIEW_CD4'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='VVM_VIEW_CD5' rs:number='7' rs:nullable='true' rs:writeunknown='true' rs:basetable='VT_VIEW_MAGE'
			 rs:basecolumn='VVM_VIEW_CD5'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='VVM_VIEW_CD6' rs:number='8' rs:nullable='true' rs:writeunknown='true' rs:basetable='VT_VIEW_MAGE'
			 rs:basecolumn='VVM_VIEW_CD6'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='VVM_VIEW_NO' rs:number='9' rs:nullable='true' rs:writeunknown='true' rs:basetable='VT_VIEW_MAGE'
			 rs:basecolumn='VVM_VIEW_NO'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='3' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='VVM_VIEW_TY' rs:number='10' rs:nullable='true' rs:writeunknown='true' rs:basetable='VT_VIEW_MAGE'
			 rs:basecolumn='VVM_VIEW_TY'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='VVM_VIEW_MEMO_KR' rs:number='11' rs:nullable='true' rs:writeunknown='true' rs:basetable='VT_VIEW_MAGE'
			 rs:basecolumn='VVM_VIEW_MEMO_KR'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='VVM_ITEM_CNT' rs:number='12' rs:nullable='true' rs:writeunknown='true' rs:basetable='VT_VIEW_MAGE'
			 rs:basecolumn='VVM_ITEM_CNT'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='3' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='VVM_FOR_KD' rs:number='13' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='321'/>
		</s:AttributeType>
		<s:AttributeType name='VVM_AFTE_CD' rs:number='14' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='321'/>
		</s:AttributeType>
		<s:AttributeType name='VVM_CLIC_CD' rs:number='15' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='305'/>
		</s:AttributeType>
		<s:AttributeType name='VVM_EQUP_TR' rs:number='16' rs:nullable='true' rs:writeunknown='true' rs:basetable='VT_VIEW_MAGE'
			 rs:basecolumn='VVM_EQUP_TR'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='VVM_AFTE_MON' rs:number='17' rs:nullable='true' rs:writeunknown='true' rs:basetable='VT_VIEW_MAGE'
			 rs:basecolumn='VVM_AFTE_MON'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='3' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='VVM_MEMO_REF' rs:number='18' rs:nullable='true' rs:writeunknown='true' rs:basetable='VT_VIEW_MAGE'
			 rs:basecolumn='VVM_MEMO_REF'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='VVM_USE_YN' rs:number='19' rs:nullable='true' rs:writeunknown='true' rs:basetable='VT_VIEW_MAGE'
			 rs:basecolumn='VVM_USE_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='VVM_AUTO_YN' rs:number='20' rs:nullable='true' rs:writeunknown='true' rs:basetable='VT_VIEW_MAGE'
			 rs:basecolumn='VVM_AUTO_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='VVM_NUSE_ID' rs:number='21' rs:nullable='true' rs:writeunknown='true' rs:basetable='VT_VIEW_MAGE'
			 rs:basecolumn='VVM_NUSE_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='VVM_NUSE_DTT' rs:number='22' rs:nullable='true' rs:writeunknown='true' rs:basetable='VT_VIEW_MAGE'
			 rs:basecolumn='VVM_NUSE_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='VVM_INPT_ID' rs:number='23' rs:nullable='true' rs:writeunknown='true' rs:basetable='VT_VIEW_MAGE'
			 rs:basecolumn='VVM_INPT_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='VVM_INPT_DTT' rs:number='24' rs:nullable='true' rs:writeunknown='true' rs:basetable='VT_VIEW_MAGE'
			 rs:basecolumn='VVM_INPT_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='VVM_MODI_ID' rs:number='25' rs:nullable='true' rs:writeunknown='true' rs:basetable='VT_VIEW_MAGE'
			 rs:basecolumn='VVM_MODI_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='VVM_MODI_DTT' rs:number='26' rs:nullable='true' rs:writeunknown='true' rs:basetable='VT_VIEW_MAGE'
			 rs:basecolumn='VVM_MODI_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='VVM_MARK_ADD_TX' rs:number='27' rs:nullable='true' rs:writeunknown='true' rs:basetable='VT_VIEW_MAGE'
			 rs:basecolumn='VVM_MARK_ADD_TX'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='VVM_DEV_ADD_TX' rs:number='28' rs:nullable='true' rs:writeunknown='true' rs:basetable='VT_VIEW_MAGE'
			 rs:basecolumn='VVM_DEV_ADD_TX'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='VVM_FOR_RATE' rs:number='29' rs:nullable='true' rs:writeunknown='true' rs:basetable='VT_VIEW_MAGE'
			 rs:basecolumn='VVM_FOR_RATE'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='3' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='30' rs:rowid='true' rs:basetable='VT_VIEW_MAGE' rs:basecolumn='ROWID'
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

			String VVM_MARK_CLASS_T = cRsList.getString("VVM_MARK_CLASS");
			String VVM_VIEW_SQ_T = cRsList.getString("VVM_VIEW_SQ");
			String VVM_VIEW_CD1_T = cRsList.getString("VVM_VIEW_CD1");
			String VVM_VIEW_CD2_T = cRsList.getString("VVM_VIEW_CD2");
			String VVM_VIEW_CD3_T = cRsList.getString("VVM_VIEW_CD3");
			String VVM_VIEW_CD4_T = cRsList.getString("VVM_VIEW_CD4");
			String VVM_VIEW_CD5_T = cRsList.getString("VVM_VIEW_CD5");
			String VVM_VIEW_CD6_T = cRsList.getString("VVM_VIEW_CD6");
			String VVM_VIEW_NO_T = cRsList.getString("VVM_VIEW_NO");
			String VVM_VIEW_TY_T = cRsList.getString("VVM_VIEW_TY");
			String VVM_VIEW_MEMO_KR_T = cRsList.getString("VVM_VIEW_MEMO_KR");
			String VVM_ITEM_CNT_T = cRsList.getString("VVM_ITEM_CNT");
			String VVM_FOR_KD_T = cRsList.getString("VVM_FOR_KD");
			String VVM_AFTE_CD_T = cRsList.getString("VVM_AFTE_CD");
			String VVM_CLIC_CD_T = cRsList.getString("VVM_CLIC_CD");
			String VVM_EQUP_TR_T = cRsList.getString("VVM_EQUP_TR");
			String VVM_AFTE_MON_T = cRsList.getString("VVM_AFTE_MON");
			String VVM_MEMO_REF_T = cRsList.getString("VVM_MEMO_REF");
			String VVM_USE_YN_T = cRsList.getString("VVM_USE_YN");
			String VVM_AUTO_YN_T = cRsList.getString("VVM_AUTO_YN");
			String VVM_NUSE_ID_T = cRsList.getString("VVM_NUSE_ID");
			String VVM_NUSE_DTT_T = cRsList.getDate2("VVM_NUSE_DTT");
			String VVM_INPT_ID_T = cRsList.getString("VVM_INPT_ID");
			String VVM_INPT_DTT_T = cRsList.getDate2("VVM_INPT_DTT");
			String VVM_MODI_ID_T = cRsList.getString("VVM_MODI_ID");
			String VVM_MODI_DTT_T = cRsList.getDate2("VVM_MODI_DTT");
			String VVM_MARK_ADD_TX_T = cRsList.getString("VVM_MARK_ADD_TX");
			String VVM_DEV_ADD_TX_T = cRsList.getString("VVM_DEV_ADD_TX");
			String VVM_FOR_RATE_T = cRsList.getString("VVM_FOR_RATE");
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

			if(! VVM_VIEW_CD2_T.equals("")) {
%>
		 		VVM_VIEW_CD2='<%= VVM_VIEW_CD2_T%>'
<%
			}

			if(! VVM_VIEW_CD3_T.equals("")) {
%>
		 		VVM_VIEW_CD3='<%= VVM_VIEW_CD3_T%>'
<%
			}

			if(! VVM_VIEW_CD4_T.equals("")) {
%>
		 		VVM_VIEW_CD4='<%= VVM_VIEW_CD4_T%>'
<%
			}

			if(! VVM_VIEW_CD5_T.equals("")) {
%>
		 		VVM_VIEW_CD5='<%= VVM_VIEW_CD5_T%>'
<%
			}

			if(! VVM_VIEW_CD6_T.equals("")) {
%>
		 		VVM_VIEW_CD6='<%= VVM_VIEW_CD6_T%>'
<%
			}

			if(! VVM_VIEW_NO_T.equals("")) {
%>
		 		VVM_VIEW_NO='<%= VVM_VIEW_NO_T%>'
<%
			}

			if(! VVM_VIEW_TY_T.equals("")) {
%>
		 		VVM_VIEW_TY='<%= VVM_VIEW_TY_T%>'
<%
			}

			if(! VVM_VIEW_MEMO_KR_T.equals("")) {
%>
		 		VVM_VIEW_MEMO_KR='<%= VVM_VIEW_MEMO_KR_T%>'
<%
			}

			if(! VVM_ITEM_CNT_T.equals("")) {
%>
		 		VVM_ITEM_CNT='<%= VVM_ITEM_CNT_T%>'
<%
			}

			if(! VVM_FOR_KD_T.equals("")) {
%>
		 		VVM_FOR_KD='<%= VVM_FOR_KD_T%>'
<%
			}

			if(! VVM_AFTE_CD_T.equals("")) {
%>
		 		VVM_AFTE_CD='<%= VVM_AFTE_CD_T%>'
<%
			}

			if(! VVM_CLIC_CD_T.equals("")) {
%>
		 		VVM_CLIC_CD='<%= VVM_CLIC_CD_T%>'
<%
			}

			if(! VVM_EQUP_TR_T.equals("")) {
%>
		 		VVM_EQUP_TR='<%= VVM_EQUP_TR_T%>'
<%
			}

			if(! VVM_AFTE_MON_T.equals("")) {
%>
		 		VVM_AFTE_MON='<%= VVM_AFTE_MON_T%>'
<%
			}

			if(! VVM_MEMO_REF_T.equals("")) {
%>
		 		VVM_MEMO_REF='<%= VVM_MEMO_REF_T%>'
<%
			}

			if(! VVM_USE_YN_T.equals("")) {
%>
		 		VVM_USE_YN='<%= VVM_USE_YN_T%>'
<%
			}

			if(! VVM_AUTO_YN_T.equals("")) {
%>
		 		VVM_AUTO_YN='<%= VVM_AUTO_YN_T%>'
<%
			}

			if(! VVM_NUSE_ID_T.equals("")) {
%>
		 		VVM_NUSE_ID='<%= VVM_NUSE_ID_T%>'
<%
			}

			if(! VVM_NUSE_DTT_T.equals("")) {
%>
		 		VVM_NUSE_DTT='<%= VVM_NUSE_DTT_T%>'
<%
			}

			if(! VVM_INPT_ID_T.equals("")) {
%>
		 		VVM_INPT_ID='<%= VVM_INPT_ID_T%>'
<%
			}

			if(! VVM_INPT_DTT_T.equals("")) {
%>
		 		VVM_INPT_DTT='<%= VVM_INPT_DTT_T%>'
<%
			}

			if(! VVM_MODI_ID_T.equals("")) {
%>
		 		VVM_MODI_ID='<%= VVM_MODI_ID_T%>'
<%
			}

			if(! VVM_MODI_DTT_T.equals("")) {
%>
		 		VVM_MODI_DTT='<%= VVM_MODI_DTT_T%>'
<%
			}

			if(! VVM_MARK_ADD_TX_T.equals("")) {
%>
		 		VVM_MARK_ADD_TX='<%= VVM_MARK_ADD_TX_T%>'
<%
			}

			if(! VVM_DEV_ADD_TX_T.equals("")) {
%>
		 		VVM_DEV_ADD_TX='<%= VVM_DEV_ADD_TX_T%>'
<%
			}

			if(! VVM_FOR_RATE_T.equals("")) {
%>
		 		VVM_FOR_RATE='<%= VVM_FOR_RATE_T%>'
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
