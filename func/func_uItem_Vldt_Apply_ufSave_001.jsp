<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uItem_Vldt_Apply_ufSave_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String SMODE = (String) argHtMethod.get("SMODE");
			String IIV_APLY_DT = (String) argHtMethod.get("IIV_APLY_DT");
			String IIV_ITEM_CD = (String) argHtMethod.get("IIV_ITEM_CD");
			String IIV_SEX_CD = (String) argHtMethod.get("IIV_SEX_CD");
			String IIV_AGE_FR = (String) argHtMethod.get("IIV_AGE_FR");
			String IIV_AGE_TO = (String) argHtMethod.get("IIV_AGE_TO");
			String IIV_EXAM_CD = (String) argHtMethod.get("IIV_EXAM_CD");
			String IIV_DOCT_ID = (String) argHtMethod.get("IIV_DOCT_ID");
			String IIV_LOW_KD = (String) argHtMethod.get("IIV_LOW_KD");
			String IIV_RSLT_LOW = (String) argHtMethod.get("IIV_RSLT_LOW");
			String IIV_HIGH_KD = (String) argHtMethod.get("IIV_HIGH_KD");
			String IIV_RSLT_HIGH = (String) argHtMethod.get("IIV_RSLT_HIGH");
			String IIV_TREF_CD = (String) argHtMethod.get("IIV_TREF_CD");
			String IIV_RSLT_UNIT = (String) argHtMethod.get("IIV_RSLT_UNIT");
			String IIV_RSPT_CNT = (String) argHtMethod.get("IIV_RSPT_CNT");
			String IIV_RSZR_KD = (String) argHtMethod.get("IIV_RSZR_KD");
			String IIV_PANJ_CD = (String) argHtMethod.get("IIV_PANJ_CD");
			String IIV_CHAR_VAL = (String) argHtMethod.get("IIV_CHAR_VAL");
			String IIV_SPCV_CD = (String) argHtMethod.get("IIV_SPCV_CD");
			String IIV_USE_YN = (String) argHtMethod.get("IIV_USE_YN");
			String IIV_INPT_ID = (String) argHtMethod.get("IIV_INPT_ID");

			//
			if(SMODE == null) { SMODE = ""; }
			if(IIV_APLY_DT == null) { IIV_APLY_DT = ""; }
			if(IIV_ITEM_CD == null) { IIV_ITEM_CD = ""; }
			if(IIV_SEX_CD == null) { IIV_SEX_CD = ""; }
			if(IIV_AGE_FR == null) { IIV_AGE_FR = ""; }
			if(IIV_AGE_TO == null) { IIV_AGE_TO = ""; }
			if(IIV_EXAM_CD == null) { IIV_EXAM_CD = ""; }
			if(IIV_DOCT_ID == null) { IIV_DOCT_ID = ""; }
			if(IIV_LOW_KD == null) { IIV_LOW_KD = ""; }
			if(IIV_RSLT_LOW == null) { IIV_RSLT_LOW = ""; }
			if(IIV_HIGH_KD == null) { IIV_HIGH_KD = ""; }
			if(IIV_RSLT_HIGH == null) { IIV_RSLT_HIGH = ""; }
			if(IIV_TREF_CD == null) { IIV_TREF_CD = ""; }
			if(IIV_RSLT_UNIT == null) { IIV_RSLT_UNIT = ""; }
			if(IIV_RSPT_CNT == null) { IIV_RSPT_CNT = ""; }
			if(IIV_RSZR_KD == null) { IIV_RSZR_KD = ""; }
			if(IIV_PANJ_CD == null) { IIV_PANJ_CD = ""; }
			if(IIV_CHAR_VAL == null) { IIV_CHAR_VAL = ""; }
			if(IIV_SPCV_CD == null) { IIV_SPCV_CD = ""; }
			if(IIV_USE_YN == null) { IIV_USE_YN = ""; }
			if(IIV_INPT_ID == null) { IIV_INPT_ID = ""; }

			//
			SMODE = CTr.Replace(SMODE, "'", "''");
			IIV_APLY_DT = CTr.Replace(IIV_APLY_DT, "'", "''");
			IIV_ITEM_CD = CTr.Replace(IIV_ITEM_CD, "'", "''");
			IIV_SEX_CD = CTr.Replace(IIV_SEX_CD, "'", "''");
			IIV_AGE_FR = CTr.Replace(IIV_AGE_FR, "'", "''");
			IIV_AGE_TO = CTr.Replace(IIV_AGE_TO, "'", "''");
			IIV_EXAM_CD = CTr.Replace(IIV_EXAM_CD, "'", "''");
			IIV_DOCT_ID = CTr.Replace(IIV_DOCT_ID, "'", "''");
			IIV_LOW_KD = CTr.Replace(IIV_LOW_KD, "'", "''");
			IIV_RSLT_LOW = CTr.Replace(IIV_RSLT_LOW, "'", "''");
			IIV_HIGH_KD = CTr.Replace(IIV_HIGH_KD, "'", "''");
			IIV_RSLT_HIGH = CTr.Replace(IIV_RSLT_HIGH, "'", "''");
			IIV_TREF_CD = CTr.Replace(IIV_TREF_CD, "'", "''");
			IIV_RSLT_UNIT = CTr.Replace(IIV_RSLT_UNIT, "'", "''");
			IIV_RSPT_CNT = CTr.Replace(IIV_RSPT_CNT, "'", "''");
			IIV_RSZR_KD = CTr.Replace(IIV_RSZR_KD, "'", "''");
			IIV_PANJ_CD = CTr.Replace(IIV_PANJ_CD, "'", "''");
			IIV_CHAR_VAL = CTr.Replace(IIV_CHAR_VAL, "'", "''");
			IIV_SPCV_CD = CTr.Replace(IIV_SPCV_CD, "'", "''");
			IIV_USE_YN = CTr.Replace(IIV_USE_YN, "'", "''");
			IIV_INPT_ID = CTr.Replace(IIV_INPT_ID, "'", "''");

			if(SMODE.equals("INSERT")) {
			
				sql = "INSERT INTO IT_ITEM_VLDT ( IIV_APLY_DT , IIV_ITEM_CD , IIV_SEX_CD , IIV_AGE_FR , IIV_AGE_TO , IIV_EXAM_CD , IIV_DOCT_ID , IIV_LOW_KD , IIV_RSLT_LOW , IIV_HIGH_KD , IIV_RSLT_HIGH , IIV_TREF_CD , IIV_RSLT_UNIT , IIV_RSPT_CNT , IIV_RSZR_KD , IIV_PANJ_CD , IIV_CHAR_VAL , IIV_SPCV_CD , IIV_USE_YN , IIV_INPT_ID , IIV_INPT_DTT) VALUES (";
				sql += "  '" + IIV_APLY_DT + "'";
				sql += ", '" + IIV_ITEM_CD + "'";
				sql += ", '" + IIV_SEX_CD + "'";
				sql += ", '" + IIV_AGE_FR + "'";
				sql += ", '" + IIV_AGE_TO + "'";
				sql += ", '" + IIV_EXAM_CD + "'";
				sql += ", '" + IIV_DOCT_ID + "'";
				sql += ", '" + IIV_LOW_KD + "'";
				sql += ", '" + IIV_RSLT_LOW + "'";
				sql += ", '" + IIV_HIGH_KD + "'";
				sql += ", '" + IIV_RSLT_HIGH + "'";
				sql += ", '" + IIV_TREF_CD + "'";
				sql += ", '" + IIV_RSLT_UNIT + "'";
				sql += ", '" + IIV_RSPT_CNT + "'";
				sql += ", '" + IIV_RSZR_KD + "'";
				sql += ", '" + IIV_PANJ_CD + "'";
				sql += ", '" + IIV_CHAR_VAL + "'";
				sql += ", '" + IIV_SPCV_CD + "'";
				sql += ", '" + IIV_USE_YN + "'";
				sql += ", '" + IIV_INPT_ID + "'";
				sql += ", SYSDATE";
				sql += ")";

				argStmtExec.executeUpdate(sql);
			}

			if(SMODE.equals("MODIFY")) {
			
				sql = "UPDATE IT_ITEM_VLDT SET ";
				sql += "  IIV_APLY_DT = '" + IIV_APLY_DT + "'";
				sql += ", IIV_LOW_KD = '" + IIV_LOW_KD + "'";
				sql += ", IIV_RSLT_LOW = '" + IIV_RSLT_LOW + "'";
				sql += ", IIV_HIGH_KD = '" + IIV_HIGH_KD + "'";
				sql += ", IIV_RSLT_HIGH = '" + IIV_RSLT_HIGH + "'";
				sql += ", IIV_TREF_CD = '" + IIV_TREF_CD + "'";
				sql += ", IIV_RSLT_UNIT = '" + IIV_RSLT_UNIT + "'";
				sql += ", IIV_RSPT_CNT = '" + IIV_RSPT_CNT + "'";
				sql += ", IIV_RSZR_KD = '" + IIV_RSZR_KD + "'";
				sql += ", IIV_CHAR_VAL = '" + IIV_CHAR_VAL + "'";
				sql += ", IIV_PANJ_CD = '" + IIV_PANJ_CD + "'";
				sql += ", IIV_SPCV_CD = '" + IIV_SPCV_CD + "'";
				sql += ", IIV_USE_YN = '" + IIV_USE_YN + "'";
				sql += ", IIV_MODI_ID = '" + IIV_INPT_ID + "'";
				sql += ", IIV_MODI_DTT = SYSDATE";
				sql += " WHERE IIV_APLY_DT = '" + IIV_APLY_DT + "'";
				sql += " AND IIV_ITEM_CD = '" + IIV_ITEM_CD + "'";
				sql += " AND IIV_SEX_CD = '" + IIV_SEX_CD + "'";
				sql += " AND IIV_AGE_FR = '" + IIV_AGE_FR + "'";
				sql += " AND IIV_AGE_TO = '" + IIV_AGE_TO + "'";
				sql += " AND IIV_EXAM_CD = '" + IIV_EXAM_CD + "'";
				sql += " AND NVL(IIV_DOCT_ID, 'N') = NVL('" + IIV_DOCT_ID + "', 'N')";
				sql += " AND IIV_PANJ_CD = '" + IIV_PANJ_CD + "'";

				argStmtExec.executeUpdate(sql);
			}

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
