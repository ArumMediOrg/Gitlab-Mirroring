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

SELECT DISTINCT B.CSM_MATT_NM, B.CSM_COMM_CD, C.CSC_ETC1_CD, D.SPG_SOKY_NM,             
       GetSP_COMMON_cdToNm('HM99A',B.CSM_COMM_CD) CSM_COMM_LT,                    
       GetSP_COMMON_cdToNm('HM06B',B.CSM_INJA_CD) CSM_INJA_NM,                    
       GetSP_COMMON_cdToNm('HM05D',A.SIR_ORGA_CD) SIR_ORGA_NM,                    
       A.*                                                         
  FROM ST_ITEM_RECHECK A                                           
       LEFT OUTER JOIN CT_SP_MATTER B ON A.SIR_MATT_CD  = B.CSM_MATT_CD  
       LEFT OUTER JOIN CT_SP_COMMON C ON B.CSM_COMM_CD  = C.CSC_SMALL    
       LEFT OUTER JOIN ST_PANJUNG   D ON A.SIR_EXAM_DT  = D.SPG_EXAM_DT  
                                     AND A.SIR_EXAM_SQ  = D.SPG_EXAM_SQ  
                                     AND A.SIR_EXAM_CHA = D.SPG_EXAM_CHA
                                     AND A.SIR_MATT_CD  = D.SPG_MATT_CD  
                                     AND A.SIR_ORGA_CD  = D.SPG_ORGA_CD  
 WHERE SIR_EXAM_DT  = :EXAM_DT  
   AND SIR_EXAM_SQ  = :EXAM_SQ  
   AND SIR_EXAM_CHA = '1'                                        
   AND SPG_PANJ_CD  = '9'   
		*/

		sql = " SELECT DISTINCT B.CSM_MATT_NM, B.CSM_COMM_CD, C.CSC_ETC1_CD, D.SPG_SOKY_NM, GETSP_COMMON_CDTONM('HM99A',B.CSM_COMM_CD) CSM_COMM_LT, GETSP_COMMON_CDTONM('HM06B',B.CSM_INJA_CD) CSM_INJA_NM, GETSP_COMMON_CDTONM('HM05D',A.SIR_ORGA_CD) SIR_ORGA_NM, A.*";
		sql += " FROM ST_ITEM_RECHECK A LEFT OUTER JOIN CT_SP_MATTER B";
		sql += " ON A.SIR_MATT_CD = B.CSM_MATT_CD LEFT OUTER JOIN CT_SP_COMMON C";
		sql += " ON B.CSM_COMM_CD = C.CSC_SMALL LEFT OUTER JOIN ST_PANJUNG D";
		sql += " ON A.SIR_EXAM_DT = D.SPG_EXAM_DT";
		sql += " AND A.SIR_EXAM_SQ = D.SPG_EXAM_SQ";
		sql += " AND A.SIR_EXAM_CHA = D.SPG_EXAM_CHA";
		sql += " AND A.SIR_MATT_CD = D.SPG_MATT_CD";
		sql += " AND A.SIR_ORGA_CD = D.SPG_ORGA_CD";
		sql += " WHERE SIR_EXAM_DT = '" + EXAM_DT + "'";
		sql += " AND SIR_EXAM_SQ = '" + EXAM_SQ + "'";
		sql += " AND SIR_EXAM_CHA = '1'";
		sql += " AND SPG_PANJ_CD = '9'";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uSP_RecheckList_UP_PanjungDisplay_002 \n";
			G_INFO += "설명 : 특검 2차 대상 물질 조회 \n";
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
		<s:AttributeType name='CSM_MATT_NM' rs:number='1' rs:nullable='true' rs:basetable='CT_SP_MATTER' rs:basecolumn='CSM_MATT_NM'>
			<s:datatype dt:type='string' dt:maxLength='300'/>
		</s:AttributeType>
		<s:AttributeType name='CSM_COMM_CD' rs:number='2' rs:nullable='true' rs:basetable='CT_SP_MATTER' rs:basecolumn='CSM_COMM_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='CSC_ETC1_CD' rs:number='3' rs:nullable='true' rs:basetable='CT_SP_COMMON' rs:basecolumn='CSC_ETC1_CD'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='SPG_SOKY_NM' rs:number='4' rs:nullable='true' rs:basetable='ST_PANJUNG' rs:basecolumn='SPG_SOKY_NM'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='CSM_COMM_LT' rs:number='5' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='CSM_INJA_NM' rs:number='6' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='SIR_ORGA_NM' rs:number='7' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='SIR_EXAM_DT' rs:number='8' rs:basetable='ST_ITEM_RECHECK' rs:basecolumn='SIR_EXAM_DT'
			 rs:keycolumn='true'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='SIR_EXAM_SQ' rs:number='9' rs:basetable='ST_ITEM_RECHECK' rs:basecolumn='SIR_EXAM_SQ'
			 rs:keycolumn='true'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='SIR_EXAM_CHA' rs:number='10' rs:basetable='ST_ITEM_RECHECK' rs:basecolumn='SIR_EXAM_CHA'
			 rs:keycolumn='true'>
			<s:datatype dt:type='string' dt:maxLength='1' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='SIR_MATT_CD' rs:number='11' rs:basetable='ST_ITEM_RECHECK' rs:basecolumn='SIR_MATT_CD'
			 rs:keycolumn='true'>
			<s:datatype dt:type='string' dt:maxLength='5' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='SIR_ORGA_CD' rs:number='12' rs:basetable='ST_ITEM_RECHECK' rs:basecolumn='SIR_ORGA_CD'
			 rs:keycolumn='true'>
			<s:datatype dt:type='string' dt:maxLength='2' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='SIR_MKJJ_CD' rs:number='13' rs:basetable='ST_ITEM_RECHECK' rs:basecolumn='SIR_MKJJ_CD'
			 rs:keycolumn='true'>
			<s:datatype dt:type='string' dt:maxLength='5' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='SIR_SWING_CD' rs:number='14' rs:basetable='ST_ITEM_RECHECK' rs:basecolumn='SIR_SWING_CD'
			 rs:keycolumn='true'>
			<s:datatype dt:type='string' dt:maxLength='1' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='SIR_CUST_NO' rs:number='15' rs:basetable='ST_ITEM_RECHECK' rs:basecolumn='SIR_CUST_NO'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='SIR_EITEM_LT' rs:number='16' rs:nullable='true' rs:basetable='ST_ITEM_RECHECK' rs:basecolumn='SIR_EITEM_LT'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='SIR_SITEM_LT' rs:number='17' rs:nullable='true' rs:basetable='ST_ITEM_RECHECK' rs:basecolumn='SIR_SITEM_LT'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='SIR_EXAM_DT2' rs:number='18' rs:nullable='true' rs:basetable='ST_ITEM_RECHECK' rs:basecolumn='SIR_EXAM_DT2'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='SIR_EXAM_SQ2' rs:number='19' rs:nullable='true' rs:basetable='ST_ITEM_RECHECK' rs:basecolumn='SIR_EXAM_SQ2'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='SIR_INPT_ID' rs:number='20' rs:nullable='true' rs:basetable='ST_ITEM_RECHECK' rs:basecolumn='SIR_INPT_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='SIR_INPT_DTT' rs:number='21' rs:nullable='true' rs:basetable='ST_ITEM_RECHECK' rs:basecolumn='SIR_INPT_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='SIR_MODI_ID' rs:number='22' rs:nullable='true' rs:basetable='ST_ITEM_RECHECK' rs:basecolumn='SIR_MODI_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='SIR_MODI_DTT' rs:number='23' rs:nullable='true' rs:basetable='ST_ITEM_RECHECK' rs:basecolumn='SIR_MODI_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='SIR_ETITEM_LT' rs:number='24' rs:nullable='true' rs:basetable='ST_ITEM_RECHECK' rs:basecolumn='SIR_ETITEM_LT'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='SIR_CBC_CD' rs:number='25' rs:nullable='true' rs:basetable='ST_ITEM_RECHECK' rs:basecolumn='SIR_CBC_CD'>
			<s:datatype dt:type='string' dt:maxLength='11'/>
		</s:AttributeType>
		<s:AttributeType name='SIR_URIN_CD' rs:number='26' rs:nullable='true' rs:basetable='ST_ITEM_RECHECK' rs:basecolumn='SIR_URIN_CD'>
			<s:datatype dt:type='string' dt:maxLength='11'/>
		</s:AttributeType>
		<s:AttributeType name='SIR_ADD_LT' rs:number='27' rs:nullable='true' rs:basetable='ST_ITEM_RECHECK' rs:basecolumn='SIR_ADD_LT'>
			<s:datatype dt:type='string' dt:maxLength='1000'/>
		</s:AttributeType>
		<s:AttributeType name='SIR_ZERO_LT' rs:number='28' rs:nullable='true' rs:basetable='ST_ITEM_RECHECK' rs:basecolumn='SIR_ZERO_LT'>
			<s:datatype dt:type='string' dt:maxLength='1000'/>
		</s:AttributeType>
		<s:extends type='rs:rowbase'/>
	</s:ElementType>
