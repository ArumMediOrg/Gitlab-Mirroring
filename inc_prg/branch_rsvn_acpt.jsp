<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%
	htBranch.put("uRsvn_Acpt_SMS_Send_002", 		"/method/rsvn_acpt/uRsvn_Acpt_SMS_Send_002.jsp");
	htBranch.put("uRsvn_Acpt_SMS_Send_001", 		"/method/rsvn_acpt/uRsvn_Acpt_SMS_Send_001.jsp");
	htBranch.put("uRsvn_Acpt_UP_FindHistR_001", 		"/method/rsvn_acpt/uRsvn_Acpt_UP_FindHistR_001.jsp");
	htBranch.put("uRsvn_Acpt_Old_Srch_001", 		"/method/rsvn_acpt/uRsvn_Acpt_Old_Srch_001.jsp");
	htBranch.put("uRsvn_Acpt_UF_FindUBEH_001", 		"/method/rsvn_acpt/uRsvn_Acpt_UF_FindUBEH_001.jsp");
	htBranch.put("uRsvn_Acpt_SelectUBAPIList_001", 		"/method/rsvn_acpt/uRsvn_Acpt_SelectUBAPIList_001.jsp");
	htBranch.put("uRsvn_Acpt_btnRsvn_SrchClick_001", 		"/method/rsvn_acpt/uRsvn_Acpt_btnRsvn_SrchClick_001.jsp");
	htBranch.put("uRsvn_Acpt_btnRsvn_SrchClick_002", 		"/method/rsvn_acpt/uRsvn_Acpt_btnRsvn_SrchClick_002.jsp");
	htBranch.put("uRsvn_Acpt_btnDeleteClick_001", 		"/method/rsvn_acpt/uRsvn_Acpt_btnDeleteClick_001.jsp");
	htBranch.put("uRsvn_Acpt_UP_FindHistR_002", 		"/method/rsvn_acpt/uRsvn_Acpt_UP_FindHistR_002.jsp");
	htBranch.put("uRsvn_Acpt_btnSaveClick_010", 		"/method/rsvn_acpt/uRsvn_Acpt_btnSaveClick_010.jsp");
	htBranch.put("uRsvn_Acpt_UP_Rsvn_Log_001", 		"/method/rsvn_acpt/uRsvn_Acpt_UP_Rsvn_Log_001.jsp");
	htBranch.put("uRsvn_Acpt_UP_FindRsvn_001", 		"/method/rsvn_acpt/uRsvn_Acpt_UP_FindRsvn_001.jsp");
	htBranch.put("uRsvn_Acpt_UF_FindRsvn_001", 		"/method/rsvn_acpt/uRsvn_Acpt_UF_FindRsvn_001.jsp");
	htBranch.put("uRsvn_Acpt_UP_RsvnSum_001", 		"/method/rsvn_acpt/uRsvn_Acpt_UP_RsvnSum_001.jsp");
	htBranch.put("uRsvn_Acpt_UP_EquipState_003", 		"/method/rsvn_acpt/uRsvn_Acpt_UP_EquipState_003.jsp");
	htBranch.put("uRsvn_Acpt_UP_EquipState_002", 		"/method/rsvn_acpt/uRsvn_Acpt_UP_EquipState_002.jsp");
	htBranch.put("uRsvn_Acpt_UP_EquipState_001", 		"/method/rsvn_acpt/uRsvn_Acpt_UP_EquipState_001.jsp");
	htBranch.put("uRsvn_Acpt_UF_FindTimeSq_001", 		"/method/rsvn_acpt/uRsvn_Acpt_UF_FindTimeSq_001.jsp");
	htBranch.put("uRsvn_Acpt_UP_EquipSetting_001", 		"/method/rsvn_acpt/uRsvn_Acpt_UP_EquipSetting_001.jsp");
	htBranch.put("uRsvn_Acpt_AsgEquipClickCell_002", 		"/method/rsvn_acpt/uRsvn_Acpt_AsgEquipClickCell_002.jsp");
	htBranch.put("uRsvn_Acpt_AsgEquipClickCell_001", 		"/method/rsvn_acpt/uRsvn_Acpt_AsgEquipClickCell_001.jsp");
	htBranch.put("uRsvn_Acpt_btnSaveClick_003", 		"/method/rsvn_acpt/uRsvn_Acpt_btnSaveClick_003.jsp");
	htBranch.put("uRsvn_Acpt_btnSaveClick_004", 		"/method/rsvn_acpt/uRsvn_Acpt_btnSaveClick_004.jsp");
	htBranch.put("uRsvn_Acpt_btnSaveClick_005", 		"/method/rsvn_acpt/uRsvn_Acpt_btnSaveClick_005.jsp");
	htBranch.put("uRsvn_Acpt_btnSaveClick_002", 		"/method/rsvn_acpt/uRsvn_Acpt_btnSaveClick_002.jsp");
	htBranch.put("uRsvn_Acpt_btnSaveClick_001", 		"/method/rsvn_acpt/uRsvn_Acpt_btnSaveClick_001.jsp");
	htBranch.put("uRsvn_Acpt_UP_UBEH_Check_001", 		"/method/rsvn_acpt/uRsvn_Acpt_UP_UBEH_Check_001.jsp");
	htBranch.put("uRsvn_Acpt_UP_SetCalendar_002", 		"/method/rsvn_acpt/uRsvn_Acpt_UP_SetCalendar_002.jsp");
	htBranch.put("uRsvn_Acpt_UP_SetCalendar_001", 		"/method/rsvn_acpt/uRsvn_Acpt_UP_SetCalendar_001.jsp");
	htBranch.put("uRsvn_Acpt_UF_EquipUpdate_001", 		"/method/rsvn_acpt/uRsvn_Acpt_UF_EquipUpdate_001.jsp");
	htBranch.put("uRsvn_Acpt_UF_EquipUpdate_002", 		"/method/rsvn_acpt/uRsvn_Acpt_UF_EquipUpdate_002.jsp");
	htBranch.put("uRsvn_Acpt_btnSaveClick_011", 		"/method/rsvn_acpt/uRsvn_Acpt_btnSaveClick_011.jsp");
	htBranch.put("uRsvnUpdate_ehrRsvnUpdate_001", 		"/method/rsvn_acpt/uRsvnUpdate_ehrRsvnUpdate_001.jsp");
	htBranch.put("uRsvnUpdate_ehrRsvnUpdate_002", 		"/method/rsvn_acpt/uRsvnUpdate_ehrRsvnUpdate_002.jsp");
	htBranch.put("uRsvnUpdate_ehrRsvnUpdate_003", 		"/method/rsvn_acpt/uRsvnUpdate_ehrRsvnUpdate_003.jsp");
	htBranch.put("uRsvn_Acpt_Pcn_Srch_001", 		"/method/rsvn_acpt/uRsvn_Acpt_Pcn_Srch_001.jsp");
	htBranch.put("uRsvn_Acpt_Old_Srch_002", 		"/method/rsvn_acpt/uRsvn_Acpt_Old_Srch_002.jsp");
	htBranch.put("uRsvn_Acpt_btnSaveClick_012", 		"/method/rsvn_acpt/uRsvn_Acpt_btnSaveClick_012.jsp");
%>
