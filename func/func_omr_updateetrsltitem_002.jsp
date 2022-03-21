<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_omr_updateetrsltitem_002(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String SRESULT = (String) argHtMethod.get("SRESULT");
			String KD = (String) argHtMethod.get("KD");
			String VLDT = (String) argHtMethod.get("VLDT");
			String EXAM_NO = (String) argHtMethod.get("EXAM_NO");
			String SDATE = (String) argHtMethod.get("SDATE");
			String SCOLUMN = (String) argHtMethod.get("SCOLUMN");

			//
			if(SRESULT == null) { SRESULT = ""; }
			if(KD == null) { KD = ""; }
			if(VLDT == null) { VLDT = ""; }
			if(EXAM_NO == null) { EXAM_NO = ""; }
			if(SDATE == null) { SDATE = ""; }
			if(SCOLUMN == null) { SCOLUMN = ""; }

			//
			SRESULT = CTr.Replace(SRESULT, "'", "''");
			KD = CTr.Replace(KD, "'", "''");
			VLDT = CTr.Replace(VLDT, "'", "''");
			EXAM_NO = CTr.Replace(EXAM_NO, "'", "''");
			SDATE = CTr.Replace(SDATE, "'", "''");
			SCOLUMN = CTr.Replace(SCOLUMN, "'", "''");

			sql += " UPDATE ET_RSLT_ITEM ";
			sql += " SET  ERI_RSLT_VL = '" + SRESULT + "' ";
			sql += " 	, ERI_HERT_CD = '" + KD + "' ";
			sql += " 	, ERI_VLDT_LH = '" + VLDT + "' ";
			sql += " WHERE  ERI_EXAM_SQ = '" + EXAM_NO + "' ";
			sql += " AND ERI_EXAM_DT = '" + SDATE + "' ";
			sql += " AND ERI_ITEM_CD = '" + SCOLUMN + "' ";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
