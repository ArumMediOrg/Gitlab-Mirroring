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
		String CHKFRSTETCITEM = htMethod.get("CHKFRSTETCITEM");
		String CHKFRSTABNM = htMethod.get("CHKFRSTABNM");

		//
		if(EXAM_DT == null) { EXAM_DT = ""; }
		if(EXAM_SQ == null) { EXAM_SQ = ""; }
		if(CHKFRSTETCITEM == null) { CHKFRSTETCITEM = ""; }
		if(CHKFRSTABNM == null) { CHKFRSTABNM = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

    sSQL := SELECT *
               FROM (SELECT ERI_ITEM_CD, IIM_KNME_NM, ERI_RSLT_VL, IIM_RSLT_KD, ERI_HTSB_PANJ, RLOW, LOWKD, RHIGH, HIGHKD
                          , GetLHPanjung(IIM_RSLT_KD, ERI_RSLT_VL, LOWKD, RLOW, HIGHKD, RHIGH, CHRVAL) AS LH
                          , EEA_HLTH_KD, EEA_HEPA_YN, EEA_HCV_YN
                       FROM (SELECT ERI_EXAM_DT,  ERI_EXAM_SQ, ERI_ITEM_CD, ERI_RSLT_VL, IIM_KNME_NM
                                  , ERI_HTSB_PANJ, IIM_RSLT_KD, EEA_SEX_CD, EEA_PSNL_AGE
                                  , EEA_HLTH_KD, EEA_HEPA_YN, EEA_HCV_YN
                               FROM ET_RSLT_ITEM
                               JOIN IT_ITEM
                                 ON ERI_ITEM_CD = IIM_ITEM_CD
                               JOIN ET_EXAM_ACPT
                                 ON EEA_EXAM_DT = ERI_EXAM_DT
                                AND EEA_EXAM_SQ = ERI_EXAM_SQ
                              WHERE ERI_EXAM_DT = :EXAM_DT
                                AND ERI_EXAM_SQ = :EXAM_SQ
                                AND NVL(ERI_CNCL_YN, 'N') <> 'Y'
                                AND IIM_RSLT_KD <> '9'

    if not :chkFrstEtcItem then
    begin
      sSQL := sSQL +
                                AND EXISTS (
                                             SELECT * FROM IT_ITEM
                                                                WHERE IIM_ITEM_CD = ERI_ITEM_CD
                                                AND (SUBSTR(IIM_GBHC_KD,1,1) >= 1 OR SUBSTR(IIM_GBHC_KD,3,1) >= 1 OR SUBSTR(IIM_GBHC_KD,5,1) >= 1)
                                           )
    end;

    sSQL := sSQL +   ) A
                     left outer join TABLE(GetItemVldtTable_PKG.GetItemVldtTable(A.ERI_ITEM_CD, A.EEA_SEX_CD, A.EEA_PSNL_AGE, A.ERI_EXAM_DT, '2')) B
                       on B.item_cd = A.eri_item_cd
                  ) GRP2

    if  :chkFrstAbnm then
    begin
      sSQL := sSQL +   WHERE NVL(LH, ' ') <> ' '
    end;


* 20200806 : 조회컬럼 추가
		*/

		sql = " SELECT *";
		sql += " FROM (SELECT ERI_ITEM_CD, IIM_KNME_NM, ERI_RSLT_VL, IIM_RSLT_KD, ERI_HTSB_PANJ, RLOW, LOWKD, RHIGH, HIGHKD , GETLHPANJUNG(IIM_RSLT_KD, ERI_RSLT_VL, LOWKD, RLOW, HIGHKD, RHIGH, CHRVAL) AS LH , EEA_HLTH_KD, EEA_HEPA_YN, EEA_HCV_YN";
		sql += " FROM (SELECT ERI_EXAM_DT, ERI_EXAM_SQ, ERI_ITEM_CD, ERI_RSLT_VL, IIM_KNME_NM , ERI_HTSB_PANJ, IIM_RSLT_KD, EEA_SEX_CD, EEA_PSNL_AGE , EEA_HLTH_KD, EEA_HEPA_YN, EEA_HCV_YN";
		sql += " FROM ET_RSLT_ITEM JOIN IT_ITEM";
		sql += " ON ERI_ITEM_CD = IIM_ITEM_CD JOIN ET_EXAM_ACPT";
		sql += " ON EEA_EXAM_DT = ERI_EXAM_DT";
		sql += " AND EEA_EXAM_SQ = ERI_EXAM_SQ";
		sql += " WHERE ERI_EXAM_DT = '" + EXAM_DT + "'";
		sql += " AND ERI_EXAM_SQ = '" + EXAM_SQ + "'";
		sql += " AND NVL(ERI_CNCL_YN, 'N') <> 'Y'";
		sql += " AND IIM_RSLT_KD <> '9'";

		if(CHKFRSTETCITEM.equals("0")) {
			sql += " AND EXISTS ( SELECT *";
			sql += " FROM IT_ITEM";
			sql += " WHERE IIM_ITEM_CD = ERI_ITEM_CD";
			sql += " AND (SUBSTR(IIM_GBHC_KD,1,1) >= 1";
			sql += " OR SUBSTR(IIM_GBHC_KD,3,1) >= 1";
			sql += " OR SUBSTR(IIM_GBHC_KD,5,1) >= 1) )";
		}

		sql += " ) A LEFT OUTER JOIN TABLE(GETITEMVLDTTABLE_PKG.GETITEMVLDTTABLE(A.ERI_ITEM_CD, A.EEA_SEX_CD, A.EEA_PSNL_AGE, A.ERI_EXAM_DT, '2')) B";
		sql += " ON B.ITEM_CD = A.ERI_ITEM_CD ) GRP2";

		if(CHKFRSTABNM.equals("1")) {
			sql += " WHERE NVL(LH, ' ') <> ' '";
		}
			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uGen_Frst_Panj_upGetFrstRslt_001 \n";
			G_INFO += "설명 : 검사항목별일검판정내역(1차판정화면) \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " EXAM_DT : " + EXAM_DT + " \n";
			G_INFO += " EXAM_SQ : " + EXAM_SQ + " \n";
			G_INFO += " CHKFRSTETCITEM : " + CHKFRSTETCITEM + " \n";
			G_INFO += " CHKFRSTABNM : " + CHKFRSTABNM + " \n";
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
		<s:AttributeType name='ERI_ITEM_CD' rs:number='1'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_KNME_NM' rs:number='2'>
			<s:datatype dt:type='string' dt:maxLength='200' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_RSLT_VL' rs:number='3' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='50'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_RSLT_KD' rs:number='4'>
			<s:datatype dt:type='string' dt:maxLength='1' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_HTSB_PANJ' rs:number='5' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='30'/>
		</s:AttributeType>
		<s:AttributeType name='RLOW' rs:number='6' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='LOWKD' rs:number='7' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='RHIGH' rs:number='8' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='HIGHKD' rs:number='9' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='LH' rs:number='10' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_HLTH_KD' rs:number='11' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_HEPA_YN' rs:number='12' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_HCV_YN' rs:number='13' rs:nullable='true'>
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

			String ERI_ITEM_CD_T = cRsList.getString("ERI_ITEM_CD");
			String IIM_KNME_NM_T = cRsList.getString("IIM_KNME_NM");
			String ERI_RSLT_VL_T = cRsList.getString("ERI_RSLT_VL");
			String IIM_RSLT_KD_T = cRsList.getString("IIM_RSLT_KD");
			String ERI_HTSB_PANJ_T = cRsList.getString("ERI_HTSB_PANJ");
			String RLOW_T = cRsList.getString("RLOW");
			String LOWKD_T = cRsList.getString("LOWKD");
			String RHIGH_T = cRsList.getString("RHIGH");
			String HIGHKD_T = cRsList.getString("HIGHKD");
			String LH_T = cRsList.getString("LH");
			String EEA_HLTH_KD_T = cRsList.getString("EEA_HLTH_KD");
			String EEA_HEPA_YN_T = cRsList.getString("EEA_HEPA_YN");
			String EEA_HCV_YN_T = cRsList.getString("EEA_HCV_YN");
%>
			<z:row
<%
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

			if(! IIM_RSLT_KD_T.equals("")) {
%>
		 		IIM_RSLT_KD='<%= IIM_RSLT_KD_T%>'
<%
			}

			if(! ERI_HTSB_PANJ_T.equals("")) {
%>
		 		ERI_HTSB_PANJ='<%= ERI_HTSB_PANJ_T%>'
<%
			}

			if(! RLOW_T.equals("")) {
%>
		 		RLOW='<%= RLOW_T%>'
<%
			}

			if(! LOWKD_T.equals("")) {
%>
		 		LOWKD='<%= LOWKD_T%>'
<%
			}

			if(! RHIGH_T.equals("")) {
%>
		 		RHIGH='<%= RHIGH_T%>'
<%
			}

			if(! HIGHKD_T.equals("")) {
%>
		 		HIGHKD='<%= HIGHKD_T%>'
<%
			}

			if(! LH_T.equals("")) {
%>
		 		LH='<%= LH_T%>'
<%
			}

			if(! EEA_HLTH_KD_T.equals("")) {
%>
		 		EEA_HLTH_KD='<%= EEA_HLTH_KD_T%>'
<%
			}

			if(! EEA_HEPA_YN_T.equals("")) {
%>
		 		EEA_HEPA_YN='<%= EEA_HEPA_YN_T%>'
<%
			}

			if(! EEA_HCV_YN_T.equals("")) {
%>
		 		EEA_HCV_YN='<%= EEA_HCV_YN_T%>'
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
