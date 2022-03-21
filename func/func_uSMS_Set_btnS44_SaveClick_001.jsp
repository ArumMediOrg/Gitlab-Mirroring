<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uSMS_Set_btnS44_SaveClick_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String CMBXS44_STANDHH = (String) argHtMethod.get("CMBXS44_STANDHH");
			String CMBXS44_STANDMM = (String) argHtMethod.get("CMBXS44_STANDMM");
			String CMBXS44_BEFORDT = (String) argHtMethod.get("CMBXS44_BEFORDT");
			String CMBXS44_BEFORHH = (String) argHtMethod.get("CMBXS44_BEFORHH");
			String CHECKBOX2 = (String) argHtMethod.get("CHECKBOX2");
			String TMPL_CD = (String) argHtMethod.get("TMPL_CD");
			String MMS44_MSG = (String) argHtMethod.get("MMS44_MSG");
			String COMBOBOX1 = (String) argHtMethod.get("COMBOBOX1");
			String GUSER = (String) argHtMethod.get("GUSER");
			String GUID_KD = (String) argHtMethod.get("GUID_KD");
			String PLCE_CD = (String) argHtMethod.get("PLCE_CD");
			String ITEM_CD = (String) argHtMethod.get("ITEM_CD");
			String PRIOR_SQ = (String) argHtMethod.get("PRIOR_SQ");
			String GUID_NM = (String) argHtMethod.get("GUID_NM");

			//
			if(CMBXS44_STANDHH == null) { CMBXS44_STANDHH = ""; }
			if(CMBXS44_STANDMM == null) { CMBXS44_STANDMM = ""; }
			if(CMBXS44_BEFORDT == null) { CMBXS44_BEFORDT = ""; }
			if(CMBXS44_BEFORHH == null) { CMBXS44_BEFORHH = ""; }
			if(CHECKBOX2 == null) { CHECKBOX2 = ""; }
			if(TMPL_CD == null) { TMPL_CD = ""; }
			if(MMS44_MSG == null) { MMS44_MSG = ""; }
			if(COMBOBOX1 == null) { COMBOBOX1 = ""; }
			if(GUSER == null) { GUSER = ""; }
			if(GUID_KD == null) { GUID_KD = ""; }
			if(PLCE_CD == null) { PLCE_CD = ""; }
			if(ITEM_CD == null) { ITEM_CD = ""; }
			if(PRIOR_SQ == null) { PRIOR_SQ = ""; }
			if(GUID_NM == null) { GUID_NM = ""; }

			//
			CMBXS44_STANDHH = CTr.Replace(CMBXS44_STANDHH, "'", "''");
			CMBXS44_STANDMM = CTr.Replace(CMBXS44_STANDMM, "'", "''");
			CMBXS44_BEFORDT = CTr.Replace(CMBXS44_BEFORDT, "'", "''");
			CMBXS44_BEFORHH = CTr.Replace(CMBXS44_BEFORHH, "'", "''");
			CHECKBOX2 = CTr.Replace(CHECKBOX2, "'", "''");
			TMPL_CD = CTr.Replace(TMPL_CD, "'", "''");
			MMS44_MSG = CTr.Replace(MMS44_MSG, "'", "''");
			COMBOBOX1 = CTr.Replace(COMBOBOX1, "'", "''");
			GUSER = CTr.Replace(GUSER, "'", "''");
			GUID_KD = CTr.Replace(GUID_KD, "'", "''");
			PLCE_CD = CTr.Replace(PLCE_CD, "'", "''");
			ITEM_CD = CTr.Replace(ITEM_CD, "'", "''");
			PRIOR_SQ = CTr.Replace(PRIOR_SQ, "'", "''");
			GUID_NM = CTr.Replace(GUID_NM, "'", "''");

			sql = "UPDATE CR_SMS_AUTO_SET SET ";
			sql += "  CSA_STAND_HH = '" + CMBXS44_STANDHH + "'";
			sql += ", CSA_STAND_MM = '" + CMBXS44_STANDMM + "'";
			sql += ", CSA_BEFOR_DT = '" + CMBXS44_BEFORDT + "'";
			sql += ", CSA_BEFOR_HH = '" + CMBXS44_BEFORHH + "'";
			sql += ", ";

			if(CHECKBOX2.equals("1")) {
				sql += "  CSA_USE_YN = 'N'";
			}
			else {
				sql += "  CSA_USE_YN = 'Y'";
			}

			sql += ", CSA_TMPL_CD = '" + TMPL_CD + "'";
			sql += ", CSA_SEND_MSG = '" + MMS44_MSG + "'";
			sql += ", CSA_SEND_TEL = '" + COMBOBOX1 + "'";
			sql += ", CSA_MODI_ID = '" + GUSER + "'";
			sql += ", CSA_MODI_DTT = SYSDATE";
			sql += ", CSA_PLCE_CD  = '" + PLCE_CD + "'";
			sql += ", CSA_ITEM_CD  = '" + ITEM_CD + "'";
			sql += ", CSA_PRIOR_SQ = '" + PRIOR_SQ + "'";
			sql += ", CSA_GUID_NM = '" + GUID_NM + "'";

			sql += " WHERE CSA_GUID_KD = '" + GUID_KD + "'";

			argStmtExec.executeUpdate(sql);
		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
