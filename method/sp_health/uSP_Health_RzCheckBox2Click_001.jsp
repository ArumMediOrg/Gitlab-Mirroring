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
		String SEX_CD = htMethod.get("SEX_CD");
		String PSNL_AGE = htMethod.get("PSNL_AGE");
		String EXAM_SQ = htMethod.get("EXAM_SQ");
		String SSQL_ADD = htMethod.get("SSQL_ADD");

		//
		if(EXAM_DT == null) { EXAM_DT = ""; }
		if(SEX_CD == null) { SEX_CD = ""; }
		if(PSNL_AGE == null) { PSNL_AGE = ""; }
		if(EXAM_SQ == null) { EXAM_SQ = ""; }
		if(SSQL_ADD == null) { SSQL_ADD = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

Select DISTINCT
       ERI.ERI_EXAM_DT,   ERI.ERI_EXAM_SQ,   ERI.ERI_ITEM_CD,  II.IIM_KNME_NM,
       ERI.ERI_RSLT_VL,   ERI_VLDT_LH,       ERI.ERI_SORT_SQ,  ERI.ERI_RSLT_KD,
       ERI.ERI_ALSB_PANJ, ERI.ERI_HTSB_PANJ, ERI.ERI_EMSB_PANJ,
       II.IIM_TRTP_CD
From ET_RSLT_ITEM ERI
   Inner Join IT_ITEM II On II.IIM_ITEM_CD = ERI.ERI_ITEM_CD
     And (II.IIM_TRTP_CD = '1' Or II.IIM_TRTP_CD = '2' Or
          II.IIM_TRTP_CD = '4' Or II.IIM_TRTP_CD = '5' Or
          II.IIM_TRTP_CD = '7')
   Left Outer Join IT_ITEM_VLDT IIV ON ERI.ERI_ITEM_CD = IIV.IIV_ITEM_CD
                 And IIV.IIV_APLY_DT <= :EXAM_DT
     And IIV.IIV_SEX_CD  =  :SEX_CD
     And IIV.IIV_AGE_FR <=  :PSNL_AGE
     And IIV.IIV_AGE_TO >=  :PSNL_AGE
                 And IIV.IIV_PANJ_CD = 'A'
     And IIV.IIV_USE_YN  = 'Y'
     And (IIV.IIV_EXAM_CD = '1' Or  IIV.IIV_EXAM_CD = '2' Or IIV.IIV_EXAM_CD = '5')
Where ERI.ERI_EXAM_DT = :EXAM_DT
  And ERI.ERI_EXAM_SQ = :EXAM_SQ
  And NVL(ERI.ERI_RSLT_VL, ' ') <> ' '
  ||:sSQL_ADD
  And ERI.ERI_CNCL_YN <> 'Y'
 Order By ERI.ERI_SORT_SQ
		*/

		sql = " SELECT DISTINCT ERI.ERI_EXAM_DT, ERI.ERI_EXAM_SQ, ERI.ERI_ITEM_CD, II.IIM_KNME_NM, ERI.ERI_RSLT_VL, ERI_VLDT_LH, ERI.ERI_SORT_SQ, ERI.ERI_RSLT_KD, ERI.ERI_ALSB_PANJ, ERI.ERI_HTSB_PANJ, ERI.ERI_EMSB_PANJ, II.IIM_TRTP_CD";
		sql += " FROM ET_RSLT_ITEM ERI INNER JOIN IT_ITEM II";
		sql += " ON II.IIM_ITEM_CD = ERI.ERI_ITEM_CD";
		sql += " AND (II.IIM_TRTP_CD = '1'";
		sql += " OR II.IIM_TRTP_CD = '2'";
		sql += " OR II.IIM_TRTP_CD = '4'";
		sql += " OR II.IIM_TRTP_CD = '5'";
		sql += " OR II.IIM_TRTP_CD = '7') LEFT OUTER JOIN IT_ITEM_VLDT IIV";
		sql += " ON ERI.ERI_ITEM_CD = IIV.IIV_ITEM_CD";
		sql += " AND IIV.IIV_APLY_DT <= '" + EXAM_DT + "'";
		sql += " AND IIV.IIV_SEX_CD = '" + SEX_CD + "'";
		sql += " AND IIV.IIV_AGE_FR <= '" + PSNL_AGE + "'";
		sql += " AND IIV.IIV_AGE_TO >= '" + PSNL_AGE + "'";
		sql += " AND IIV.IIV_PANJ_CD = 'A'";
		sql += " AND IIV.IIV_USE_YN = 'Y'";
		sql += " AND (IIV.IIV_EXAM_CD = '1'";
		sql += " OR IIV.IIV_EXAM_CD = '2'";
		sql += " OR IIV.IIV_EXAM_CD = '5')";
		sql += " WHERE ERI.ERI_EXAM_DT = '" + EXAM_DT + "'";
		sql += " AND ERI.ERI_EXAM_SQ = '" + EXAM_SQ + "'";
		sql += " AND NVL(ERI.ERI_RSLT_VL, ' ') <> ' '";
		sql += SSQL_ADD;
		sql += " AND ERI.ERI_CNCL_YN <> 'Y'";
		sql += " ORDER BY ERI.ERI_SORT_SQ";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uSP_Health_RzCheckBox2Click_001 \n";
			G_INFO += "설명 : 특수검진항목만 보기 내역 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " EXAM_DT : " + EXAM_DT + " \n";
			G_INFO += " SEX_CD : " + SEX_CD + " \n";
			G_INFO += " PSNL_AGE : " + PSNL_AGE + " \n";
			G_INFO += " EXAM_SQ : " + EXAM_SQ + " \n";
			G_INFO += " SSQL_ADD : " + SSQL_ADD + " \n";
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
		<s:AttributeType name='ERI_EXAM_DT' rs:number='1' rs:basetable='ET_RSLT_ITEM' rs:basecolumn='ERI_EXAM_DT' rs:keycolumn='true'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_EXAM_SQ' rs:number='2' rs:basetable='ET_RSLT_ITEM' rs:basecolumn='ERI_EXAM_SQ' rs:keycolumn='true'>
			<s:datatype dt:type='string' dt:maxLength='6' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_ITEM_CD' rs:number='3' rs:basetable='ET_RSLT_ITEM' rs:basecolumn='ERI_ITEM_CD' rs:keycolumn='true'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_KNME_NM' rs:number='4' rs:basetable='IT_ITEM' rs:basecolumn='IIM_KNME_NM'>
			<s:datatype dt:type='string' dt:maxLength='200' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_RSLT_VL' rs:number='5' rs:nullable='true' rs:basetable='ET_RSLT_ITEM' rs:basecolumn='ERI_RSLT_VL'>
			<s:datatype dt:type='string' dt:maxLength='50'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_VLDT_LH' rs:number='6' rs:nullable='true' rs:basetable='ET_RSLT_ITEM' rs:basecolumn='ERI_VLDT_LH'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_SORT_SQ' rs:number='7' rs:nullable='true' rs:basetable='ET_RSLT_ITEM' rs:basecolumn='ERI_SORT_SQ'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_RSLT_KD' rs:number='8' rs:nullable='true' rs:basetable='ET_RSLT_ITEM' rs:basecolumn='ERI_RSLT_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_ALSB_PANJ' rs:number='9' rs:nullable='true' rs:basetable='ET_RSLT_ITEM' rs:basecolumn='ERI_ALSB_PANJ'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_HTSB_PANJ' rs:number='10' rs:nullable='true' rs:basetable='ET_RSLT_ITEM' rs:basecolumn='ERI_HTSB_PANJ'>
			<s:datatype dt:type='string' dt:maxLength='30'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_EMSB_PANJ' rs:number='11' rs:nullable='true' rs:basetable='ET_RSLT_ITEM' rs:basecolumn='ERI_EMSB_PANJ'>
			<s:datatype dt:type='string' dt:maxLength='30'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_TRTP_CD' rs:number='12' rs:nullable='true' rs:basetable='IT_ITEM' rs:basecolumn='IIM_TRTP_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:extends type='rs:rowbase'/>
	</s:ElementType>
</s:Schema>
		<rs:data>
<%
		int cnt = 0;
		while(cRsList.next()) {

			cnt++;

			String ERI_EXAM_DT_T = cRsList.getString("ERI_EXAM_DT");
			String ERI_EXAM_SQ_T = cRsList.getString("ERI_EXAM_SQ");
			String ERI_ITEM_CD_T = cRsList.getString("ERI_ITEM_CD");
			String IIM_KNME_NM_T = cRsList.getString("IIM_KNME_NM");
			String ERI_RSLT_VL_T = cRsList.getString("ERI_RSLT_VL");
			String ERI_VLDT_LH_T = cRsList.getString("ERI_VLDT_LH");
			String ERI_SORT_SQ_T = cRsList.getString("ERI_SORT_SQ");
			String ERI_RSLT_KD_T = cRsList.getString("ERI_RSLT_KD");
			String ERI_ALSB_PANJ_T = cRsList.getString("ERI_ALSB_PANJ");
			String ERI_HTSB_PANJ_T = cRsList.getString("ERI_HTSB_PANJ");
			String ERI_EMSB_PANJ_T = cRsList.getString("ERI_EMSB_PANJ");
			String IIM_TRTP_CD_T = cRsList.getString("IIM_TRTP_CD");
%>
			<z:row
<%
			if(! ERI_EXAM_DT_T.equals("")) {
%>
		 		ERI_EXAM_DT='<%= ERI_EXAM_DT_T%>'
<%
			}

			if(! ERI_EXAM_SQ_T.equals("")) {
%>
		 		ERI_EXAM_SQ='<%= ERI_EXAM_SQ_T%>'
<%
			}

			if(! ERI_ITEM_CD_T.equals("")) {
%>
		 		ERI_ITEM_CD='<%= ERI_ITEM_CD_T%>'
<%
			}

			if(! IIM_KNME_NM_T.equals("")) {
%>
		 		IIM_KNME_NM='<%= IIM_KNME_NM_T%>'
<%
			}

			if(! ERI_RSLT_VL_T.equals("")) {
%>
		 		ERI_RSLT_VL='<%= ERI_RSLT_VL_T%>'
<%
			}

			if(! ERI_VLDT_LH_T.equals("")) {
%>
		 		ERI_VLDT_LH='<%= ERI_VLDT_LH_T%>'
<%
			}

			if(! ERI_SORT_SQ_T.equals("")) {
%>
		 		ERI_SORT_SQ='<%= ERI_SORT_SQ_T%>'
<%
			}

			if(! ERI_RSLT_KD_T.equals("")) {
%>
		 		ERI_RSLT_KD='<%= ERI_RSLT_KD_T%>'
<%
			}

			if(! ERI_ALSB_PANJ_T.equals("")) {
%>
		 		ERI_ALSB_PANJ='<%= ERI_ALSB_PANJ_T%>'
<%
			}

			if(! ERI_HTSB_PANJ_T.equals("")) {
%>
		 		ERI_HTSB_PANJ='<%= ERI_HTSB_PANJ_T%>'
<%
			}

			if(! ERI_EMSB_PANJ_T.equals("")) {
%>
		 		ERI_EMSB_PANJ='<%= ERI_EMSB_PANJ_T%>'
<%
			}

			if(! IIM_TRTP_CD_T.equals("")) {
%>
		 		IIM_TRTP_CD='<%= IIM_TRTP_CD_T%>'
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
