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

Select pfp_exam_dt, pfp_exam_sq,                                                                                     
           CASE WHEN A.PLP_JLPN_DSCD = '0SH' then '기타질환'                                                         
                WHEN A.PLP_JLPN_DSCD = '1SH' then '폐결핵/흉부'                                                      
                WHEN A.PLP_JLPN_DSCD = '2SH' then '고혈압'                                                           
                WHEN A.PLP_JLPN_DSCD = '3SH' then '당뇨'                                                             
                WHEN A.PLP_JLPN_DSCD = '4SH' then '이상지질혈'                                                       
                WHEN A.PLP_JLPN_DSCD = '5SH' then '빈혈'                                                             
                WHEN A.PLP_JLPN_DSCD = '6SH' then '청력'                                                             
                WHEN A.PLP_JLPN_DSCD = '7SH' then '간장질환'                                                         
                WHEN A.PLP_JLPN_DSCD = '8SH' then '신장질환'                                                         
                WHEN A.PLP_JLPN_DSCD = '9SH' then '비만'                                                             
                Else '' END PLP_JLPN_DSCD,                                                                             
           A.PLP_JLPN_PNCD,                                                                                              
           CASE WHEN A.PLP_JLPN_SH01 = '1' then '건강상담'                                                           
                WHEN A.PLP_JLPN_SH01 = '2' then '보호구지급 및 착용지도'                                             
                WHEN A.PLP_JLPN_SH01 = '3' then '추적검사검사항목에 대하여 추적검사가 필요'                          
                WHEN A.PLP_JLPN_SH01 = '4' then '근무중에 대하여 치료'                                               
                WHEN A.PLP_JLPN_SH01 = '5' then '근로시간 단축'                                                      
                WHEN A.PLP_JLPN_SH01 = '6' then '작업전환'                                                           
                WHEN A.PLP_JLPN_SH01 = '7' then '근로제한 및 금지'                                                   
                WHEN A.PLP_JLPN_SH01 = '8' then '산재요양신청서 직접 작성 등 당해 근로자에 대한 직업병확진의뢰 안내' 
                WHEN A.PLP_JLPN_SH01 = '9' then '기타'                                                               
                Else '' END PLP_JLPN_SH01,                                                                             
           CASE WHEN A.PLP_JLPN_SH02 = '1' then '건강상담'                                                           
                WHEN A.PLP_JLPN_SH02 = '2' then '보호구지급 및 착용지도'                                             
                WHEN A.PLP_JLPN_SH02 = '3' then '추적검사검사항목에 대하여 추적검사가 필요'                          
                WHEN A.PLP_JLPN_SH02 = '4' then '근무중에 대하여 치료'                                               
                WHEN A.PLP_JLPN_SH02 = '5' then '근로시간 단축'                                                      
                WHEN A.PLP_JLPN_SH02 = '6' then '작업전환'                                                           
                WHEN A.PLP_JLPN_SH02 = '7' then '근로제한 및 금지'                                                   
                WHEN A.PLP_JLPN_SH02 = '8' then '산재요양신청서 직접 작성 등 당해 근로자에 대한 직업병확진의뢰 안내' 
                WHEN A.PLP_JLPN_SH02 = '9' then '기타'                                                               
                Else '' END PLP_JLPN_SH02,                                                                             
           CASE WHEN A.PLP_JLPN_SH03 = '1' then '건강상담'                                                           
                WHEN A.PLP_JLPN_SH03 = '2' then '보호구지급 및 착용지도'                                             
                WHEN A.PLP_JLPN_SH03 = '3' then '추적검사검사항목에 대하여 추적검사가 필요'                          
                WHEN A.PLP_JLPN_SH03 = '4' then '근무중에 대하여 치료'                                               
                WHEN A.PLP_JLPN_SH03 = '5' then '근로시간 단축'                                                      
                WHEN A.PLP_JLPN_SH03 = '6' then '작업전환'                                                           
                WHEN A.PLP_JLPN_SH03 = '7' then '근로제한 및 금지'                                                   
                WHEN A.PLP_JLPN_SH03 = '8' then '산재요양신청서 직접 작성 등 당해 근로자에 대한 직업병확진의뢰 안내' 
                WHEN A.PLP_JLPN_SH03 = '9' then '기타'                                                               
                Else '' END PLP_JLPN_SH03,                                                                             
           A.PLP_JLPN_SHDS, A.PLP_JLPN_DOCV, A.PLP_ETC_EX, B.PFP_DOCTORFIR, C.IAU_PENL_NM                                
      From PT_LABOR_PANJUNG A                                                                                            
           Left Outer Join PT_FIR_PANJUNG B On B.PFP_EXAM_DT = A.PLP_EXAM_DT                                             
                                     And B.PFP_EXAM_SQ = A.PLP_EXAM_SQ                                                   
           Left Outer Join IT_AUTH_USER   C On C.IAU_EMP_NO  = B.PFP_DOCTORFIR                                           
     Where A.PLP_EXAM_DT   = :EXAM_DT
       And A.PLP_EXAM_SQ   = :EXAM_SQ
       And A.PLP_JLPN_PNCD <> 'A'                                                                                      
      Order By pfp_exam_dt, pfp_exam_Sq                                                                                  

		*/

		sql = " SELECT PFP_EXAM_DT, PFP_EXAM_SQ, CASE WHEN A.PLP_JLPN_DSCD = '0SH' THEN '기타질환' WHEN A.PLP_JLPN_DSCD = '1SH' THEN '폐결핵/흉부' WHEN A.PLP_JLPN_DSCD = '2SH' THEN '고혈압' WHEN A.PLP_JLPN_DSCD = '3SH' THEN '당뇨' WHEN A.PLP_JLPN_DSCD = '4SH' THEN '이상지질혈' WHEN A.PLP_JLPN_DSCD = '5SH' THEN '빈혈' WHEN A.PLP_JLPN_DSCD = '6SH' THEN '청력' WHEN A.PLP_JLPN_DSCD = '7SH' THEN '간장질환' WHEN A.PLP_JLPN_DSCD = '8SH' THEN '신장질환' WHEN A.PLP_JLPN_DSCD = '9SH' THEN '비만' ELSE '' END PLP_JLPN_DSCD, A.PLP_JLPN_PNCD, CASE WHEN A.PLP_JLPN_SH01 = '1' THEN '건강상담' WHEN A.PLP_JLPN_SH01 = '2' THEN '보호구지급 및 착용지도' WHEN A.PLP_JLPN_SH01 = '3' THEN '추적검사검사항목에 대하여 추적검사가 필요' WHEN A.PLP_JLPN_SH01 = '4' THEN '근무중에 대하여 치료' WHEN A.PLP_JLPN_SH01 = '5' THEN '근로시간 단축' WHEN A.PLP_JLPN_SH01 = '6' THEN '작업전환' WHEN A.PLP_JLPN_SH01 = '7' THEN '근로제한 및 금지' WHEN A.PLP_JLPN_SH01 = '8' THEN '산재요양신청서 직접 작성 등 당해 근로자에 대한 직업병확진의뢰 안내' WHEN A.PLP_JLPN_SH01 = '9' THEN '기타' ELSE '' END PLP_JLPN_SH01, CASE WHEN A.PLP_JLPN_SH02 = '1' THEN '건강상담' WHEN A.PLP_JLPN_SH02 = '2' THEN '보호구지급 및 착용지도' WHEN A.PLP_JLPN_SH02 = '3' THEN '추적검사검사항목에 대하여 추적검사가 필요' WHEN A.PLP_JLPN_SH02 = '4' THEN '근무중에 대하여 치료' WHEN A.PLP_JLPN_SH02 = '5' THEN '근로시간 단축' WHEN A.PLP_JLPN_SH02 = '6' THEN '작업전환' WHEN A.PLP_JLPN_SH02 = '7' THEN '근로제한 및 금지' WHEN A.PLP_JLPN_SH02 = '8' THEN '산재요양신청서 직접 작성 등 당해 근로자에 대한 직업병확진의뢰 안내' WHEN A.PLP_JLPN_SH02 = '9' THEN '기타' ELSE '' END PLP_JLPN_SH02, CASE WHEN A.PLP_JLPN_SH03 = '1' THEN '건강상담' WHEN A.PLP_JLPN_SH03 = '2' THEN '보호구지급 및 착용지도' WHEN A.PLP_JLPN_SH03 = '3' THEN '추적검사검사항목에 대하여 추적검사가 필요' WHEN A.PLP_JLPN_SH03 = '4' THEN '근무중에 대하여 치료' WHEN A.PLP_JLPN_SH03 = '5' THEN '근로시간 단축' WHEN A.PLP_JLPN_SH03 = '6' THEN '작업전환' WHEN A.PLP_JLPN_SH03 = '7' THEN '근로제한 및 금지' WHEN A.PLP_JLPN_SH03 = '8' THEN '산재요양신청서 직접 작성 등 당해 근로자에 대한 직업병확진의뢰 안내' WHEN A.PLP_JLPN_SH03 = '9' THEN '기타' ELSE '' END PLP_JLPN_SH03, A.PLP_JLPN_SHDS, A.PLP_JLPN_DOCV, A.PLP_ETC_EX, B.PFP_DOCTORFIR, C.IAU_PENL_NM";
		sql += " FROM PT_LABOR_PANJUNG A LEFT OUTER JOIN PT_FIR_PANJUNG B";
		sql += " ON B.PFP_EXAM_DT = A.PLP_EXAM_DT";
		sql += " AND B.PFP_EXAM_SQ = A.PLP_EXAM_SQ LEFT OUTER JOIN IT_AUTH_USER C";
		sql += " ON C.IAU_EMP_NO = B.PFP_DOCTORFIR";
		sql += " WHERE A.PLP_EXAM_DT = '" + EXAM_DT + "'";
		sql += " AND A.PLP_EXAM_SQ = '" + EXAM_SQ + "'";
		sql += " AND A.PLP_JLPN_PNCD <> 'A'";
		sql += " ORDER BY PFP_EXAM_DT, PFP_EXAM_SQ";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uPostManagement_NEWCounseling_UP_CSP_Display_001 \n";
			G_INFO += "설명 : 사업장 판정정보 로딩 \n";
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
		<s:AttributeType name='PFP_EXAM_DT' rs:number='1' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_FIR_PANJUNG'
			 rs:basecolumn='PFP_EXAM_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_EXAM_SQ' rs:number='2' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_FIR_PANJUNG'
			 rs:basecolumn='PFP_EXAM_SQ'>
			<s:datatype dt:type='string' dt:maxLength='6'/>
		</s:AttributeType>
		<s:AttributeType name='PLP_JLPN_DSCD' rs:number='3' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_LABOR_PANJUNG'
			 rs:basecolumn='PLP_JLPN_DSCD'>
			<s:datatype dt:type='string' dt:maxLength='11'/>
		</s:AttributeType>
		<s:AttributeType name='PLP_JLPN_PNCD' rs:number='4' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='PLP_JLPN_SH01' rs:number='5' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_LABOR_PANJUNG'
			 rs:basecolumn='PLP_JLPN_SH01'>
			<s:datatype dt:type='string' dt:maxLength='66'/>
		</s:AttributeType>
		<s:AttributeType name='PLP_JLPN_SH02' rs:number='6' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_LABOR_PANJUNG'
			 rs:basecolumn='PLP_JLPN_SH02'>
			<s:datatype dt:type='string' dt:maxLength='66'/>
		</s:AttributeType>
		<s:AttributeType name='PLP_JLPN_SH03' rs:number='7' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_LABOR_PANJUNG'
			 rs:basecolumn='PLP_JLPN_SH03'>
			<s:datatype dt:type='string' dt:maxLength='66'/>
		</s:AttributeType>
		<s:AttributeType name='PLP_JLPN_SHDS' rs:number='8' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='PLP_JLPN_DOCV' rs:number='9' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_LABOR_PANJUNG'
			 rs:basecolumn='PLP_JLPN_DOCV'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='PLP_ETC_EX' rs:number='10' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_LABOR_PANJUNG'
			 rs:basecolumn='PLP_ETC_EX'>
			<s:datatype dt:type='string' dt:maxLength='60'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_DOCTORFIR' rs:number='11' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_FIR_PANJUNG'
			 rs:basecolumn='PFP_DOCTORFIR'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_PENL_NM' rs:number='12' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_PENL_NM'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='13' rs:rowid='true' rs:basetable='PT_LABOR_PANJUNG' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c13' rs:name='ROWID' rs:number='14' rs:rowid='true' rs:basetable='PT_FIR_PANJUNG' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c14' rs:name='ROWID' rs:number='15' rs:rowid='true' rs:basetable='IT_AUTH_USER' rs:basecolumn='ROWID'
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

			String PFP_EXAM_DT_T = cRsList.getString("PFP_EXAM_DT");
			String PFP_EXAM_SQ_T = cRsList.getString("PFP_EXAM_SQ");
			String PLP_JLPN_DSCD_T = cRsList.getString("PLP_JLPN_DSCD");
			String PLP_JLPN_PNCD_T = cRsList.getString("PLP_JLPN_PNCD");
			String PLP_JLPN_SH01_T = cRsList.getString("PLP_JLPN_SH01");
			String PLP_JLPN_SH02_T = cRsList.getString("PLP_JLPN_SH02");
			String PLP_JLPN_SH03_T = cRsList.getString("PLP_JLPN_SH03");
			String PLP_JLPN_SHDS_T = cRsList.getString("PLP_JLPN_SHDS");
			String PLP_JLPN_DOCV_T = cRsList.getString("PLP_JLPN_DOCV");
			String PLP_ETC_EX_T = cRsList.getString("PLP_ETC_EX");
			String PFP_DOCTORFIR_T = cRsList.getString("PFP_DOCTORFIR");
			String IAU_PENL_NM_T = cRsList.getString("IAU_PENL_NM");
			String ROWID_T = cRsList.getString("ROWID");
			String c13_T = cRsList.getString("c13");
			String c14_T = cRsList.getString("c14");
