<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uCancer_Rslt_2020_ufSaveCrvcRslt_002(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String ICOUNT = (String) argHtMethod.get("ICOUNT");
			String EXAM_DT = (String) argHtMethod.get("EXAM_DT");
			String EXAM_SQ = (String) argHtMethod.get("EXAM_SQ");
			String CVEX_DT = (String) argHtMethod.get("CVEX_DT");
			String DBCV_KD = (String) argHtMethod.get("DBCV_KD");
			String CVSP1_KD = (String) argHtMethod.get("CVSP1_KD");
			String CELL1_KD = (String) argHtMethod.get("CELL1_KD");
			String CVRT1_KD = (String) argHtMethod.get("CVRT1_KD");
			String SQRT1_KD = (String) argHtMethod.get("SQRT1_KD");
			String NHRT1_KD = (String) argHtMethod.get("NHRT1_KD");
			String EPRT1_KD = (String) argHtMethod.get("EPRT1_KD");
			String NHEP1_KD = (String) argHtMethod.get("NHEP1_KD");
			String EPET1_EX = (String) argHtMethod.get("EPET1_EX");
			String RTET1_EX = (String) argHtMethod.get("RTET1_EX");
			String ETCRT1_KD = (String) argHtMethod.get("ETCRT1_KD");
			String ETCEX1_EX = (String) argHtMethod.get("ETCEX1_EX");
			String CVSP2_KD = (String) argHtMethod.get("CVSP2_KD");
			String CELL2_KD = (String) argHtMethod.get("CELL2_KD");
			String CVRT2_KD = (String) argHtMethod.get("CVRT2_KD");
			String SQRT2_KD = (String) argHtMethod.get("SQRT2_KD");
			String NHRT2_KD = (String) argHtMethod.get("NHRT2_KD");
			String EPRT2_KD = (String) argHtMethod.get("EPRT2_KD");
			String NHEP2_KD = (String) argHtMethod.get("NHEP2_KD");
			String EPET2_EX = (String) argHtMethod.get("EPET2_EX");
			String RTET2_EX = (String) argHtMethod.get("RTET2_EX");
			String ETCRT2_KD = (String) argHtMethod.get("ETCRT2_KD");
			String ETCEX2_EX = (String) argHtMethod.get("ETCEX2_EX");
			String RSLT_KD = (String) argHtMethod.get("RSLT_KD");
			String ETC_EX = (String) argHtMethod.get("ETC_EX");
			String CVCN_YN = (String) argHtMethod.get("CVCN_YN");
			String RSLT_EX = (String) argHtMethod.get("RSLT_EX");
			String CFRM_DT = (String) argHtMethod.get("CFRM_DT");
			String LICEN_CD = (String) argHtMethod.get("LICEN_CD");
			String COLL_LICEN_CD = (String) argHtMethod.get("COLL_LICEN_CD");
			String PATH_LICEN_CD = (String) argHtMethod.get("PATH_LICEN_CD");
			String USER = (String) argHtMethod.get("USER");

			//
			if(ICOUNT == null) { ICOUNT = ""; }
			if(EXAM_DT == null) { EXAM_DT = ""; }
			if(EXAM_SQ == null) { EXAM_SQ = ""; }
			if(CVEX_DT == null) { CVEX_DT = ""; }
			if(DBCV_KD == null) { DBCV_KD = ""; }
			if(CVSP1_KD == null) { CVSP1_KD = ""; }
			if(CELL1_KD == null) { CELL1_KD = ""; }
			if(CVRT1_KD == null) { CVRT1_KD = ""; }
			if(SQRT1_KD == null) { SQRT1_KD = ""; }
			if(NHRT1_KD == null) { NHRT1_KD = ""; }
			if(EPRT1_KD == null) { EPRT1_KD = ""; }
			if(NHEP1_KD == null) { NHEP1_KD = ""; }
			if(EPET1_EX == null) { EPET1_EX = ""; }
			if(RTET1_EX == null) { RTET1_EX = ""; }
			if(ETCRT1_KD == null) { ETCRT1_KD = ""; }
			if(ETCEX1_EX == null) { ETCEX1_EX = ""; }
			if(CVSP2_KD == null) { CVSP2_KD = ""; }
			if(CELL2_KD == null) { CELL2_KD = ""; }
			if(CVRT2_KD == null) { CVRT2_KD = ""; }
			if(SQRT2_KD == null) { SQRT2_KD = ""; }
			if(NHRT2_KD == null) { NHRT2_KD = ""; }
			if(EPRT2_KD == null) { EPRT2_KD = ""; }
			if(NHEP2_KD == null) { NHEP2_KD = ""; }
			if(EPET2_EX == null) { EPET2_EX = ""; }
			if(RTET2_EX == null) { RTET2_EX = ""; }
			if(ETCRT2_KD == null) { ETCRT2_KD = ""; }
			if(ETCEX2_EX == null) { ETCEX2_EX = ""; }
			if(RSLT_KD == null) { RSLT_KD = ""; }
			if(ETC_EX == null) { ETC_EX = ""; }
			if(CVCN_YN == null) { CVCN_YN = ""; }
			if(RSLT_EX == null) { RSLT_EX = ""; }
			if(CFRM_DT == null) { CFRM_DT = ""; }
			if(LICEN_CD == null) { LICEN_CD = ""; }
			if(COLL_LICEN_CD == null) { COLL_LICEN_CD = ""; }
			if(PATH_LICEN_CD == null) { PATH_LICEN_CD = ""; }
			if(USER == null) { USER = ""; }

			//
			ICOUNT = CTr.Replace(ICOUNT, "'", "''");
			EXAM_DT = CTr.Replace(EXAM_DT, "'", "''");
			EXAM_SQ = CTr.Replace(EXAM_SQ, "'", "''");
			CVEX_DT = CTr.Replace(CVEX_DT, "'", "''");
			DBCV_KD = CTr.Replace(DBCV_KD, "'", "''");
			CVSP1_KD = CTr.Replace(CVSP1_KD, "'", "''");
			CELL1_KD = CTr.Replace(CELL1_KD, "'", "''");
			CVRT1_KD = CTr.Replace(CVRT1_KD, "'", "''");
			SQRT1_KD = CTr.Replace(SQRT1_KD, "'", "''");
			NHRT1_KD = CTr.Replace(NHRT1_KD, "'", "''");
			EPRT1_KD = CTr.Replace(EPRT1_KD, "'", "''");
			NHEP1_KD = CTr.Replace(NHEP1_KD, "'", "''");
			EPET1_EX = CTr.Replace(EPET1_EX, "'", "''");
			RTET1_EX = CTr.Replace(RTET1_EX, "'", "''");
			ETCRT1_KD = CTr.Replace(ETCRT1_KD, "'", "''");
			ETCEX1_EX = CTr.Replace(ETCEX1_EX, "'", "''");
			CVSP2_KD = CTr.Replace(CVSP2_KD, "'", "''");
			CELL2_KD = CTr.Replace(CELL2_KD, "'", "''");
			CVRT2_KD = CTr.Replace(CVRT2_KD, "'", "''");
			SQRT2_KD = CTr.Replace(SQRT2_KD, "'", "''");
			NHRT2_KD = CTr.Replace(NHRT2_KD, "'", "''");
			EPRT2_KD = CTr.Replace(EPRT2_KD, "'", "''");
			NHEP2_KD = CTr.Replace(NHEP2_KD, "'", "''");
			EPET2_EX = CTr.Replace(EPET2_EX, "'", "''");
			RTET2_EX = CTr.Replace(RTET2_EX, "'", "''");
			ETCRT2_KD = CTr.Replace(ETCRT2_KD, "'", "''");
			ETCEX2_EX = CTr.Replace(ETCEX2_EX, "'", "''");
			RSLT_KD = CTr.Replace(RSLT_KD, "'", "''");
			ETC_EX = CTr.Replace(ETC_EX, "'", "''");
			CVCN_YN = CTr.Replace(CVCN_YN, "'", "''");
			RSLT_EX = CTr.Replace(RSLT_EX, "'", "''");
			CFRM_DT = CTr.Replace(CFRM_DT, "'", "''");
			LICEN_CD = CTr.Replace(LICEN_CD, "'", "''");
			COLL_LICEN_CD = CTr.Replace(COLL_LICEN_CD, "'", "''");
			PATH_LICEN_CD = CTr.Replace(PATH_LICEN_CD, "'", "''");
			USER = CTr.Replace(USER, "'", "''");

			if(ICOUNT.equals("0")) {
				sql = "INSERT INTO ET_CANCER_CRVC ( ECV_EXAM_DT , ECV_EXAM_SQ , ECV_CVEX_DT , ECV_DBCV_KD , ECV_CVSP1_KD , ECV_CELL1_KD , ECV_CVRT1_KD , ECV_SQRT1_KD , ECV_NHRT1_KD , ECV_EPRT1_KD , ECV_NHEP1_KD , ECV_EPET1_EX , ECV_RTET1_EX , ECV_ETCRT1_KD , ECV_ETCEX1_EX , ECV_CVSP2_KD , ECV_CELL2_KD , ECV_CVRT2_KD , ECV_SQRT2_KD , ECV_NHRT2_KD , ECV_EPRT2_KD , ECV_NHEP2_KD , ECV_EPET2_EX , ECV_RTET2_EX , ECV_ETCRT2_KD , ECV_ETCEX2_EX , ECV_RSLT_KD , ECV_ETC_EX , ECV_CVCN_YN , ECV_RSLT_EX , ECV_CFRM_DT , ECV_LICEN_CD , ECV_COLL_LICEN_CD , ECV_PATH_LICEN_CD , ECV_INPUT_DTT , ECV_INPUT_ID ) VALUES (";
				sql += "  '" + EXAM_DT + "'";
				sql += ", '" + EXAM_SQ + "'";
				sql += ", '" + CVEX_DT + "'";
				sql += ", '" + DBCV_KD + "'";
				sql += ", '" + CVSP1_KD + "'";
				sql += ", '" + CELL1_KD + "'";
				sql += ", '" + CVRT1_KD + "'";
				sql += ", '" + SQRT1_KD + "'";
				sql += ", '" + NHRT1_KD + "'";
				sql += ", '" + EPRT1_KD + "'";
				sql += ", '" + NHEP1_KD + "'";
				sql += ", '" + EPET1_EX + "'";
				sql += ", '" + RTET1_EX + "'";
				sql += ", '" + ETCRT1_KD + "'";
				sql += ", '" + ETCEX1_EX + "'";
				sql += ", '" + CVSP2_KD + "'";
				sql += ", '" + CELL2_KD + "'";
				sql += ", '" + CVRT2_KD + "'";
				sql += ", '" + SQRT2_KD + "'";
				sql += ", '" + NHRT2_KD + "'";
				sql += ", '" + EPRT2_KD + "'";
				sql += ", '" + NHEP2_KD + "'";
				sql += ", '" + EPET2_EX + "'";
				sql += ", '" + RTET2_EX + "'";
				sql += ", '" + ETCRT2_KD + "'";
				sql += ", '" + ETCEX2_EX + "'";
				sql += ", '" + RSLT_KD + "'";
				sql += ", '" + ETC_EX + "'";
				sql += ", '" + CVCN_YN + "'";
				sql += ", '" + RSLT_EX + "'";
				sql += ", '" + CFRM_DT + "'";
				sql += ", '" + LICEN_CD + "'";
				sql += ", '" + COLL_LICEN_CD + "'";
				sql += ", '" + PATH_LICEN_CD + "'";
				sql += ", SYSDATE";
				sql += ", '" + USER + "'";
				sql += ")";
	
				argStmtExec.executeUpdate(sql);

			}
			else {
				sql = "UPDATE ET_CANCER_CRVC SET ";
				sql += "  ECV_CVEX_DT = '" + CVEX_DT + "'";
				sql += ", ECV_DBCV_KD = '" + DBCV_KD + "'";
				sql += ", ECV_CVSP1_KD = '" + CVSP1_KD + "'";
				sql += ", ECV_CELL1_KD = '" + CELL1_KD + "'";
				sql += ", ECV_CVRT1_KD = '" + CVRT1_KD + "'";
				sql += ", ECV_SQRT1_KD = '" + SQRT1_KD + "'";
				sql += ", ECV_NHRT1_KD = '" + NHRT1_KD + "'";
				sql += ", ECV_EPRT1_KD = '" + EPRT1_KD + "'";
				sql += ", ECV_NHEP1_KD = '" + NHEP1_KD + "'";
				sql += ", ECV_EPET1_EX = '" + EPET1_EX + "'";
				sql += ", ECV_RTET1_EX = '" + RTET1_EX + "'";
				sql += ", ECV_ETCRT1_KD = '" + ETCRT1_KD + "'";
				sql += ", ECV_ETCEX1_EX = '" + ETCEX1_EX + "'";
				sql += ", ECV_CVSP2_KD = '" + CVSP2_KD + "'";
				sql += ", ECV_CELL2_KD = '" + CELL2_KD + "'";
				sql += ", ECV_CVRT2_KD = '" + CVRT2_KD + "'";
				sql += ", ECV_SQRT2_KD = '" + SQRT2_KD + "'";
				sql += ", ECV_NHRT2_KD = '" + NHRT2_KD + "'";
				sql += ", ECV_EPRT2_KD = '" + EPRT2_KD + "'";
				sql += ", ECV_NHEP2_KD = '" + NHEP2_KD + "'";
				sql += ", ECV_EPET2_EX = '" + EPET2_EX + "'";
				sql += ", ECV_RTET2_EX = '" + RTET2_EX + "'";
				sql += ", ECV_ETCRT2_KD = '" + ETCRT2_KD + "'";
				sql += ", ECV_ETCEX2_EX = '" + ETCEX2_EX + "'";
				sql += ", ECV_RSLT_KD = '" + RSLT_KD + "'";
				sql += ", ECV_ETC_EX = '" + ETC_EX + "'";
				sql += ", ECV_CVCN_YN = '" + CVCN_YN + "'";
				sql += ", ECV_RSLT_EX = '" + RSLT_EX + "'";
				sql += ", ECV_CFRM_DT = '" + CFRM_DT + "'";
				sql += ", ECV_LICEN_CD = '" + LICEN_CD + "'";
				sql += ", ECV_COLL_LICEN_CD = '" + COLL_LICEN_CD + "'";
				sql += ", ECV_PATH_LICEN_CD = '" + PATH_LICEN_CD + "'";
				sql += ", ECV_MODI_DTT = SYSDATE";
				sql += ", ECV_MODI_ID = '" + USER + "'";
				sql += " WHERE ECV_EXAM_DT = '" + EXAM_DT + "'";
				sql += " AND ECV_EXAM_SQ = '" + EXAM_SQ + "'";
	
				argStmtExec.executeUpdate(sql);

			}
		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
