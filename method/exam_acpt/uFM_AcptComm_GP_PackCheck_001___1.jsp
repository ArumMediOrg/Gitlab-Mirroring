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

		String FIND_CD = htMethod.get("FIND_CD");
		String FIND_SQ = htMethod.get("FIND_SQ");
		String FIND_LT = htMethod.get("FIND_LT");

		//
		if(FIND_CD == null) { FIND_CD = ""; }
		if(FIND_SQ == null) { FIND_SQ = ""; }
		if(FIND_LT == null) { FIND_LT = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

  SELECT * 
    FROM ET_PACK 
   WHERE EPK_EXAM_CD = :FIND_CD
     AND EPK_PACK_SQ = :FIND_SQ
     AND EPK_ITEM_LT LIKE %||:FIND_LT||%
     AND UPPER(EPK_USE_YN) = 'Y'  SELECT * 
    FROM ET_PACK 
   WHERE EPK_EXAM_CD = :FIND_CD
     AND EPK_PACK_SQ = :FIND_SQ
     AND EPK_ITEM_LT LIKE %||:FIND_LT||%
     AND UPPER(EPK_USE_YN) = 'Y'  SELECT * 
    FROM ET_PACK 
   WHERE EPK_EXAM_CD = :FIND_CD
     AND EPK_PACK_SQ = :FIND_SQ
     AND EPK_ITEM_LT LIKE %||:FIND_LT||%
     AND UPPER(EPK_USE_YN) = 'Y'
		*/

		sql = " SELECT *";
		sql += " FROM ET_PACK";
		sql += " WHERE EPK_EXAM_CD = '" + FIND_CD + "'";
		sql += " AND EPK_PACK_SQ = '" + FIND_SQ + "'";
		sql += " AND EPK_ITEM_LT LIKE '%" + FIND_LT + "%'";
		sql += " AND UPPER(EPK_USE_YN) = 'Y'";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uFM_AcptComm_GP_PackCheck_001___1 \n";
			G_INFO += "설명 : 개별/사업장 묶음 검사___1 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " FIND_CD : " + FIND_CD + " \n";
			G_INFO += " FIND_SQ : " + FIND_SQ + " \n";
			G_INFO += " FIND_LT : " + FIND_LT + " \n";
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
		<s:AttributeType name='EPK_EXAM_CD' rs:number='1' rs:writeunknown='true' rs:basetable='ET_PACK' rs:basecolumn='EPK_EXAM_CD'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EPK_PACK_SQ' rs:number='2' rs:writeunknown='true' rs:basetable='ET_PACK' rs:basecolumn='EPK_PACK_SQ'>
			<s:datatype dt:type='string' dt:maxLength='5' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EPK_PACK_NM' rs:number='3' rs:writeunknown='true' rs:basetable='ET_PACK' rs:basecolumn='EPK_PACK_NM'>
			<s:datatype dt:type='string' dt:maxLength='200' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EPK_PACK_SDT' rs:number='4' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_PACK'
			 rs:basecolumn='EPK_PACK_SDT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EPK_PACK_EDT' rs:number='5' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_PACK'
			 rs:basecolumn='EPK_PACK_EDT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EPK_SEX_CD' rs:number='6' rs:writeunknown='true' rs:basetable='ET_PACK' rs:basecolumn='EPK_SEX_CD'>
			<s:datatype dt:type='string' dt:maxLength='1' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EPK_CALC_CD' rs:number='7' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_PACK'
			 rs:basecolumn='EPK_CALC_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EPK_CALC_PR' rs:number='8' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_PACK'
			 rs:basecolumn='EPK_CALC_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EPK_SALE_PR' rs:number='9' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_PACK'
			 rs:basecolumn='EPK_SALE_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EPK_GRUP_PR' rs:number='10' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_PACK'
			 rs:basecolumn='EPK_GRUP_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EPK_COUP_PR' rs:number='11' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_PACK'
			 rs:basecolumn='EPK_COUP_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EPK_FAMY_PR' rs:number='12' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_PACK'
			 rs:basecolumn='EPK_FAMY_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EPK_CUPN_PR' rs:number='13' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_PACK'
			 rs:basecolumn='EPK_CUPN_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EPK_MMBR_PR' rs:number='14' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_PACK'
			 rs:basecolumn='EPK_MMBR_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EPK_OPTN_PR' rs:number='15' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_PACK'
			 rs:basecolumn='EPK_OPTN_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EPK_CNCL_CD' rs:number='16' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_PACK'
			 rs:basecolumn='EPK_CNCL_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EPK_OPTN_YN' rs:number='17' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_PACK'
			 rs:basecolumn='EPK_OPTN_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EPK_ITEM_LT' rs:number='18' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_PACK'
			 rs:basecolumn='EPK_ITEM_LT'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='EPK_PACK_DT' rs:number='19' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_PACK'
			 rs:basecolumn='EPK_PACK_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EPK_PACK_TX' rs:number='20' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_PACK'
			 rs:basecolumn='EPK_PACK_TX'>
			<s:datatype dt:type='string' dt:maxLength='1000'/>
		</s:AttributeType>
		<s:AttributeType name='EPK_USE_YN' rs:number='21' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_PACK'
			 rs:basecolumn='EPK_USE_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EPK_NUSE_ID' rs:number='22' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_PACK'
			 rs:basecolumn='EPK_NUSE_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='EPK_NUSE_DTT' rs:number='23' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_PACK'
			 rs:basecolumn='EPK_NUSE_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EPK_INPT_ID' rs:number='24' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_PACK'
			 rs:basecolumn='EPK_INPT_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='EPK_INPT_DTT' rs:number='25' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_PACK'
			 rs:basecolumn='EPK_INPT_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EPK_MODI_ID' rs:number='26' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_PACK'
			 rs:basecolumn='EPK_MODI_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='EPK_MODI_DTT' rs:number='27' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_PACK'
			 rs:basecolumn='EPK_MODI_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EPK_TRNS_ID' rs:number='28' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_PACK'
			 rs:basecolumn='EPK_TRNS_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='EPK_TRNS_DTT' rs:number='29' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_PACK'
			 rs:basecolumn='EPK_TRNS_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EPK_ORGA_CD' rs:number='30' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_PACK'
			 rs:basecolumn='EPK_ORGA_CD'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='UB_SEX' rs:number='31' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_PACK'
			 rs:basecolumn='UB_SEX'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='UB_PACKAGE' rs:number='32' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_PACK'
			 rs:basecolumn='UB_PACKAGE'>
			<s:datatype dt:type='string' dt:maxLength='18'/>
		</s:AttributeType>
		<s:AttributeType name='UB_PACKAGE_TYPE' rs:number='33' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_PACK'
			 rs:basecolumn='UB_PACKAGE_TYPE'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='UB_YEAR' rs:number='34' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_PACK'
			 rs:basecolumn='UB_YEAR'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='35' rs:rowid='true' rs:writeunknown='true' rs:basetable='ET_PACK'
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

			String EPK_EXAM_CD_T = cRsList.getString("EPK_EXAM_CD");
			String EPK_PACK_SQ_T = cRsList.getString("EPK_PACK_SQ");
			String EPK_PACK_NM_T = cRsList.getString("EPK_PACK_NM");
			String EPK_PACK_SDT_T = cRsList.getString("EPK_PACK_SDT");
			String EPK_PACK_EDT_T = cRsList.getString("EPK_PACK_EDT");
			String EPK_SEX_CD_T = cRsList.getString("EPK_SEX_CD");
			String EPK_CALC_CD_T = cRsList.getString("EPK_CALC_CD");
			String EPK_CALC_PR_T = cRsList.getString("EPK_CALC_PR");
			String EPK_SALE_PR_T = cRsList.getString("EPK_SALE_PR");
			String EPK_GRUP_PR_T = cRsList.getString("EPK_GRUP_PR");
			String EPK_COUP_PR_T = cRsList.getString("EPK_COUP_PR");
			String EPK_FAMY_PR_T = cRsList.getString("EPK_FAMY_PR");
			String EPK_CUPN_PR_T = cRsList.getString("EPK_CUPN_PR");
			String EPK_MMBR_PR_T = cRsList.getString("EPK_MMBR_PR");
			String EPK_OPTN_PR_T = cRsList.getString("EPK_OPTN_PR");
			String EPK_CNCL_CD_T = cRsList.getString("EPK_CNCL_CD");
			String EPK_OPTN_YN_T = cRsList.getString("EPK_OPTN_YN");
			String EPK_ITEM_LT_T = cRsList.getString("EPK_ITEM_LT");
			String EPK_PACK_DT_T = cRsList.getString("EPK_PACK_DT");
			String EPK_PACK_TX_T = cRsList.getString("EPK_PACK_TX");
			String EPK_USE_YN_T = cRsList.getString("EPK_USE_YN");
			String EPK_NUSE_ID_T = cRsList.getString("EPK_NUSE_ID");
			String EPK_NUSE_DTT_T = cRsList.getDate2("EPK_NUSE_DTT");
			String EPK_INPT_ID_T = cRsList.getString("EPK_INPT_ID");
			String EPK_INPT_DTT_T = cRsList.getDate2("EPK_INPT_DTT");
			String EPK_MODI_ID_T = cRsList.getString("EPK_MODI_ID");
			String EPK_MODI_DTT_T = cRsList.getDate2("EPK_MODI_DTT");
			String EPK_TRNS_ID_T = cRsList.getString("EPK_TRNS_ID");
			String EPK_TRNS_DTT_T = cRsList.getDate2("EPK_TRNS_DTT");
			String EPK_ORGA_CD_T = cRsList.getString("EPK_ORGA_CD");
			String UB_SEX_T = cRsList.getString("UB_SEX");
			String UB_PACKAGE_T = cRsList.getString("UB_PACKAGE");
			String UB_PACKAGE_TYPE_T = cRsList.getString("UB_PACKAGE_TYPE");
			String UB_YEAR_T = cRsList.getString("UB_YEAR");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! EPK_EXAM_CD_T.equals("")) {
%>
		 		EPK_EXAM_CD='<%= EPK_EXAM_CD_T%>'
<%
			}

			if(! EPK_PACK_SQ_T.equals("")) {
%>
		 		EPK_PACK_SQ='<%= EPK_PACK_SQ_T%>'
<%
			}

			if(! EPK_PACK_NM_T.equals("")) {
%>
		 		EPK_PACK_NM='<%= EPK_PACK_NM_T%>'
<%
			}

			if(! EPK_PACK_SDT_T.equals("")) {
%>
		 		EPK_PACK_SDT='<%= EPK_PACK_SDT_T%>'
<%
			}

			if(! EPK_PACK_EDT_T.equals("")) {
%>
		 		EPK_PACK_EDT='<%= EPK_PACK_EDT_T%>'
<%
			}

			if(! EPK_SEX_CD_T.equals("")) {
%>
		 		EPK_SEX_CD='<%= EPK_SEX_CD_T%>'
<%
			}

			if(! EPK_CALC_CD_T.equals("")) {
%>
		 		EPK_CALC_CD='<%= EPK_CALC_CD_T%>'
<%
			}

			if(! EPK_CALC_PR_T.equals("")) {
%>
		 		EPK_CALC_PR='<%= EPK_CALC_PR_T%>'
<%
			}

			if(! EPK_SALE_PR_T.equals("")) {
%>
		 		EPK_SALE_PR='<%= EPK_SALE_PR_T%>'
<%
			}

			if(! EPK_GRUP_PR_T.equals("")) {
%>
		 		EPK_GRUP_PR='<%= EPK_GRUP_PR_T%>'
<%
			}

			if(! EPK_COUP_PR_T.equals("")) {
%>
		 		EPK_COUP_PR='<%= EPK_COUP_PR_T%>'
<%
			}

			if(! EPK_FAMY_PR_T.equals("")) {
%>
		 		EPK_FAMY_PR='<%= EPK_FAMY_PR_T%>'
<%
			}

			if(! EPK_CUPN_PR_T.equals("")) {
%>
		 		EPK_CUPN_PR='<%= EPK_CUPN_PR_T%>'
<%
			}

			if(! EPK_MMBR_PR_T.equals("")) {
%>
		 		EPK_MMBR_PR='<%= EPK_MMBR_PR_T%>'
<%
			}

			if(! EPK_OPTN_PR_T.equals("")) {
%>
		 		EPK_OPTN_PR='<%= EPK_OPTN_PR_T%>'
<%
			}

			if(! EPK_CNCL_CD_T.equals("")) {
%>
		 		EPK_CNCL_CD='<%= EPK_CNCL_CD_T%>'
<%
			}

			if(! EPK_OPTN_YN_T.equals("")) {
%>
		 		EPK_OPTN_YN='<%= EPK_OPTN_YN_T%>'
<%
			}

			if(! EPK_ITEM_LT_T.equals("")) {
%>
		 		EPK_ITEM_LT='<%= EPK_ITEM_LT_T%>'
<%
			}

			if(! EPK_PACK_DT_T.equals("")) {
%>
		 		EPK_PACK_DT='<%= EPK_PACK_DT_T%>'
<%
			}

			if(! EPK_PACK_TX_T.equals("")) {
%>
		 		EPK_PACK_TX='<%= EPK_PACK_TX_T%>'
<%
			}

			if(! EPK_USE_YN_T.equals("")) {
%>
		 		EPK_USE_YN='<%= EPK_USE_YN_T%>'
<%
			}

			if(! EPK_NUSE_ID_T.equals("")) {
%>
		 		EPK_NUSE_ID='<%= EPK_NUSE_ID_T%>'
<%
			}

			if(! EPK_NUSE_DTT_T.equals("")) {
%>
		 		EPK_NUSE_DTT='<%= EPK_NUSE_DTT_T%>'
<%
			}

			if(! EPK_INPT_ID_T.equals("")) {
%>
		 		EPK_INPT_ID='<%= EPK_INPT_ID_T%>'
<%
			}

			if(! EPK_INPT_DTT_T.equals("")) {
%>
		 		EPK_INPT_DTT='<%= EPK_INPT_DTT_T%>'
<%
			}

			if(! EPK_MODI_ID_T.equals("")) {
%>
		 		EPK_MODI_ID='<%= EPK_MODI_ID_T%>'
<%
			}

			if(! EPK_MODI_DTT_T.equals("")) {
%>
		 		EPK_MODI_DTT='<%= EPK_MODI_DTT_T%>'
<%
			}

			if(! EPK_TRNS_ID_T.equals("")) {
%>
		 		EPK_TRNS_ID='<%= EPK_TRNS_ID_T%>'
<%
			}

			if(! EPK_TRNS_DTT_T.equals("")) {
%>
		 		EPK_TRNS_DTT='<%= EPK_TRNS_DTT_T%>'
<%
			}

			if(! EPK_ORGA_CD_T.equals("")) {
%>
		 		EPK_ORGA_CD='<%= EPK_ORGA_CD_T%>'
<%
			}

			if(! UB_SEX_T.equals("")) {
%>
		 		UB_SEX='<%= UB_SEX_T%>'
<%
			}

			if(! UB_PACKAGE_T.equals("")) {
%>
		 		UB_PACKAGE='<%= UB_PACKAGE_T%>'
<%
			}

			if(! UB_PACKAGE_TYPE_T.equals("")) {
%>
		 		UB_PACKAGE_TYPE='<%= UB_PACKAGE_TYPE_T%>'
<%
			}

			if(! UB_YEAR_T.equals("")) {
%>
		 		UB_YEAR='<%= UB_YEAR_T%>'
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