%>
			<z:row
<%
			if(! PFP_EXAM_DT_T.equals("")) {
%>
		 		PFP_EXAM_DT='<%= PFP_EXAM_DT_T%>'
<%
			}

			if(! PFP_EXAM_SQ_T.equals("")) {
%>
		 		PFP_EXAM_SQ='<%= PFP_EXAM_SQ_T%>'
<%
			}

			if(! PLP_JLPN_DSCD_T.equals("")) {
%>
		 		PLP_JLPN_DSCD='<%= PLP_JLPN_DSCD_T%>'
<%
			}

			if(! PLP_JLPN_PNCD_T.equals("")) {
%>
		 		PLP_JLPN_PNCD='<%= PLP_JLPN_PNCD_T%>'
<%
			}

			if(! PLP_JLPN_SH01_T.equals("")) {
%>
		 		PLP_JLPN_SH01='<%= PLP_JLPN_SH01_T%>'
<%
			}

			if(! PLP_JLPN_SH02_T.equals("")) {
%>
		 		PLP_JLPN_SH02='<%= PLP_JLPN_SH02_T%>'
<%
			}

			if(! PLP_JLPN_SH03_T.equals("")) {
%>
		 		PLP_JLPN_SH03='<%= PLP_JLPN_SH03_T%>'
<%
			}

			if(! PLP_JLPN_SHDS_T.equals("")) {
%>
		 		PLP_JLPN_SHDS='<%= PLP_JLPN_SHDS_T%>'
<%
			}

			if(! PLP_JLPN_DOCV_T.equals("")) {
%>
		 		PLP_JLPN_DOCV='<%= PLP_JLPN_DOCV_T%>'
<%
			}

			if(! PLP_ETC_EX_T.equals("")) {
%>
		 		PLP_ETC_EX='<%= PLP_ETC_EX_T%>'
<%
			}

			if(! PFP_DOCTORFIR_T.equals("")) {
%>
		 		PFP_DOCTORFIR='<%= PFP_DOCTORFIR_T%>'
<%
			}

			if(! IAU_PENL_NM_T.equals("")) {
%>
		 		IAU_PENL_NM='<%= IAU_PENL_NM_T%>'
<%
			}
%>
				ROWID='<%= cnt%>'
				c13='<%= cnt%>'
				c14='<%= cnt%>'
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
