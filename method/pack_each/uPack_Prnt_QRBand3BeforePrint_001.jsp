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

		String EXAM_CD = htMethod.get("EXAM_CD");
		String PACK_SQ = htMethod.get("PACK_SQ");

		//
		if(EXAM_CD == null) { EXAM_CD = ""; }
		if(PACK_SQ == null) { PACK_SQ = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

select epk_exam_cd, epk_pack_sq, epk_pack_nm,                                                           
       TO_CHAR(TO_DATE( epk_pack_sdt), 'YYYY-MM-DD') || ' ~ ' || TO_CHAR(TO_DATE( epk_pack_edt), 'YYYY-MM-DD') pack_tm,   
                   case when epk_optn_yn = 'Y' then '사용' else '미사용' end optn_nm,                         
                   case when epk_cncl_cd = '1' then '미검사 수가 차감' else '미검사 수가 미차감' end cncl_nm, 
                   epk_calc_pr, epk_sale_pr, epk_grup_pr, epk_coup_pr, epk_famy_pr, epk_mmbr_pr, epk_optn_pr,       
                    epk_pack_tx, F_CODE_FIND('0407', epk_calc_cd, '', '1') prce_nm                         
  from et_pack                                                                                          
where epk_exam_cd = :exam_cd 
  and epk_pack_sq = :pack_sq
		*/
		//TO_CHAR(TO_DATE( epk_pack_sdt), 'YYYY-MM-DD') || ' ~ ' || TO_CHAR(TO_DATE( epk_pack_edt), 'YYYY-MM-DD') pack_tm,  
        //-> TO_CHAR(TO_DATE( epk_pack_sdt,'YYYY-MM-DD'), 'YYYY-MM-DD') || ' ~ ' || TO_CHAR(TO_DATE( epk_pack_edt,'YYYY-MM-DD'), 'YYYY-MM-DD') pack_tm,

		sql = " SELECT EPK_EXAM_CD, EPK_PACK_SQ, EPK_PACK_NM, ";
		sql += " TO_CHAR(TO_DATE(EPK_PACK_SDT, 'YYYY-MM-DD'), 'YYYY-MM-DD') || ' ~ ' || TO_CHAR(TO_DATE(EPK_PACK_EDT, 'YYYY-MM-DD'), 'YYYY-MM-DD') PACK_TM";
		sql += ", CASE WHEN EPK_OPTN_YN = 'Y' THEN '사용' ELSE '미사용' END OPTN_NM";
		sql += ", CASE WHEN EPK_CNCL_CD = '1' THEN '미검사 수가 차감' ELSE '미검사 수가 미차감' END CNCL_NM";
		sql += ", EPK_CALC_PR, EPK_SALE_PR, EPK_GRUP_PR, EPK_COUP_PR, EPK_FAMY_PR, EPK_MMBR_PR, EPK_OPTN_PR ";
		sql += ", EPK_PACK_TX, F_CODE_FIND('0407', EPK_CALC_CD, '', '1') PRCE_NM";
		sql += " FROM ET_PACK";
		sql += " WHERE EPK_EXAM_CD = '" + EXAM_CD + "'";
		sql += " AND EPK_PACK_SQ = '" + PACK_SQ + "'";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uPack_Prnt_QRBand3BeforePrint_001 \n";
			G_INFO += "설명 : 묶음코드 로딩 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " EXAM_CD : " + EXAM_CD + " \n";
			G_INFO += " PACK_SQ : " + PACK_SQ + " \n";
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
		<s:AttributeType name='PACK_TM' rs:number='4' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='23'/>
		</s:AttributeType>
		<s:AttributeType name='OPTN_NM' rs:number='5' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_PACK'
			 rs:basecolumn='OPTN_NM'>
			<s:datatype dt:type='string' dt:maxLength='6'/>
		</s:AttributeType>
		<s:AttributeType name='CNCL_NM' rs:number='6' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_PACK'
			 rs:basecolumn='CNCL_NM'>
			<s:datatype dt:type='string' dt:maxLength='18'/>
		</s:AttributeType>
		<s:AttributeType name='EPK_CALC_PR' rs:number='7' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EPK_SALE_PR' rs:number='8' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_PACK'
			 rs:basecolumn='EPK_SALE_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EPK_GRUP_PR' rs:number='9' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_PACK'
			 rs:basecolumn='EPK_GRUP_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EPK_COUP_PR' rs:number='10' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_PACK'
			 rs:basecolumn='EPK_COUP_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EPK_FAMY_PR' rs:number='11' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_PACK'
			 rs:basecolumn='EPK_FAMY_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EPK_MMBR_PR' rs:number='12' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_PACK'
			 rs:basecolumn='EPK_MMBR_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EPK_OPTN_PR' rs:number='13' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_PACK'
			 rs:basecolumn='EPK_OPTN_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EPK_PACK_TX' rs:number='14' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_PACK'
			 rs:basecolumn='EPK_PACK_TX'>
			<s:datatype dt:type='string' dt:maxLength='1000'/>
		</s:AttributeType>
		<s:AttributeType name='PRCE_NM' rs:number='15' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='16' rs:rowid='true' rs:basetable='ET_PACK' rs:basecolumn='ROWID' rs:keycolumn='true'
			 rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:extends type='rs:rowbase'/>
	</s:ElementType>
</s:Schema>		<rs:data>
<%
		int cnt = 0;
		while(cRsList.next()) {

			cnt++;

			String EPK_EXAM_CD_T = cRsList.getString("EPK_EXAM_CD");
			String EPK_PACK_SQ_T = cRsList.getString("EPK_PACK_SQ");
			String EPK_PACK_NM_T = cRsList.getString("EPK_PACK_NM");
			String PACK_TM_T = cRsList.getString("PACK_TM");
			String OPTN_NM_T = cRsList.getString("OPTN_NM");
			String CNCL_NM_T = cRsList.getString("CNCL_NM");
			String EPK_CALC_PR_T = cRsList.getString("EPK_CALC_PR");
			String EPK_SALE_PR_T = cRsList.getString("EPK_SALE_PR");
			String EPK_GRUP_PR_T = cRsList.getString("EPK_GRUP_PR");
			String EPK_COUP_PR_T = cRsList.getString("EPK_COUP_PR");
			String EPK_FAMY_PR_T = cRsList.getString("EPK_FAMY_PR");
			String EPK_MMBR_PR_T = cRsList.getString("EPK_MMBR_PR");
			String EPK_OPTN_PR_T = cRsList.getString("EPK_OPTN_PR");
			String EPK_PACK_TX_T = cRsList.getString("EPK_PACK_TX");
			String PRCE_NM_T = cRsList.getString("PRCE_NM");
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

			if(! PACK_TM_T.equals("")) {
%>
		 		PACK_TM='<%= PACK_TM_T%>'
<%
			}

			if(! OPTN_NM_T.equals("")) {
%>
		 		OPTN_NM='<%= OPTN_NM_T%>'
<%
			}

			if(! CNCL_NM_T.equals("")) {
%>
		 		CNCL_NM='<%= CNCL_NM_T%>'
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

			if(! EPK_PACK_TX_T.equals("")) {
%>
		 		EPK_PACK_TX='<%= EPK_PACK_TX_T%>'
<%
			}

			if(! PRCE_NM_T.equals("")) {
%>
		 		PRCE_NM='<%= PRCE_NM_T%>'
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
