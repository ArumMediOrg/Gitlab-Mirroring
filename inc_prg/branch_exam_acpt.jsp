<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%
	htBranch.put("uFM_AcptComm_GP_ItemList_002", 		"/method/exam_acpt/uFM_AcptComm_GP_ItemList_002.jsp");
	htBranch.put("uFM_AcptComm_GP_ItemList_001", 		"/method/exam_acpt/uFM_AcptComm_GP_ItemList_001.jsp");
	htBranch.put("pmPrntClick", 		"/method/exam_acpt/pmPrntClick.jsp");
	htBranch.put("uExam_Acpt_Up_DisplayDmd_002", 		"/method/exam_acpt/uExam_Acpt_Up_DisplayDmd_002.jsp");
	htBranch.put("uFM_AcptComm_GF_SaveExamPrice_002", 		"/method/exam_acpt/uFM_AcptComm_GF_SaveExamPrice_002.jsp");
	htBranch.put("uFM_AcptComm_GP_ExamList_010", 		"/method/exam_acpt/uFM_AcptComm_GP_ExamList_010.jsp");
	htBranch.put("uExam_Acpt_UF_AcptFind_001", 		"/method/exam_acpt/uExam_Acpt_UF_AcptFind_001.jsp");
	htBranch.put("uFM_AcptComm_GP_PackCheck_001", 		"/method/exam_acpt/uFM_AcptComm_GP_PackCheck_001.jsp");
	htBranch.put("uFM_AcptComm_GP_PackCheck_001___1", 		"/method/exam_acpt/uFM_AcptComm_GP_PackCheck_001___1.jsp");
	htBranch.put("uFM_AcptComm_GP_PackCheck_001___2", 		"/method/exam_acpt/uFM_AcptComm_GP_PackCheck_001___2.jsp");
	htBranch.put("uFM_AcptComm_GF_FindPackNm_001", 		"/method/exam_acpt/uFM_AcptComm_GF_FindPackNm_001.jsp");
	htBranch.put("uFM_AcptComm_GP_ExamList_005", 		"/method/exam_acpt/uFM_AcptComm_GP_ExamList_005.jsp");
	htBranch.put("uFM_AcptComm_GP_ExamSetting_002", 		"/method/exam_acpt/uFM_AcptComm_GP_ExamSetting_002.jsp");
	htBranch.put("uFM_AcptComm_GF_FindPack_001", 		"/method/exam_acpt/uFM_AcptComm_GF_FindPack_001.jsp");
	htBranch.put("uFM_AcptComm_GF_FindTotalOptn_001", 		"/method/exam_acpt/uFM_AcptComm_GF_FindTotalOptn_001.jsp");
	htBranch.put("uFM_AcptComm_GP_ExamSetting_013", 		"/method/exam_acpt/uFM_AcptComm_GP_ExamSetting_013.jsp");
	htBranch.put("uFM_AcptComm_GP_ItemList_007", 		"/method/exam_acpt/uFM_AcptComm_GP_ItemList_007.jsp");
	htBranch.put("uFM_AcptComm_GF_RsvnDataFind_001", 		"/method/exam_acpt/uFM_AcptComm_GF_RsvnDataFind_001.jsp");
	htBranch.put("uFM_AcptComm_GP_ExamSetting_003", 		"/method/exam_acpt/uFM_AcptComm_GP_ExamSetting_003.jsp");
	htBranch.put("uFM_AcptComm_GP_ItemList_011", 		"/method/exam_acpt/uFM_AcptComm_GP_ItemList_011.jsp");
	htBranch.put("uExam_Acpt_AlvAcptDblClick_005", 		"/method/exam_acpt/uExam_Acpt_AlvAcptDblClick_005.jsp");
	htBranch.put("uFM_AcptComm_GF_FindItem_001", 		"/method/exam_acpt/uFM_AcptComm_GF_FindItem_001.jsp");
	htBranch.put("uFM_AcptComm_GP_ExamList_009", 		"/method/exam_acpt/uFM_AcptComm_GP_ExamList_009.jsp");
	htBranch.put("uFM_AcptComm_GF_SaveRsltItem_001", 		"/method/exam_acpt/uFM_AcptComm_GF_SaveRsltItem_001.jsp");
	htBranch.put("uFM_AcptComm_GF_SaveExamItem_001", 		"/method/exam_acpt/uFM_AcptComm_GF_SaveExamItem_001.jsp");
	htBranch.put("uFM_AcptComm_GF_FindOcsCode_001", 		"/method/exam_acpt/uFM_AcptComm_GF_FindOcsCode_001.jsp");
	htBranch.put("uFM_AcptComm_GP_FindHist_001", 		"/method/exam_acpt/uFM_AcptComm_GP_FindHist_001.jsp");
	htBranch.put("uFind_Ticket_upGetRslt_001", 		"/method/exam_acpt/uFind_Ticket_upGetRslt_001.jsp");
	htBranch.put("uFM_AcptComm_GF_FindPrceKd_001", 		"/method/exam_acpt/uFM_AcptComm_GF_FindPrceKd_001.jsp");
	htBranch.put("uFM_AcptComm_GF_FindRsltItem_001", 		"/method/exam_acpt/uFM_AcptComm_GF_FindRsltItem_001.jsp");
	htBranch.put("uFM_AcptComm_GF_FindCustomer_001", 		"/method/exam_acpt/uFM_AcptComm_GF_FindCustomer_001.jsp");
	htBranch.put("uFM_AcptComm_GF_MakeCustNo_001", 		"/method/exam_acpt/uFM_AcptComm_GF_MakeCustNo_001.jsp");
	htBranch.put("uFM_AcptComm_GF_SaveCustomer_001", 		"/method/exam_acpt/uFM_AcptComm_GF_SaveCustomer_001.jsp");
	htBranch.put("uFM_AcptComm_GP_FindCode_001", 		"/method/exam_acpt/uFM_AcptComm_GP_FindCode_001.jsp");
	htBranch.put("uExam_Acpt_Up_FindExam_001", 		"/method/exam_acpt/uExam_Acpt_Up_FindExam_001.jsp");
	htBranch.put("uFM_AcptComm_GF_FindRsvnAcpt_001", 		"/method/exam_acpt/uFM_AcptComm_GF_FindRsvnAcpt_001.jsp");
	htBranch.put("uFM_AcptComm_GF_FindExamAcpt_001", 		"/method/exam_acpt/uFM_AcptComm_GF_FindExamAcpt_001.jsp");
	htBranch.put("uFM_AcptComm_GP_ExamList_001", 		"/method/exam_acpt/uFM_AcptComm_GP_ExamList_001.jsp");
	htBranch.put("uFM_AcptComm_GP_ExamList_001___1", 		"/method/exam_acpt/uFM_AcptComm_GP_ExamList_001___1.jsp");
	htBranch.put("uFM_AcptComm_GP_ExamList_001___2", 		"/method/exam_acpt/uFM_AcptComm_GP_ExamList_001___2.jsp");
	htBranch.put("uFM_AcptComm_GF_UdtMultiColumn_001", 		"/method/exam_acpt/uFM_AcptComm_GF_UdtMultiColumn_001.jsp");
	htBranch.put("uExam_Acpt_Up_FindRsvn_001", 		"/method/exam_acpt/uExam_Acpt_Up_FindRsvn_001.jsp");
	htBranch.put("uExam_Acpt_edPsnl_NmExit_002", 		"/method/exam_acpt/uExam_Acpt_edPsnl_NmExit_002.jsp");
	htBranch.put("uFM_AcptComm_GF_SaveMemo_001", 		"/method/exam_acpt/uFM_AcptComm_GF_SaveMemo_001.jsp");
	htBranch.put("uFM_AcptComm_GF_CheckMemo_001", 		"/method/exam_acpt/uFM_AcptComm_GF_CheckMemo_001.jsp");
	htBranch.put("uFM_AcptComm_GF_FindMemo_001", 		"/method/exam_acpt/uFM_AcptComm_GF_FindMemo_001.jsp");
	htBranch.put("uFM_AcptComm_GP_ExamList_003", 		"/method/exam_acpt/uFM_AcptComm_GP_ExamList_003.jsp");
	htBranch.put("uFM_AcptComm_GP_ItemList_013", 		"/method/exam_acpt/uFM_AcptComm_GP_ItemList_013.jsp");
	htBranch.put("uFM_AcptComm_GP_ExamSetting_011", 		"/method/exam_acpt/uFM_AcptComm_GP_ExamSetting_011.jsp");
	htBranch.put("uFM_AcptComm_GF_FindCnrtCust_001", 		"/method/exam_acpt/uFM_AcptComm_GF_FindCnrtCust_001.jsp");
	htBranch.put("uFM_AcptComm_GP_ExamSetting_009", 		"/method/exam_acpt/uFM_AcptComm_GP_ExamSetting_009.jsp");
	htBranch.put("uFM_AcptComm_GP_ComboSetting_001", 		"/method/exam_acpt/uFM_AcptComm_GP_ComboSetting_001.jsp");
	htBranch.put("uFM_AcptComm_GP_ExamSetting_012", 		"/method/exam_acpt/uFM_AcptComm_GP_ExamSetting_012.jsp");
	htBranch.put("uExam_Acpt_AlvAcptDblClick_006", 		"/method/exam_acpt/uExam_Acpt_AlvAcptDblClick_006.jsp");
	htBranch.put("uFM_AcptComm_GF_FindCompany_001", 		"/method/exam_acpt/uFM_AcptComm_GF_FindCompany_001.jsp");
	htBranch.put("uFM_AcptComm_GP_ExamSetting_010", 		"/method/exam_acpt/uFM_AcptComm_GP_ExamSetting_010.jsp");
	htBranch.put("uFM_AcptComm_GF_FindTbasCd_001", 		"/method/exam_acpt/uFM_AcptComm_GF_FindTbasCd_001.jsp");
	htBranch.put("uFM_AcptComm_GP_ItemList_009", 		"/method/exam_acpt/uFM_AcptComm_GP_ItemList_009.jsp");
	htBranch.put("uFM_AcptComm_GP_ExamSetting_007", 		"/method/exam_acpt/uFM_AcptComm_GP_ExamSetting_007.jsp");
	htBranch.put("uFM_AcptComm_GP_ExamList_002", 		"/method/exam_acpt/uFM_AcptComm_GP_ExamList_002.jsp");
	htBranch.put("uFM_AcptComm_GF_FindCompOptn_001", 		"/method/exam_acpt/uFM_AcptComm_GF_FindCompOptn_001.jsp");
	htBranch.put("uFM_AcptComm_GP_ExamSetting_014", 		"/method/exam_acpt/uFM_AcptComm_GP_ExamSetting_014.jsp");
	htBranch.put("uFM_AcptComm_GP_ExamSetting_008", 		"/method/exam_acpt/uFM_AcptComm_GP_ExamSetting_008.jsp");
	htBranch.put("uFM_AcptComm_GP_ItemList_008", 		"/method/exam_acpt/uFM_AcptComm_GP_ItemList_008.jsp");
	htBranch.put("uFM_AcptComm_GF_FindCompPack_001", 		"/method/exam_acpt/uFM_AcptComm_GF_FindCompPack_001.jsp");
	htBranch.put("uFM_AcptComm_GP_ItemList_010", 		"/method/exam_acpt/uFM_AcptComm_GP_ItemList_010.jsp");
	htBranch.put("uFM_AcptComm_GP_ExamList_008", 		"/method/exam_acpt/uFM_AcptComm_GP_ExamList_008.jsp");
	htBranch.put("uFM_AcptComm_GF_FindUser_001", 		"/method/exam_acpt/uFM_AcptComm_GF_FindUser_001.jsp");
	htBranch.put("uRsvn_Cnsl_UP_CnslSearching_001", 		"/method/exam_acpt/uRsvn_Cnsl_UP_CnslSearching_001.jsp");
	htBranch.put("uExam_Acpt_UP_ExamPrice_Re_001", 		"/method/exam_acpt/uExam_Acpt_UP_ExamPrice_Re_001.jsp");
	htBranch.put("uFM_AcptComm_GF_SaveExamPrice_001", 		"/method/exam_acpt/uFM_AcptComm_GF_SaveExamPrice_001.jsp");
	htBranch.put("uExam_Acpt_Up_DisplayDmd_001", 		"/method/exam_acpt/uExam_Acpt_Up_DisplayDmd_001.jsp");
	htBranch.put("uExam_Acpt_dgCanDblClick_001", 		"/method/exam_acpt/uExam_Acpt_dgCanDblClick_001.jsp");
	htBranch.put("uFM_AcptComm_GP_ExamSetting_004", 		"/method/exam_acpt/uFM_AcptComm_GP_ExamSetting_004.jsp");
	htBranch.put("uFM_AcptComm_GP_CanMunjin_001", 		"/method/exam_acpt/uFM_AcptComm_GP_CanMunjin_001.jsp");
	htBranch.put("uFM_AcptComm_GP_CanDrSetting_001", 		"/method/exam_acpt/uFM_AcptComm_GP_CanDrSetting_001.jsp");
	htBranch.put("uFM_AcptComm_GF_EchelonEncrypt_001", 		"/method/exam_acpt/uFM_AcptComm_GF_EchelonEncrypt_001.jsp");
	htBranch.put("uFM_AcptComm_GF_FindUBOptn_001", 		"/method/exam_acpt/uFM_AcptComm_GF_FindUBOptn_001.jsp");
	htBranch.put("uFM_AcptComm_GP_ExamSetting_015", 		"/method/exam_acpt/uFM_AcptComm_GP_ExamSetting_015.jsp");
	htBranch.put("uFM_AcptComm_GF_FindOcsCode_002", 		"/method/exam_acpt/uFM_AcptComm_GF_FindOcsCode_002.jsp");
	htBranch.put("uFM_AcptComm_GF_FindRsvtItem_001", 		"/method/exam_acpt/uFM_AcptComm_GF_FindRsvtItem_001.jsp");
	htBranch.put("uExam_Acpt_btnRsvn_SrchClick_001", 		"/method/exam_acpt/uExam_Acpt_btnRsvn_SrchClick_001.jsp");
	htBranch.put("uFM_AcptComm_GF_EquipItem_001", 		"/method/exam_acpt/uFM_AcptComm_GF_EquipItem_001.jsp");
	htBranch.put("uFM_AcptComm_GP_ItemList_003", 		"/method/exam_acpt/uFM_AcptComm_GP_ItemList_003.jsp");
	htBranch.put("uExam_Acpt_AlvAcptDblClick_001", 		"/method/exam_acpt/uExam_Acpt_AlvAcptDblClick_001.jsp");
	htBranch.put("uFM_AcptComm_GF_UBRsvnFind_001", 		"/method/exam_acpt/uFM_AcptComm_GF_UBRsvnFind_001.jsp");
	htBranch.put("uFM_AcptComm_GP_ItemList_004", 		"/method/exam_acpt/uFM_AcptComm_GP_ItemList_004.jsp");
	htBranch.put("uFM_AcptComm_GP_ItemList_012", 		"/method/exam_acpt/uFM_AcptComm_GP_ItemList_012.jsp");
	htBranch.put("uFM_AcptComm_GF_FindDr_001", 		"/method/exam_acpt/uFM_AcptComm_GF_FindDr_001.jsp");
	htBranch.put("uFM_AcptComm_GF_FindNextDate_001", 		"/method/exam_acpt/uFM_AcptComm_GF_FindNextDate_001.jsp");
	htBranch.put("uExam_Acpt_UP_FindFstPnjn_003", 		"/method/exam_acpt/uExam_Acpt_UP_FindFstPnjn_003.jsp");
	htBranch.put("uExam_Acpt_UP_FindFstPnjn_001", 		"/method/exam_acpt/uExam_Acpt_UP_FindFstPnjn_001.jsp");
	htBranch.put("uExam_Acpt_UP_FindFstPnjn_002", 		"/method/exam_acpt/uExam_Acpt_UP_FindFstPnjn_002.jsp");
	htBranch.put("uFM_AcptComm_GP_ExamSetting_001", 		"/method/exam_acpt/uFM_AcptComm_GP_ExamSetting_001.jsp");
	htBranch.put("uFM_AcptComm_GP_ItemList_006", 		"/method/exam_acpt/uFM_AcptComm_GP_ItemList_006.jsp");
	htBranch.put("uFM_AcptComm_GF_ChkCustomer_001", 		"/method/exam_acpt/uFM_AcptComm_GF_ChkCustomer_001.jsp");
	htBranch.put("uFM_AcptComm_GF_LongRsltFind_001", 		"/method/exam_acpt/uFM_AcptComm_GF_LongRsltFind_001.jsp");
	htBranch.put("uExam_Acpt_AlvAcptSelectItem_001", 		"/method/exam_acpt/uExam_Acpt_AlvAcptSelectItem_001.jsp");
	htBranch.put("uExam_Acpt_AlvAcptDblClick_003", 		"/method/exam_acpt/uExam_Acpt_AlvAcptDblClick_003.jsp");
	htBranch.put("uExam_Acpt_btnAcpt_SrchClick_001", 		"/method/exam_acpt/uExam_Acpt_btnAcpt_SrchClick_001.jsp");
	htBranch.put("uExam_Acpt_AlvAcptDblClick_004", 		"/method/exam_acpt/uExam_Acpt_AlvAcptDblClick_004.jsp");
	htBranch.put("uExam_Acpt_btnSaveClick_002", 		"/method/exam_acpt/uExam_Acpt_btnSaveClick_002.jsp");
	htBranch.put("uExam_Acpt_btnSaveClick_001", 		"/method/exam_acpt/uExam_Acpt_btnSaveClick_001.jsp");
	htBranch.put("uExam_Acpt_btnSaveClick_004", 		"/method/exam_acpt/uExam_Acpt_btnSaveClick_004.jsp");
	htBranch.put("uExam_Acpt_btnSaveClick_003", 		"/method/exam_acpt/uExam_Acpt_btnSaveClick_003.jsp");
	htBranch.put("uFM_AcptComm_GF_SaveExamAcpt_001", 		"/method/exam_acpt/uFM_AcptComm_GF_SaveExamAcpt_001.jsp");
	htBranch.put("uFM_AcptComm_GF_CancelAcpt_001", 		"/method/exam_acpt/uFM_AcptComm_GF_CancelAcpt_001.jsp");
	htBranch.put("uExam_Acpt_edPsnl_NmExit_001", 		"/method/exam_acpt/uExam_Acpt_edPsnl_NmExit_001.jsp");
	htBranch.put("uFM_AcptComm_GF_ChkDelAcpt_001", 		"/method/exam_acpt/uFM_AcptComm_GF_ChkDelAcpt_001.jsp");
	htBranch.put("uFM_AcptComm_GF_MakeExamSq_001", 		"/method/exam_acpt/uFM_AcptComm_GF_MakeExamSq_001.jsp");
	htBranch.put("uExam_Acpt_btnInjkSaveClick_001", 		"/method/exam_acpt/uExam_Acpt_btnInjkSaveClick_001.jsp");
	htBranch.put("uFM_AcptComm_GP_ExamSetting_016", 		"/method/exam_acpt/uFM_AcptComm_GP_ExamSetting_016.jsp");
	htBranch.put("uFM_AcptComm_GF_CanPrKd_001", 		"/method/exam_acpt/uFM_AcptComm_GF_CanPrKd_001.jsp");
	htBranch.put("uFM_AcptComm_GP_ComboSetting_002", 		"/method/exam_acpt/uFM_AcptComm_GP_ComboSetting_002.jsp");
	htBranch.put("uFM_AcptComm_GP_ItemList_020", 		"/method/exam_acpt/uFM_AcptComm_GP_ItemList_020.jsp");
	htBranch.put("uFM_AcptComm_GP_ItemList_021", 		"/method/exam_acpt/uFM_AcptComm_GP_ItemList_021.jsp");
	htBranch.put("uFM_AcptComm_GP_CnrtList_001", 		"/method/exam_acpt/uFM_AcptComm_GP_CnrtList_001.jsp");
	htBranch.put("uFM_AcptComm_GP_ItemList_019", 		"/method/exam_acpt/uFM_AcptComm_GP_ItemList_019.jsp");
	htBranch.put("uFM_AcptComm_GP_ExamSetting_005", 		"/method/exam_acpt/uFM_AcptComm_GP_ExamSetting_005.jsp");
	htBranch.put("uFM_AcptComm_GP_CnrtList_003", 		"/method/exam_acpt/uFM_AcptComm_GP_CnrtList_003.jsp");
	htBranch.put("uFM_AcptComm_GP_CnrtList_002", 		"/method/exam_acpt/uFM_AcptComm_GP_CnrtList_002.jsp");
	htBranch.put("uFM_AcptComm_GP_ItemList_018", 		"/method/exam_acpt/uFM_AcptComm_GP_ItemList_018.jsp");
	htBranch.put("uFM_AcptComm_GP_ItemList_022", 		"/method/exam_acpt/uFM_AcptComm_GP_ItemList_022.jsp");
	htBranch.put("uFM_AcptComm_GP_ItemList_015", 		"/method/exam_acpt/uFM_AcptComm_GP_ItemList_015.jsp");
	htBranch.put("uFM_AcptComm_GP_ItemList_014", 		"/method/exam_acpt/uFM_AcptComm_GP_ItemList_014.jsp");
	htBranch.put("uExam_Acpt_UP_SpclMngt_001", 		"/method/exam_acpt/uExam_Acpt_UP_SpclMngt_001.jsp");
	htBranch.put("uFM_AcptComm_GP_ItemList_005", 		"/method/exam_acpt/uFM_AcptComm_GP_ItemList_005.jsp");
	htBranch.put("uFM_AcptComm_GP_ItemList_016", 		"/method/exam_acpt/uFM_AcptComm_GP_ItemList_016.jsp");
	htBranch.put("uExam_Acpt_AlvAcptDblClick_002", 		"/method/exam_acpt/uExam_Acpt_AlvAcptDblClick_002.jsp");
	htBranch.put("uFM_AcptComm_GP_ExamList_007", 		"/method/exam_acpt/uFM_AcptComm_GP_ExamList_007.jsp");
	htBranch.put("uFM_AcptComm_GP_ExamSetting_006", 		"/method/exam_acpt/uFM_AcptComm_GP_ExamSetting_006.jsp");
	htBranch.put("uFM_AcptComm_GP_ExamList_006", 		"/method/exam_acpt/uFM_AcptComm_GP_ExamList_006.jsp");
	htBranch.put("uFM_AcptComm_GP_ItemList_017", 		"/method/exam_acpt/uFM_AcptComm_GP_ItemList_017.jsp");
	htBranch.put("uFM_AcptComm_GF_UdtOneColumn_001", 		"/method/exam_acpt/uFM_AcptComm_GF_UdtOneColumn_001.jsp");
	htBranch.put("uFM_AcptComm_GP_ExamList_004", 		"/method/exam_acpt/uFM_AcptComm_GP_ExamList_004.jsp");
	htBranch.put("uFM_AcptComm_GF_FindHoliday_001", 		"/method/exam_acpt/uFM_AcptComm_GF_FindHoliday_001.jsp");
	htBranch.put("uFM_AcptComm_GF_SmsSearch_001", 		"/method/exam_acpt/uFM_AcptComm_GF_SmsSearch_001.jsp");
	htBranch.put("uFM_AcptComm_GF_SmsDelete_001", 		"/method/exam_acpt/uFM_AcptComm_GF_SmsDelete_001.jsp");
	htBranch.put("uFM_AcptComm_GF_SmsSave_001", 		"/method/exam_acpt/uFM_AcptComm_GF_SmsSave_001.jsp");
	htBranch.put("uFM_AcptComm_GF_UdtOcsSno_001", 		"/method/exam_acpt/uFM_AcptComm_GF_UdtOcsSno_001.jsp");
	htBranch.put("uFM_AcptComm_GP_Psnl_Memo_001", 		"/method/exam_acpt/uFM_AcptComm_GP_Psnl_Memo_001.jsp");
	htBranch.put("uFM_AcptComm_GF_SaveExamItem_002", 		"/method/exam_acpt/uFM_AcptComm_GF_SaveExamItem_002.jsp");
	htBranch.put("uFM_AcptComm_GF_FindRsvtItem_002", 		"/method/exam_acpt/uFM_AcptComm_GF_FindRsvtItem_002.jsp");
	htBranch.put("uFM_AcptComm_GF_FindRsltItem_002", 		"/method/exam_acpt/uFM_AcptComm_GF_FindRsltItem_002.jsp");
	htBranch.put("uFM_AcptComm_GP_CodeSearching_001", 		"/method/exam_acpt/uFM_AcptComm_GP_CodeSearching_001.jsp");
	htBranch.put("uFM_AcptComm_GP_ExamList_011", 		"/method/exam_acpt/uFM_AcptComm_GP_ExamList_011.jsp");
%>
