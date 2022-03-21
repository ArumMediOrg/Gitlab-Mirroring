<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uVT1000Apply_ufSave_005(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String MARK_CLASS = (String) argHtMethod.get("MARK_CLASS");
			String VIEW_NO = (String) argHtMethod.get("VIEW_NO");
			String VIEW_CD1 = (String) argHtMethod.get("VIEW_CD1");
			String VIEW_CD2 = (String) argHtMethod.get("VIEW_CD2");
			String VIEW_CD3 = (String) argHtMethod.get("VIEW_CD3");
			String VIEW_CD4 = (String) argHtMethod.get("VIEW_CD4");
			String VIEW_CD5 = (String) argHtMethod.get("VIEW_CD5");
			String VIEW_CD6 = (String) argHtMethod.get("VIEW_CD6");

			//
			if(MARK_CLASS == null) { MARK_CLASS = ""; }
			if(VIEW_NO == null) { VIEW_NO = ""; }
			if(VIEW_CD1 == null) { VIEW_CD1 = ""; }
			if(VIEW_CD2 == null) { VIEW_CD2 = ""; }
			if(VIEW_CD3 == null) { VIEW_CD3 = ""; }
			if(VIEW_CD4 == null) { VIEW_CD4 = ""; }
			if(VIEW_CD5 == null) { VIEW_CD5 = ""; }
			if(VIEW_CD6 == null) { VIEW_CD6 = ""; }

			//
			MARK_CLASS = CTr.Replace(MARK_CLASS, "'", "''");
			VIEW_NO = CTr.Replace(VIEW_NO, "'", "''");
			VIEW_CD1 = CTr.Replace(VIEW_CD1, "'", "''");
			VIEW_CD2 = CTr.Replace(VIEW_CD2, "'", "''");
			VIEW_CD3 = CTr.Replace(VIEW_CD3, "'", "''");
			VIEW_CD4 = CTr.Replace(VIEW_CD4, "'", "''");
			VIEW_CD5 = CTr.Replace(VIEW_CD5, "'", "''");
			VIEW_CD6 = CTr.Replace(VIEW_CD6, "'", "''");

			sql = "UPDATE VT_VIEW_MAGE SET ";
			sql += "  VVM_AUTO_YN = 'N'";
			sql += " WHERE VVM_MARK_CLASS = '" + MARK_CLASS + "'";
			sql += " AND VVM_VIEW_NO <> '" + VIEW_NO + "'";
			sql += " AND VVM_VIEW_CD1 = '" + VIEW_CD1 + "'";
			sql += " AND VVM_VIEW_CD2 = '" + VIEW_CD2 + "'";
			sql += " AND VVM_VIEW_CD3 = '" + VIEW_CD3 + "'";
			sql += " AND VVM_VIEW_CD4 = '" + VIEW_CD4 + "'";
			sql += " AND VVM_VIEW_CD5 = '" + VIEW_CD5 + "'";
			sql += " AND VVM_VIEW_CD6 = '" + VIEW_CD6 + "'";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
