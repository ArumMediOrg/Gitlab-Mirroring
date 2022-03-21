<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uJobStress_Simple_UF_Save_002(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String EXAM_DT = (String) argHtMethod.get("EXAM_DT");
			String EXAM_SQ = (String) argHtMethod.get("EXAM_SQ");
			String QST1_1VL = (String) argHtMethod.get("QST1_1VL");
			String QST1_2VL = (String) argHtMethod.get("QST1_2VL");
			String QST1_3VL = (String) argHtMethod.get("QST1_3VL");
			String QST1_4VL = (String) argHtMethod.get("QST1_4VL");
			String QST2_5VL = (String) argHtMethod.get("QST2_5VL");
			String QST2_6VL = (String) argHtMethod.get("QST2_6VL");
			String QST2_7VL = (String) argHtMethod.get("QST2_7VL");
			String QST2_8VL = (String) argHtMethod.get("QST2_8VL");
			String QST3_9VL = (String) argHtMethod.get("QST3_9VL");
			String QST3_10VL = (String) argHtMethod.get("QST3_10VL");
			String QST3_11VL = (String) argHtMethod.get("QST3_11VL");
			String QST4_12VL = (String) argHtMethod.get("QST4_12VL");
			String QST4_13VL = (String) argHtMethod.get("QST4_13VL");
			String QST5_14VL = (String) argHtMethod.get("QST5_14VL");
			String QST5_15VL = (String) argHtMethod.get("QST5_15VL");
			String QST5_16VL = (String) argHtMethod.get("QST5_16VL");
			String QST5_17VL = (String) argHtMethod.get("QST5_17VL");
			String QST6_18VL = (String) argHtMethod.get("QST6_18VL");
			String QST6_19VL = (String) argHtMethod.get("QST6_19VL");
			String QST6_20VL = (String) argHtMethod.get("QST6_20VL");
			String QST7_21VL = (String) argHtMethod.get("QST7_21VL");
			String QST7_22VL = (String) argHtMethod.get("QST7_22VL");
			String QST7_23VL = (String) argHtMethod.get("QST7_23VL");
			String QST7_24VL = (String) argHtMethod.get("QST7_24VL");
			String PANJ_DT = (String) argHtMethod.get("PANJ_DT");
			String RST1_VL = (String) argHtMethod.get("RST1_VL");
			String RST2_VL = (String) argHtMethod.get("RST2_VL");
			String RST3_VL = (String) argHtMethod.get("RST3_VL");
			String RST4_VL = (String) argHtMethod.get("RST4_VL");
			String RST5_VL = (String) argHtMethod.get("RST5_VL");
			String RST6_VL = (String) argHtMethod.get("RST6_VL");
			String RST7_VL = (String) argHtMethod.get("RST7_VL");
			String RSTT_VL = (String) argHtMethod.get("RSTT_VL");
			String RSLT_TX = (String) argHtMethod.get("RSLT_TX");
			String DOCT_CD = (String) argHtMethod.get("DOCT_CD");
			String PANJ_YN = (String) argHtMethod.get("PANJ_YN");
			String ID = (String) argHtMethod.get("ID");

			//
			if(EXAM_DT == null) { EXAM_DT = ""; }
			if(EXAM_SQ == null) { EXAM_SQ = ""; }
			if(QST1_1VL == null) { QST1_1VL = ""; }
			if(QST1_2VL == null) { QST1_2VL = ""; }
			if(QST1_3VL == null) { QST1_3VL = ""; }
			if(QST1_4VL == null) { QST1_4VL = ""; }
			if(QST2_5VL == null) { QST2_5VL = ""; }
			if(QST2_6VL == null) { QST2_6VL = ""; }
			if(QST2_7VL == null) { QST2_7VL = ""; }
			if(QST2_8VL == null) { QST2_8VL = ""; }
			if(QST3_9VL == null) { QST3_9VL = ""; }
			if(QST3_10VL == null) { QST3_10VL = ""; }
			if(QST3_11VL == null) { QST3_11VL = ""; }
			if(QST4_12VL == null) { QST4_12VL = ""; }
			if(QST4_13VL == null) { QST4_13VL = ""; }
			if(QST5_14VL == null) { QST5_14VL = ""; }
			if(QST5_15VL == null) { QST5_15VL = ""; }
			if(QST5_16VL == null) { QST5_16VL = ""; }
			if(QST5_17VL == null) { QST5_17VL = ""; }
			if(QST6_18VL == null) { QST6_18VL = ""; }
			if(QST6_19VL == null) { QST6_19VL = ""; }
			if(QST6_20VL == null) { QST6_20VL = ""; }
			if(QST7_21VL == null) { QST7_21VL = ""; }
			if(QST7_22VL == null) { QST7_22VL = ""; }
			if(QST7_23VL == null) { QST7_23VL = ""; }
			if(QST7_24VL == null) { QST7_24VL = ""; }
			if(PANJ_DT == null) { PANJ_DT = ""; }
			if(RST1_VL == null) { RST1_VL = ""; }
			if(RST2_VL == null) { RST2_VL = ""; }
			if(RST3_VL == null) { RST3_VL = ""; }
			if(RST4_VL == null) { RST4_VL = ""; }
			if(RST5_VL == null) { RST5_VL = ""; }
			if(RST6_VL == null) { RST6_VL = ""; }
			if(RST7_VL == null) { RST7_VL = ""; }
			if(RSTT_VL == null) { RSTT_VL = ""; }
			if(RSLT_TX == null) { RSLT_TX = ""; }
			if(DOCT_CD == null) { DOCT_CD = ""; }
			if(PANJ_YN == null) { PANJ_YN = ""; }
			if(ID == null) { ID = ""; }

			//
			EXAM_DT = CTr.Replace(EXAM_DT, "'", "''");
			EXAM_SQ = CTr.Replace(EXAM_SQ, "'", "''");
			QST1_1VL = CTr.Replace(QST1_1VL, "'", "''");
			QST1_2VL = CTr.Replace(QST1_2VL, "'", "''");
			QST1_3VL = CTr.Replace(QST1_3VL, "'", "''");
			QST1_4VL = CTr.Replace(QST1_4VL, "'", "''");
			QST2_5VL = CTr.Replace(QST2_5VL, "'", "''");
			QST2_6VL = CTr.Replace(QST2_6VL, "'", "''");
			QST2_7VL = CTr.Replace(QST2_7VL, "'", "''");
			QST2_8VL = CTr.Replace(QST2_8VL, "'", "''");
			QST3_9VL = CTr.Replace(QST3_9VL, "'", "''");
			QST3_10VL = CTr.Replace(QST3_10VL, "'", "''");
			QST3_11VL = CTr.Replace(QST3_11VL, "'", "''");
			QST4_12VL = CTr.Replace(QST4_12VL, "'", "''");
			QST4_13VL = CTr.Replace(QST4_13VL, "'", "''");
			QST5_14VL = CTr.Replace(QST5_14VL, "'", "''");
			QST5_15VL = CTr.Replace(QST5_15VL, "'", "''");
			QST5_16VL = CTr.Replace(QST5_16VL, "'", "''");
			QST5_17VL = CTr.Replace(QST5_17VL, "'", "''");
			QST6_18VL = CTr.Replace(QST6_18VL, "'", "''");
			QST6_19VL = CTr.Replace(QST6_19VL, "'", "''");
			QST6_20VL = CTr.Replace(QST6_20VL, "'", "''");
			QST7_21VL = CTr.Replace(QST7_21VL, "'", "''");
			QST7_22VL = CTr.Replace(QST7_22VL, "'", "''");
			QST7_23VL = CTr.Replace(QST7_23VL, "'", "''");
			QST7_24VL = CTr.Replace(QST7_24VL, "'", "''");
			PANJ_DT = CTr.Replace(PANJ_DT, "'", "''");
			RST1_VL = CTr.Replace(RST1_VL, "'", "''");
			RST2_VL = CTr.Replace(RST2_VL, "'", "''");
			RST3_VL = CTr.Replace(RST3_VL, "'", "''");
			RST4_VL = CTr.Replace(RST4_VL, "'", "''");
			RST5_VL = CTr.Replace(RST5_VL, "'", "''");
			RST6_VL = CTr.Replace(RST6_VL, "'", "''");
			RST7_VL = CTr.Replace(RST7_VL, "'", "''");
			RSTT_VL = CTr.Replace(RSTT_VL, "'", "''");
			RSLT_TX = CTr.Replace(RSLT_TX, "'", "''");
			DOCT_CD = CTr.Replace(DOCT_CD, "'", "''");
			PANJ_YN = CTr.Replace(PANJ_YN, "'", "''");
			ID = CTr.Replace(ID, "'", "''");

			sql = "INSERT INTO ET_JOBSTRESS_SIMPLE (EJS_EXAM_DT, EJS_EXAM_SQ, EJS_QST1_1VL, EJS_QST1_2VL, EJS_QST1_3VL, EJS_QST1_4VL, EJS_QST2_5VL, EJS_QST2_6VL, EJS_QST2_7VL, EJS_QST2_8VL, EJS_QST3_9VL, EJS_QST3_10VL, EJS_QST3_11VL, EJS_QST4_12VL, EJS_QST4_13VL, EJS_QST5_14VL, EJS_QST5_15VL, EJS_QST5_16VL, EJS_QST5_17VL, EJS_QST6_18VL, EJS_QST6_19VL, EJS_QST6_20VL, EJS_QST7_21VL, EJS_QST7_22VL, EJS_QST7_23VL, EJS_QST7_24VL, EJS_PANJ_DT, EJS_RST1_VL, EJS_RST2_VL, EJS_RST3_VL, EJS_RST4_VL, EJS_RST5_VL, EJS_RST6_VL, EJS_RST7_VL, EJS_RSTT_VL, EJS_RSLT_TX, EJS_DOCT_CD, EJS_PANJ_YN, EJS_INPT_ID, EJS_INPT_DTT) VALUES (";
			sql += "  '" + EXAM_DT + "'";
			sql += ", '" + EXAM_SQ + "'";
			sql += ", '" + QST1_1VL + "'";
			sql += ", '" + QST1_2VL + "'";
			sql += ", '" + QST1_3VL + "'";
			sql += ", '" + QST1_4VL + "'";
			sql += ", '" + QST2_5VL + "'";
			sql += ", '" + QST2_6VL + "'";
			sql += ", '" + QST2_7VL + "'";
			sql += ", '" + QST2_8VL + "'";
			sql += ", '" + QST3_9VL + "'";
			sql += ", '" + QST3_10VL + "'";
			sql += ", '" + QST3_11VL + "'";
			sql += ", '" + QST4_12VL + "'";
			sql += ", '" + QST4_13VL + "'";
			sql += ", '" + QST5_14VL + "'";
			sql += ", '" + QST5_15VL + "'";
			sql += ", '" + QST5_16VL + "'";
			sql += ", '" + QST5_17VL + "'";
			sql += ", '" + QST6_18VL + "'";
			sql += ", '" + QST6_19VL + "'";
			sql += ", '" + QST6_20VL + "'";
			sql += ", '" + QST7_21VL + "'";
			sql += ", '" + QST7_22VL + "'";
			sql += ", '" + QST7_23VL + "'";
			sql += ", '" + QST7_24VL + "'";
			sql += ", '" + PANJ_DT + "'";
			sql += ", '" + RST1_VL + "'";
			sql += ", '" + RST2_VL + "'";
			sql += ", '" + RST3_VL + "'";
			sql += ", '" + RST4_VL + "'";
			sql += ", '" + RST5_VL + "'";
			sql += ", '" + RST6_VL + "'";
			sql += ", '" + RST7_VL + "'";
			sql += ", '" + RSTT_VL + "'";
			sql += ", '" + RSLT_TX + "'";
			sql += ", '" + DOCT_CD + "'";
			sql += ", '" + PANJ_YN + "'";
			sql += ", '" + ID + "'";
			sql += ", SYSDATE";
			sql += ")";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
