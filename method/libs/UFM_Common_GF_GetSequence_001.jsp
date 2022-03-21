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

		String STABLE = htMethod.get("STABLE");
		String SVALUE1 = htMethod.get("SVALUE1");
		String SVALUE2 = htMethod.get("SVALUE2");
		String SVALUE3 = htMethod.get("SVALUE3");
		String SVALUE4 = htMethod.get("SVALUE4");

		//
		if(STABLE == null) { STABLE = ""; }
		if(SVALUE1 == null) { SVALUE1 = ""; }
		if(SVALUE2 == null) { SVALUE2 = ""; }
		if(SVALUE3 == null) { SVALUE3 = ""; }
		if(SVALUE4 == null) { SVALUE4 = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

         if :sTable = 'IT_COMP_DEPT' then
         begin
             SELECT F_LPAD(NVL(MAX(ICD_DEPT_CD),0)+1, 4, '0') AS SEQ FROM IT_COMP_DEPT
                         WHERE ICD_COMP_CD = :sVALUE1
                           AND ICD_MNGT_YR = :sVALUE2
                           AND ICD_HALF_CD = :sVALUE3
         end else if :sTable = 'ET_COMP_CNRT' then
         begin
             SELECT F_LPAD(NVL(MAX(ECC_CNRT_SQ),0)+1, 2, '0') AS SEQ FROM ET_COMP_CNRT
                         WHERE ECC_COMP_CD = :sVALUE1
                           AND ECC_MNGT_YR = :sVALUE2
         end else if :sTable = 'ET_COMP_CNRT_PROF' then
         begin
             SELECT F_LPAD(NVL(MAX(ECP_PROF_SQ),0)+1, 2, '0') AS SEQ FROM ET_COMP_CNRT_PROF
                         WHERE ECP_COMP_CD = :sVALUE1
                           AND ECP_MNGT_YR = :sVALUE2
                           AND ECP_CNRT_SQ = :sVALUE3
         end else if :sTable = 'ET_COMP_CNRT_OPTN' then
         begin
             SELECT F_LPAD(NVL(MAX(ECO_OPTN_SQ),0)+1, 2, '0') AS SEQ FROM ET_COMP_CNRT_OPTN
                         WHERE ECO_COMP_CD = :sVALUE1
                           AND ECO_MNGT_YR = :sVALUE2
                           AND ECO_CNRT_SQ = :sVALUE3
                           AND ECO_PROF_SQ = :sVALUE4
         end else if :sTable = 'ET_COMP_CNRT_CUST' then
         begin
             SELECT NVL(MAX(ECT_CUST_SQ),0)+1 AS SEQ FROM ET_COMP_CNRT_CUST
                         WHERE ECT_COMP_CD = :sVALUE1
                           AND ECT_MNGT_YR = :sVALUE2
                           AND ECT_CNRT_SQ = :sVALUE3
         end else if :sTable = 'CT_QUESTION' then
         begin
            if :sVALUE4 = 'CQN_QSTN_CD' then
            begin
                SELECT NVL(MAX(CQN_QSTN_CD),0)+1 AS SEQ FROM CT_QUESTION
            end else if :sVALUE4 = 'CQN_QSTN_SQ' then
            begin
                SELECT NVL(MAX(CQN_QSTN_SQ),0)+1 AS SEQ FROM CT_QUESTION WHERE CQN_QSKD_CD = :sVALUE1
            end;
         end else if :sTable = 'IT_COMPANY' then
         begin
             SELECT CASE WHEN MAX(ICY_COMP_SQ) IS NULL THEN '00' ELSE F_LPAD(NVL(MAX(ICY_COMP_SQ),0)+1, 2, '0') END SEQ FROM IT_COMPANY
                         WHERE ICY_COMP_NO = :sVALUE1
         end else if :sTable = 'RT_RSVT_EQUIP' then
         begin
             SELECT CASE WHEN MAX(RRE_EQUI_CD) IS NULL THEN '00' ELSE F_LPAD(NVL(MAX(RRE_EQUI_CD),0)+1, 2, '0') END SEQ
                           FROM RT_RSVT_EQUIP
         end else if :sTable = 'RT_RSVT_EQUIP_LIMIT' then
         begin
             SELECT F_LPAD(NVL(MAX(RRL_TIME_SQ),0)+1, 2, '0') AS SEQ FROM RT_RSVT_EQUIP_LIMIT
                         WHERE RRL_EXAM_DT = :sVALUE1
                           AND RRL_EQUI_CD = :sVALUE2
         end else if :sTable = 'BT_ESTIMATE' then
         begin
             SELECT F_LPAD(NVL(MAX(BEE_ESTI_CD),0)+1, 8, '0') AS SEQ FROM BT_ESTIMATE
                         WHERE BEE_MNGT_YR = :sVALUE1
         end else if :sTable = 'BT_ESTI_OPTN' then
         begin
             SELECT F_LPAD(NVL(MAX(BEO_OPTN_SQ),0)+1, 2, '0') AS SEQ FROM BT_ESTI_OPTN
                         WHERE BEO_MNGT_YR = :sVALUE1
                           AND BEO_ESTI_CD = :sVALUE2
                           AND BEO_PROF_SQ = :sVALUE3
         end else if :sTable = 'CT_COMM_PANJ' then
         begin
             SELECT F_LPAD(NVL(MAX(CCP_MACH_SQ),0)+1, 2, '0') AS SEQ FROM CT_COMM_PANJ
                         WHERE CCP_GUBN_CD = :sVALUE1
                          AND CCP_MACH_CD = :sVALUE2
         end else if :sTable = 'CT_KSCD' then
         begin
            if :sVALUE4 = '1' then
            begin
               SELECT F_LPAD(NVL(MAX(CKD_LV1),0)+1, 2, '0') AS SEQ FROM CT_KSCD
                            WHERE CKD_LEVL_KD = '1'
            end else if :sVALUE4 = '2' then
            begin
                SELECT F_LPAD(NVL(MAX(CKD_LV2),0)+1, 2, '0') AS SEQ FROM CT_KSCD
                            WHERE CKD_LV1 = :sVALUE1
                             AND CKD_LEVL_KD = '2'
            end else if :sVALUE4 = '3' then
            begin
                SELECT F_LPAD(NVL(MAX(CKD_LV3),0)+1, 3, '0') AS SEQ FROM CT_KSCD
                            WHERE CKD_LV1 = :sVALUE1
                              AND CKD_LV2 = :sVALUE2
                              AND CKD_LEVL_KD = '3'
            end else if :sVALUE4 = '4' then
            begin
                SELECT F_LPAD(NVL(MAX(CKD_LV4),0)+1, 3, '0') AS SEQ FROM CT_KSCD
                            WHERE CKD_LV1 = :sVALUE1
                              AND CKD_LV2 = :sVALUE2
                              AND CKD_LV3 = :sVALUE3
                              AND CKD_LEVL_KD = '4'
            end;
         end else if :sTable = 'ET_CLDR_MEMO' then
         begin
             SELECT NVL(MAX(ECM_MEMO_SQ),0)+1 AS SEQ FROM ET_CLDR_MEMO
                         WHERE ECM_MEMO_DT = :sVALUE1
         end else if :sTable = 'ST_ADVICE' then
         begin
             SELECT NVL(MAX(SAE_ADVI_SQ),0)+1 AS SEQ FROM ST_ADVICE
                         WHERE SAE_ADVI_DT = :sVALUE1
                          AND SAE_CUST_NO = :sVALUE2
         end else if :sTable = 'BT_ESTI_DEPT' then
         begin
             SELECT F_LPAD(NVL(MAX(BED_DEPT_SQ),0)+1, 4, '0') AS SEQ FROM BT_ESTI_DEPT
                         WHERE BED_MNGT_YR = :sVALUE1
                          AND BED_ESTI_CD = :sVALUE2
         end else if :sTable = 'IT_SMS_MESSAGE' then
         begin
             SELECT NVL(MAX(ISM_SEQ),0)+1 AS SEQ FROM IT_SMS_MESSAGE
                         WHERE ISM_MESG_KD = :sVALUE1
         end else if :sTable = 'BT_ESTI_PROF' then
         begin
             SELECT F_LPAD(ISNULL(MAX(BEP_PROF_SQ),0)+1, 2, '0') AS SEQ FROM BT_ESTI_PROF
                         WHERE BEP_MNGT_YR = :sVALUE1
                          AND BEP_ESTI_CD = :sVALUE2
         end;
		*/

		if(STABLE.equals("IT_COMP_DEPT")) {

			sql = " SELECT F_LPAD(NVL(MAX(ICD_DEPT_CD),0)+1, 4, '0') AS SEQ";
			sql += " FROM IT_COMP_DEPT";
			sql += " WHERE ICD_COMP_CD = '" + SVALUE1 + "'";
			sql += " AND ICD_MNGT_YR = '" + SVALUE2 + "'";
			sql += " AND ICD_HALF_CD = '" + SVALUE3 + "'";
		} else if(STABLE.equals("ET_COMP_CNRT")) {

			sql = " SELECT F_LPAD(NVL(MAX(ECC_CNRT_SQ),0)+1, 2, '0') AS SEQ";
			sql += " FROM ET_COMP_CNRT";
			sql += " WHERE ECC_COMP_CD = '" + SVALUE1 + "'";
			sql += " AND ECC_MNGT_YR = '" + SVALUE2 + "'";

		} else if(STABLE.equals("ET_COMP_CNRT_PROF")) {

			sql = " SELECT F_LPAD(NVL(MAX(ECP_PROF_SQ),0)+1, 2, '0') AS SEQ";
			sql += " FROM ET_COMP_CNRT_PROF";
			sql += " WHERE ECP_COMP_CD = '" + SVALUE1 + "'";
			sql += " AND ECP_MNGT_YR = '" + SVALUE2 + "'";
			sql += " AND ECP_CNRT_SQ = '" + SVALUE3 + "'";

		} else if(STABLE.equals("ET_COMP_CNRT_OPTN")) {

			sql = " SELECT F_LPAD(NVL(MAX(ECO_OPTN_SQ),0)+1, 2, '0') AS SEQ";
			sql += " FROM ET_COMP_CNRT_OPTN";
			sql += " WHERE ECO_COMP_CD = '" + SVALUE1 + "'";
			sql += " AND ECO_MNGT_YR = '" + SVALUE2 + "'";
			sql += " AND ECO_CNRT_SQ = '" + SVALUE3 + "'";
			sql += " AND ECO_PROF_SQ = '" + SVALUE4 + "'";

		} else if(STABLE.equals("ET_COMP_CNRT_CUST")) {

			sql = " SELECT NVL(MAX(ECT_CUST_SQ),0)+1 AS SEQ";
			sql += " FROM ET_COMP_CNRT_CUST";
			sql += " WHERE ECT_COMP_CD = '" + SVALUE1 + "'";
			sql += " AND ECT_MNGT_YR = '" + SVALUE2 + "'";
			sql += " AND ECT_CNRT_SQ = '" + SVALUE3 + "'";

		} else if(STABLE.equals("CT_QUESTION")) {


			if(SVALUE4.equals("CQN_QSTN_CD")) {

				sql = " SELECT NVL(MAX(CQN_QSTN_CD),0)+1 AS SEQ";
				sql += " FROM CT_QUESTION";
			} else if(SVALUE4.equals("CQN_QSTN_SQ")) {

				sql = " SELECT NVL(MAX(CQN_QSTN_SQ),0)+1 AS SEQ";
				sql += " FROM CT_QUESTION";
				sql += " WHERE CQN_QSKD_CD = '" + SVALUE1 + "'";
			}
		} else if(STABLE.equals("IT_COMPANY")) {

			sql = " SELECT CASE WHEN MAX(ICY_COMP_SQ) IS NULL THEN '00' ";
            sql += " 			WHEN IS_NUMBER(MAX(ICY_COMP_SQ)) = '0' THEN MAX(ICY_COMP_SQ) ";
			sql += "            WHEN MAX(ICY_COMP_SQ) = '99' THEN '100' ";
			sql += "            ELSE F_LPAD(NVL(MAX(ICY_COMP_SQ),0)+1, 2, '0') END SEQ ";
			sql += " 	   FROM IT_COMPANY ";
			sql += " WHERE ICY_COMP_NO = '" + SVALUE1 + "'";

		} else if(STABLE.equals("RT_RSVT_EQUIP")) {

			sql = " SELECT CASE WHEN MAX(RRE_EQUI_CD) IS NULL THEN '00' ELSE F_LPAD(NVL(MAX(RRE_EQUI_CD),0)+1, 2, '0') END SEQ";
			sql += " FROM RT_RSVT_EQUIP";

		} else if(STABLE.equals("RT_RSVT_EQUIP_LIMIT")) {

			sql = " SELECT F_LPAD(NVL(MAX(RRL_TIME_SQ),0)+1, 2, '0') AS SEQ";
			sql += " FROM RT_RSVT_EQUIP_LIMIT";
			sql += " WHERE RRL_EXAM_DT = '" + SVALUE1 + "'";
			sql += " AND RRL_EQUI_CD = '" + SVALUE2 + "'";

		} else if(STABLE.equals("BT_ESTIMATE")) {

			sql = " SELECT F_LPAD(NVL(MAX(BEE_ESTI_CD),0)+1, 8, '0') AS SEQ";
			sql += " FROM BT_ESTIMATE";
			sql += " WHERE BEE_MNGT_YR = '" + SVALUE1 + "'";

		} else if(STABLE.equals("BT_ESTI_OPTN")) {

			sql = " SELECT F_LPAD(NVL(MAX(BEO_OPTN_SQ),0)+1, 2, '0') AS SEQ";
			sql += " FROM BT_ESTI_OPTN";
			sql += " WHERE BEO_MNGT_YR = '" + SVALUE1 + "'";
			sql += " AND BEO_ESTI_CD = '" + SVALUE2 + "'";
			sql += " AND BEO_PROF_SQ = '" + SVALUE3 + "'";
		} else if(STABLE.equals("CT_COMM_PANJ")) {

			sql = " SELECT F_LPAD(NVL(MAX(CCP_MACH_SQ),0)+1, 2, '0') AS SEQ";
			sql += " FROM CT_COMM_PANJ";
			sql += " WHERE CCP_GUBN_CD = '" + SVALUE1 + "'";
			sql += " AND CCP_MACH_CD = '" + SVALUE2 + "'";
		} else if(STABLE.equals("CT_KSCD")) {


			if(SVALUE4.equals("1")) {

				sql = " SELECT F_LPAD(NVL(MAX(CKD_LV1),0)+1, 2, '0') AS SEQ";
				sql += " FROM CT_KSCD";
				sql += " WHERE CKD_LEVL_KD = '1'";
			} else if(SVALUE4.equals("2")) {

				sql = " SELECT F_LPAD(NVL(MAX(CKD_LV2),0)+1, 2, '0') AS SEQ";
				sql += " FROM CT_KSCD";
				sql += " WHERE CKD_LV1 = '" + SVALUE1 + "'";
				sql += " AND CKD_LEVL_KD = '2'";
			} else if(SVALUE4.equals("3")) {

				sql = " SELECT F_LPAD(NVL(MAX(CKD_LV3),0)+1, 3, '0') AS SEQ";
				sql += " FROM CT_KSCD";
				sql += " WHERE CKD_LV1 = '" + SVALUE1 + "'";
				sql += " AND CKD_LV2 = '" + SVALUE2 + "'";
				sql += " AND CKD_LEVL_KD = '3'";
			} else if(SVALUE4.equals("4")) {

				sql = " SELECT F_LPAD(NVL(MAX(CKD_LV4),0)+1, 3, '0') AS SEQ";
				sql += " FROM CT_KSCD";
				sql += " WHERE CKD_LV1 = '" + SVALUE1 + "'";
				sql += " AND CKD_LV2 = '" + SVALUE2 + "'";
				sql += " AND CKD_LV3 = '" + SVALUE3 + "'";
				sql += " AND CKD_LEVL_KD = '4'";
			}

		} else if(STABLE.equals("ET_CLDR_MEMO")) {

			sql = " SELECT NVL(MAX(ECM_MEMO_SQ),0)+1 AS SEQ";
			sql += " FROM ET_CLDR_MEMO";
			sql += " WHERE ECM_MEMO_DT = '" + SVALUE1 + "'";

		} else if(STABLE.equals("ST_ADVICE")) {

			sql = " SELECT NVL(MAX(SAE_ADVI_SQ),0)+1 AS SEQ";
			sql += " FROM ST_ADVICE";
			sql += " WHERE SAE_ADVI_DT = '" + SVALUE1 + "'";
			sql += " AND SAE_CUST_NO = '" + SVALUE2 + "'";
		} else if(STABLE.equals("BT_ESTI_DEPT")) {

			sql = " SELECT F_LPAD(NVL(MAX(BED_DEPT_SQ),0)+1, 4, '0') AS SEQ";
			sql += " FROM BT_ESTI_DEPT";
			sql += " WHERE BED_MNGT_YR = '" + SVALUE1 + "'";
			sql += " AND BED_ESTI_CD = '" + SVALUE2 + "'";
		} else if(STABLE.equals("IT_SMS_MESSAGE")) {

			sql = " SELECT NVL(MAX(ISM_SEQ),0)+1 AS SEQ";
			sql += " FROM IT_SMS_MESSAGE";
			sql += " WHERE ISM_MESG_KD = '" + SVALUE1 + "'";
		} else if(STABLE.equals("BT_ESTI_PROF")) {

			sql = " SELECT F_LPAD(NVL(MAX(BEP_PROF_SQ),0)+1, 2, '0') AS SEQ";
			sql += " FROM BT_ESTI_PROF";
			sql += " WHERE BEP_MNGT_YR = '" + SVALUE1 + "'";
			sql += " AND BEP_ESTI_CD = '" + SVALUE2 + "'";
		}
			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : UFM_Common_GF_GetSequence_001 \n";
			G_INFO += "설명 : 테이블명에 따른 순번증가 리턴 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " STABLE : " + STABLE + " \n";
			G_INFO += " SVALUE1 : " + SVALUE1 + " \n";
			G_INFO += " SVALUE2 : " + SVALUE2 + " \n";
			G_INFO += " SVALUE3 : " + SVALUE3 + " \n";
			G_INFO += " SVALUE4 : " + SVALUE4 + " \n";
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
		<s:AttributeType name='SEQ' rs:number='1' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:extends type='rs:rowbase'/>
	</s:ElementType>
</s:Schema>
		<rs:data>
<%
		int cnt = 0;
		while(cRsList.next()) {

			cnt++;

			String SEQ_T = cRsList.getString("SEQ");
%>
			<z:row
<%
			if(! SEQ_T.equals("")) {
%>
		 		SEQ='<%= SEQ_T%>'
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
