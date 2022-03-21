<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uItem_Price_Apply_ufSave_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String SMODE = (String) argHtMethod.get("SMODE");
			String IIP_APLY_DT = (String) argHtMethod.get("IIP_APLY_DT");
			String IIP_ITEM_CD = (String) argHtMethod.get("IIP_ITEM_CD");
			String IIP_JCSG_PR = (String) argHtMethod.get("IIP_JCSG_PR");
			String IIP_HESG_PR = (String) argHtMethod.get("IIP_HESG_PR");
			String IIP_GBSG_PR = (String) argHtMethod.get("IIP_GBSG_PR");
			String IIP_SBSG_PR = (String) argHtMethod.get("IIP_SBSG_PR");
			String IIP_TGSG_PR = (String) argHtMethod.get("IIP_TGSG_PR");
			String IIP_STSG_PR = (String) argHtMethod.get("IIP_STSG_PR");
			String IIP_GASN_PR = (String) argHtMethod.get("IIP_GASN_PR");
			String IIP_PRSN_PR = (String) argHtMethod.get("IIP_PRSN_PR");
			String IIP_SBGB_PR = (String) argHtMethod.get("IIP_SBGB_PR");
			String IIP_USE_YN = (String) argHtMethod.get("IIP_USE_YN");
			String USER = (String) argHtMethod.get("USER");

			//
			if(SMODE == null) { SMODE = ""; }
			if(IIP_APLY_DT == null) { IIP_APLY_DT = ""; }
			if(IIP_ITEM_CD == null) { IIP_ITEM_CD = ""; }
			if(IIP_JCSG_PR == null) { IIP_JCSG_PR = ""; }
			if(IIP_HESG_PR == null) { IIP_HESG_PR = ""; }
			if(IIP_GBSG_PR == null) { IIP_GBSG_PR = ""; }
			if(IIP_SBSG_PR == null) { IIP_SBSG_PR = ""; }
			if(IIP_TGSG_PR == null) { IIP_TGSG_PR = ""; }
			if(IIP_STSG_PR == null) { IIP_STSG_PR = ""; }
			if(IIP_GASN_PR == null) { IIP_GASN_PR = ""; }
			if(IIP_PRSN_PR == null) { IIP_PRSN_PR = ""; }
			if(IIP_SBGB_PR == null) { IIP_SBGB_PR = ""; }
			if(IIP_USE_YN == null) { IIP_USE_YN = ""; }
			if(USER == null) { USER = ""; }

			//
			SMODE = CTr.Replace(SMODE, "'", "''");
			IIP_APLY_DT = CTr.Replace(IIP_APLY_DT, "'", "''");
			IIP_ITEM_CD = CTr.Replace(IIP_ITEM_CD, "'", "''");
			IIP_JCSG_PR = CTr.Replace(IIP_JCSG_PR, "'", "''");
			IIP_HESG_PR = CTr.Replace(IIP_HESG_PR, "'", "''");
			IIP_GBSG_PR = CTr.Replace(IIP_GBSG_PR, "'", "''");
			IIP_SBSG_PR = CTr.Replace(IIP_SBSG_PR, "'", "''");
			IIP_TGSG_PR = CTr.Replace(IIP_TGSG_PR, "'", "''");
			IIP_STSG_PR = CTr.Replace(IIP_STSG_PR, "'", "''");
			IIP_GASN_PR = CTr.Replace(IIP_GASN_PR, "'", "''");
			IIP_PRSN_PR = CTr.Replace(IIP_PRSN_PR, "'", "''");
			IIP_SBGB_PR = CTr.Replace(IIP_SBGB_PR, "'", "''");
			IIP_USE_YN = CTr.Replace(IIP_USE_YN, "'", "''");
			USER = CTr.Replace(USER, "'", "''");

			if(SMODE.equals("INSERT")) {
			
				sql = "INSERT INTO IT_ITEM_PRICE (IIP_APLY_DT ,IIP_ITEM_CD ,IIP_JCSG_PR ,IIP_HESG_PR ,IIP_GBSG_PR ,IIP_SBSG_PR ,IIP_TGSG_PR ,IIP_STSG_PR ,IIP_GASN_PR ,IIP_PRSN_PR ,IIP_SBGB_PR ,IIP_USE_YN ,IIP_INPT_ID ,IIP_INPT_DTT) VALUES (";
				sql += "  '" + IIP_APLY_DT + "'";
				sql += ", '" + IIP_ITEM_CD + "'";
				sql += ", '" + IIP_JCSG_PR + "'";
				sql += ", '" + IIP_HESG_PR + "'";
				sql += ", '" + IIP_GBSG_PR + "'";
				sql += ", '" + IIP_SBSG_PR + "'";
				sql += ", '" + IIP_TGSG_PR + "'";
				sql += ", '" + IIP_STSG_PR + "'";
				sql += ", '" + IIP_GASN_PR + "'";
				sql += ", '" + IIP_PRSN_PR + "'";
				sql += ", '" + IIP_SBGB_PR + "'";
				sql += ", '" + IIP_USE_YN + "'";
				sql += ", '" + USER + "'";
				sql += ", SYSDATE";
				sql += ")";

				argStmtExec.executeUpdate(sql);
			}

			if(SMODE.equals("MODIFY")) {

				sql = "UPDATE IT_ITEM_PRICE SET ";
				sql += "  IIP_JCSG_PR = '" + IIP_JCSG_PR + "'";
				sql += ", IIP_HESG_PR = '" + IIP_HESG_PR + "'";
				sql += ", IIP_GBSG_PR = '" + IIP_GBSG_PR + "'";
				sql += ", IIP_SBSG_PR = '" + IIP_SBSG_PR + "'";
				sql += ", IIP_TGSG_PR = '" + IIP_TGSG_PR + "'";
				sql += ", IIP_STSG_PR = '" + IIP_STSG_PR + "'";
				sql += ", IIP_GASN_PR = '" + IIP_GASN_PR + "'";
				sql += ", IIP_PRSN_PR = '" + IIP_PRSN_PR + "'";
				sql += ", IIP_SBGB_PR = '" + IIP_SBGB_PR + "'";
				sql += ", IIP_USE_YN = '" + IIP_USE_YN + "'";
				sql += ", IIP_MODI_ID = '" + USER + "'";
				sql += ", IIP_MODI_DTT = SYSDATE";
				sql += " WHERE IIP_APLY_DT = '" + IIP_APLY_DT + "'";
				sql += " AND IIP_ITEM_CD = '" + IIP_ITEM_CD + "'";

				argStmtExec.executeUpdate(sql);
			}

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
