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

Select CASE WHEN A.ECG_RSLT_KD = '1' then '이상소견없음'      
            WHEN A.ECG_RSLT_KD = '2' then '양성결절'          
            WHEN A.ECG_RSLT_KD = '3' then '경계선결절'        
            WHEN A.ECG_RSLT_KD = '4' then '폐암의심심'        
            WHEN A.ECG_RSLT_KD = '5' then '기타'              
            Else '' END ECG_RSLT_KD,                            
       A.*, B.IAU_PENL_NM                                         
  From ET_CANCER_LUNG A                                           
  Left Outer Join IT_AUTH_USER B On B.IAU_EMP_NO  = A.ECG_LICEN_CD
 Where A.ECG_EXAM_DT = :EXAM_DT
   And A.ECG_EXAM_SQ = :EXAM_SQ
		*/

		sql = " SELECT CASE WHEN A.ECG_RSLT_KD = '1' THEN '이상소견없음' WHEN A.ECG_RSLT_KD = '2' THEN '양성결절' WHEN A.ECG_RSLT_KD = '3' THEN '경계선결절' WHEN A.ECG_RSLT_KD = '4' THEN '폐암의심심' WHEN A.ECG_RSLT_KD = '5' THEN '기타' ELSE '' END ECG_RSLT_KD, A.*, B.IAU_PENL_NM";
		sql += " FROM ET_CANCER_LUNG A LEFT OUTER JOIN IT_AUTH_USER B";
		sql += " ON B.IAU_EMP_NO = A.ECG_LICEN_CD";
		sql += " WHERE A.ECG_EXAM_DT = '" + EXAM_DT + "'";
		sql += " AND A.ECG_EXAM_SQ = '" + EXAM_SQ + "'";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uPostManagement_NEWCustList_APPLY_UP_PanjungDispaly_008 \n";
			G_INFO += "설명 : 폐암정보 로딩 \n";
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
		<s:AttributeType name='ECG_RSLT_KD' rs:number='1' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_RSLT_KD'>
			<s:datatype dt:type='string' dt:maxLength='12'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_EXAM_DT' rs:number='2' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG' rs:basecolumn='ECG_EXAM_DT'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_EXAM_SQ' rs:number='3' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG' rs:basecolumn='ECG_EXAM_SQ'>
			<s:datatype dt:type='string' dt:maxLength='6' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_CFRM_CD' rs:number='4' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_CFRM_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_LUEX_DT' rs:number='5' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_LUEX_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_LUEX_KD' rs:number='6' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_LUEX_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_CTDI_VL' rs:number='7' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_CTDI_VL'>
			<s:datatype dt:type='string' dt:maxLength='6'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_BEFO_YN' rs:number='8' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_BEFO_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_BEFO_YY' rs:number='9' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_BEFO_YY'>
			<s:datatype dt:type='string' dt:maxLength='4'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_BEFO_MM' rs:number='10' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_BEFO_MM'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_PNRT_YN' rs:number='11' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_PNRT_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_PNRT1_YN' rs:number='12' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_PNRT1_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_PNRT1IC_KD' rs:number='13' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_PNRT1IC_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_PNRT1SL_KD' rs:number='14' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_PNRT1SL_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_PNRT1SZ1_VL' rs:number='15' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_PNRT1SZ1_VL'>
			<s:datatype dt:type='string' dt:maxLength='3'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_PNRT1SZ2_VL' rs:number='16' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_PNRT1SZ2_VL'>
			<s:datatype dt:type='string' dt:maxLength='3'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_PNRT1FT_KD' rs:number='17' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_PNRT1FT_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_PNRT1TR1_KD' rs:number='18' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_PNRT1TR1_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_PNRT1TR2_KD' rs:number='19' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_PNRT1TR2_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_PNRT2_YN' rs:number='20' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_PNRT2_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_PNRT2IC_KD' rs:number='21' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_PNRT2IC_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_PNRT2SL_KD' rs:number='22' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_PNRT2SL_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_PNRT2SZ1_VL' rs:number='23' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_PNRT2SZ1_VL'>
			<s:datatype dt:type='string' dt:maxLength='3'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_PNRT2SZ2_VL' rs:number='24' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_PNRT2SZ2_VL'>
			<s:datatype dt:type='string' dt:maxLength='3'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_PNRT2FT_KD' rs:number='25' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_PNRT2FT_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_PNRT2TR1_KD' rs:number='26' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_PNRT2TR1_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_PNRT2TR2_KD' rs:number='27' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_PNRT2TR2_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_PNRT3_YN' rs:number='28' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_PNRT3_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_PNRT3IC_KD' rs:number='29' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_PNRT3IC_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_PNRT3SL_KD' rs:number='30' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_PNRT3SL_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_PNRT3SZ1_VL' rs:number='31' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_PNRT3SZ1_VL'>
			<s:datatype dt:type='string' dt:maxLength='3'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_PNRT3SZ2_VL' rs:number='32' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_PNRT3SZ2_VL'>
			<s:datatype dt:type='string' dt:maxLength='3'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_PNRT3FT_KD' rs:number='33' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_PNRT3FT_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_PNRT3TR1_KD' rs:number='34' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_PNRT3TR1_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_PNRT3TR2_KD' rs:number='35' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_PNRT3TR2_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_PNRT4_YN' rs:number='36' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_PNRT4_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_PNRT4IC_KD' rs:number='37' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_PNRT4IC_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_PNRT4SL_KD' rs:number='38' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_PNRT4SL_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_PNRT4SZ1_VL' rs:number='39' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_PNRT4SZ1_VL'>
			<s:datatype dt:type='string' dt:maxLength='3'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_PNRT4SZ2_VL' rs:number='40' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_PNRT4SZ2_VL'>
			<s:datatype dt:type='string' dt:maxLength='3'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_PNRT4FT_KD' rs:number='41' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_PNRT4FT_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_PNRT4TR1_KD' rs:number='42' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_PNRT4TR1_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_PNRT4TR2_KD' rs:number='43' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_PNRT4TR2_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_PNRT5_YN' rs:number='44' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_PNRT5_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_PNRT5IC_KD' rs:number='45' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_PNRT5IC_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_PNRT5SL_KD' rs:number='46' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_PNRT5SL_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_PNRT5SZ1_VL' rs:number='47' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_PNRT5SZ1_VL'>
			<s:datatype dt:type='string' dt:maxLength='3'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_PNRT5SZ2_VL' rs:number='48' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_PNRT5SZ2_VL'>
			<s:datatype dt:type='string' dt:maxLength='3'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_PNRT5FT_KD' rs:number='49' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_PNRT5FT_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_PNRT5TR1_KD' rs:number='50' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_PNRT5TR1_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_PNRT5TR2_KD' rs:number='51' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_PNRT5TR2_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_PNRT6_YN' rs:number='52' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_PNRT6_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_PNRT6IC_KD' rs:number='53' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_PNRT6IC_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_PNRT6SL_KD' rs:number='54' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_PNRT6SL_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_PNRT6SZ1_VL' rs:number='55' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_PNRT6SZ1_VL'>
			<s:datatype dt:type='string' dt:maxLength='3'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_PNRT6SZ2_VL' rs:number='56' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_PNRT6SZ2_VL'>
			<s:datatype dt:type='string' dt:maxLength='3'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_PNRT6FT_KD' rs:number='57' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_PNRT6FT_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_PNRT6TR1_KD' rs:number='58' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_PNRT6TR1_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_PNRT6TR2_KD' rs:number='59' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_PNRT6TR2_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_BRLE_YN' rs:number='60' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_BRLE_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_BRLE_EX' rs:number='61' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_BRLE_EX'>
			<s:datatype dt:type='string' dt:maxLength='40'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_LUCN_KD' rs:number='62' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_LUCN_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_LUCN_EX' rs:number='63' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_LUCN_EX'>
			<s:datatype dt:type='string' dt:maxLength='40'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_SCRT_CD' rs:number='64' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_SCRT_CD'>
			<s:datatype dt:type='string' dt:maxLength='9'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_SCRT_EX' rs:number='65' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_SCRT_EX'>
			<s:datatype dt:type='string' dt:maxLength='40'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_INPT_YN' rs:number='66' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_INPT_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='c66' rs:name='ECG_RSLT_KD' rs:number='67' rs:nullable='true' rs:writeunknown='true'
			 rs:basetable='ET_CANCER_LUNG' rs:basecolumn='ECG_RSLT_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_RSLT2_KD' rs:number='68' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_RSLT2_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_ETC_EX' rs:number='69' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_ETC_EX'>
			<s:datatype dt:type='string' dt:maxLength='40'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_RSLT_EX' rs:number='70' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_RSLT_EX'>
			<s:datatype dt:type='string' dt:maxLength='1200'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_RSLT_ETC_EX' rs:number='71' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_RSLT_ETC_EX'>
			<s:datatype dt:type='string' dt:maxLength='1200'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_CFRM_DT' rs:number='72' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_CFRM_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_LICEN_CD' rs:number='73' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_LICEN_CD'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_DECI_LICEN_CD' rs:number='74' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_DECI_LICEN_CD'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_LUCN_YN' rs:number='75' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_LUCN_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_AFRL_EX' rs:number='76' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_AFRL_EX'>
			<s:datatype dt:type='string' dt:maxLength='1200'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_AFSM_EX' rs:number='77' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_AFSM_EX'>
			<s:datatype dt:type='string' dt:maxLength='1200'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_AFDT_DT' rs:number='78' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_AFDT_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_AFPL_CD' rs:number='79' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_AFPL_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_AFTE_LICEN_CD' rs:number='80' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_AFTE_LICEN_CD'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_INPUT_DTT' rs:number='81' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_INPUT_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_INPUT_ID' rs:number='82' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_INPUT_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_MODI_DTT' rs:number='83' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_MODI_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_MODI_ID' rs:number='84' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_MODI_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_ETC_KD' rs:number='85' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_ETC_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_PENL_NM' rs:number='86' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='87' rs:rowid='true' rs:basetable='ET_CANCER_LUNG' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c87' rs:name='ROWID' rs:number='88' rs:rowid='true' rs:basetable='IT_AUTH_USER' rs:basecolumn='ROWID'
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

			String ECG_RSLT_KD_T = cRsList.getString("ECG_RSLT_KD");
			String ECG_EXAM_DT_T = cRsList.getString("ECG_EXAM_DT");
			String ECG_EXAM_SQ_T = cRsList.getString("ECG_EXAM_SQ");
			String ECG_CFRM_CD_T = cRsList.getString("ECG_CFRM_CD");
			String ECG_LUEX_DT_T = cRsList.getString("ECG_LUEX_DT");
			String ECG_LUEX_KD_T = cRsList.getString("ECG_LUEX_KD");
			String ECG_CTDI_VL_T = cRsList.getString("ECG_CTDI_VL");
			String ECG_BEFO_YN_T = cRsList.getString("ECG_BEFO_YN");
			String ECG_BEFO_YY_T = cRsList.getString("ECG_BEFO_YY");
			String ECG_BEFO_MM_T = cRsList.getString("ECG_BEFO_MM");
			String ECG_PNRT_YN_T = cRsList.getString("ECG_PNRT_YN");
			String ECG_PNRT1_YN_T = cRsList.getString("ECG_PNRT1_YN");
			String ECG_PNRT1IC_KD_T = cRsList.getString("ECG_PNRT1IC_KD");
			String ECG_PNRT1SL_KD_T = cRsList.getString("ECG_PNRT1SL_KD");
			String ECG_PNRT1SZ1_VL_T = cRsList.getString("ECG_PNRT1SZ1_VL");
			String ECG_PNRT1SZ2_VL_T = cRsList.getString("ECG_PNRT1SZ2_VL");
			String ECG_PNRT1FT_KD_T = cRsList.getString("ECG_PNRT1FT_KD");
			String ECG_PNRT1TR1_KD_T = cRsList.getString("ECG_PNRT1TR1_KD");
			String ECG_PNRT1TR2_KD_T = cRsList.getString("ECG_PNRT1TR2_KD");
			String ECG_PNRT2_YN_T = cRsList.getString("ECG_PNRT2_YN");
			String ECG_PNRT2IC_KD_T = cRsList.getString("ECG_PNRT2IC_KD");
			String ECG_PNRT2SL_KD_T = cRsList.getString("ECG_PNRT2SL_KD");
			String ECG_PNRT2SZ1_VL_T = cRsList.getString("ECG_PNRT2SZ1_VL");
			String ECG_PNRT2SZ2_VL_T = cRsList.getString("ECG_PNRT2SZ2_VL");
			String ECG_PNRT2FT_KD_T = cRsList.getString("ECG_PNRT2FT_KD");
			String ECG_PNRT2TR1_KD_T = cRsList.getString("ECG_PNRT2TR1_KD");
			String ECG_PNRT2TR2_KD_T = cRsList.getString("ECG_PNRT2TR2_KD");
			String ECG_PNRT3_YN_T = cRsList.getString("ECG_PNRT3_YN");
			String ECG_PNRT3IC_KD_T = cRsList.getString("ECG_PNRT3IC_KD");
			String ECG_PNRT3SL_KD_T = cRsList.getString("ECG_PNRT3SL_KD");
			String ECG_PNRT3SZ1_VL_T = cRsList.getString("ECG_PNRT3SZ1_VL");
			String ECG_PNRT3SZ2_VL_T = cRsList.getString("ECG_PNRT3SZ2_VL");
			String ECG_PNRT3FT_KD_T = cRsList.getString("ECG_PNRT3FT_KD");
			String ECG_PNRT3TR1_KD_T = cRsList.getString("ECG_PNRT3TR1_KD");
			String ECG_PNRT3TR2_KD_T = cRsList.getString("ECG_PNRT3TR2_KD");
			String ECG_PNRT4_YN_T = cRsList.getString("ECG_PNRT4_YN");
			String ECG_PNRT4IC_KD_T = cRsList.getString("ECG_PNRT4IC_KD");
			String ECG_PNRT4SL_KD_T = cRsList.getString("ECG_PNRT4SL_KD");
			String ECG_PNRT4SZ1_VL_T = cRsList.getString("ECG_PNRT4SZ1_VL");
			String ECG_PNRT4SZ2_VL_T = cRsList.getString("ECG_PNRT4SZ2_VL");
			String ECG_PNRT4FT_KD_T = cRsList.getString("ECG_PNRT4FT_KD");
			String ECG_PNRT4TR1_KD_T = cRsList.getString("ECG_PNRT4TR1_KD");
			String ECG_PNRT4TR2_KD_T = cRsList.getString("ECG_PNRT4TR2_KD");
			String ECG_PNRT5_YN_T = cRsList.getString("ECG_PNRT5_YN");
			String ECG_PNRT5IC_KD_T = cRsList.getString("ECG_PNRT5IC_KD");
			String ECG_PNRT5SL_KD_T = cRsList.getString("ECG_PNRT5SL_KD");
			String ECG_PNRT5SZ1_VL_T = cRsList.getString("ECG_PNRT5SZ1_VL");
			String ECG_PNRT5SZ2_VL_T = cRsList.getString("ECG_PNRT5SZ2_VL");
			String ECG_PNRT5FT_KD_T = cRsList.getString("ECG_PNRT5FT_KD");
			String ECG_PNRT5TR1_KD_T = cRsList.getString("ECG_PNRT5TR1_KD");
			String ECG_PNRT5TR2_KD_T = cRsList.getString("ECG_PNRT5TR2_KD");
			String ECG_PNRT6_YN_T = cRsList.getString("ECG_PNRT6_YN");
			String ECG_PNRT6IC_KD_T = cRsList.getString("ECG_PNRT6IC_KD");
			String ECG_PNRT6SL_KD_T = cRsList.getString("ECG_PNRT6SL_KD");
			String ECG_PNRT6SZ1_VL_T = cRsList.getString("ECG_PNRT6SZ1_VL");
			String ECG_PNRT6SZ2_VL_T = cRsList.getString("ECG_PNRT6SZ2_VL");
			String ECG_PNRT6FT_KD_T = cRsList.getString("ECG_PNRT6FT_KD");
			String ECG_PNRT6TR1_KD_T = cRsList.getString("ECG_PNRT6TR1_KD");
			String ECG_PNRT6TR2_KD_T = cRsList.getString("ECG_PNRT6TR2_KD");
			String ECG_BRLE_YN_T = cRsList.getString("ECG_BRLE_YN");
			String ECG_BRLE_EX_T = cRsList.getString("ECG_BRLE_EX");
			String ECG_LUCN_KD_T = cRsList.getString("ECG_LUCN_KD");
			String ECG_LUCN_EX_T = cRsList.getString("ECG_LUCN_EX");
			String ECG_SCRT_CD_T = cRsList.getString("ECG_SCRT_CD");
			String ECG_SCRT_EX_T = cRsList.getString("ECG_SCRT_EX");
			String ECG_INPT_YN_T = cRsList.getString("ECG_INPT_YN");
			String c66_T = cRsList.getString("c66");
			String ECG_RSLT2_KD_T = cRsList.getString("ECG_RSLT2_KD");
			String ECG_ETC_EX_T = cRsList.getString("ECG_ETC_EX");
			String ECG_RSLT_EX_T = cRsList.getString("ECG_RSLT_EX");
			String ECG_RSLT_ETC_EX_T = cRsList.getString("ECG_RSLT_ETC_EX");
			String ECG_CFRM_DT_T = cRsList.getString("ECG_CFRM_DT");
			String ECG_LICEN_CD_T = cRsList.getString("ECG_LICEN_CD");
			String ECG_DECI_LICEN_CD_T = cRsList.getString("ECG_DECI_LICEN_CD");
			String ECG_LUCN_YN_T = cRsList.getString("ECG_LUCN_YN");
			String ECG_AFRL_EX_T = cRsList.getString("ECG_AFRL_EX");
			String ECG_AFSM_EX_T = cRsList.getString("ECG_AFSM_EX");
			String ECG_AFDT_DT_T = cRsList.getString("ECG_AFDT_DT");
			String ECG_AFPL_CD_T = cRsList.getString("ECG_AFPL_CD");
			String ECG_AFTE_LICEN_CD_T = cRsList.getString("ECG_AFTE_LICEN_CD");
			String ECG_INPUT_DTT_T = cRsList.getDate2("ECG_INPUT_DTT");
			String ECG_INPUT_ID_T = cRsList.getString("ECG_INPUT_ID");
			String ECG_MODI_DTT_T = cRsList.getDate2("ECG_MODI_DTT");
			String ECG_MODI_ID_T = cRsList.getString("ECG_MODI_ID");
			String ECG_ETC_KD_T = cRsList.getString("ECG_ETC_KD");
			String IAU_PENL_NM_T = cRsList.getString("IAU_PENL_NM");
			String ROWID_T = cRsList.getString("ROWID");
			String c87_T = cRsList.getString("c87");
