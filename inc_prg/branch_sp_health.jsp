<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%
	htBranch.put("uSP_Health_RzBmpButton4Click_001", 		"/method/sp_health/uSP_Health_RzBmpButton4Click_001.jsp");
	htBranch.put("uSP_HEALTH_ITEM_RECHK_btnSearchClick_001", 		"/method/sp_health/uSP_HEALTH_ITEM_RECHK_btnSearchClick_001.jsp");
	htBranch.put("uSP_Health_UP_MATTGridDisplay_2cha_001", 		"/method/sp_health/uSP_Health_UP_MATTGridDisplay_2cha_001.jsp");
	htBranch.put("uSP_Health_UP_MATTGridDisplay_2cha_002", 		"/method/sp_health/uSP_Health_UP_MATTGridDisplay_2cha_002.jsp");
	htBranch.put("uSP_Health_UP_MATTGridDisplay_2cha_004", 		"/method/sp_health/uSP_Health_UP_MATTGridDisplay_2cha_004.jsp");
	htBranch.put("uSP_Health_UP_MATTGridDisplay_2cha_003", 		"/method/sp_health/uSP_Health_UP_MATTGridDisplay_2cha_003.jsp");
	htBranch.put("uSP_Health_UF_SP2CHA_CREATE_004", 		"/method/sp_health/uSP_Health_UF_SP2CHA_CREATE_004.jsp");
	htBranch.put("uSP_Health_UF_SP2CHA_CREATE_007", 		"/method/sp_health/uSP_Health_UF_SP2CHA_CREATE_007.jsp");
	htBranch.put("uSP_Health_UF_SP2CHA_CREATE_008", 		"/method/sp_health/uSP_Health_UF_SP2CHA_CREATE_008.jsp");
	htBranch.put("uSP_Health_UF_SP2CHA_CREATE_009", 		"/method/sp_health/uSP_Health_UF_SP2CHA_CREATE_009.jsp");
	htBranch.put("uSP_Health_UF_SP2CHA_CREATE_011", 		"/method/sp_health/uSP_Health_UF_SP2CHA_CREATE_011.jsp");
	htBranch.put("uSP_Health_UF_SP2CHA_CREATE_012", 		"/method/sp_health/uSP_Health_UF_SP2CHA_CREATE_012.jsp");
	htBranch.put("uSP_Health_UF_SP2CHA_CREATE_015", 		"/method/sp_health/uSP_Health_UF_SP2CHA_CREATE_015.jsp");
	htBranch.put("uSP_Health_UF_SP2CHA_CREATE_016", 		"/method/sp_health/uSP_Health_UF_SP2CHA_CREATE_016.jsp");
	htBranch.put("uSP_Health_UF_SP2CHA_CREATE_010", 		"/method/sp_health/uSP_Health_UF_SP2CHA_CREATE_010.jsp");
	htBranch.put("uSP_Health_UF_SP2CHA_CREATE_003", 		"/method/sp_health/uSP_Health_UF_SP2CHA_CREATE_003.jsp");
	htBranch.put("uSP_Health_UF_SP2CHA_CREATE_013", 		"/method/sp_health/uSP_Health_UF_SP2CHA_CREATE_013.jsp");
	htBranch.put("uSP_Health_UF_SP2CHA_CREATE_014", 		"/method/sp_health/uSP_Health_UF_SP2CHA_CREATE_014.jsp");
	htBranch.put("uSP_Health_UF_SP2CHA_CREATE_006", 		"/method/sp_health/uSP_Health_UF_SP2CHA_CREATE_006.jsp");
	htBranch.put("uSP_Health_UF_SP2CHA_CREATE_005", 		"/method/sp_health/uSP_Health_UF_SP2CHA_CREATE_005.jsp");
	htBranch.put("uSP_Health_UF_SP2CHA_CREATE_002", 		"/method/sp_health/uSP_Health_UF_SP2CHA_CREATE_002.jsp");
	htBranch.put("uSP_Health_UF_SP2CHA_CREATE_001", 		"/method/sp_health/uSP_Health_UF_SP2CHA_CREATE_001.jsp");
	htBranch.put("uSP_Health_GridSYMPTOM1CellChanging_001", 		"/method/sp_health/uSP_Health_GridSYMPTOM1CellChanging_001.jsp");
	htBranch.put("uSP_Health_BtnPANJUNG_SaveClick_002", 		"/method/sp_health/uSP_Health_BtnPANJUNG_SaveClick_002.jsp");
	htBranch.put("uSP_Health_BtnPANJUNG_SaveClick_003", 		"/method/sp_health/uSP_Health_BtnPANJUNG_SaveClick_003.jsp");
	htBranch.put("uSP_Health_BtnPANJUNG_SaveClick_001", 		"/method/sp_health/uSP_Health_BtnPANJUNG_SaveClick_001.jsp");
	htBranch.put("uSP_Health_GirdSPITEMClickCell_002", 		"/method/sp_health/uSP_Health_GirdSPITEMClickCell_002.jsp");
	htBranch.put("uSP_Health_UP_ITEM_001", 		"/method/sp_health/uSP_Health_UP_ITEM_001.jsp");
	htBranch.put("uSP_Health_UP_ITEM_Complete_001", 		"/method/sp_health/uSP_Health_UP_ITEM_Complete_001.jsp");
	htBranch.put("uSP_Health_UP_ITEM_Complete_002", 		"/method/sp_health/uSP_Health_UP_ITEM_Complete_002.jsp");
	htBranch.put("uSP_Health_ufGetPanJungItem_001", 		"/method/sp_health/uSP_Health_ufGetPanJungItem_001.jsp");
	htBranch.put("uSP_Health_GrdEXAM_ACPTSelectionChanged_018", 		"/method/sp_health/uSP_Health_GrdEXAM_ACPTSelectionChanged_018.jsp");
	htBranch.put("uSP_Health_GrdEXAM_ACPTSelectionChanged_019", 		"/method/sp_health/uSP_Health_GrdEXAM_ACPTSelectionChanged_019.jsp");
	htBranch.put("uSP_Health_GirdSPITEMClickCell_001", 		"/method/sp_health/uSP_Health_GirdSPITEMClickCell_001.jsp");
	htBranch.put("uSP_HEALTH_ITEM_RECHK_UP_GirdDisplay_005", 		"/method/sp_health/uSP_HEALTH_ITEM_RECHK_UP_GirdDisplay_005.jsp");
	htBranch.put("uSP_Health_BtnSave_DentalClick_005", 		"/method/sp_health/uSP_Health_BtnSave_DentalClick_005.jsp");
	htBranch.put("uSP_Health_CmbXRay_RsltChange_001", 		"/method/sp_health/uSP_Health_CmbXRay_RsltChange_001.jsp");
	htBranch.put("uSP_Health_GrdEXAM_ACPTSelectionChanged_005", 		"/method/sp_health/uSP_Health_GrdEXAM_ACPTSelectionChanged_005.jsp");
	htBranch.put("uSP_HEALTH_HPRI_BtnSaveClick_001", 		"/method/sp_health/uSP_HEALTH_HPRI_BtnSaveClick_001.jsp");
	htBranch.put("uSP_HEALTH_HPRI_FormShow_001", 		"/method/sp_health/uSP_HEALTH_HPRI_FormShow_001.jsp");
	htBranch.put("uSP_HEALTH_HPRI_BtnDeleteClick_001", 		"/method/sp_health/uSP_HEALTH_HPRI_BtnDeleteClick_001.jsp");
	htBranch.put("uSP_Health_BtnSave_BaseClick_008", 		"/method/sp_health/uSP_Health_BtnSave_BaseClick_008.jsp");
	htBranch.put("uSP_Health_BtnPast_PanjungClick_001", 		"/method/sp_health/uSP_Health_BtnPast_PanjungClick_001.jsp");
	htBranch.put("uSP_HEALTH_PAST_PANJ_UP_ITEMGridDisplay_001", 		"/method/sp_health/uSP_HEALTH_PAST_PANJ_UP_ITEMGridDisplay_001.jsp");
	htBranch.put("uSP_HEALTH_PAST_PANJ_UP_ITEMGridDisplay_002", 		"/method/sp_health/uSP_HEALTH_PAST_PANJ_UP_ITEMGridDisplay_002.jsp");
	htBranch.put("uSP_HEALTH_PAST_PANJ_FormShow_001", 		"/method/sp_health/uSP_HEALTH_PAST_PANJ_FormShow_001.jsp");
	htBranch.put("uSP_HEALTH_PAST_PANJ_UP_MATTGridDisplay_001", 		"/method/sp_health/uSP_HEALTH_PAST_PANJ_UP_MATTGridDisplay_001.jsp");
	htBranch.put("uSP_Health_GrdEXAM_ACPTSelectionChanged_003", 		"/method/sp_health/uSP_Health_GrdEXAM_ACPTSelectionChanged_003.jsp");
	htBranch.put("uSP_Health_UP_GridDisplay_001", 		"/method/sp_health/uSP_Health_UP_GridDisplay_001.jsp");
	htBranch.put("uSP_Health_UP_GridDisplay_002", 		"/method/sp_health/uSP_Health_UP_GridDisplay_002.jsp");
	htBranch.put("uSP_Health_UP_Score_Set_001", 		"/method/sp_health/uSP_Health_UP_Score_Set_001.jsp");
	htBranch.put("uSP_Health_UP_GridDisplay_003", 		"/method/sp_health/uSP_Health_UP_GridDisplay_003.jsp");
	htBranch.put("uSP_HEALTH_CANCEL_FormShow_001", 		"/method/sp_health/uSP_HEALTH_CANCEL_FormShow_001.jsp");
	htBranch.put("uSP_HEALTH_CANCEL_BtnDeleteClick_001", 		"/method/sp_health/uSP_HEALTH_CANCEL_BtnDeleteClick_001.jsp");
	htBranch.put("uSP_HEALTH_CANCEL_RzDelete_ALLClick_001", 		"/method/sp_health/uSP_HEALTH_CANCEL_RzDelete_ALLClick_001.jsp");
	htBranch.put("uSP_HEALTH_CANCEL_BtnSaveClick_001", 		"/method/sp_health/uSP_HEALTH_CANCEL_BtnSaveClick_001.jsp");
	htBranch.put("uSP_Health_BtnDefultClick_001", 		"/method/sp_health/uSP_Health_BtnDefultClick_001.jsp");
	htBranch.put("uSP_Health_XML_COM_004", 		"/method/sp_health/uSP_Health_XML_COM_004.jsp");
	htBranch.put("uSP_Health_GrdEXAM_ACPTSelectionChanged_004", 		"/method/sp_health/uSP_Health_GrdEXAM_ACPTSelectionChanged_004.jsp");
	htBranch.put("uSP_HEALTH_ITEM_RECHK_UP_GirdDisplay_003", 		"/method/sp_health/uSP_HEALTH_ITEM_RECHK_UP_GirdDisplay_003.jsp");
	htBranch.put("uSP_Health_FormInit_003", 		"/method/sp_health/uSP_Health_FormInit_003.jsp");
	htBranch.put("uSP_Health_XML_COM_002", 		"/method/sp_health/uSP_Health_XML_COM_002.jsp");
	htBranch.put("uSP_Health_ufRsltAutoCalc_004", 		"/method/sp_health/uSP_Health_ufRsltAutoCalc_004.jsp");
	htBranch.put("uSP_Health_ufRsltAutoCalc_003", 		"/method/sp_health/uSP_Health_ufRsltAutoCalc_003.jsp");
	htBranch.put("uSP_Health_ufRsltAutoCalc_002", 		"/method/sp_health/uSP_Health_ufRsltAutoCalc_002.jsp");
	htBranch.put("uSP_Health_ufRsltAutoCalc_001", 		"/method/sp_health/uSP_Health_ufRsltAutoCalc_001.jsp");
	htBranch.put("uSP_DOCT_PJ_APPLY_GridBookmarkSelectionChanged_001", 		"/method/sp_health/uSP_DOCT_PJ_APPLY_GridBookmarkSelectionChanged_001.jsp");
	htBranch.put("uSP_DOCT_PJ_APPLY_FormShow_001", 		"/method/sp_health/uSP_DOCT_PJ_APPLY_FormShow_001.jsp");
	htBranch.put("uSP_DOCT_PJ_APPLY_BtnDeleteClick_001", 		"/method/sp_health/uSP_DOCT_PJ_APPLY_BtnDeleteClick_001.jsp");
	htBranch.put("uSP_DOCT_PJ_APPLY_RzBmpButton1Click_001", 		"/method/sp_health/uSP_DOCT_PJ_APPLY_RzBmpButton1Click_001.jsp");
	htBranch.put("uSP_DOCT_PJ_APPLY_UF_Save_001", 		"/method/sp_health/uSP_DOCT_PJ_APPLY_UF_Save_001.jsp");
	htBranch.put("uSP_Health_BtnSave_BaseClick_009", 		"/method/sp_health/uSP_Health_BtnSave_BaseClick_009.jsp");
	htBranch.put("uSP_Health_GrdEXAM_ACPTSelectionChanged_010", 		"/method/sp_health/uSP_Health_GrdEXAM_ACPTSelectionChanged_010.jsp");
	htBranch.put("uSP_Health_GrdEXAM_ACPTSelectionChanged_009", 		"/method/sp_health/uSP_Health_GrdEXAM_ACPTSelectionChanged_009.jsp");
	htBranch.put("uSP_Health_RzComboBox2Change_001", 		"/method/sp_health/uSP_Health_RzComboBox2Change_001.jsp");
	htBranch.put("uSP_Health_RzBmpButton5Click_002", 		"/method/sp_health/uSP_Health_RzBmpButton5Click_002.jsp");
	htBranch.put("uSP_Health_UP_DentalDisplay_001", 		"/method/sp_health/uSP_Health_UP_DentalDisplay_001.jsp");
	htBranch.put("uSP_HEALTH_ITEM_RECHK_UP_GirdAddDisplay_002", 		"/method/sp_health/uSP_HEALTH_ITEM_RECHK_UP_GirdAddDisplay_002.jsp");
	htBranch.put("uSP_HEALTH_ITEM_RECHK_UP_GirdAddDisplay_001", 		"/method/sp_health/uSP_HEALTH_ITEM_RECHK_UP_GirdAddDisplay_001.jsp");
	htBranch.put("uSP_HEALTH_ITEM_RECHK_BtnSaveClick_002", 		"/method/sp_health/uSP_HEALTH_ITEM_RECHK_BtnSaveClick_002.jsp");
	htBranch.put("uSP_HEALTH_ITEM_RECHK_UP_GirdDisplay_004", 		"/method/sp_health/uSP_HEALTH_ITEM_RECHK_UP_GirdDisplay_004.jsp");
	htBranch.put("uSP_HEALTH_ITEM_RECHK_BtnSaveClick_001", 		"/method/sp_health/uSP_HEALTH_ITEM_RECHK_BtnSaveClick_001.jsp");
	htBranch.put("uSP_HEALTH_ITEM_RECHK_FormShow_001", 		"/method/sp_health/uSP_HEALTH_ITEM_RECHK_FormShow_001.jsp");
	htBranch.put("uSP_HEALTH_ITEM_RECHK_BtnDeleteClick_001", 		"/method/sp_health/uSP_HEALTH_ITEM_RECHK_BtnDeleteClick_001.jsp");
	htBranch.put("uSP_Health_ChkBoxTPanClick_005", 		"/method/sp_health/uSP_Health_ChkBoxTPanClick_005.jsp");
	htBranch.put("uSP_HEALTH_ITEM_RECHK_BtnSaveClick_003", 		"/method/sp_health/uSP_HEALTH_ITEM_RECHK_BtnSaveClick_003.jsp");
	htBranch.put("uSP_Health_XML_COM_008", 		"/method/sp_health/uSP_Health_XML_COM_008.jsp");
	htBranch.put("uSP_Health_ChkBoxTPanClick_003", 		"/method/sp_health/uSP_Health_ChkBoxTPanClick_003.jsp");
	htBranch.put("uSP_Health_UP_RECHECKGridDisplay_001", 		"/method/sp_health/uSP_Health_UP_RECHECKGridDisplay_001.jsp");
	htBranch.put("uSP_Health_BtnSave_Base_PWClick_001", 		"/method/sp_health/uSP_Health_BtnSave_Base_PWClick_001.jsp");
	htBranch.put("uSP_Health_GrdEXAM_ACPTSelectionChanged_014", 		"/method/sp_health/uSP_Health_GrdEXAM_ACPTSelectionChanged_014.jsp");
	htBranch.put("uSP_Health_BtnSave_Base_PWClick_002", 		"/method/sp_health/uSP_Health_BtnSave_Base_PWClick_002.jsp");
	htBranch.put("uSP_Health_GrdEXAM_ACPTSelectionChanged_013", 		"/method/sp_health/uSP_Health_GrdEXAM_ACPTSelectionChanged_013.jsp");
	htBranch.put("uSP_Health_GrdEXAM_ACPTSelectionChanged_017", 		"/method/sp_health/uSP_Health_GrdEXAM_ACPTSelectionChanged_017.jsp");
	htBranch.put("uSP_Health_BtnEtc_SaveClick_002", 		"/method/sp_health/uSP_Health_BtnEtc_SaveClick_002.jsp");
	htBranch.put("uSP_Health_GrdEXAM_ACPTSelectionChanged_008", 		"/method/sp_health/uSP_Health_GrdEXAM_ACPTSelectionChanged_008.jsp");
	htBranch.put("uSP_Health_GrdEXAM_ACPTSelectionChanged_015", 		"/method/sp_health/uSP_Health_GrdEXAM_ACPTSelectionChanged_015.jsp");
	htBranch.put("uSP_Health_XML_COM_006", 		"/method/sp_health/uSP_Health_XML_COM_006.jsp");
	htBranch.put("uSP_Health_XML_COM_005", 		"/method/sp_health/uSP_Health_XML_COM_005.jsp");
	htBranch.put("uSP_Health_GrdEXAM_ACPTSelectionChanged_012", 		"/method/sp_health/uSP_Health_GrdEXAM_ACPTSelectionChanged_012.jsp");
	htBranch.put("uSP_Health_XML_COM_007", 		"/method/sp_health/uSP_Health_XML_COM_007.jsp");
	htBranch.put("uSP_Health_BtnSave_DentalClick_002", 		"/method/sp_health/uSP_Health_BtnSave_DentalClick_002.jsp");
	htBranch.put("uSP_Health_BtnSave_DentalClick_001", 		"/method/sp_health/uSP_Health_BtnSave_DentalClick_001.jsp");
	htBranch.put("uSP_Health_GrdEXAM_ACPTSelectionChanged_001", 		"/method/sp_health/uSP_Health_GrdEXAM_ACPTSelectionChanged_001.jsp");
	htBranch.put("uSP_Health_GrdEXAM_ACPTSelectionChanged_016", 		"/method/sp_health/uSP_Health_GrdEXAM_ACPTSelectionChanged_016.jsp");
	htBranch.put("uSP_Health_ChkBoxTPanClick_004", 		"/method/sp_health/uSP_Health_ChkBoxTPanClick_004.jsp");
	htBranch.put("uSP_Health_ChkBoxTPanClick_002", 		"/method/sp_health/uSP_Health_ChkBoxTPanClick_002.jsp");
	htBranch.put("uSP_Health_UF_Save_001", 		"/method/sp_health/uSP_Health_UF_Save_001.jsp");
	htBranch.put("uSP_Health_UP_ITEM_Check_001", 		"/method/sp_health/uSP_Health_UP_ITEM_Check_001.jsp");
	htBranch.put("uSP_Health_UP_ITEM_Check_002", 		"/method/sp_health/uSP_Health_UP_ITEM_Check_002.jsp");
	htBranch.put("uSP_Health_XML_COM_003", 		"/method/sp_health/uSP_Health_XML_COM_003.jsp");
	htBranch.put("uSP_Health_UP_GirdSet_001", 		"/method/sp_health/uSP_Health_UP_GirdSet_001.jsp");
	htBranch.put("uSP_Health_UP_MarkComBoDisplay_001", 		"/method/sp_health/uSP_Health_UP_MarkComBoDisplay_001.jsp");
	htBranch.put("uSP_HEALTH_HPRI_GridHgihPriceSelectionChanged_001", 		"/method/sp_health/uSP_HEALTH_HPRI_GridHgihPriceSelectionChanged_001.jsp");
	htBranch.put("uSP_DOCT_PJ_APPLY_EdtSBP_MATT_CDChange_001", 		"/method/sp_health/uSP_DOCT_PJ_APPLY_EdtSBP_MATT_CDChange_001.jsp");
	htBranch.put("uSP_Health_GrdEXAM_ACPTSelectionChanged_020", 		"/method/sp_health/uSP_Health_GrdEXAM_ACPTSelectionChanged_020.jsp");
	htBranch.put("uSP_Health_FormInit_001", 		"/method/sp_health/uSP_Health_FormInit_001.jsp");
	htBranch.put("uSP_Health_Btn_MunjinClick_001", 		"/method/sp_health/uSP_Health_Btn_MunjinClick_001.jsp");
	htBranch.put("uSP_DOCT_PJ_APPLY_GridBookmarkDblClick_001", 		"/method/sp_health/uSP_DOCT_PJ_APPLY_GridBookmarkDblClick_001.jsp");
	htBranch.put("uSP_Health_NEWAutoPanjung_Detail_006", 		"/method/sp_health/uSP_Health_NEWAutoPanjung_Detail_006.jsp");
	htBranch.put("uSP_Health_Button3Click_002", 		"/method/sp_health/uSP_Health_Button3Click_002.jsp");
	htBranch.put("uSP_Health_Button3Click_004", 		"/method/sp_health/uSP_Health_Button3Click_004.jsp");
	htBranch.put("uSP_Health_Button3Click_003", 		"/method/sp_health/uSP_Health_Button3Click_003.jsp");
	htBranch.put("uSP_Health_NEWAutoPanjung_003", 		"/method/sp_health/uSP_Health_NEWAutoPanjung_003.jsp");
	htBranch.put("uSP_Health_NEWAutoPanjung_004", 		"/method/sp_health/uSP_Health_NEWAutoPanjung_004.jsp");
	htBranch.put("uSP_Health_NEWAutoPanjung_Detail_010", 		"/method/sp_health/uSP_Health_NEWAutoPanjung_Detail_010.jsp");
	htBranch.put("uSP_Health_NEWAutoPanjung_Detail_012", 		"/method/sp_health/uSP_Health_NEWAutoPanjung_Detail_012.jsp");
	htBranch.put("uSP_Health_Button3Click_001", 		"/method/sp_health/uSP_Health_Button3Click_001.jsp");
	htBranch.put("uSP_Health_NEWAutoPanjung_Detail_007", 		"/method/sp_health/uSP_Health_NEWAutoPanjung_Detail_007.jsp");
	htBranch.put("uSP_Health_NEWAutoPanjung_Detail_002", 		"/method/sp_health/uSP_Health_NEWAutoPanjung_Detail_002.jsp");
	htBranch.put("uSP_Health_Button3Click_006", 		"/method/sp_health/uSP_Health_Button3Click_006.jsp");
	htBranch.put("uSP_Health_Button3Click_007", 		"/method/sp_health/uSP_Health_Button3Click_007.jsp");
	htBranch.put("uSP_Health_NEWAutoPanjung_001", 		"/method/sp_health/uSP_Health_NEWAutoPanjung_001.jsp");
	htBranch.put("uSP_Health_NEWAutoPanjung_Detail_008", 		"/method/sp_health/uSP_Health_NEWAutoPanjung_Detail_008.jsp");
	htBranch.put("uSP_Health_Button3Click_005", 		"/method/sp_health/uSP_Health_Button3Click_005.jsp");
	htBranch.put("uSP_Health_NEWAutoPanjung_Detail_009", 		"/method/sp_health/uSP_Health_NEWAutoPanjung_Detail_009.jsp");
	htBranch.put("uSP_Health_NEWAutoPanjung_Detail_003", 		"/method/sp_health/uSP_Health_NEWAutoPanjung_Detail_003.jsp");
	htBranch.put("uSP_Health_NEWAutoPanjung_Detail_013", 		"/method/sp_health/uSP_Health_NEWAutoPanjung_Detail_013.jsp");
	htBranch.put("uSP_Health_Button3Click_008", 		"/method/sp_health/uSP_Health_Button3Click_008.jsp");
	htBranch.put("uSP_Health_Button3Click_009", 		"/method/sp_health/uSP_Health_Button3Click_009.jsp");
	htBranch.put("uSP_Health_NEWAutoPanjung_Detail_011", 		"/method/sp_health/uSP_Health_NEWAutoPanjung_Detail_011.jsp");
	htBranch.put("uSP_Health_NEWAutoPanjung_Detail_005", 		"/method/sp_health/uSP_Health_NEWAutoPanjung_Detail_005.jsp");
	htBranch.put("uSP_Health_NEWAutoPanjung_Detail_005", 		"/method/sp_health/uSP_Health_NEWAutoPanjung_Detail_005.jsp");
	htBranch.put("uSP_Health_NEWAutoPanjung_Detail_004", 		"/method/sp_health/uSP_Health_NEWAutoPanjung_Detail_004.jsp");
	htBranch.put("uSP_Health_NEWAutoPanjung_Detail_001", 		"/method/sp_health/uSP_Health_NEWAutoPanjung_Detail_001.jsp");
	htBranch.put("uSP_Health_NEWAutoPanjung_002", 		"/method/sp_health/uSP_Health_NEWAutoPanjung_002.jsp");
	htBranch.put("uSP_Health_GrdEXAM_ACPTSelectionChanged_023", 		"/method/sp_health/uSP_Health_GrdEXAM_ACPTSelectionChanged_023.jsp");
	htBranch.put("uSP_Health_UF_Panjung_Del_002", 		"/method/sp_health/uSP_Health_UF_Panjung_Del_002.jsp");
	htBranch.put("uSP_Health_UF_Panjung_Del_001", 		"/method/sp_health/uSP_Health_UF_Panjung_Del_001.jsp");
	htBranch.put("uSP_Health_BtnSave_BaseClick_002", 		"/method/sp_health/uSP_Health_BtnSave_BaseClick_002.jsp");
	htBranch.put("uSP_Health_UF_Save_005", 		"/method/sp_health/uSP_Health_UF_Save_005.jsp");
	htBranch.put("uSP_Health_UF_Save_004", 		"/method/sp_health/uSP_Health_UF_Save_004.jsp");
	htBranch.put("uSP_Health_BtnSave_BaseClick_001", 		"/method/sp_health/uSP_Health_BtnSave_BaseClick_001.jsp");
	htBranch.put("uSP_Health_GrdEXAM_ACPTSelectionChanged_025", 		"/method/sp_health/uSP_Health_GrdEXAM_ACPTSelectionChanged_025.jsp");
	htBranch.put("uSP_Health_UF_Matt_Item_Maching_001", 		"/method/sp_health/uSP_Health_UF_Matt_Item_Maching_001.jsp");
	htBranch.put("uSP_Health_UF_ITEM_VLDT_Set_001", 		"/method/sp_health/uSP_Health_UF_ITEM_VLDT_Set_001.jsp");
	htBranch.put("uSP_Health_BtnSave_BaseClick_005", 		"/method/sp_health/uSP_Health_BtnSave_BaseClick_005.jsp");
	htBranch.put("uSP_Health_BtnSave_BaseClick_007", 		"/method/sp_health/uSP_Health_BtnSave_BaseClick_007.jsp");
	htBranch.put("uSP_Health_GrdEXAM_ACPTSelectionChanged_006", 		"/method/sp_health/uSP_Health_GrdEXAM_ACPTSelectionChanged_006.jsp");
	htBranch.put("uSP_Health_BtnSave_DentalClick_004", 		"/method/sp_health/uSP_Health_BtnSave_DentalClick_004.jsp");
	htBranch.put("uSP_Health_XML_COM_001", 		"/method/sp_health/uSP_Health_XML_COM_001.jsp");
	htBranch.put("uSP_Health_BtnSave_BaseClick_004", 		"/method/sp_health/uSP_Health_BtnSave_BaseClick_004.jsp");
	htBranch.put("uSP_Health_UP_SqlTextSet_001", 		"/method/sp_health/uSP_Health_UP_SqlTextSet_001.jsp");
	htBranch.put("uSP_Health_RzCheckBox2Click_004", 		"/method/sp_health/uSP_Health_RzCheckBox2Click_004.jsp");
	htBranch.put("uSP_Health_RzCheckBox2Click_003", 		"/method/sp_health/uSP_Health_RzCheckBox2Click_003.jsp");
	htBranch.put("uSP_Health_RzCheckBox2Click_001", 		"/method/sp_health/uSP_Health_RzCheckBox2Click_001.jsp");
	htBranch.put("uSP_Health_RzCheckBox2Click_002", 		"/method/sp_health/uSP_Health_RzCheckBox2Click_002.jsp");
	htBranch.put("uSP_Health_ChkBoxTPanClick_001", 		"/method/sp_health/uSP_Health_ChkBoxTPanClick_001.jsp");
	htBranch.put("uSP_Health_RzBmpButton3Click_001", 		"/method/sp_health/uSP_Health_RzBmpButton3Click_001.jsp");
	htBranch.put("uSP_Health_UF_Save_002", 		"/method/sp_health/uSP_Health_UF_Save_002.jsp");
	htBranch.put("uSP_Health_BtnPANJUNG_SaveClick_004", 		"/method/sp_health/uSP_Health_BtnPANJUNG_SaveClick_004.jsp");
	htBranch.put("uSP_Health_RzBmpButton5Click_001", 		"/method/sp_health/uSP_Health_RzBmpButton5Click_001.jsp");
	htBranch.put("uSP_Health_UP_ITEMGridDisplay_001", 		"/method/sp_health/uSP_Health_UP_ITEMGridDisplay_001.jsp");
	htBranch.put("uSP_HEALTH_ITEM_RECHK_UP_GirdDisplay_002", 		"/method/sp_health/uSP_HEALTH_ITEM_RECHK_UP_GirdDisplay_002.jsp");
	htBranch.put("uSP_Health_FormInit_002", 		"/method/sp_health/uSP_Health_FormInit_002.jsp");
	htBranch.put("uSP_Health_UP_OnClick_001", 		"/method/sp_health/uSP_Health_UP_OnClick_001.jsp");
	htBranch.put("uSP_HEALTH_ITEM_RECHK_UP_GirdDisplay_001", 		"/method/sp_health/uSP_HEALTH_ITEM_RECHK_UP_GirdDisplay_001.jsp");
	htBranch.put("uSP_Health_GrdEXAM_ACPTSelectionChanged_002", 		"/method/sp_health/uSP_Health_GrdEXAM_ACPTSelectionChanged_002.jsp");
	htBranch.put("uSP_Health_GrdEXAM_ACPTSelectionChanged_026", 		"/method/sp_health/uSP_Health_GrdEXAM_ACPTSelectionChanged_026.jsp");
	htBranch.put("uSP_Health_UF_Save_006", 		"/method/sp_health/uSP_Health_UF_Save_006.jsp");
	htBranch.put("uView_item_UP_ExamSearching_001", 		"/method/sp_health/uView_item_UP_ExamSearching_001.jsp");
	htBranch.put("EQuestionnaire_upSaveNurionSpQuestionScore_003", 		"/method/sp_health/EQuestionnaire_upSaveNurionSpQuestionScore_003.jsp");
	htBranch.put("Sp_upSaveNurionSpQuestionScore_001", 		"/method/sp_health/Sp_upSaveNurionSpQuestionScore_001.jsp");
	htBranch.put("Sp_upSaveNurionSpQuestionScore_002", 		"/method/sp_health/Sp_upSaveNurionSpQuestionScore_002.jsp");
	htBranch.put("uSP_HEALTH_SP_STAUTOPANJ_001", 		"/method/sp_health/uSP_HEALTH_SP_STAUTOPANJ_001.jsp");
	htBranch.put("uSP_Health_UP_ITEM_Check_003", 		"/method/sp_health/uSP_Health_UP_ITEM_Check_003.jsp");
%>
