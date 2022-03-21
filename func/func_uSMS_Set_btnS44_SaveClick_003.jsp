<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uSMS_Set_btnS44_SaveClick_003(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String CMBXS44_STANDHH = (String) argHtMethod.get("CMBXS44_STANDHH");
			String CMBXS44_STANDMM = (String) argHtMethod.get("CMBXS44_STANDMM");
			String CMBXS44_BEFORDT = (String) argHtMethod.get("CMBXS44_BEFORDT");
			String CMBXS44_BEFORHH = (String) argHtMethod.get("CMBXS44_BEFORHH");
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
			TMPL_CD = CTr.Replace(TMPL_CD, "'", "''");
			MMS44_MSG = CTr.Replace(MMS44_MSG, "'", "''");
			COMBOBOX1 = CTr.Replace(COMBOBOX1, "'", "''");
			GUSER = CTr.Replace(GUSER, "'", "''");
			GUID_KD = CTr.Replace(GUID_KD, "'", "''");
			PLCE_CD = CTr.Replace(PLCE_CD, "'", "''");
			ITEM_CD = CTr.Replace(ITEM_CD, "'", "''");
			PRIOR_SQ = CTr.Replace(PRIOR_SQ, "'", "''");
			GUID_NM = CTr.Replace(GUID_NM, "'", "''");

			sql = " Insert Into CR_SMS_AUTO_SET ";
			sql += " (CSA_GUID_KD,  CSA_GUID_NM,   CSA_SEND_KD,  CSA_STAND_HH, CSA_STAND_MM, ";
			sql += " CSA_BEFOR_DT, CSA_BEFOR_HH,  CSA_SEND_MSG, CSA_SEND_TEL, CSA_USE_YN, ";
			sql += " CSA_TMPL_CD, ";
			sql += " CSA_INPUT_ID, CSA_INPUT_DTT, CSA_ITEM_CD,  CSA_PRIOR_SQ, CSA_PLCE_CD) ";
			sql += " Values  ";
			sql += " ('" + GUID_KD + "', ";
			sql += " '" + GUID_NM + "', ";
			sql += " '2',  ";
			sql += " '" + CMBXS44_STANDHH + "', ";
			sql += " '" + CMBXS44_STANDMM + "', ";
			sql += " '" + CMBXS44_BEFORDT + "', ";
			sql += " '" + CMBXS44_BEFORHH + "', ";
			sql += " '" + MMS44_MSG + "', ";
			sql += " '" + COMBOBOX1 + "', ";
			sql += " 'Y',  ";
			sql += " '" + TMPL_CD + "', ";
			sql += " '" + GUSER + "', ";
			sql += " sysdate, ";
			sql += " '" + ITEM_CD + "', ";
			sql += " '" + PRIOR_SQ + "', ";
			sql += " '" + PLCE_CD + "' ";
			sql += ")";

			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