</s:Schema>		<rs:data>
<%
		int cnt = 0;
		while(cRsList.next()) {

			cnt++;

			String CSM_MATT_NM_T = cRsList.getString("CSM_MATT_NM");
			String CSM_COMM_CD_T = cRsList.getString("CSM_COMM_CD");
			String CSC_ETC1_CD_T = cRsList.getString("CSC_ETC1_CD");
			String SPG_SOKY_NM_T = cRsList.getString("SPG_SOKY_NM");
			String CSM_COMM_LT_T = cRsList.getString("CSM_COMM_LT");
			String CSM_INJA_NM_T = cRsList.getString("CSM_INJA_NM");
			String SIR_ORGA_NM_T = cRsList.getString("SIR_ORGA_NM");
			String SIR_EXAM_DT_T = cRsList.getString("SIR_EXAM_DT");
			String SIR_EXAM_SQ_T = cRsList.getString("SIR_EXAM_SQ");
			String SIR_EXAM_CHA_T = cRsList.getString("SIR_EXAM_CHA");
			String SIR_MATT_CD_T = cRsList.getString("SIR_MATT_CD");
			String SIR_ORGA_CD_T = cRsList.getString("SIR_ORGA_CD");
			String SIR_MKJJ_CD_T = cRsList.getString("SIR_MKJJ_CD");
			String SIR_SWING_CD_T = cRsList.getString("SIR_SWING_CD");
			String SIR_CUST_NO_T = cRsList.getString("SIR_CUST_NO");
			String SIR_EITEM_LT_T = cRsList.getString("SIR_EITEM_LT");
			String SIR_SITEM_LT_T = cRsList.getString("SIR_SITEM_LT");
			String SIR_EXAM_DT2_T = cRsList.getString("SIR_EXAM_DT2");
			String SIR_EXAM_SQ2_T = cRsList.getString("SIR_EXAM_SQ2");
			String SIR_INPT_ID_T = cRsList.getString("SIR_INPT_ID");
			String SIR_INPT_DTT_T = cRsList.getDate2("SIR_INPT_DTT");
			String SIR_MODI_ID_T = cRsList.getString("SIR_MODI_ID");
			String SIR_MODI_DTT_T = cRsList.getDate2("SIR_MODI_DTT");
			String SIR_ETITEM_LT_T = cRsList.getString("SIR_ETITEM_LT");
			String SIR_CBC_CD_T = cRsList.getString("SIR_CBC_CD");
			String SIR_URIN_CD_T = cRsList.getString("SIR_URIN_CD");
			String SIR_ADD_LT_T = cRsList.getString("SIR_ADD_LT");
			String SIR_ZERO_LT_T = cRsList.getString("SIR_ZERO_LT");
%>
			<z:row
<%
			if(! CSM_MATT_NM_T.equals("")) {
%>
		 		CSM_MATT_NM='<%= CSM_MATT_NM_T%>'
<%
			}

			if(! CSM_COMM_CD_T.equals("")) {
%>
		 		CSM_COMM_CD='<%= CSM_COMM_CD_T%>'
<%
			}

			if(! CSC_ETC1_CD_T.equals("")) {
%>
		 		CSC_ETC1_CD='<%= CSC_ETC1_CD_T%>'
<%
			}

			if(! SPG_SOKY_NM_T.equals("")) {
%>
		 		SPG_SOKY_NM='<%= SPG_SOKY_NM_T%>'
<%
			}

			if(! CSM_COMM_LT_T.equals("")) {
%>
		 		CSM_COMM_LT='<%= CSM_COMM_LT_T%>'
<%
			}

			if(! CSM_INJA_NM_T.equals("")) {
%>
		 		CSM_INJA_NM='<%= CSM_INJA_NM_T%>'
<%
			}

			if(! SIR_ORGA_NM_T.equals("")) {
%>
		 		SIR_ORGA_NM='<%= SIR_ORGA_NM_T%>'
<%
			}

			if(! SIR_EXAM_DT_T.equals("")) {
%>
		 		SIR_EXAM_DT='<%= SIR_EXAM_DT_T%>'
<%
			}

			if(! SIR_EXAM_SQ_T.equals("")) {
%>
		 		SIR_EXAM_SQ='<%= SIR_EXAM_SQ_T%>'
<%
			}

			if(! SIR_EXAM_CHA_T.equals("")) {
%>
		 		SIR_EXAM_CHA='<%= SIR_EXAM_CHA_T%>'
<%
			}

			if(! SIR_MATT_CD_T.equals("")) {
%>
		 		SIR_MATT_CD='<%= SIR_MATT_CD_T%>'
<%
			}

			if(! SIR_ORGA_CD_T.equals("")) {
%>
		 		SIR_ORGA_CD='<%= SIR_ORGA_CD_T%>'
<%
			}

			if(! SIR_MKJJ_CD_T.equals("")) {
%>
		 		SIR_MKJJ_CD='<%= SIR_MKJJ_CD_T%>'
<%
			}

			if(! SIR_SWING_CD_T.equals("")) {
%>
		 		SIR_SWING_CD='<%= SIR_SWING_CD_T%>'
<%
			}

			if(! SIR_CUST_NO_T.equals("")) {
%>
		 		SIR_CUST_NO='<%= SIR_CUST_NO_T%>'
<%
			}

			if(! SIR_EITEM_LT_T.equals("")) {
%>
		 		SIR_EITEM_LT='<%= SIR_EITEM_LT_T%>'
<%
			}

			if(! SIR_SITEM_LT_T.equals("")) {
%>
		 		SIR_SITEM_LT='<%= SIR_SITEM_LT_T%>'
<%
			}

			if(! SIR_EXAM_DT2_T.equals("")) {
%>
		 		SIR_EXAM_DT2='<%= SIR_EXAM_DT2_T%>'
<%
			}

			if(! SIR_EXAM_SQ2_T.equals("")) {
%>
		 		SIR_EXAM_SQ2='<%= SIR_EXAM_SQ2_T%>'
<%
			}

			if(! SIR_INPT_ID_T.equals("")) {
%>
		 		SIR_INPT_ID='<%= SIR_INPT_ID_T%>'
<%
			}

			if(! SIR_INPT_DTT_T.equals("")) {
%>
		 		SIR_INPT_DTT='<%= SIR_INPT_DTT_T%>'
<%
			}

			if(! SIR_MODI_ID_T.equals("")) {
%>
		 		SIR_MODI_ID='<%= SIR_MODI_ID_T%>'
<%
			}

			if(! SIR_MODI_DTT_T.equals("")) {
%>
		 		SIR_MODI_DTT='<%= SIR_MODI_DTT_T%>'
<%
			}

			if(! SIR_ETITEM_LT_T.equals("")) {
%>
		 		SIR_ETITEM_LT='<%= SIR_ETITEM_LT_T%>'
<%
			}

			if(! SIR_CBC_CD_T.equals("")) {
%>
		 		SIR_CBC_CD='<%= SIR_CBC_CD_T%>'
<%
			}

			if(! SIR_URIN_CD_T.equals("")) {
%>
		 		SIR_URIN_CD='<%= SIR_URIN_CD_T%>'
<%
			}

			if(! SIR_ADD_LT_T.equals("")) {
%>
		 		SIR_ADD_LT='<%= SIR_ADD_LT_T%>'
<%
			}

			if(! SIR_ZERO_LT_T.equals("")) {
%>
		 		SIR_ZERO_LT='<%= SIR_ZERO_LT_T%>'
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
