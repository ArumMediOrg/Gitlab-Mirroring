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

    String DP_FROMDT8 = htMethod.get("DP_FROMDT8");
    String DP_TODT8 = htMethod.get("DP_TODT8");
    String SELECTKD1 = htMethod.get("SELECTKD1");
    String SELECTKD2 = htMethod.get("SELECTKD2");

//
        if (DP_FROMDT8 == null) {
        DP_FROMDT8 = "";
        }
        if (DP_TODT8 == null) {
        DP_TODT8 = "";
        }
        if (SELECTKD1 == null) {
        SELECTKD1 = "";
        }
        if (SELECTKD2 == null) {
        SELECTKD2 = "";
        }

    // DB객체
    stmtList = connect.createStatement();

    if (SELECTKD2.equals("0")) {
            sql =  " SELECT ";
            sql += " SLT_DATE, sum(PSNL_PR) PSNL_PR, sum(COMP_PR) COMP_PR, sum(DISC_PR) DISC_PR, sum(ACPT_CNT) ACPT_CNT ";
            sql += " ,sum(D_CardPr) D_CardPr, sum(D_CashPr) D_CashPr, sum(D_BookPr) D_BookPr, sum(D_PointPr) D_PointPr, sum(D_OtherPr) D_OtherPr ";
            sql += " ,sum(D_SalePr) D_SalePr, sum(RESER_PR) RESER_PR, sum(RESEREPL_PR) RESEREPL_PR, sum(R_CardPr) R_CardPr, sum(R_CashPr) R_CashPr ";
            sql += " ,sum(R_BookPr) R_BookPr ,sum(R_PointPr) R_PointPr ,sum(R_OtherPr)   R_OtherPr   ,sum(R_SalePr)  R_SalePr  ";
            sql += " FROM ";
            sql += " ( SELECT ";
            sql += " '1990-01-01'  SLT_DATE  , 0 PSNL_PR   ,0 COMP_PR   ,0 DISC_PR   , 0 ACPT_CNT ";
            sql += " ,0 D_CardPr   ,0 D_CashPr  ,0 D_BookPr    ,0 D_PointPr ,0 D_OtherPr ";
            sql += " ,0 D_SalePr   ,0 RESER_PR  ,0 RESEREPL_PR ,0 R_CardPr  ,0 R_CashPr ";
            sql += " ,0 R_BookPr   ,0 R_PointPr ,0 R_OtherPr   ,0 R_SalePr  FROM dual ";

            sql += " UNION ALL ";
            sql += " SELECT ";
            sql += " EEP_ORDER_DT SLT_DATE  ,PSNL_PR   ,COMP_PR   ,DISC_PR   ,ACPT_CNT ";
            sql += " ,0 D_CardPr   ,0 D_CashPr  ,0 D_BookPr    ,0 D_PointPr ,0 D_OtherPr ";
            sql += " ,0 D_SalePr   ,0 RESER_PR  ,0 RESEREPL_PR ,0 R_CardPr  ,0 R_CashPr ";
            sql += " ,0 R_BookPr   ,0 R_PointPr ,0 R_OtherPr   ,0 R_SalePr ";
            sql += " FROM V_KUMC_ACPT ";
            sql += " WHERE ";
            sql += " EEP_ORDER_DT between '" + DP_FROMDT8 + "' and '" + DP_TODT8 + "'";
            sql += " UNION ALL ";
            sql += " SELECT ";
            sql += " RRM_RECE_DT SLT_DATE  ,0 PSNL_PR ,0 COMP_PR ,0 DISC_PR ,0 ACPT_CNT ";
            sql += " ,sum(D_CardPr) D_CardPr ,sum(D_CashPr) D_CashPr   ,sum(D_BookPr)    D_BookPr    ,sum(D_PointPr) D_PointPr,sum(D_OtherPr) D_OtherPr ";
            sql += " ,sum(D_SalePr) D_SalePr ,sum(RESER_PR) RESER_PR   ,sum(RESEREPL_PR) RESEREPL_PR ,sum(R_CardPr)  R_CardPr,sum(R_CashPr)   R_CashPr ";
            sql += " ,sum(R_BookPr) R_BookPr ,sum(R_PointPr) R_PointPr ,sum(R_OtherPr)   R_OtherPr   ,sum(R_SalePr)  R_SalePr ";
            sql += " FROM V_KUMC_RECE ";
            sql += " WHERE ";
            sql += " RRM_RECE_DT between '" + DP_FROMDT8 + "' and '" + DP_TODT8 + "'";
            if (SELECTKD1.equals("0")) {
                sql += "and OCCU_KD IN ('2','3') "; //전체
            } else if (SELECTKD1.equals("1")) {
                sql += "and OCCU_KD IN ('1')";  //예약금
            } else if (SELECTKD1.equals("2")) {
                sql += "and OCCU_KD IN ('2')"; //개인(직불)
            } else if (SELECTKD1.equals("3")) {
                sql += "and OCCU_KD IN ('3')"; //사업장(청구) ";
            }
            sql += "GROUP BY RRM_RECE_DT ";

            sql += "UNION ALL ";
            sql += "SELECT ";
            sql += "EEP_ORDER_DT SLT_DATE  ,PSNL_PR   ,COMP_PR   ,DISC_PR   ,ACPT_CNT ";
            sql += ",0 D_CardPr   ,0 D_CashPr  ,0 D_BookPr    ,0 D_PointPr ,0 D_OtherPr ";
            sql += ",0 D_SalePr   ,0 RESER_PR  ,0 RESEREPL_PR ,0 R_CardPr  ,0 R_CashPr ";
            sql += ",0 R_BookPr   ,0 R_PointPr ,0 R_OtherPr   ,0 R_SalePr ";
            sql += "FROM V_KUMC_ACPT_G ";
            sql += "WHERE ";
            sql += "EEP_ORDER_DT between'" + DP_FROMDT8 + "' and '" + DP_TODT8 + "'";
            sql += "UNION ALL ";
            sql += "SELECT ";
            sql += "RRM_RECE_DT SLT_DATE  ,0 PSNL_PR ,0 COMP_PR ,0 DISC_PR ,0 ACPT_CNT ";
            sql += ",sum(D_CardPr) D_CardPr ,sum(D_CashPr) D_CashPr   ,sum(D_BookPr)    D_BookPr    ,sum(D_PointPr) D_PointPr,sum(D_OtherPr) D_OtherPr ";
            sql += ",sum(D_SalePr) D_SalePr ,sum(RESER_PR) RESER_PR   ,sum(RESEREPL_PR) RESEREPL_PR ,sum(R_CardPr)  R_CardPr,sum(R_CashPr)   R_CashPr ";
            sql += ",sum(R_BookPr) R_BookPr ,sum(R_PointPr) R_PointPr ,sum(R_OtherPr)   R_OtherPr   ,sum(R_SalePr)  R_SalePr ";
            sql += "FROM V_KUMC_RECE_G ";
            sql += "WHERE ";
            sql += "RRM_RECE_DT between'" + DP_FROMDT8 + "' and '" + DP_TODT8 + "'";
            if (SELECTKD1.equals("0")) {
                sql += " and OCCU_KD IN ('2','3')"; //전체
            } else if (SELECTKD1.equals("1")) {
                sql += " and OCCU_KD IN ('1')";  //예약금
            } else if (SELECTKD1.equals("2")) {
                sql += " and OCCU_KD IN ('2')"; //개인(직불)
            } else if (SELECTKD1.equals("3")) {
                sql += " and OCCU_KD IN ('3')"; //사업장(청구) ";
            }
            sql += "GROUP BY RRM_RECE_DT ";

            sql += ") A ";
            sql += " WHERE";
            sql += " SLT_DATE <> '1990-01-01'";
            sql += "GROUP BY SLT_DATE ";
            sql += "ORDER BY SLT_DATE ";

    } else if (SELECTKD2.equals("1")) {
            sql = " SELECT ";
            sql += " SLT_DATE, sum(PSNL_PR) PSNL_PR, sum(COMP_PR) COMP_PR, sum(DISC_PR) DISC_PR, sum(ACPT_CNT) ACPT_CNT ";
            sql += " ,sum(D_CardPr) D_CardPr, sum(D_CashPr) D_CashPr, sum(D_BookPr) D_BookPr, sum(D_PointPr) D_PointPr, sum(D_OtherPr) D_OtherPr ";
            sql += " ,sum(D_SalePr) D_SalePr, sum(RESER_PR) RESER_PR, sum(RESEREPL_PR) RESEREPL_PR, sum(R_CardPr) R_CardPr, sum(R_CashPr) R_CashPr ";
            sql += " ,sum(R_BookPr) R_BookPr ,sum(R_PointPr) R_PointPr ,sum(R_OtherPr)   R_OtherPr   ,sum(R_SalePr)  R_SalePr  ";
            sql += " FROM ";
            sql += " ( SELECT ";
            sql += " '1990-01-01'  SLT_DATE  , 0 PSNL_PR   ,0 COMP_PR   ,0 DISC_PR   , 0 ACPT_CNT ";
            sql += " ,0 D_CardPr   ,0 D_CashPr  ,0 D_BookPr    ,0 D_PointPr ,0 D_OtherPr ";
            sql += " ,0 D_SalePr   ,0 RESER_PR  ,0 RESEREPL_PR ,0 R_CardPr  ,0 R_CashPr ";
            sql += " ,0 R_BookPr   ,0 R_PointPr ,0 R_OtherPr   ,0 R_SalePr  FROM dual ";

            sql += " UNION ALL ";
            sql += " SELECT ";
            sql += " EEP_ORDER_DT SLT_DATE  ,PSNL_PR   ,COMP_PR   ,DISC_PR   ,ACPT_CNT ";
            sql += " ,0 D_CardPr   ,0 D_CashPr  ,0 D_BookPr    ,0 D_PointPr ,0 D_OtherPr ";
            sql += " ,0 D_SalePr   ,0 RESER_PR  ,0 RESEREPL_PR ,0 R_CardPr  ,0 R_CashPr ";
            sql += " ,0 R_BookPr   ,0 R_PointPr ,0 R_OtherPr   ,0 R_SalePr ";
            sql += " FROM V_KUMC_ACPT ";
            sql += " WHERE ";
            sql += " EEP_ORDER_DT between '" + DP_FROMDT8 + "' and '" + DP_TODT8 + "'";
            sql += " UNION ALL ";
            sql += " SELECT ";
            sql += " RRM_RECE_DT SLT_DATE  ,0 PSNL_PR ,0 COMP_PR ,0 DISC_PR ,0 ACPT_CNT ";
            sql += " ,sum(D_CardPr) D_CardPr ,sum(D_CashPr) D_CashPr   ,sum(D_BookPr)    D_BookPr    ,sum(D_PointPr) D_PointPr,sum(D_OtherPr) D_OtherPr ";
            sql += " ,sum(D_SalePr) D_SalePr ,sum(RESER_PR) RESER_PR   ,sum(RESEREPL_PR) RESEREPL_PR ,sum(R_CardPr)  R_CardPr,sum(R_CashPr)   R_CashPr ";
            sql += " ,sum(R_BookPr) R_BookPr ,sum(R_PointPr) R_PointPr ,sum(R_OtherPr)   R_OtherPr   ,sum(R_SalePr)  R_SalePr ";
            sql += " FROM V_KUMC_RECE ";
            sql += " WHERE ";
            sql += " RRM_RECE_DT between '" + DP_FROMDT8 + "' and '" + DP_TODT8 + "'";
            if (SELECTKD1.equals("0")) {
                sql += "and OCCU_KD IN ('2','3') "; //전체
            } else if (SELECTKD1.equals("1")) {
                sql += "and OCCU_KD IN ('1')";  //예약금
            } else if (SELECTKD1.equals("2")) {
                sql += "and OCCU_KD IN ('2')"; //개인(직불)
            } else if (SELECTKD1.equals("3")) {
                sql += "and OCCU_KD IN ('3')"; //사업장(청구) ";
            }
            sql += "GROUP BY RRM_RECE_DT ";

            sql += ") A ";
            sql += " WHERE";
            sql += " SLT_DATE <> '1990-01-01'";
            sql += "GROUP BY SLT_DATE ";
            sql += "ORDER BY SLT_DATE ";

    } else if (SELECTKD2.equals("2")) {
            sql =  " SELECT ";
            sql += " SLT_DATE, sum(PSNL_PR) PSNL_PR, sum(COMP_PR) COMP_PR, sum(DISC_PR) DISC_PR, sum(ACPT_CNT) ACPT_CNT ";
            sql += " ,sum(D_CardPr) D_CardPr, sum(D_CashPr) D_CashPr, sum(D_BookPr) D_BookPr, sum(D_PointPr) D_PointPr, sum(D_OtherPr) D_OtherPr ";
            sql += " ,sum(D_SalePr) D_SalePr, sum(RESER_PR) RESER_PR, sum(RESEREPL_PR) RESEREPL_PR, sum(R_CardPr) R_CardPr, sum(R_CashPr) R_CashPr ";
            sql += " ,sum(R_BookPr) R_BookPr ,sum(R_PointPr) R_PointPr ,sum(R_OtherPr)   R_OtherPr   ,sum(R_SalePr)  R_SalePr  ";
            sql += " FROM ";
            sql += " ( SELECT ";
            sql += " '1990-01-01'  SLT_DATE  , 0 PSNL_PR   ,0 COMP_PR   ,0 DISC_PR   , 0 ACPT_CNT ";
            sql += " ,0 D_CardPr   ,0 D_CashPr  ,0 D_BookPr    ,0 D_PointPr ,0 D_OtherPr ";
            sql += " ,0 D_SalePr   ,0 RESER_PR  ,0 RESEREPL_PR ,0 R_CardPr  ,0 R_CashPr ";
            sql += " ,0 R_BookPr   ,0 R_PointPr ,0 R_OtherPr   ,0 R_SalePr  FROM dual ";

            sql += "UNION ALL ";
            sql += "SELECT ";
            sql += "EEP_ORDER_DT SLT_DATE  ,PSNL_PR   ,COMP_PR   ,DISC_PR   ,ACPT_CNT ";
            sql += ",0 D_CardPr   ,0 D_CashPr  ,0 D_BookPr    ,0 D_PointPr ,0 D_OtherPr ";
            sql += ",0 D_SalePr   ,0 RESER_PR  ,0 RESEREPL_PR ,0 R_CardPr  ,0 R_CashPr ";
            sql += ",0 R_BookPr   ,0 R_PointPr ,0 R_OtherPr   ,0 R_SalePr ";
            sql += "FROM V_KUMC_ACPT_G ";
            sql += "WHERE ";
            sql += "EEP_ORDER_DT between'" + DP_FROMDT8 + "' and '" + DP_TODT8 + "'";
            sql += "UNION ALL ";
            sql += "SELECT ";
            sql += "RRM_RECE_DT SLT_DATE  ,0 PSNL_PR ,0 COMP_PR ,0 DISC_PR ,0 ACPT_CNT ";
            sql += ",sum(D_CardPr) D_CardPr ,sum(D_CashPr) D_CashPr   ,sum(D_BookPr)    D_BookPr    ,sum(D_PointPr) D_PointPr,sum(D_OtherPr) D_OtherPr ";
            sql += ",sum(D_SalePr) D_SalePr ,sum(RESER_PR) RESER_PR   ,sum(RESEREPL_PR) RESEREPL_PR ,sum(R_CardPr)  R_CardPr,sum(R_CashPr)   R_CashPr ";
            sql += ",sum(R_BookPr) R_BookPr ,sum(R_PointPr) R_PointPr ,sum(R_OtherPr)   R_OtherPr   ,sum(R_SalePr)  R_SalePr ";
            sql += "FROM V_KUMC_RECE_G ";
            sql += "WHERE ";
            sql += "RRM_RECE_DT between'" + DP_FROMDT8 + "' and '" + DP_TODT8 + "'";
            if (SELECTKD1.equals("0")) {
                sql += " and OCCU_KD IN ('2','3')"; //전체
            } else if (SELECTKD1.equals("1")) {
                sql += " and OCCU_KD IN ('1')";  //예약금
            } else if (SELECTKD1.equals("2")) {
                sql += " and OCCU_KD IN ('2')"; //개인(직불)
            } else if (SELECTKD1.equals("3")) {
                sql += " and OCCU_KD IN ('3')"; //사업장(청구) ";
            }
            sql += "GROUP BY RRM_RECE_DT ";

            sql += ") A ";
            sql += " WHERE";
            sql += " SLT_DATE <> '1990-01-01'";
            sql += "GROUP BY SLT_DATE ";
            sql += "ORDER BY SLT_DATE ";
    } else {
            sql =  " SELECT ";
            sql += " SLT_DATE, sum(PSNL_PR) PSNL_PR, sum(COMP_PR) COMP_PR, sum(DISC_PR) DISC_PR, sum(ACPT_CNT) ACPT_CNT ";
            sql += " ,sum(D_CardPr) D_CardPr, sum(D_CashPr) D_CashPr, sum(D_BookPr) D_BookPr, sum(D_PointPr) D_PointPr, sum(D_OtherPr) D_OtherPr ";
            sql += " ,sum(D_SalePr) D_SalePr, sum(RESER_PR) RESER_PR, sum(RESEREPL_PR) RESEREPL_PR, sum(R_CardPr) R_CardPr, sum(R_CashPr) R_CashPr ";
            sql += " ,sum(R_BookPr) R_BookPr ,sum(R_PointPr) R_PointPr ,sum(R_OtherPr)   R_OtherPr   ,sum(R_SalePr)  R_SalePr  ";
            sql += " FROM ";
            sql += " ( SELECT ";
            sql += " '1990-01-01'  SLT_DATE  , 0 PSNL_PR   ,0 COMP_PR   ,0 DISC_PR   , 0 ACPT_CNT ";
            sql += " ,0 D_CardPr   ,0 D_CashPr  ,0 D_BookPr    ,0 D_PointPr ,0 D_OtherPr ";
            sql += " ,0 D_SalePr   ,0 RESER_PR  ,0 RESEREPL_PR ,0 R_CardPr  ,0 R_CashPr ";
            sql += " ,0 R_BookPr   ,0 R_PointPr ,0 R_OtherPr   ,0 R_SalePr  FROM dual ";

            sql += " UNION ALL ";
            sql += " SELECT ";
            sql += " EEP_ORDER_DT SLT_DATE  ,PSNL_PR   ,COMP_PR   ,DISC_PR   ,ACPT_CNT ";
            sql += " ,0 D_CardPr   ,0 D_CashPr  ,0 D_BookPr    ,0 D_PointPr ,0 D_OtherPr ";
            sql += " ,0 D_SalePr   ,0 RESER_PR  ,0 RESEREPL_PR ,0 R_CardPr  ,0 R_CashPr ";
            sql += " ,0 R_BookPr   ,0 R_PointPr ,0 R_OtherPr   ,0 R_SalePr ";
            sql += " FROM V_KUMC_ACPT ";
            sql += " WHERE ";
            sql += " EEP_ORDER_DT between '" + DP_FROMDT8 + "' and '" + DP_TODT8 + "'";
            sql += " UNION ALL ";
            sql += " SELECT ";
            sql += " RRM_RECE_DT SLT_DATE  ,0 PSNL_PR ,0 COMP_PR ,0 DISC_PR ,0 ACPT_CNT ";
            sql += " ,sum(D_CardPr) D_CardPr ,sum(D_CashPr) D_CashPr   ,sum(D_BookPr)    D_BookPr    ,sum(D_PointPr) D_PointPr,sum(D_OtherPr) D_OtherPr ";
            sql += " ,sum(D_SalePr) D_SalePr ,sum(RESER_PR) RESER_PR   ,sum(RESEREPL_PR) RESEREPL_PR ,sum(R_CardPr)  R_CardPr,sum(R_CashPr)   R_CashPr ";
            sql += " ,sum(R_BookPr) R_BookPr ,sum(R_PointPr) R_PointPr ,sum(R_OtherPr)   R_OtherPr   ,sum(R_SalePr)  R_SalePr ";
            sql += " FROM V_KUMC_RECE ";
            sql += " WHERE ";
            sql += " RRM_RECE_DT between '" + DP_FROMDT8 + "' and '" + DP_TODT8 + "'";
            if (SELECTKD1.equals("0")) {
                sql += "and OCCU_KD IN ('2','3') "; //전체
            } else if (SELECTKD1.equals("1")) {
                sql += "and OCCU_KD IN ('1')";  //예약금
            } else if (SELECTKD1.equals("2")) {
                sql += "and OCCU_KD IN ('2')"; //개인(직불)
            } else if (SELECTKD1.equals("3")) {
                sql += "and OCCU_KD IN ('3')"; //사업장(청구) ";
            }
            sql += "GROUP BY RRM_RECE_DT ";

            sql += "UNION ALL ";
            sql += "SELECT ";
            sql += "EEP_ORDER_DT SLT_DATE  ,PSNL_PR   ,COMP_PR   ,DISC_PR   ,ACPT_CNT ";
            sql += ",0 D_CardPr   ,0 D_CashPr  ,0 D_BookPr    ,0 D_PointPr ,0 D_OtherPr ";
            sql += ",0 D_SalePr   ,0 RESER_PR  ,0 RESEREPL_PR ,0 R_CardPr  ,0 R_CashPr ";
            sql += ",0 R_BookPr   ,0 R_PointPr ,0 R_OtherPr   ,0 R_SalePr ";
            sql += "FROM V_KUMC_ACPT_G ";
            sql += "WHERE ";
            sql += "EEP_ORDER_DT between'" + DP_FROMDT8 + "' and '" + DP_TODT8 + "'";
            sql += "UNION ALL ";
            sql += "SELECT ";
            sql += "RRM_RECE_DT SLT_DATE  ,0 PSNL_PR ,0 COMP_PR ,0 DISC_PR ,0 ACPT_CNT ";
            sql += ",sum(D_CardPr) D_CardPr ,sum(D_CashPr) D_CashPr   ,sum(D_BookPr)    D_BookPr    ,sum(D_PointPr) D_PointPr,sum(D_OtherPr) D_OtherPr ";
            sql += ",sum(D_SalePr) D_SalePr ,sum(RESER_PR) RESER_PR   ,sum(RESEREPL_PR) RESEREPL_PR ,sum(R_CardPr)  R_CardPr,sum(R_CashPr)   R_CashPr ";
            sql += ",sum(R_BookPr) R_BookPr ,sum(R_PointPr) R_PointPr ,sum(R_OtherPr)   R_OtherPr   ,sum(R_SalePr)  R_SalePr ";
            sql += "FROM V_KUMC_RECE_G ";
            sql += "WHERE ";
            sql += "RRM_RECE_DT between'" + DP_FROMDT8 + "' and '" + DP_TODT8 + "'";
            if (SELECTKD1.equals("0")) {
                sql += " and OCCU_KD IN ('2','3')"; //전체
            } else if (SELECTKD1.equals("1")) {
                sql += " and OCCU_KD IN ('1')";  //예약금
            } else if (SELECTKD1.equals("2")) {
                sql += " and OCCU_KD IN ('2')"; //개인(직불)
            } else if (SELECTKD1.equals("3")) {
                sql += " and OCCU_KD IN ('3')"; //사업장(청구) ";
            }
            sql += "GROUP BY RRM_RECE_DT ";

            sql += ") A ";
            sql += " WHERE";
            sql += " SLT_DATE <> '1990-01-01'";
            sql += "GROUP BY SLT_DATE ";
            sql += "ORDER BY SLT_DATE ";
    }

    //
    G_INFO += "<!-- \n";
    G_INFO += "서비스명 : uRT_ReceDayReport_Up_afLoadComp8_001 \n";
    G_INFO += "설명 : 고려대 원무과 제공 VIEW 통계 조회 \n";
    G_INFO += "\n\n";

    G_INFO += "전달인자 : \n";
    G_INFO += " DP_FROMDT8 : " + DP_FROMDT8 + " \n";
    G_INFO += " DP_TODT8 : " + DP_TODT8 + " \n";
    G_INFO += " SELECTKD1 : " + SELECTKD1 + " \n";
    G_INFO += " SELECTKD2 : " + SELECTKD2 + " \n";
    G_INFO += "\n\n";

    G_INFO += "질의문 : " + sql + " \n";
    G_INFO += "-->";

    rsList = stmtList.executeQuery(sql);
    cRsList = new CRs(rsList);

    rsmd = rsList.getMetaData();  //SELECT 결과의 Metadata 가져오기.

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
