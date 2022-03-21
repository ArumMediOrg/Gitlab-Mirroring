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

		String EXAM_DT = htMethod.get("EXAM_DT");
		String EXAM_SQ = htMethod.get("EXAM_SQ");

		//
		if(EXAM_DT == null) { EXAM_DT = ""; }
		if(EXAM_SQ == null) { EXAM_SQ = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT EEP_ORDER_DT, 
       F_CODE_FIND('0419',  EEP_ORDER_CD, '', '1') EEP_ORDER_NM, 
       EEP_EXAM_PR, EEP_FST_PR,   EEP_ADD_PR,  EEP_PRGS_PR, 
       EEP_HTSB_PR, EEP_CAN_PR,   EEP_SPSB_PR, EEP_CVSB_PR,  EEP_EMSB_PR, EEP_ETSB_PR, 
       EEP_DMD_PR,  EEP_HDMD_PR,  EEP_SDMD_PR, 
       EEP_COMP_PR, EEP_COMPS_PR, EEP_PSNL_PR, EEP_PSNLP_PR, 
       NVL(EEP_DISC_PR, 0) EEP_DISC_PR, NVL(EEP_DISC_CPR, 0) EEP_DISC_CPR, 
       EEP_INPT_DTT
  FROM ET_EXAM_PRICE 
 WHERE EEP_EXAM_DT = :EXAM_DT
   AND EEP_EXAM_SQ = :EXAM_SQ
 ORDER BY EEP_ORDER_SQ DESC

		*/

		sql = " SELECT EEP_ORDER_DT, F_CODE_FIND('0419', EEP_ORDER_CD, '', '1') EEP_ORDER_NM, EEP_EXAM_PR, EEP_FST_PR, EEP_ADD_PR, EEP_PRGS_PR, ";
		sql += " EEP_HTSB_PR, EEP_CAN_PR, EEP_SPSB_PR, EEP_CVSB_PR, EEP_EMSB_PR, EEP_ETSB_PR, EEP_DMD_PR, EEP_HDMD_PR, EEP_SDMD_PR, EEP_COMP_PR, ";
		sql += " EEP_COMPS_PR, EEP_PSNL_PR, EEP_PSNLP_PR, ";
		sql += " NVL(EEP_DISC_PR, 0) EEP_DISC_PR, NVL(EEP_DISC_CPR, 0) EEP_DISC_CPR, ";
		sql += " EEP_INPT_DTT";
		sql += " FROM ET_EXAM_PRICE";
		sql += " WHERE EEP_EXAM_DT = '" + EXAM_DT + "'";
		sql += " AND EEP_EXAM_SQ = '" + EXAM_SQ + "'";
		sql += " ORDER BY EEP_ORDER_SQ DESC";

		//
		G_INFO += "<!-- \n";
		G_INFO += "서비스명 : uExam_Acpt_Up_DisplayDmd_002 \n";
		G_INFO += "설명 : 수가 청구내역 조회-2 \n";
		G_INFO += "\n\n";

		G_INFO += "전달인자 : \n";
		G_INFO += " EXAM_DT : " + EXAM_DT + " \n";
		G_INFO += " EXAM_SQ : " + EXAM_SQ + " \n";
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
		<s:AttributeType name='EEP_ORDER_DT' rs:number='1' rs:writeunknown='true' rs:basetable='ET_EXAM_PRICE' rs:basecolumn='EEP_ORDER_DT'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEP_ORDER_NM' rs:number='2' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='EEP_EXAM_PR' rs:number='3' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_PRICE'
			 rs:basecolumn='EEP_EXAM_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='11' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEP_FST_PR' rs:number='4' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_PRICE'
			 rs:basecolumn='EEP_FST_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='11' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEP_ADD_PR' rs:number='5' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_PRICE'
			 rs:basecolumn='EEP_ADD_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='11' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEP_PRGS_PR' rs:number='6' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_PRICE'
			 rs:basecolumn='EEP_PRGS_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='11' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEP_HTSB_PR' rs:number='7' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_PRICE'
			 rs:basecolumn='EEP_HTSB_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='11' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEP_CAN_PR' rs:number='8' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_PRICE'
			 rs:basecolumn='EEP_CAN_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='11' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEP_SPSB_PR' rs:number='9' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_PRICE'
			 rs:basecolumn='EEP_SPSB_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='11' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEP_CVSB_PR' rs:number='10' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_PRICE'
			 rs:basecolumn='EEP_CVSB_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='11' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEP_EMSB_PR' rs:number='11' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_PRICE'
			 rs:basecolumn='EEP_EMSB_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='11' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEP_ETSB_PR' rs:number='12' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_PRICE'
			 rs:basecolumn='EEP_ETSB_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='11' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEP_DMD_PR' rs:number='13' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_PRICE'
			 rs:basecolumn='EEP_DMD_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='11' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEP_HDMD_PR' rs:number='14' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_PRICE'
			 rs:basecolumn='EEP_HDMD_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='11' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEP_SDMD_PR' rs:number='15' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_PRICE'
			 rs:basecolumn='EEP_SDMD_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='11' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEP_COMP_PR' rs:number='16' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_PRICE'
			 rs:basecolumn='EEP_COMP_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='11' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEP_COMPS_PR' rs:number='17' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_PRICE'
			 rs:basecolumn='EEP_COMPS_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='11' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEP_PSNL_PR' rs:number='18' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_PRICE'
			 rs:basecolumn='EEP_PSNL_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='11' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEP_PSNLP_PR' rs:number='19' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_PRICE'
			 rs:basecolumn='EEP_PSNLP_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='11' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEP_DISC_PR' rs:number='20' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_PRICE'
			 rs:basecolumn='EEP_DISC_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='4000' rs:scale='0' rs:precision='11' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEP_DISC_CPR' rs:number='21' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_PRICE'
			 rs:basecolumn='EEP_DISC_CPR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='4000' rs:scale='0' rs:precision='11' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEP_INPT_DTT' rs:number='22' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_PRICE'
			 rs:basecolumn='EEP_INPT_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='23' rs:rowid='true' rs:basetable='ET_EXAM_PRICE' rs:basecolumn='ROWID'
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

			String EEP_ORDER_DT_T = cRsList.getString("EEP_ORDER_DT");
			String EEP_ORDER_NM_T = cRsList.getString("EEP_ORDER_NM");
			String EEP_EXAM_PR_T = cRsList.getString("EEP_EXAM_PR");
			String EEP_FST_PR_T = cRsList.getString("EEP_FST_PR");
			String EEP_ADD_PR_T = cRsList.getString("EEP_ADD_PR");
			String EEP_PRGS_PR_T = cRsList.getString("EEP_PRGS_PR");
			String EEP_HTSB_PR_T = cRsList.getString("EEP_HTSB_PR");
			String EEP_CAN_PR_T = cRsList.getString("EEP_CAN_PR");
			String EEP_SPSB_PR_T = cRsList.getString("EEP_SPSB_PR");
			String EEP_CVSB_PR_T = cRsList.getString("EEP_CVSB_PR");
			String EEP_EMSB_PR_T = cRsList.getString("EEP_EMSB_PR");
			String EEP_ETSB_PR_T = cRsList.getString("EEP_ETSB_PR");
			String EEP_DMD_PR_T = cRsList.getString("EEP_DMD_PR");
			String EEP_HDMD_PR_T = cRsList.getString("EEP_HDMD_PR");
			String EEP_SDMD_PR_T = cRsList.getString("EEP_SDMD_PR");
			String EEP_COMP_PR_T = cRsList.getString("EEP_COMP_PR");
			String EEP_COMPS_PR_T = cRsList.getString("EEP_COMPS_PR");
			String EEP_PSNL_PR_T = cRsList.getString("EEP_PSNL_PR");
			String EEP_PSNLP_PR_T = cRsList.getString("EEP_PSNLP_PR");
			String EEP_DISC_PR_T = cRsList.getString("EEP_DISC_PR");
			String EEP_DISC_CPR_T = cRsList.getString("EEP_DISC_CPR");
			String EEP_INPT_DTT_T = cRsList.getDate2("EEP_INPT_DTT");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! EEP_ORDER_DT_T.equals("")) {
%>
		 		EEP_ORDER_DT='<%= EEP_ORDER_DT_T%>'
<%
			}

			if(! EEP_ORDER_NM_T.equals("")) {
%>
		 		EEP_ORDER_NM='<%= EEP_ORDER_NM_T%>'
<%
			}

			if(! EEP_EXAM_PR_T.equals("")) {
%>
		 		EEP_EXAM_PR='<%= EEP_EXAM_PR_T%>'
<%
			}

			if(! EEP_FST_PR_T.equals("")) {
%>
		 		EEP_FST_PR='<%= EEP_FST_PR_T%>'
<%
			}

			if(! EEP_ADD_PR_T.equals("")) {
%>
		 		EEP_ADD_PR='<%= EEP_ADD_PR_T%>'
<%
			}

			if(! EEP_PRGS_PR_T.equals("")) {
%>
		 		EEP_PRGS_PR='<%= EEP_PRGS_PR_T%>'
<%
			}

			if(! EEP_HTSB_PR_T.equals("")) {
%>
		 		EEP_HTSB_PR='<%= EEP_HTSB_PR_T%>'
<%
			}

			if(! EEP_CAN_PR_T.equals("")) {
%>
		 		EEP_CAN_PR='<%= EEP_CAN_PR_T%>'
<%
			}

			if(! EEP_SPSB_PR_T.equals("")) {
%>
		 		EEP_SPSB_PR='<%= EEP_SPSB_PR_T%>'
<%
			}

			if(! EEP_CVSB_PR_T.equals("")) {
%>
		 		EEP_CVSB_PR='<%= EEP_CVSB_PR_T%>'
<%
			}

			if(! EEP_EMSB_PR_T.equals("")) {
%>
		 		EEP_EMSB_PR='<%= EEP_EMSB_PR_T%>'
<%
			}

			if(! EEP_ETSB_PR_T.equals("")) {
%>
		 		EEP_ETSB_PR='<%= EEP_ETSB_PR_T%>'
<%
			}

			if(! EEP_DMD_PR_T.equals("")) {
%>
		 		EEP_DMD_PR='<%= EEP_DMD_PR_T%>'
<%
			}

			if(! EEP_HDMD_PR_T.equals("")) {
%>
		 		EEP_HDMD_PR='<%= EEP_HDMD_PR_T%>'
<%
			}

			if(! EEP_SDMD_PR_T.equals("")) {
%>
		 		EEP_SDMD_PR='<%= EEP_SDMD_PR_T%>'
<%
			}

			if(! EEP_COMP_PR_T.equals("")) {
%>
		 		EEP_COMP_PR='<%= EEP_COMP_PR_T%>'
<%
			}

			if(! EEP_COMPS_PR_T.equals("")) {
%>
		 		EEP_COMPS_PR='<%= EEP_COMPS_PR_T%>'
<%
			}

			if(! EEP_PSNL_PR_T.equals("")) {
%>
		 		EEP_PSNL_PR='<%= EEP_PSNL_PR_T%>'
<%
			}

			if(! EEP_PSNLP_PR_T.equals("")) {
%>
		 		EEP_PSNLP_PR='<%= EEP_PSNLP_PR_T%>'
<%
			}

			if(! EEP_DISC_PR_T.equals("")) {
%>
				EEP_DISC_PR='<%= EEP_DISC_PR_T%>'
<%
			}

			if(! EEP_DISC_CPR_T.equals("")) {
%>
				EEP_DISC_CPR='<%= EEP_DISC_CPR_T%>'
<%
			}

			if(! EEP_INPT_DTT_T.equals("")) {
%>
		 		EEP_INPT_DTT='<%= EEP_INPT_DTT_T%>'
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