%>
			<z:row
<%
			if(! ECG_RSLT_KD_T.equals("")) {
%>
		 		ECG_RSLT_KD='<%= ECG_RSLT_KD_T%>'
<%
			}

			if(! ECG_EXAM_DT_T.equals("")) {
%>
		 		ECG_EXAM_DT='<%= ECG_EXAM_DT_T%>'
<%
			}

			if(! ECG_EXAM_SQ_T.equals("")) {
%>
		 		ECG_EXAM_SQ='<%= ECG_EXAM_SQ_T%>'
<%
			}

			if(! ECG_CFRM_CD_T.equals("")) {
%>
		 		ECG_CFRM_CD='<%= ECG_CFRM_CD_T%>'
<%
			}

			if(! ECG_LUEX_DT_T.equals("")) {
%>
		 		ECG_LUEX_DT='<%= ECG_LUEX_DT_T%>'
<%
			}

			if(! ECG_LUEX_KD_T.equals("")) {
%>
		 		ECG_LUEX_KD='<%= ECG_LUEX_KD_T%>'
<%
			}

			if(! ECG_CTDI_VL_T.equals("")) {
%>
		 		ECG_CTDI_VL='<%= ECG_CTDI_VL_T%>'
<%
			}

			if(! ECG_BEFO_YN_T.equals("")) {
%>
		 		ECG_BEFO_YN='<%= ECG_BEFO_YN_T%>'
<%
			}

			if(! ECG_BEFO_YY_T.equals("")) {
%>
		 		ECG_BEFO_YY='<%= ECG_BEFO_YY_T%>'
<%
			}

			if(! ECG_BEFO_MM_T.equals("")) {
%>
		 		ECG_BEFO_MM='<%= ECG_BEFO_MM_T%>'
<%
			}

			if(! ECG_PNRT_YN_T.equals("")) {
%>
		 		ECG_PNRT_YN='<%= ECG_PNRT_YN_T%>'
<%
			}

			if(! ECG_PNRT1_YN_T.equals("")) {
%>
		 		ECG_PNRT1_YN='<%= ECG_PNRT1_YN_T%>'
<%
			}

			if(! ECG_PNRT1IC_KD_T.equals("")) {
%>
		 		ECG_PNRT1IC_KD='<%= ECG_PNRT1IC_KD_T%>'
<%
			}

			if(! ECG_PNRT1SL_KD_T.equals("")) {
%>
		 		ECG_PNRT1SL_KD='<%= ECG_PNRT1SL_KD_T%>'
<%
			}

			if(! ECG_PNRT1SZ1_VL_T.equals("")) {
%>
		 		ECG_PNRT1SZ1_VL='<%= ECG_PNRT1SZ1_VL_T%>'
<%
			}

			if(! ECG_PNRT1SZ2_VL_T.equals("")) {
%>
		 		ECG_PNRT1SZ2_VL='<%= ECG_PNRT1SZ2_VL_T%>'
<%
			}

			if(! ECG_PNRT1FT_KD_T.equals("")) {
%>
		 		ECG_PNRT1FT_KD='<%= ECG_PNRT1FT_KD_T%>'
<%
			}

			if(! ECG_PNRT1TR1_KD_T.equals("")) {
%>
		 		ECG_PNRT1TR1_KD='<%= ECG_PNRT1TR1_KD_T%>'
<%
			}

			if(! ECG_PNRT1TR2_KD_T.equals("")) {
%>
		 		ECG_PNRT1TR2_KD='<%= ECG_PNRT1TR2_KD_T%>'
<%
			}

			if(! ECG_PNRT2_YN_T.equals("")) {
%>
		 		ECG_PNRT2_YN='<%= ECG_PNRT2_YN_T%>'
<%
			}

			if(! ECG_PNRT2IC_KD_T.equals("")) {
%>
		 		ECG_PNRT2IC_KD='<%= ECG_PNRT2IC_KD_T%>'
<%
			}

			if(! ECG_PNRT2SL_KD_T.equals("")) {
%>
		 		ECG_PNRT2SL_KD='<%= ECG_PNRT2SL_KD_T%>'
<%
			}

			if(! ECG_PNRT2SZ1_VL_T.equals("")) {
%>
		 		ECG_PNRT2SZ1_VL='<%= ECG_PNRT2SZ1_VL_T%>'
<%
			}

			if(! ECG_PNRT2SZ2_VL_T.equals("")) {
%>
		 		ECG_PNRT2SZ2_VL='<%= ECG_PNRT2SZ2_VL_T%>'
<%
			}

			if(! ECG_PNRT2FT_KD_T.equals("")) {
%>
		 		ECG_PNRT2FT_KD='<%= ECG_PNRT2FT_KD_T%>'
<%
			}

			if(! ECG_PNRT2TR1_KD_T.equals("")) {
%>
		 		ECG_PNRT2TR1_KD='<%= ECG_PNRT2TR1_KD_T%>'
<%
			}

			if(! ECG_PNRT2TR2_KD_T.equals("")) {
%>
		 		ECG_PNRT2TR2_KD='<%= ECG_PNRT2TR2_KD_T%>'
<%
			}

			if(! ECG_PNRT3_YN_T.equals("")) {
%>
		 		ECG_PNRT3_YN='<%= ECG_PNRT3_YN_T%>'
<%
			}

			if(! ECG_PNRT3IC_KD_T.equals("")) {
%>
		 		ECG_PNRT3IC_KD='<%= ECG_PNRT3IC_KD_T%>'
<%
			}

			if(! ECG_PNRT3SL_KD_T.equals("")) {
%>
		 		ECG_PNRT3SL_KD='<%= ECG_PNRT3SL_KD_T%>'
<%
			}

			if(! ECG_PNRT3SZ1_VL_T.equals("")) {
%>
		 		ECG_PNRT3SZ1_VL='<%= ECG_PNRT3SZ1_VL_T%>'
<%
			}

			if(! ECG_PNRT3SZ2_VL_T.equals("")) {
%>
		 		ECG_PNRT3SZ2_VL='<%= ECG_PNRT3SZ2_VL_T%>'
<%
			}

			if(! ECG_PNRT3FT_KD_T.equals("")) {
%>
		 		ECG_PNRT3FT_KD='<%= ECG_PNRT3FT_KD_T%>'
<%
			}

			if(! ECG_PNRT3TR1_KD_T.equals("")) {
%>
		 		ECG_PNRT3TR1_KD='<%= ECG_PNRT3TR1_KD_T%>'
<%
			}

			if(! ECG_PNRT3TR2_KD_T.equals("")) {
%>
		 		ECG_PNRT3TR2_KD='<%= ECG_PNRT3TR2_KD_T%>'
<%
			}

			if(! ECG_PNRT4_YN_T.equals("")) {
%>
		 		ECG_PNRT4_YN='<%= ECG_PNRT4_YN_T%>'
<%
			}

			if(! ECG_PNRT4IC_KD_T.equals("")) {
%>
		 		ECG_PNRT4IC_KD='<%= ECG_PNRT4IC_KD_T%>'
<%
			}

			if(! ECG_PNRT4SL_KD_T.equals("")) {
%>
		 		ECG_PNRT4SL_KD='<%= ECG_PNRT4SL_KD_T%>'
<%
			}

			if(! ECG_PNRT4SZ1_VL_T.equals("")) {
%>
		 		ECG_PNRT4SZ1_VL='<%= ECG_PNRT4SZ1_VL_T%>'
<%
			}

			if(! ECG_PNRT4SZ2_VL_T.equals("")) {
%>
		 		ECG_PNRT4SZ2_VL='<%= ECG_PNRT4SZ2_VL_T%>'
<%
			}

			if(! ECG_PNRT4FT_KD_T.equals("")) {
%>
		 		ECG_PNRT4FT_KD='<%= ECG_PNRT4FT_KD_T%>'
<%
			}

			if(! ECG_PNRT4TR1_KD_T.equals("")) {
%>
		 		ECG_PNRT4TR1_KD='<%= ECG_PNRT4TR1_KD_T%>'
<%
			}

			if(! ECG_PNRT4TR2_KD_T.equals("")) {
%>
		 		ECG_PNRT4TR2_KD='<%= ECG_PNRT4TR2_KD_T%>'
<%
			}

			if(! ECG_PNRT5_YN_T.equals("")) {
%>
		 		ECG_PNRT5_YN='<%= ECG_PNRT5_YN_T%>'
<%
			}

			if(! ECG_PNRT5IC_KD_T.equals("")) {
%>
		 		ECG_PNRT5IC_KD='<%= ECG_PNRT5IC_KD_T%>'
<%
			}

			if(! ECG_PNRT5SL_KD_T.equals("")) {
%>
		 		ECG_PNRT5SL_KD='<%= ECG_PNRT5SL_KD_T%>'
<%
			}

			if(! ECG_PNRT5SZ1_VL_T.equals("")) {
%>
		 		ECG_PNRT5SZ1_VL='<%= ECG_PNRT5SZ1_VL_T%>'
<%
			}

			if(! ECG_PNRT5SZ2_VL_T.equals("")) {
%>
		 		ECG_PNRT5SZ2_VL='<%= ECG_PNRT5SZ2_VL_T%>'
<%
			}

			if(! ECG_PNRT5FT_KD_T.equals("")) {
%>
		 		ECG_PNRT5FT_KD='<%= ECG_PNRT5FT_KD_T%>'
<%
			}

			if(! ECG_PNRT5TR1_KD_T.equals("")) {
%>
		 		ECG_PNRT5TR1_KD='<%= ECG_PNRT5TR1_KD_T%>'
<%
			}

			if(! ECG_PNRT5TR2_KD_T.equals("")) {
%>
		 		ECG_PNRT5TR2_KD='<%= ECG_PNRT5TR2_KD_T%>'
<%
			}

			if(! ECG_PNRT6_YN_T.equals("")) {
%>
		 		ECG_PNRT6_YN='<%= ECG_PNRT6_YN_T%>'
<%
			}

			if(! ECG_PNRT6IC_KD_T.equals("")) {
%>
		 		ECG_PNRT6IC_KD='<%= ECG_PNRT6IC_KD_T%>'
<%
			}

			if(! ECG_PNRT6SL_KD_T.equals("")) {
%>
		 		ECG_PNRT6SL_KD='<%= ECG_PNRT6SL_KD_T%>'
<%
			}

			if(! ECG_PNRT6SZ1_VL_T.equals("")) {
%>
		 		ECG_PNRT6SZ1_VL='<%= ECG_PNRT6SZ1_VL_T%>'
<%
			}

			if(! ECG_PNRT6SZ2_VL_T.equals("")) {
%>
		 		ECG_PNRT6SZ2_VL='<%= ECG_PNRT6SZ2_VL_T%>'
<%
			}

			if(! ECG_PNRT6FT_KD_T.equals("")) {
%>
		 		ECG_PNRT6FT_KD='<%= ECG_PNRT6FT_KD_T%>'
<%
			}

			if(! ECG_PNRT6TR1_KD_T.equals("")) {
%>
		 		ECG_PNRT6TR1_KD='<%= ECG_PNRT6TR1_KD_T%>'
<%
			}

			if(! ECG_PNRT6TR2_KD_T.equals("")) {
%>
		 		ECG_PNRT6TR2_KD='<%= ECG_PNRT6TR2_KD_T%>'
<%
			}

			if(! ECG_BRLE_YN_T.equals("")) {
%>
		 		ECG_BRLE_YN='<%= ECG_BRLE_YN_T%>'
<%
			}

			if(! ECG_BRLE_EX_T.equals("")) {
%>
		 		ECG_BRLE_EX='<%= ECG_BRLE_EX_T%>'
<%
			}

			if(! ECG_LUCN_KD_T.equals("")) {
%>
		 		ECG_LUCN_KD='<%= ECG_LUCN_KD_T%>'
<%
			}

			if(! ECG_LUCN_EX_T.equals("")) {
%>
		 		ECG_LUCN_EX='<%= ECG_LUCN_EX_T%>'
<%
			}

			if(! ECG_SCRT_CD_T.equals("")) {
%>
		 		ECG_SCRT_CD='<%= ECG_SCRT_CD_T%>'
<%
			}

			if(! ECG_SCRT_EX_T.equals("")) {
%>
		 		ECG_SCRT_EX='<%= ECG_SCRT_EX_T%>'
<%
			}

			if(! ECG_INPT_YN_T.equals("")) {
%>
		 		ECG_INPT_YN='<%= ECG_INPT_YN_T%>'
<%
			}

			if(! c66_T.equals("")) {
%>
		 		c66='<%= c66_T%>'
<%
			}

			if(! ECG_RSLT2_KD_T.equals("")) {
%>
		 		ECG_RSLT2_KD='<%= ECG_RSLT2_KD_T%>'
<%
			}

			if(! ECG_ETC_EX_T.equals("")) {
%>
		 		ECG_ETC_EX='<%= ECG_ETC_EX_T%>'
<%
			}

			if(! ECG_RSLT_EX_T.equals("")) {
%>
		 		ECG_RSLT_EX='<%= ECG_RSLT_EX_T%>'
<%
			}

			if(! ECG_RSLT_ETC_EX_T.equals("")) {
%>
		 		ECG_RSLT_ETC_EX='<%= ECG_RSLT_ETC_EX_T%>'
<%
			}

			if(! ECG_CFRM_DT_T.equals("")) {
%>
		 		ECG_CFRM_DT='<%= ECG_CFRM_DT_T%>'
<%
			}

			if(! ECG_LICEN_CD_T.equals("")) {
%>
		 		ECG_LICEN_CD='<%= ECG_LICEN_CD_T%>'
<%
			}

			if(! ECG_DECI_LICEN_CD_T.equals("")) {
%>
		 		ECG_DECI_LICEN_CD='<%= ECG_DECI_LICEN_CD_T%>'
<%
			}

			if(! ECG_LUCN_YN_T.equals("")) {
%>
		 		ECG_LUCN_YN='<%= ECG_LUCN_YN_T%>'
<%
			}

			if(! ECG_AFRL_EX_T.equals("")) {
%>
		 		ECG_AFRL_EX='<%= ECG_AFRL_EX_T%>'
<%
			}

			if(! ECG_AFSM_EX_T.equals("")) {
%>
		 		ECG_AFSM_EX='<%= ECG_AFSM_EX_T%>'
<%
			}

			if(! ECG_AFDT_DT_T.equals("")) {
%>
		 		ECG_AFDT_DT='<%= ECG_AFDT_DT_T%>'
<%
			}

			if(! ECG_AFPL_CD_T.equals("")) {
%>
		 		ECG_AFPL_CD='<%= ECG_AFPL_CD_T%>'
<%
			}

			if(! ECG_AFTE_LICEN_CD_T.equals("")) {
%>
		 		ECG_AFTE_LICEN_CD='<%= ECG_AFTE_LICEN_CD_T%>'
<%
			}

			if(! ECG_INPUT_DTT_T.equals("")) {
%>
		 		ECG_INPUT_DTT='<%= ECG_INPUT_DTT_T%>'
<%
			}

			if(! ECG_INPUT_ID_T.equals("")) {
%>
		 		ECG_INPUT_ID='<%= ECG_INPUT_ID_T%>'
<%
			}

			if(! ECG_MODI_DTT_T.equals("")) {
%>
		 		ECG_MODI_DTT='<%= ECG_MODI_DTT_T%>'
<%
			}

			if(! ECG_MODI_ID_T.equals("")) {
%>
		 		ECG_MODI_ID='<%= ECG_MODI_ID_T%>'
<%
			}

			if(! ECG_ETC_KD_T.equals("")) {
%>
		 		ECG_ETC_KD='<%= ECG_ETC_KD_T%>'
<%
			}

			if(! IAU_PENL_NM_T.equals("")) {
%>
		 		IAU_PENL_NM='<%= IAU_PENL_NM_T%>'
<%
			}
%>
				ROWID='<%= cnt%>'
				c87='<%= cnt%>'
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
