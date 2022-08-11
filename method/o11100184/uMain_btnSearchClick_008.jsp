<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.HashMap" %>
<%@ include file="/inc_prg/common.jsp" %>
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

    ResultSetMetaData rsmd = null;
    int colCnt = 0;

    try {
%>
<%@ include file="/inc_prg/connect.jsp" %>
<%
    // 전달자료
    htData = (HashMap<String, Object>) request.getAttribute("htData");
    htMethod = (HashMap<String, String>) request.getAttribute("htMethod_1");

    String SFROMDATE = htMethod.get("SFROMDATE");
    String STODATE = htMethod.get("STODATE");
    String CMBSRCHTEST = htMethod.get("CMBSRCHTEST");
    String RZCOMBOBOX1 = htMethod.get("RZCOMBOBOX1");
    String PLCE_CD = htMethod.get("PLCE_CD");
    String COMP_CD = htMethod.get("COMP_CD");
    String PSNL_NM = htMethod.get("PSNL_NM");
    String DIVI_CS = htMethod.get("DIVI_CS");
    String CLSS_KD = htMethod.get("CLSS_KD");
    String CHART_NO = htMethod.get("CHART_NO");
    String CBCAN_KD = htMethod.get("CBCAN_KD");
    String EXAM_SQ = htMethod.get("EXAM_SQ");
    String CANCEL_YN = htMethod.get("CANCEL_YN");
    String SEX_CD = htMethod.get("SEX_CD");

    //
    if (SFROMDATE == null) {
        SFROMDATE = "";
    }
    if (STODATE == null) {
        STODATE = "";
    }
    if (CMBSRCHTEST == null) {
        CMBSRCHTEST = "";
    }
    if (RZCOMBOBOX1 == null) {
        RZCOMBOBOX1 = "";
    }
    if (PLCE_CD == null) {
        PLCE_CD = "";
    }
    if (COMP_CD == null) {
        COMP_CD = "";
    }
    if (PSNL_NM == null) {
        PSNL_NM = "";
    }
    if (DIVI_CS == null) {
        DIVI_CS = "";
    }
    if (CLSS_KD == null) {
        CLSS_KD = "";
    }
    if (CHART_NO == null) {
        CHART_NO = "";
    }
    if (CBCAN_KD == null) {
        CBCAN_KD = "";
    }
    if (EXAM_SQ == null) {
        EXAM_SQ = "";
    }
    if (CANCEL_YN == null) {
        CANCEL_YN = "";
    }
    if (SEX_CD == null) {
        SEX_CD = "";
    }

    // DB객체
    stmtList = connect.createStatement();

    sql = " SELECT EEA_EXAM_DT,";
    sql += " EEA_EXAM_SQ,";
    sql += " EEA_PSNL_NM,";
    sql += " EEA_CHART_NO,";
    sql += " ICR_TEL_NO,";
    sql += " ICR_MOBL_NO,";
    sql += " EEA_EXAM_CD,";
    sql += " EEA_SPSB_YN,";
    sql += " EEA_HTSB_YN,";
    sql += " EEA_EMSB_YN,";
    sql += " EEA_CVSB_YN,";
    sql += " EEA_ETSB_YN,";
    sql += " EEA_ACPT_CD,";
    sql += " EEA_SPCL_LT,";
    sql += " EEA_OCS_DR,";
    sql += " EEA_PLCE_CD,";
    sql += " EEA_ZIP_CD,";
    sql += " EEA_ZIP_AR,";
    sql += " EEA_ROAD_AR,";
    sql += " EEA_PSNL_AGE,";
    sql += " EEA_SEX_CD,";
    sql += " EEA_BLDG_NO,";
    sql += " EEA_OCS_NO,";
    sql += " EEA_PSNLR_PR,";
    sql += " EEA_ORDER_YN,";
    sql += " EEA_SPSB_CD,";
    sql += " EEA_DISC_RC,";
    sql += " EEA_DISC_CD,";
    sql += " EEA_HDMD_YN,";
    sql += " EEA_HTSB_CD,";
    sql += " EEA_EXAM_LT,";
    sql += " EEA_RSVN_NO,";
    sql += " EEA_DISC_PR,";
    sql += " EEA_STOMA_CD,";
    sql += " EEA_CANAD_YN,";
    sql += " EEA_ACPT_TX,";
    sql += " EEA_LIVER_CD,";
    sql += " EEA_BAST_CD,";
    sql += " EEA_HLTH_KD,";
    sql += " ICR_EMAI_AR,";
    sql += " ICR_PENL_ID,";
    sql += " ICR_NTNA_CD,";
    sql += " ICR_REGION_CD,";
    sql += " CASE";
    sql += " WHEN SUBSTR(EEA_EXAM_LT, 1, 3) IN ('P00', 'E00') THEN F_PACK_FIND(EEA_EXAM_LT, '')";
    sql += " WHEN SUBSTR(EEA_EXAM_LT, 1, 3) = 'C03' THEN F_PACK_FIND(EEA_EXAM_LT, EEA_COMP_CD)";
    sql += " ELSE F_CODE_FIND('0401', SUBSTR(EEA_EXAM_CD || '001', 1, 5), '', '1') END AS EXAM_NM,";
    sql += " CCN_REL,";
    sql += " SUM(EEP_FST_PR) FST_PR,";
    sql += " SUM(EEP_ADD_PR) ADD_PR,";
    sql += " SUM(EEP_PRGS_PR) PRGS_PR,";
    sql += " SUM(EEP_HTSB_PR) HTSB_PR,";
    sql += " SUM(EEP_CAN_PR) CAN_PR,";
    sql += " SUM(EEP_SPSB_PR) SPSB_PR,";
    sql += " SUM(EEP_CVSB_PR) CVSB_PR,";
    sql += " SUM(EEP_EMSB_PR) EMSB_PR,";
    sql += " SUM(EEP_ETSB_PR) ETSB_PR,";
    sql += " SUM(EEP_DMD_PR) DMD_PR,";
    sql += " SUM(EEP_HDMD_PR) HDMD_PR,";
    sql += " SUM(EEP_SDMD_PR) SDMD_PR,";
    sql += " SUM(EEP_COMP_PR) COMP_PR,";
    sql += " SUM(EEP_COMPS_PR) COMPS_PR,";
    sql += " SUM(EEP_PSNL_PR + EEP_PSNLP_PR) PSNLT_PR,";
    sql += " SUM(EEP_PSNL_PR) PSNL_PR,";
    sql += " SUM(EEP_PSNLP_PR) PSNLP_PR,";
    sql += " SUM(EEP_EXAM_PR)EXAM_PR,";
    sql += " (SELECT LISTAGG(CSC_ETC1_CD, '') WITHIN GROUP (ORDER BY CSM_MATT_CD)";
    sql += " FROM (SELECT CSM_MATT_CD,";
    sql += " CSC_ETC1_CD";
    sql += " FROM CT_SP_MATTER";
    sql += " INNER JOIN CT_SP_COMMON ON CSM_COMM_CD = CSC_SMALL";
    sql += " WHERE CSC_LARGE = 'HM99A'";
    sql += " AND CSM_MATT_CD IN";
    sql += " (SELECT SUBSTR(REGEXP_SUBSTR(A.EEA_SPCL_LT, '[^|]+', 1, LV), 2, 5) AS MATT_CD";
    sql += " FROM ET_EXAM_ACPT";
    sql += " , (SELECT LEVEL AS LV";
    sql += " FROM DUAL";
    sql += " CONNECT BY LEVEL <= 100) B";
    sql += " WHERE EEA_EXAM_DT = A.EEA_EXAM_DT";
    sql += " AND EEA_EXAM_SQ = A.EEA_EXAM_SQ";
    sql += " AND REGEXP_SUBSTR(A.EEA_SPCL_LT, '[^|]+', 1, LV) IS NOT NULL)))  ETC1_CD,";
    sql += " (SELECT LISTAGG(ERI_ITEM_CD, '|') WITHIN GROUP (ORDER BY ERI_ITEM_CD)";
    sql += " FROM ET_RSLT_ITEM";
    sql += " WHERE ERI_EXAM_DT = A.EEA_EXAM_DT";
    sql += " AND ERI_EXAM_SQ = A.EEA_EXAM_SQ";
    sql += " AND NVL(ERI_CNCL_YN, 'N') <> 'Y') ITEM_CD,";
    sql += " (SELECT LISTAGG(IIM_KNME_NM, '|') WITHIN GROUP (ORDER BY ERI_ITEM_CD)";
    sql += " FROM IT_ITEM";
    sql += " Inner Join ET_RSLT_ITEM On IIM_ITEM_CD = ERI_ITEM_CD";
    sql += " WHERE ERI_EXAM_DT = A.EEA_EXAM_DT";
    sql += " AND ERI_EXAM_SQ = A.EEA_EXAM_SQ";
    sql += " AND NVL(ERI_CNCL_YN, 'N') <> 'Y') KNME_NM";
    sql += " FROM ET_EXAM_ACPT A";
    sql += " INNER JOIN IT_CUSTOMER ON ICR_CUST_NO = EEA_CUST_NO AND NVL(ICR_PENL_ID, ' ') <> ' '";
    sql += " LEFT JOIN CT_COMMON ON CCN_SMALL = EEA_DISC_CD AND CCN_LARGE = '0921' AND CCN_LEVEL = '5'";
    sql += " LEFT JOIN ET_EXAM_PRICE ON EEP_EXAM_DT = EEA_EXAM_DT AND EEP_EXAM_SQ = EEA_EXAM_SQ";
    sql += " WHERE EEA_EXAM_DT BETWEEN '" + SFROMDATE + "' AND '" + STODATE + "'";

    if (!EXAM_SQ.equals("")) {
        sql += "AND EEA_EXAM_SQ = '" + EXAM_SQ + "'";
    }

    if (CMBSRCHTEST.equals("10000")) {
        sql += "AND (SUBSTR(EEA_EXAM_CD,1,1) = '1' OR SUBSTR(EEA_HTSB_CD,1,1) = '1') ";
    } else if (CMBSRCHTEST.equals("11001")) {
        sql += "AND (EEA_EXAM_CD IN ('11001', '12001', '12003') OR EEA_HTSB_CD IN ('11001', '12001', '12003')) ";
    } else if (CMBSRCHTEST.equals("11002")) {
        sql += "AND (EEA_EXAM_CD IN ('11002', '12002', '12004') OR EEA_HTSB_CD IN ('11002', '12002', '12004')) ";
    } else if (CMBSRCHTEST.equals("13000")) {
        sql += "AND (EEA_STOMA_CD > 0 OR EEA_COLON_CD > 0 OR EEA_LIVER_CD > 0 OR EEA_BAST_CD > 0 OR EEA_UTER_CD > 0 OR (EEA_LUNG_CD > 0 And EEA_LUNG_CD is not null) ) ";
    } else if (CMBSRCHTEST.equals("20000")) {
        sql += "AND SUBSTR(EEA_EXAM_CD,1,1) = '2' ";
    } else if (CMBSRCHTEST.equals("31000")) {
        sql += " AND SUBSTR(EEA_EXAM_CD,1,2) = '31'";
    } else if (CMBSRCHTEST.equals("32000")) {
        sql += " AND (SUBSTR(EEA_EXAM_CD,1,2) = '32' OR SUBSTR(EEA_EMSB_CD,1,2) = '32') ";
    } else if (CMBSRCHTEST.equals("40000")) {
        sql += " AND (SUBSTR(EEA_EXAM_CD,1,1) = '4' OR SUBSTR(EEA_SPSB_CD,1,1) = '4') ";
    } else if (CMBSRCHTEST.equals("50000")) {
        sql += " AND SUBSTR(EEA_EXAM_CD,1,1) = '5'";
    } else if (CMBSRCHTEST.equals("60000")) {
        sql += " AND SUBSTR(EEA_EXAM_CD,1,1) = '6'";
    } else if (CMBSRCHTEST.equals("70000")) {
        sql += " AND SUBSTR(EEA_EXAM_CD,1,1) = '7'";
    } else if (CMBSRCHTEST.equals("80000")) {
        sql += " AND SUBSTR(EEA_EXAM_CD,1,1) = '8'";
    } else if (CMBSRCHTEST.equals("90000")) {
        sql += " AND (SUBSTR(EEA_EXAM_CD,1,1) = '9' OR SUBSTR(EEA_EXAM_CD,1,1) = '9')";
    }

    if (!RZCOMBOBOX1.equals("전체")) {
        sql += " AND EEA_PLCE_CD = '" + PLCE_CD + "'";
    }

    if (!COMP_CD.equals("")) {
        sql += " AND EEA_COMP_CD = '" + COMP_CD + "'";
    }

    if (!PSNL_NM.equals("")) {
        sql += " AND EEA_PSNL_NM LIKE '%'||'" + PSNL_NM + "'||'%'";
    }

    if (!DIVI_CS.equals("")) {
        sql += " AND EEA_DIVI_CS = '" + DIVI_CS + "'";
    }

    if (!CLSS_KD.equals("")) {
        sql += " AND EEA_CLSS_KD = '" + CLSS_KD + "'";
    }

    if (!CHART_NO.equals("")) {
        sql += " AND EEA_CHART_NO Like  '%'|| '" + CHART_NO + "' ||'%'";
    }

    if (!CANCEL_YN.equals("Y")) {
        sql += " AND EEA_ORDER_YN <> 'C'";
    }

    if (CBCAN_KD.equals("1")) {
        sql += " AND EEA_STOMA_CD <> '0'";
    } else if (CBCAN_KD.equals("2")) {
        sql += " AND EEA_COLON_CD <> '0'";
    } else if (CBCAN_KD.equals("3")) {
        sql += " AND EEA_LIVER_CD <> '0'";
    } else if (CBCAN_KD.equals("4")) {
        sql += " AND EEA_BAST_CD <> '0'";
    } else if (CBCAN_KD.equals("5")) {
        sql += " AND EEA_UTER_CD <> '0'";
    } else if (CBCAN_KD.equals("6")) {
        sql += " AND NVL(EEA_LUNG_CD, '0') <> '0'";
    }


    if (!SEX_CD.equals("0")) {
        sql += " AND EEA_SEX_CD = '" + SEX_CD + "'";
    }

    sql += " GROUP BY EEA_EXAM_DT, ";
    sql += " EEA_EXAM_SQ, ";
    sql += " EEA_PSNL_NM, ";
    sql += " ICR_PENL_ID, ";
    sql += " EEA_CHART_NO, ";
    sql += " ICR_TEL_NO, ";
    sql += " ICR_MOBL_NO, ";
    sql += " EEA_EXAM_CD, ";
    sql += " EEA_SPSB_YN, ";
    sql += " EEA_HTSB_YN, ";
    sql += " EEA_EMSB_YN, ";
    sql += " EEA_CVSB_YN, ";
    sql += " EEA_ETSB_YN, ";
    sql += " EEA_ACPT_CD, ";
    sql += " EEA_SPCL_LT, ";
    sql += " EEA_OCS_DR, ";
    sql += " EEA_PLCE_CD, ";
    sql += " EEA_ZIP_CD, ";
    sql += " EEA_ZIP_AR, ";
    sql += " EEA_ROAD_AR, ";
    sql += " EEA_PSNL_AGE, ";
    sql += " EEA_SEX_CD, ";
    sql += " EEA_BLDG_NO, ";
    sql += " EEA_OCS_NO, ";
    sql += " EEA_PSNLR_PR, ";
    sql += " EEA_ORDER_YN, ";
    sql += " EEA_SPSB_CD, ";
    sql += " EEA_DISC_RC, ";
    sql += " EEA_DISC_CD, ";
    sql += " EEA_HDMD_YN, ";
    sql += " EEA_HTSB_CD, ";
    sql += " EEA_EXAM_LT, ";
    sql += " EEA_RSVN_NO, ";
    sql += " EEA_DISC_PR, ";
    sql += " EEA_STOMA_CD, ";
    sql += " EEA_CANAD_YN, ";
    sql += " EEA_BAST_CD, ";
    sql += " EEA_ACPT_TX, ";
    sql += " EEA_LIVER_CD, ";
    sql += " EEA_BAST_CD, ";
    sql += " EEA_HLTH_KD, ";
    sql += " EEA_COMP_CD, ";
    sql += " ICR_EMAI_AR, ";
    sql += " ICR_NTNA_CD, ";
    sql += " ICR_REGION_CD, ";
    sql += " CCN_REL ";

    //
    G_INFO += "<!-- \n";
    G_INFO += "서비스명 : uMain_btnSearchClick_008 \n";
    G_INFO += "설명 : 접수정보및 환자정보 로딩 \n";
    G_INFO += "\n\n";

    G_INFO += " 전달인자 : \n";
    G_INFO += " SFROMDATE : " + SFROMDATE + " \n";
    G_INFO += " STODATE : " + STODATE + " \n";
    G_INFO += " CMBSRCHTEST : " + CMBSRCHTEST + " \n";
    G_INFO += " RZCOMBOBOX1 : " + RZCOMBOBOX1 + " \n";
    G_INFO += " PLCE_CD : " + PLCE_CD + " \n";
    G_INFO += " COMP_CD : " + COMP_CD + " \n";
    G_INFO += " PSNL_NM : " + PSNL_NM + " \n";
    G_INFO += " DIVI_CS : " + DIVI_CS + " \n";
    G_INFO += " CLSS_KD : " + CLSS_KD + " \n";
    G_INFO += " CHART_NO : " + CHART_NO + " \n";
    G_INFO += " CBCAN_KD : " + CBCAN_KD + " \n";
    G_INFO += " EXAM_SQ : " + EXAM_SQ + " \n";
    G_INFO += " CANCEL_YN : " + CANCEL_YN + " \n";
    G_INFO += " SEX_CD : " + SEX_CD + " \n";
    G_INFO += "\n\n";

    G_INFO += "질의문 : " + sql + " \n";
    G_INFO += "-->";

    rsList = stmtList.executeQuery(sql);
    cRsList = new CRs(rsList);

    rsmd = rsList.getMetaData();  //Select 결과의 Metadata 가져오기.

    out.clear();        // include된 파일안의 공백 제거
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
                    <%
                        for (colCnt = 1; colCnt <= rsmd.getColumnCount(); colCnt++) {
                            String dataType = "string";
                            String maxLength = "4000";

                            if (rsmd.getColumnTypeName(colCnt).equals("BLOB")) {
                                dataType = "bin.hex";
                                maxLength = "2147483647";
                                //<s:datatype dt:type='bin.hex' dt:maxLength='2147483647' rs:long='true'/>
                            } else if (rsmd.getColumnTypeName(colCnt).equals("CLOB")) {
                                maxLength = "1073741823";
                                //<s:datatype dt:type='string' dt:maxLength='1073741823' rs:long='true'/>
                            }
                    %>
                    <s:AttributeType name='<%= rsmd.getColumnName(colCnt)%>' rs:number='<%= Integer.toString(colCnt)%>' rs:writeunknown='true' rs:basetable='DUAL'
                                     rs:basecolumn='<%= rsmd.getColumnName(colCnt)%>'>
                        <s:datatype dt:type='<%= dataType%>' dt:maxLength='<%= maxLength%>' <% if (!maxLength.equals("4000")) { %> rs:long='true' <% } %>/>
                    </s:AttributeType>
                    <%
                        }
                    %>
                    <s:AttributeType name='ROWID' rs:number='<%= Integer.toString(colCnt)%>' rs:rowid='true' rs:writeunknown='true' rs:basetable='DUAL'
                                     rs:basecolumn='ROWID' rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
                        <s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
                    </s:AttributeType>
                    <s:extends type='rs:rowbase'/>
                </s:ElementType>
            </s:Schema> <rs:data>
            <%
                int cnt = 0;
                while (cRsList.next()) {

                    cnt++;

                    String ROWID_T = cRsList.getString("ROWID");
            %>
            <z:row
            <%
                for (colCnt = 1; colCnt <= rsmd.getColumnCount(); colCnt++) {

                    String tempData = cRsList.getString(rsmd.getColumnName(colCnt));

                    if (rsmd.getColumnTypeName(colCnt).equals("BLOB")) {
                        byte[] buf_BLOB = rsList.getBytes(rsmd.getColumnName(colCnt));
                        if (buf_BLOB != null) {
                            tempData = new String(buf_BLOB);
                        }
                    }

                    if (!tempData.equals("")) {
            %>
            <%= rsmd.getColumnName(colCnt)%>='<%= tempData%>'
            <%
                    }
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

    out.clear();        // include된 파일안의 공백 제거
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

    if (rsList != null) {
        rsList.close();
        rsList = null;
    }

    if (stmtList != null) {
        stmtList.close();
        stmtList = null;
    }
%>
<%@ include file="/inc_prg/disconnect.jsp" %>
<%
    }
%>
