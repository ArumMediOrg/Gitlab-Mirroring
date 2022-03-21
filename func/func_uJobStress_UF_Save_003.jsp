<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uJobStress_UF_Save_003(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String QST1_1VL = (String) argHtMethod.get("QST1_1VL");
			String QST1_2VL = (String) argHtMethod.get("QST1_2VL");
			String QST1_3VL = (String) argHtMethod.get("QST1_3VL");
			String QST2_4VL = (String) argHtMethod.get("QST2_4VL");
			String QST2_5VL = (String) argHtMethod.get("QST2_5VL");
			String QST2_6VL = (String) argHtMethod.get("QST2_6VL");
			String QST2_7VL = (String) argHtMethod.get("QST2_7VL");
			String QST2_8VL = (String) argHtMethod.get("QST2_8VL");
			String QST2_9VL = (String) argHtMethod.get("QST2_9VL");
			String QST2_10VL = (String) argHtMethod.get("QST2_10VL");
			String QST2_11VL = (String) argHtMethod.get("QST2_11VL");
			String QST3_12VL = (String) argHtMethod.get("QST3_12VL");
			String QST3_13VL = (String) argHtMethod.get("QST3_13VL");
			String QST3_14VL = (String) argHtMethod.get("QST3_14VL");
			String QST3_15VL = (String) argHtMethod.get("QST3_15VL");
			String QST3_16VL = (String) argHtMethod.get("QST3_16VL");
			String QST4_17VL = (String) argHtMethod.get("QST4_17VL");
			String QST4_18VL = (String) argHtMethod.get("QST4_18VL");
			String QST4_19VL = (String) argHtMethod.get("QST4_19VL");
			String QST4_20VL = (String) argHtMethod.get("QST4_20VL");
			String QST5_21VL = (String) argHtMethod.get("QST5_21VL");
			String QST5_22VL = (String) argHtMethod.get("QST5_22VL");
			String QST5_23VL = (String) argHtMethod.get("QST5_23VL");
			String QST5_24VL = (String) argHtMethod.get("QST5_24VL");
			String QST5_25VL = (String) argHtMethod.get("QST5_25VL");
			String QST5_26VL = (String) argHtMethod.get("QST5_26VL");
			String QST6_27VL = (String) argHtMethod.get("QST6_27VL");
			String QST6_28VL = (String) argHtMethod.get("QST6_28VL");
			String QST6_29VL = (String) argHtMethod.get("QST6_29VL");
			String QST6_30VL = (String) argHtMethod.get("QST6_30VL");
			String QST6_31VL = (String) argHtMethod.get("QST6_31VL");
			String QST6_32VL = (String) argHtMethod.get("QST6_32VL");
			String QST6_33VL = (String) argHtMethod.get("QST6_33VL");
			String QST7_34VL = (String) argHtMethod.get("QST7_34VL");
			String QST7_35VL = (String) argHtMethod.get("QST7_35VL");
			String QST7_36VL = (String) argHtMethod.get("QST7_36VL");
			String QST7_37VL = (String) argHtMethod.get("QST7_37VL");
			String QST7_38VL = (String) argHtMethod.get("QST7_38VL");
			String QST7_39VL = (String) argHtMethod.get("QST7_39VL");
			String QST8_40VL = (String) argHtMethod.get("QST8_40VL");
			String QST8_41VL = (String) argHtMethod.get("QST8_41VL");
			String QST8_42VL = (String) argHtMethod.get("QST8_42VL");
			String QST8_43VL = (String) argHtMethod.get("QST8_43VL");
			String RST1_VL = (String) argHtMethod.get("RST1_VL");
			String RST2_VL = (String) argHtMethod.get("RST2_VL");
			String RST3_VL = (String) argHtMethod.get("RST3_VL");
			String RST4_VL = (String) argHtMethod.get("RST4_VL");
			String RST5_VL = (String) argHtMethod.get("RST5_VL");
			String RST6_VL = (String) argHtMethod.get("RST6_VL");
			String RST7_VL = (String) argHtMethod.get("RST7_VL");
			String RST8_VL = (String) argHtMethod.get("RST8_VL");
			String RSTT_VL = (String) argHtMethod.get("RSTT_VL");
			String RSLT_TX = (String) argHtMethod.get("RSLT_TX");
			String PANJ_DT = (String) argHtMethod.get("PANJ_DT");
			String DOCT_CD = (String) argHtMethod.get("DOCT_CD");
			String PANJ_YN = (String) argHtMethod.get("PANJ_YN");
			String MODI_ID = (String) argHtMethod.get("MODI_ID");
			String EXAM_DT = (String) argHtMethod.get("EXAM_DT");
			String EXAM_SQ = (String) argHtMethod.get("EXAM_SQ");

			//
			if(QST1_1VL == null) { QST1_1VL = ""; }
			if(QST1_2VL == null) { QST1_2VL = ""; }
			if(QST1_3VL == null) { QST1_3VL = ""; }
			if(QST2_4VL == null) { QST2_4VL = ""; }
			if(QST2_5VL == null) { QST2_5VL = ""; }
			if(QST2_6VL == null) { QST2_6VL = ""; }
			if(QST2_7VL == null) { QST2_7VL = ""; }
			if(QST2_8VL == null) { QST2_8VL = ""; }
			if(QST2_9VL == null) { QST2_9VL = ""; }
			if(QST2_10VL == null) { QST2_10VL = ""; }
			if(QST2_11VL == null) { QST2_11VL = ""; }
			if(QST3_12VL == null) { QST3_12VL = ""; }
			if(QST3_13VL == null) { QST3_13VL = ""; }
			if(QST3_14VL == null) { QST3_14VL = ""; }
			if(QST3_15VL == null) { QST3_15VL = ""; }
			if(QST3_16VL == null) { QST3_16VL = ""; }
			if(QST4_17VL == null) { QST4_17VL = ""; }
			if(QST4_18VL == null) { QST4_18VL = ""; }
			if(QST4_19VL == null) { QST4_19VL = ""; }
			if(QST4_20VL == null) { QST4_20VL = ""; }
			if(QST5_21VL == null) { QST5_21VL = ""; }
			if(QST5_22VL == null) { QST5_22VL = ""; }
			if(QST5_23VL == null) { QST5_23VL = ""; }
			if(QST5_24VL == null) { QST5_24VL = ""; }
			if(QST5_25VL == null) { QST5_25VL = ""; }
			if(QST5_26VL == null) { QST5_26VL = ""; }
			if(QST6_27VL == null) { QST6_27VL = ""; }
			if(QST6_28VL == null) { QST6_28VL = ""; }
			if(QST6_29VL == null) { QST6_29VL = ""; }
			if(QST6_30VL == null) { QST6_30VL = ""; }
			if(QST6_31VL == null) { QST6_31VL = ""; }
			if(QST6_32VL == null) { QST6_32VL = ""; }
			if(QST6_33VL == null) { QST6_33VL = ""; }
			if(QST7_34VL == null) { QST7_34VL = ""; }
			if(QST7_35VL == null) { QST7_35VL = ""; }
			if(QST7_36VL == null) { QST7_36VL = ""; }
			if(QST7_37VL == null) { QST7_37VL = ""; }
			if(QST7_38VL == null) { QST7_38VL = ""; }
			if(QST7_39VL == null) { QST7_39VL = ""; }
			if(QST8_40VL == null) { QST8_40VL = ""; }
			if(QST8_41VL == null) { QST8_41VL = ""; }
			if(QST8_42VL == null) { QST8_42VL = ""; }
			if(QST8_43VL == null) { QST8_43VL = ""; }
			if(RST1_VL == null) { RST1_VL = ""; }
			if(RST2_VL == null) { RST2_VL = ""; }
			if(RST3_VL == null) { RST3_VL = ""; }
			if(RST4_VL == null) { RST4_VL = ""; }
			if(RST5_VL == null) { RST5_VL = ""; }
			if(RST6_VL == null) { RST6_VL = ""; }
			if(RST7_VL == null) { RST7_VL = ""; }
			if(RST8_VL == null) { RST8_VL = ""; }
			if(RSTT_VL == null) { RSTT_VL = ""; }
			if(RSLT_TX == null) { RSLT_TX = ""; }
			if(PANJ_DT == null) { PANJ_DT = ""; }
			if(DOCT_CD == null) { DOCT_CD = ""; }
			if(PANJ_YN == null) { PANJ_YN = ""; }
			if(MODI_ID == null) { MODI_ID = ""; }
			if(EXAM_DT == null) { EXAM_DT = ""; }
			if(EXAM_SQ == null) { EXAM_SQ = ""; }

			//
			QST1_1VL = CTr.Replace(QST1_1VL, "'", "''");
			QST1_2VL = CTr.Replace(QST1_2VL, "'", "''");
			QST1_3VL = CTr.Replace(QST1_3VL, "'", "''");
			QST2_4VL = CTr.Replace(QST2_4VL, "'", "''");
			QST2_5VL = CTr.Replace(QST2_5VL, "'", "''");
			QST2_6VL = CTr.Replace(QST2_6VL, "'", "''");
			QST2_7VL = CTr.Replace(QST2_7VL, "'", "''");
			QST2_8VL = CTr.Replace(QST2_8VL, "'", "''");
			QST2_9VL = CTr.Replace(QST2_9VL, "'", "''");
			QST2_10VL = CTr.Replace(QST2_10VL, "'", "''");
			QST2_11VL = CTr.Replace(QST2_11VL, "'", "''");
			QST3_12VL = CTr.Replace(QST3_12VL, "'", "''");
			QST3_13VL = CTr.Replace(QST3_13VL, "'", "''");
			QST3_14VL = CTr.Replace(QST3_14VL, "'", "''");
			QST3_15VL = CTr.Replace(QST3_15VL, "'", "''");
			QST3_16VL = CTr.Replace(QST3_16VL, "'", "''");
			QST4_17VL = CTr.Replace(QST4_17VL, "'", "''");
			QST4_18VL = CTr.Replace(QST4_18VL, "'", "''");
			QST4_19VL = CTr.Replace(QST4_19VL, "'", "''");
			QST4_20VL = CTr.Replace(QST4_20VL, "'", "''");
			QST5_21VL = CTr.Replace(QST5_21VL, "'", "''");
			QST5_22VL = CTr.Replace(QST5_22VL, "'", "''");
			QST5_23VL = CTr.Replace(QST5_23VL, "'", "''");
			QST5_24VL = CTr.Replace(QST5_24VL, "'", "''");
			QST5_25VL = CTr.Replace(QST5_25VL, "'", "''");
			QST5_26VL = CTr.Replace(QST5_26VL, "'", "''");
			QST6_27VL = CTr.Replace(QST6_27VL, "'", "''");
			QST6_28VL = CTr.Replace(QST6_28VL, "'", "''");
			QST6_29VL = CTr.Replace(QST6_29VL, "'", "''");
			QST6_30VL = CTr.Replace(QST6_30VL, "'", "''");
			QST6_31VL = CTr.Replace(QST6_31VL, "'", "''");
			QST6_32VL = CTr.Replace(QST6_32VL, "'", "''");
			QST6_33VL = CTr.Replace(QST6_33VL, "'", "''");
			QST7_34VL = CTr.Replace(QST7_34VL, "'", "''");
			QST7_35VL = CTr.Replace(QST7_35VL, "'", "''");
			QST7_36VL = CTr.Replace(QST7_36VL, "'", "''");
			QST7_37VL = CTr.Replace(QST7_37VL, "'", "''");
			QST7_38VL = CTr.Replace(QST7_38VL, "'", "''");
			QST7_39VL = CTr.Replace(QST7_39VL, "'", "''");
			QST8_40VL = CTr.Replace(QST8_40VL, "'", "''");
			QST8_41VL = CTr.Replace(QST8_41VL, "'", "''");
			QST8_42VL = CTr.Replace(QST8_42VL, "'", "''");
			QST8_43VL = CTr.Replace(QST8_43VL, "'", "''");
			RST1_VL = CTr.Replace(RST1_VL, "'", "''");
			RST2_VL = CTr.Replace(RST2_VL, "'", "''");
			RST3_VL = CTr.Replace(RST3_VL, "'", "''");
			RST4_VL = CTr.Replace(RST4_VL, "'", "''");
			RST5_VL = CTr.Replace(RST5_VL, "'", "''");
			RST6_VL = CTr.Replace(RST6_VL, "'", "''");
			RST7_VL = CTr.Replace(RST7_VL, "'", "''");
			RST8_VL = CTr.Replace(RST8_VL, "'", "''");
			RSTT_VL = CTr.Replace(RSTT_VL, "'", "''");
			RSLT_TX = CTr.Replace(RSLT_TX, "'", "''");
			PANJ_DT = CTr.Replace(PANJ_DT, "'", "''");
			DOCT_CD = CTr.Replace(DOCT_CD, "'", "''");
			PANJ_YN = CTr.Replace(PANJ_YN, "'", "''");
			MODI_ID = CTr.Replace(MODI_ID, "'", "''");
			EXAM_DT = CTr.Replace(EXAM_DT, "'", "''");
			EXAM_SQ = CTr.Replace(EXAM_SQ, "'", "''");

			sql = "UPDATE ET_JOBSTRESS SET ";
			sql += "  EJS_QST1_1VL = '" + QST1_1VL + "'";
			sql += ", EJS_QST1_2VL = '" + QST1_2VL + "'";
			sql += ", EJS_QST1_3VL = '" + QST1_3VL + "'";
			sql += ", EJS_QST2_4VL = '" + QST2_4VL + "'";
			sql += ", EJS_QST2_5VL = '" + QST2_5VL + "'";
			sql += ", EJS_QST2_6VL = '" + QST2_6VL + "'";
			sql += ", EJS_QST2_7VL = '" + QST2_7VL + "'";
			sql += ", EJS_QST2_8VL = '" + QST2_8VL + "'";
			sql += ", EJS_QST2_9VL = '" + QST2_9VL + "'";
			sql += ", EJS_QST2_10VL = '" + QST2_10VL + "'";
			sql += ", EJS_QST2_11VL = '" + QST2_11VL + "'";
			sql += ", EJS_QST3_12VL = '" + QST3_12VL + "'";
			sql += ", EJS_QST3_13VL = '" + QST3_13VL + "'";
			sql += ", EJS_QST3_14VL = '" + QST3_14VL + "'";
			sql += ", EJS_QST3_15VL = '" + QST3_15VL + "'";
			sql += ", EJS_QST3_16VL = '" + QST3_16VL + "'";
			sql += ", EJS_QST4_17VL = '" + QST4_17VL + "'";
			sql += ", EJS_QST4_18VL = '" + QST4_18VL + "'";
			sql += ", EJS_QST4_19VL = '" + QST4_19VL + "'";
			sql += ", EJS_QST4_20VL = '" + QST4_20VL + "'";
			sql += ", EJS_QST5_21VL = '" + QST5_21VL + "'";
			sql += ", EJS_QST5_22VL = '" + QST5_22VL + "'";
			sql += ", EJS_QST5_23VL = '" + QST5_23VL + "'";
			sql += ", EJS_QST5_24VL = '" + QST5_24VL + "'";
			sql += ", EJS_QST5_25VL = '" + QST5_25VL + "'";
			sql += ", EJS_QST5_26VL = '" + QST5_26VL + "'";
			sql += ", EJS_QST6_27VL = '" + QST6_27VL + "'";
			sql += ", EJS_QST6_28VL = '" + QST6_28VL + "'";
			sql += ", EJS_QST6_29VL = '" + QST6_29VL + "'";
			sql += ", EJS_QST6_30VL = '" + QST6_30VL + "'";
			sql += ", EJS_QST6_31VL = '" + QST6_31VL + "'";
			sql += ", EJS_QST6_32VL = '" + QST6_32VL + "'";
			sql += ", EJS_QST6_33VL = '" + QST6_33VL + "'";
			sql += ", EJS_QST7_34VL = '" + QST7_34VL + "'";
			sql += ", EJS_QST7_35VL = '" + QST7_35VL + "'";
			sql += ", EJS_QST7_36VL = '" + QST7_36VL + "'";
			sql += ", EJS_QST7_37VL = '" + QST7_37VL + "'";
			sql += ", EJS_QST7_38VL = '" + QST7_38VL + "'";
			sql += ", EJS_QST7_39VL = '" + QST7_39VL + "'";
			sql += ", EJS_QST8_40VL = '" + QST8_40VL + "'";
			sql += ", EJS_QST8_41VL = '" + QST8_41VL + "'";
			sql += ", EJS_QST8_42VL = '" + QST8_42VL + "'";
			sql += ", EJS_QST8_43VL = '" + QST8_43VL + "'";
			sql += ", EJS_RST1_VL = '" + RST1_VL + "'";
			sql += ", EJS_RST2_VL = '" + RST2_VL + "'";
			sql += ", EJS_RST3_VL = '" + RST3_VL + "'";
			sql += ", EJS_RST4_VL = '" + RST4_VL + "'";
			sql += ", EJS_RST5_VL = '" + RST5_VL + "'";
			sql += ", EJS_RST6_VL = '" + RST6_VL + "'";
			sql += ", EJS_RST7_VL = '" + RST7_VL + "'";
			sql += ", EJS_RST8_VL = '" + RST8_VL + "'";
			sql += ", EJS_RSTT_VL = '" + RSTT_VL + "'";
			sql += ", EJS_RSLT_TX = '" + RSLT_TX + "'";
			sql += ", EJS_PANJ_DT = '" + PANJ_DT + "'";
			sql += ", EJS_DOCT_CD = '" + DOCT_CD + "'";
			sql += ", EJS_PANJ_YN = '" + PANJ_YN + "'";
			sql += ", EJS_MODI_ID = '" + MODI_ID + "'";
			sql += ", EJS_MODI_DTT = SYSDATE";
			sql += " WHERE EJS_EXAM_DT = '" + EXAM_DT + "'";
			sql += " AND EJS_EXAM_SQ = '" + EXAM_SQ + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
