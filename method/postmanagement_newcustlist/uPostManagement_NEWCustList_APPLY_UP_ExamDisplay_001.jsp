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

		String CUST_NO = htMethod.get("CUST_NO");

		//
		if(CUST_NO == null) { CUST_NO = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT EEA_EXAM_DT, EEA_EXAM_SQ, EEA_CHART_NO, EEA_SPCL_LT,  EEA_HTSB_YN, EEA_SPSB_YN,    
       GetCOMMON_LvCdToNm('0401',EEA_EXAM_CD ,'5',5) EEA_EXAM_NM,                 
       GetCOMMON_LvCdToNm('0401',EEA_HTSB_CD ,'5',5) EEA_HTSB_NM,                 
       GetCOMMON_LvCdToNm('0401',EEA_SPSB_CD ,'5',5) EEA_SPSB_NM,                 
       GetCOMMON_LvCdToNm('0401',EEA_CVSB_CD ,'5',5) EEA_CVSB_NM,                 
       GetCOMMON_LvCdToNm('0401',EEA_EMSB_CD ,'5',5) EEA_EMSB_NM,                 
       GetCOMMON_LvCdToNm('0401',EEA_ETSB_CD ,'5',5) EEA_ETSB_NM,                 
       CASE WHEN (EEA_EXAM_CD   = '14001') OR (EEA_ORAL_YN = 'N') THEN ''           
            else EEA_ORAL_YN END EEA_ORAL_YN,                                             
       CASE WHEN EEA_STOMA_CD  = '0' THEN ''                                          
            else GetCOMMON_LvCdToNm('0915',EEA_STOMA_CD ,'5',1) END EEA_STOMA_NM, 
       CASE WHEN EEA_COLON_CD  = '0' THEN ''                                          
            else GetCOMMON_LvCdToNm('0915',EEA_COLON_CD ,'5',1) END EEA_COLON_NM, 
       CASE WHEN EEA_LIVER_CD  = '0' THEN ''                                          
            else GetCOMMON_LvCdToNm('0915',EEA_LIVER_CD ,'5',1) END EEA_LIVER_NM, 
       CASE WHEN EEA_BAST_CD   = '0' THEN ''                                          
            else GetCOMMON_LvCdToNm('0915',EEA_BAST_CD  ,'5',1) END EEA_BAST_NM,  
       CASE WHEN EEA_UTER_CD   = '0' THEN ''                                          
            else GetCOMMON_LvCdToNm('0915',EEA_UTER_CD  ,'5',1) END EEA_UTER_NM,  
       GetCOMMON_LvCdToNm('0910',EEA_SPCL_CD ,'5',2) EEA_SPCL_NM                  
  FROM ET_EXAM_ACPT                                                                       
 WHERE EEA_CUST_NO = :CUST_NO                                                
   AND EEA_ORDER_YN <> 'C'                                                              
 ORDER BY EEA_EXAM_DT desc                                                                
		*/

		sql = " SELECT EEA_EXAM_DT, EEA_EXAM_SQ, EEA_CHART_NO, EEA_SPCL_LT, EEA_HTSB_YN, EEA_SPSB_YN, GETCOMMON_LVCDTONM('0401',EEA_EXAM_CD ,'5',5) EEA_EXAM_NM, GETCOMMON_LVCDTONM('0401',EEA_HTSB_CD ,'5',5) EEA_HTSB_NM, GETCOMMON_LVCDTONM('0401',EEA_SPSB_CD ,'5',5) EEA_SPSB_NM, GETCOMMON_LVCDTONM('0401',EEA_CVSB_CD ,'5',5) EEA_CVSB_NM, GETCOMMON_LVCDTONM('0401',EEA_EMSB_CD ,'5',5) EEA_EMSB_NM, GETCOMMON_LVCDTONM('0401',EEA_ETSB_CD ,'5',5) EEA_ETSB_NM";
		sql += ", CASE WHEN (EEA_EXAM_CD = '14001') OR (EEA_ORAL_YN = 'N') THEN '' ELSE EEA_ORAL_YN END EEA_ORAL_YN";
		sql += ", CASE WHEN EEA_STOMA_CD = '0' THEN '' ELSE GETCOMMON_LVCDTONM('0915',EEA_STOMA_CD ,'5',1) END EEA_STOMA_NM";
		sql += ", CASE WHEN EEA_COLON_CD = '0' THEN '' ELSE GETCOMMON_LVCDTONM('0915',EEA_COLON_CD ,'5',1) END EEA_COLON_NM";
		sql += ", CASE WHEN EEA_LIVER_CD = '0' THEN '' ELSE GETCOMMON_LVCDTONM('0915',EEA_LIVER_CD ,'5',1) END EEA_LIVER_NM";
		sql += ", CASE WHEN EEA_BAST_CD = '0' THEN '' ELSE GETCOMMON_LVCDTONM('0915',EEA_BAST_CD ,'5',1) END EEA_BAST_NM";
		sql += ", CASE WHEN EEA_UTER_CD = '0' THEN '' ELSE GETCOMMON_LVCDTONM('0915',EEA_UTER_CD ,'5',1) END EEA_UTER_NM";
		sql += ", GETCOMMON_LVCDTONM('0910',EEA_SPCL_CD ,'5',2) EEA_SPCL_NM";
		sql += " FROM ET_EXAM_ACPT";
		sql += " WHERE EEA_CUST_NO = '" + CUST_NO + "'";
		sql += " AND EEA_ORDER_YN <> 'C'";
		sql += " ORDER BY EEA_EXAM_DT DESC";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uPostManagement_NEWCustList_APPLY_UP_ExamDisplay_001 \n";
			G_INFO += "설명 : 접수정보 로딩 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " CUST_NO : " + CUST_NO + " \n";
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
		<s:AttributeType name='EEA_EXAM_DT' rs:number='1' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_EXAM_DT'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_EXAM_SQ' rs:number='2' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_EXAM_SQ'>
			<s:datatype dt:type='string' dt:maxLength='6' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_CHART_NO' rs:number='3' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_CHART_NO'>
			<s:datatype dt:type='string' dt:maxLength='30'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SPCL_LT' rs:number='4' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_SPCL_LT'>
			<s:datatype dt:type='string' dt:maxLength='500'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_HTSB_YN' rs:number='5' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_HTSB_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SPSB_YN' rs:number='6' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_SPSB_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_EXAM_NM' rs:number='7' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_HTSB_NM' rs:number='8' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SPSB_NM' rs:number='9' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_CVSB_NM' rs:number='10' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_EMSB_NM' rs:number='11' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_ETSB_NM' rs:number='12' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_ORAL_YN' rs:number='13' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_ORAL_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_STOMA_NM' rs:number='14' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_STOMA_NM'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_COLON_NM' rs:number='15' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_COLON_NM'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_LIVER_NM' rs:number='16' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_LIVER_NM'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_BAST_NM' rs:number='17' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_BAST_NM'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_UTER_NM' rs:number='18' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_UTER_NM'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SPCL_NM' rs:number='19' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='20' rs:rowid='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='ROWID'
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

			String EEA_EXAM_DT_T = cRsList.getString("EEA_EXAM_DT");
			String EEA_EXAM_SQ_T = cRsList.getString("EEA_EXAM_SQ");
			String EEA_CHART_NO_T = cRsList.getString("EEA_CHART_NO");
			String EEA_SPCL_LT_T = cRsList.getString("EEA_SPCL_LT");
			String EEA_HTSB_YN_T = cRsList.getString("EEA_HTSB_YN");
			String EEA_SPSB_YN_T = cRsList.getString("EEA_SPSB_YN");
			String EEA_EXAM_NM_T = cRsList.getString("EEA_EXAM_NM");
			String EEA_HTSB_NM_T = cRsList.getString("EEA_HTSB_NM");
			String EEA_SPSB_NM_T = cRsList.getString("EEA_SPSB_NM");
			String EEA_CVSB_NM_T = cRsList.getString("EEA_CVSB_NM");
			String EEA_EMSB_NM_T = cRsList.getString("EEA_EMSB_NM");
			String EEA_ETSB_NM_T = cRsList.getString("EEA_ETSB_NM");
			String EEA_ORAL_YN_T = cRsList.getString("EEA_ORAL_YN");
			String EEA_STOMA_NM_T = cRsList.getString("EEA_STOMA_NM");
			String EEA_COLON_NM_T = cRsList.getString("EEA_COLON_NM");
			String EEA_LIVER_NM_T = cRsList.getString("EEA_LIVER_NM");
			String EEA_BAST_NM_T = cRsList.getString("EEA_BAST_NM");
			String EEA_UTER_NM_T = cRsList.getString("EEA_UTER_NM");
			String EEA_SPCL_NM_T = cRsList.getString("EEA_SPCL_NM");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! EEA_EXAM_DT_T.equals("")) {
%>
		 		EEA_EXAM_DT='<%= EEA_EXAM_DT_T%>'
<%
			}

			if(! EEA_EXAM_SQ_T.equals("")) {
%>
		 		EEA_EXAM_SQ='<%= EEA_EXAM_SQ_T%>'
<%
			}

			if(! EEA_CHART_NO_T.equals("")) {
%>
		 		EEA_CHART_NO='<%= EEA_CHART_NO_T%>'
<%
			}

			if(! EEA_SPCL_LT_T.equals("")) {
%>
		 		EEA_SPCL_LT='<%= EEA_SPCL_LT_T%>'
<%
			}

			if(! EEA_HTSB_YN_T.equals("")) {
%>
		 		EEA_HTSB_YN='<%= EEA_HTSB_YN_T%>'
<%
			}

			if(! EEA_SPSB_YN_T.equals("")) {
%>
		 		EEA_SPSB_YN='<%= EEA_SPSB_YN_T%>'
<%
			}

			if(! EEA_EXAM_NM_T.equals("")) {
%>
		 		EEA_EXAM_NM='<%= EEA_EXAM_NM_T%>'
<%
			}

			if(! EEA_HTSB_NM_T.equals("")) {
%>
		 		EEA_HTSB_NM='<%= EEA_HTSB_NM_T%>'
<%
			}

			if(! EEA_SPSB_NM_T.equals("")) {
%>
		 		EEA_SPSB_NM='<%= EEA_SPSB_NM_T%>'
<%
			}

			if(! EEA_CVSB_NM_T.equals("")) {
%>
		 		EEA_CVSB_NM='<%= EEA_CVSB_NM_T%>'
<%
			}

			if(! EEA_EMSB_NM_T.equals("")) {
%>
		 		EEA_EMSB_NM='<%= EEA_EMSB_NM_T%>'
<%
			}

			if(! EEA_ETSB_NM_T.equals("")) {
%>
		 		EEA_ETSB_NM='<%= EEA_ETSB_NM_T%>'
<%
			}

			if(! EEA_ORAL_YN_T.equals("")) {
%>
		 		EEA_ORAL_YN='<%= EEA_ORAL_YN_T%>'
<%
			}

			if(! EEA_STOMA_NM_T.equals("")) {
%>
		 		EEA_STOMA_NM='<%= EEA_STOMA_NM_T%>'
<%
			}

			if(! EEA_COLON_NM_T.equals("")) {
%>
		 		EEA_COLON_NM='<%= EEA_COLON_NM_T%>'
<%
			}

			if(! EEA_LIVER_NM_T.equals("")) {
%>
		 		EEA_LIVER_NM='<%= EEA_LIVER_NM_T%>'
<%
			}

			if(! EEA_BAST_NM_T.equals("")) {
%>
		 		EEA_BAST_NM='<%= EEA_BAST_NM_T%>'
<%
			}

			if(! EEA_UTER_NM_T.equals("")) {
%>
		 		EEA_UTER_NM='<%= EEA_UTER_NM_T%>'
<%
			}

			if(! EEA_SPCL_NM_T.equals("")) {
%>
		 		EEA_SPCL_NM='<%= EEA_SPCL_NM_T%>'
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
