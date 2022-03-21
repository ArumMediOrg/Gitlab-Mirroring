<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_frameSetCustomExamResult_targetItemSave_003(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String EMP_NO = (String) argHtMethod.get("EMP_NO");
			String ITEM_CD = (String) argHtMethod.get("ITEM_CD");
			String GROUP_NM = (String) argHtMethod.get("GROUP_NM");
			String GROUP_KEY = (String) argHtMethod.get("GROUP_KEY");
			String GROUP_PKEY = (String) argHtMethod.get("GROUP_PKEY");
			String ORDERBY = (String) argHtMethod.get("ORDERBY");

			//
			if(EMP_NO == null) { EMP_NO = ""; }
			if(ITEM_CD == null) { ITEM_CD = ""; }
			if(GROUP_NM == null) { GROUP_NM = ""; }
			if(GROUP_KEY == null) { GROUP_KEY = ""; }
			if(GROUP_PKEY == null) { GROUP_PKEY = ""; }
			if(ORDERBY == null) { ORDERBY = ""; }

			//
			if(EMP_NO == null) { EMP_NO = ""; }
			if(ITEM_CD == null) { ITEM_CD = ""; }
			if(GROUP_NM == null) { GROUP_NM = ""; }
			if(GROUP_KEY == null) { GROUP_KEY = ""; }
			if(GROUP_PKEY == null) { GROUP_PKEY = ""; }
			if(ORDERBY == null) { ORDERBY = ""; }

			sql = " INSERT INTO ET_CUST_ITEM (ECI_EMP_NO, ECI_ITEM_CD, ECI_GROUP_NM, ECI_GROUP_KEY, ECI_GROUP_PKEY, ECI_ORDERBY ";
			sql += ")  VALUES ( ";
			sql += "  '" + EMP_NO + "' ";
			sql += ", '" + ITEM_CD + "'";
			sql += ", '" + GROUP_NM + "'";
			sql += ", '" + GROUP_KEY + "'";
			sql += ", '" + GROUP_PKEY + "'";
			sql += ", '" + ORDERBY + "'";
			sql += ") ";



			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
