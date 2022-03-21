<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uEmotional_Labor_UF_Save_002(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String ISEMPTY = (String) argHtMethod.get("ISEMPTY");
			String EXAM_DT = (String) argHtMethod.get("EXAM_DT");
			String EXAM_SQ = (String) argHtMethod.get("EXAM_SQ");
			String QST1_1VL = (String) argHtMethod.get("QST1_1VL");
			String QST1_2VL = (String) argHtMethod.get("QST1_2VL");
			String QST1_3VL = (String) argHtMethod.get("QST1_3VL");
			String QST1_4VL = (String) argHtMethod.get("QST1_4VL");
			String QST1_5VL = (String) argHtMethod.get("QST1_5VL");
			String QST1_6VL = (String) argHtMethod.get("QST1_6VL");
			String QST1_7VL = (String) argHtMethod.get("QST1_7VL");
			String QST1_8VL = (String) argHtMethod.get("QST1_8VL");
			String QST1_9VL = (String) argHtMethod.get("QST1_9VL");
			String QST1_10VL = (String) argHtMethod.get("QST1_10VL");
			String QST1_11VL = (String) argHtMethod.get("QST1_11VL");
			String QST1_12VL = (String) argHtMethod.get("QST1_12VL");
			String QST1_13VL = (String) argHtMethod.get("QST1_13VL");
			String QST1_14VL = (String) argHtMethod.get("QST1_14VL");
			String QST1_15VL = (String) argHtMethod.get("QST1_15VL");
			String QST1_16VL = (String) argHtMethod.get("QST1_16VL");
			String QST1_17VL = (String) argHtMethod.get("QST1_17VL");
			String QST1_18VL = (String) argHtMethod.get("QST1_18VL");
			String QST1_19VL = (String) argHtMethod.get("QST1_19VL");
			String QST1_20VL = (String) argHtMethod.get("QST1_20VL");
			String QST1_21VL = (String) argHtMethod.get("QST1_21VL");
			String QST1_22VL = (String) argHtMethod.get("QST1_22VL");
			String QST1_23VL = (String) argHtMethod.get("QST1_23VL");
			String QST1_24VL = (String) argHtMethod.get("QST1_24VL");
			String PANJ_DT = (String) argHtMethod.get("PANJ_DT");
			String RST1_VL = (String) argHtMethod.get("RST1_VL");
			String RST2_VL = (String) argHtMethod.get("RST2_VL");
			String RST3_VL = (String) argHtMethod.get("RST3_VL");
			String RST4_VL = (String) argHtMethod.get("RST4_VL");
			String RST5_VL = (String) argHtMethod.get("RST5_VL");
			String RSLT_TX = (String) argHtMethod.get("RSLT_TX");
			String DOCT_CD = (String) argHtMethod.get("DOCT_CD");
			String PANJ_YN = (String) argHtMethod.get("PANJ_YN");
			String INPUT_ID = (String) argHtMethod.get("INPUT_ID");

			//
			if(ISEMPTY == null) { ISEMPTY = ""; }
			if(EXAM_DT == null) { EXAM_DT = ""; }
			if(EXAM_SQ == null) { EXAM_SQ = ""; }
			if(QST1_1VL == null) { QST1_1VL = ""; }
			if(QST1_2VL == null) { QST1_2VL = ""; }
			if(QST1_3VL == null) { QST1_3VL = ""; }
			if(QST1_4VL == null) { QST1_4VL = ""; }
			if(QST1_5VL == null) { QST1_5VL = ""; }
			if(QST1_6VL == null) { QST1_6VL = ""; }
			if(QST1_7VL == null) { QST1_7VL = ""; }
			if(QST1_8VL == null) { QST1_8VL = ""; }
			if(QST1_9VL == null) { QST1_9VL = ""; }
			if(QST1_10VL == null) { QST1_10VL = ""; }
			if(QST1_11VL == null) { QST1_11VL = ""; }
			if(QST1_12VL == null) { QST1_12VL = ""; }
			if(QST1_13VL == null) { QST1_13VL = ""; }
			if(QST1_14VL == null) { QST1_14VL = ""; }
			if(QST1_15VL == null) { QST1_15VL = ""; }
			if(QST1_16VL == null) { QST1_16VL = ""; }
			if(QST1_17VL == null) { QST1_17VL = ""; }
			if(QST1_18VL == null) { QST1_18VL = ""; }
			if(QST1_19VL == null) { QST1_19VL = ""; }
			if(QST1_20VL == null) { QST1_20VL = ""; }
			if(QST1_21VL == null) { QST1_21VL = ""; }
			if(QST1_22VL == null) { QST1_22VL = ""; }
			if(QST1_23VL == null) { QST1_23VL = ""; }
			if(QST1_24VL == null) { QST1_24VL = ""; }
			if(PANJ_DT == null) { PANJ_DT = ""; }
			if(RST1_VL == null) { RST1_VL = ""; }
			if(RST2_VL == null) { RST2_VL = ""; }
			if(RST3_VL == null) { RST3_VL = ""; }
			if(RST4_VL == null) { RST4_VL = ""; }
			if(RST5_VL == null) { RST5_VL = ""; }
			if(RSLT_TX == null) { RSLT_TX = ""; }
			if(DOCT_CD == null) { DOCT_CD = ""; }
			if(PANJ_YN == null) { PANJ_YN = ""; }
			if(INPUT_ID == null) { INPUT_ID = ""; }

			//
			ISEMPTY = CTr.Replace(ISEMPTY, "'", "''");
			EXAM_DT = CTr.Replace(EXAM_DT, "'", "''");
			EXAM_SQ = CTr.Replace(EXAM_SQ, "'", "''");
			QST1_1VL = CTr.Replace(QST1_1VL, "'", "''");
			QST1_2VL = CTr.Replace(QST1_2VL, "'", "''");
			QST1_3VL = CTr.Replace(QST1_3VL, "'", "''");
			QST1_4VL = CTr.Replace(QST1_4VL, "'", "''");
			QST1_5VL = CTr.Replace(QST1_5VL, "'", "''");
			QST1_6VL = CTr.Replace(QST1_6VL, "'", "''");
			QST1_7VL = CTr.Replace(QST1_7VL, "'", "''");
			QST1_8VL = CTr.Replace(QST1_8VL, "'", "''");
			QST1_9VL = CTr.Replace(QST1_9VL, "'", "''");
			QST1_10VL = CTr.Replace(QST1_10VL, "'", "''");
			QST1_11VL = CTr.Replace(QST1_11VL, "'", "''");
			QST1_12VL = CTr.Replace(QST1_12VL, "'", "''");
			QST1_13VL = CTr.Replace(QST1_13VL, "'", "''");
			QST1_14VL = CTr.Replace(QST1_14VL, "'", "''");
			QST1_15VL = CTr.Replace(QST1_15VL, "'", "''");
			QST1_16VL = CTr.Replace(QST1_16VL, "'", "''");
			QST1_17VL = CTr.Replace(QST1_17VL, "'", "''");
			QST1_18VL = CTr.Replace(QST1_18VL, "'", "''");
			QST1_19VL = CTr.Replace(QST1_19VL, "'", "''");
			QST1_20VL = CTr.Replace(QST1_20VL, "'", "''");
			QST1_21VL = CTr.Replace(QST1_21VL, "'", "''");
			QST1_22VL = CTr.Replace(QST1_22VL, "'", "''");
			QST1_23VL = CTr.Replace(QST1_23VL, "'", "''");
			QST1_24VL = CTr.Replace(QST1_24VL, "'", "''");
			PANJ_DT = CTr.Replace(PANJ_DT, "'", "''");
			RST1_VL = CTr.Replace(RST1_VL, "'", "''");
			RST2_VL = CTr.Replace(RST2_VL, "'", "''");
			RST3_VL = CTr.Replace(RST3_VL, "'", "''");
			RST4_VL = CTr.Replace(RST4_VL, "'", "''");
			RST5_VL = CTr.Replace(RST5_VL, "'", "''");
			RSLT_TX = CTr.Replace(RSLT_TX, "'", "''");
			DOCT_CD = CTr.Replace(DOCT_CD, "'", "''");
			PANJ_YN = CTr.Replace(PANJ_YN, "'", "''");
			INPUT_ID = CTr.Replace(INPUT_ID, "'", "''");

			if(!ISEMPTY.equals("")) {
				sql = "INSERT INTO ET_EMOTIONAL_LABOR (EEL_EXAM_DT, EEL_EXAM_SQ, EEL_QST1_1VL, EEL_QST1_2VL, EEL_QST1_3VL, EEL_QST1_4VL, EEL_QST1_5VL, EEL_QST1_6VL, EEL_QST1_7VL, EEL_QST1_8VL, EEL_QST1_9VL, EEL_QST1_10VL, EEL_QST1_11VL, EEL_QST1_12VL, EEL_QST1_13VL, EEL_QST1_14VL, EEL_QST1_15VL, EEL_QST1_16VL, EEL_QST1_17VL, EEL_QST1_18VL, EEL_QST1_19VL, EEL_QST1_20VL, EEL_QST1_21VL, EEL_QST1_22VL, EEL_QST1_23VL, EEL_QST1_24VL, EEL_PANJ_DT, EEL_RST1_VL, EEL_RST2_VL, EEL_RST3_VL, EEL_RST4_VL, EEL_RST5_VL, EEL_RSLT_TX, EEL_DOCT_CD, EEL_PANJ_YN, EEL_INPUT_ID, EEL_INPUT_DTT) VALUES (";
				sql += "  '" + EXAM_DT + "'";
				sql += ", '" + EXAM_SQ + "'";
				sql += ", '" + QST1_1VL + "'";
				sql += ", '" + QST1_2VL + "'";
				sql += ", '" + QST1_3VL + "'";
				sql += ", '" + QST1_4VL + "'";
				sql += ", '" + QST1_5VL + "'";
				sql += ", '" + QST1_6VL + "'";
				sql += ", '" + QST1_7VL + "'";
				sql += ", '" + QST1_8VL + "'";
				sql += ", '" + QST1_9VL + "'";
				sql += ", '" + QST1_10VL + "'";
				sql += ", '" + QST1_11VL + "'";
				sql += ", '" + QST1_12VL + "'";
				sql += ", '" + QST1_13VL + "'";
				sql += ", '" + QST1_14VL + "'";
				sql += ", '" + QST1_15VL + "'";
				sql += ", '" + QST1_16VL + "'";
				sql += ", '" + QST1_17VL + "'";
				sql += ", '" + QST1_18VL + "'";
				sql += ", '" + QST1_19VL + "'";
				sql += ", '" + QST1_20VL + "'";
				sql += ", '" + QST1_21VL + "'";
				sql += ", '" + QST1_22VL + "'";
				sql += ", '" + QST1_23VL + "'";
				sql += ", '" + QST1_24VL + "'";
				sql += ", '" + PANJ_DT + "'";
				sql += ", '" + RST1_VL + "'";
				sql += ", '" + RST2_VL + "'";
				sql += ", '" + RST3_VL + "'";
				sql += ", '" + RST4_VL + "'";
				sql += ", '" + RST5_VL + "'";
				sql += ", '" + RSLT_TX + "'";
				sql += ", '" + DOCT_CD + "'";
				sql += ", '" + PANJ_YN + "'";
				sql += ", '" + INPUT_ID + "'";
				sql += ", SYSDATE";
				sql += ")";

				argStmtExec.executeUpdate(sql);

			} else {
				sql = "UPDATE ET_EMOTIONAL_LABOR SET ";
				sql += "  EEL_QST1_1VL = '" + QST1_1VL + "'";
				sql += ", EEL_QST1_2VL = '" + QST1_2VL + "'";
				sql += ", EEL_QST1_3VL = '" + QST1_3VL + "'";
				sql += ", EEL_QST1_4VL = '" + QST1_4VL + "'";
				sql += ", EEL_QST1_5VL = '" + QST1_5VL + "'";
				sql += ", EEL_QST1_6VL = '" + QST1_6VL + "'";
				sql += ", EEL_QST1_7VL = '" + QST1_7VL + "'";
				sql += ", EEL_QST1_8VL = '" + QST1_8VL + "'";
				sql += ", EEL_QST1_9VL = '" + QST1_9VL + "'";
				sql += ", EEL_QST1_10VL = '" + QST1_10VL + "'";
				sql += ", EEL_QST1_11VL = '" + QST1_11VL + "'";
				sql += ", EEL_QST1_12VL = '" + QST1_12VL + "'";
				sql += ", EEL_QST1_13VL = '" + QST1_13VL + "'";
				sql += ", EEL_QST1_14VL = '" + QST1_14VL + "'";
				sql += ", EEL_QST1_15VL = '" + QST1_15VL + "'";
				sql += ", EEL_QST1_16VL = '" + QST1_16VL + "'";
				sql += ", EEL_QST1_17VL = '" + QST1_17VL + "'";
				sql += ", EEL_QST1_18VL = '" + QST1_18VL + "'";
				sql += ", EEL_QST1_19VL = '" + QST1_19VL + "'";
				sql += ", EEL_QST1_20VL = '" + QST1_20VL + "'";
				sql += ", EEL_QST1_21VL = '" + QST1_21VL + "'";
				sql += ", EEL_QST1_22VL = '" + QST1_22VL + "'";
				sql += ", EEL_QST1_23VL = '" + QST1_23VL + "'";
				sql += ", EEL_QST1_24VL = '" + QST1_24VL + "'";
				sql += ", EEL_RST1_VL = '" + RST1_VL + "'";
				sql += ", EEL_RST2_VL = '" + RST2_VL + "'";
				sql += ", EEL_RST3_VL = '" + RST3_VL + "'";
				sql += ", EEL_RST4_VL = '" + RST4_VL + "'";
				sql += ", EEL_RST5_VL = '" + RST5_VL + "'";
				sql += ", EEL_RSLT_TX = '" + RSLT_TX + "'";
				sql += ", EEL_PANJ_DT = '" + PANJ_DT + "'";
				sql += ", EEL_DOCT_CD = '" + DOCT_CD + "'";
				sql += ", EEL_PANJ_YN = '" + PANJ_YN + "'";
				sql += ", EEL_INPUT_ID = '" + INPUT_ID + "'";
				sql += ", EEL_INPUT_DTT = SYSDATE";
				sql += " WHERE EEL_EXAM_DT = '" + EXAM_DT + "'";
				sql += " AND EEL_EXAM_SQ = '" + EXAM_SQ + "'";	

				argStmtExec.executeUpdate(sql);

			}
		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
