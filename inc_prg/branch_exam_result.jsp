<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%
	htBranch.put("uExam_Result_btnQstnSaveClick_003", 		"/method/exam_result/uExam_Result_btnQstnSaveClick_003.jsp");
	htBranch.put("uExam_Result_btnQstnSaveClick_001", 		"/method/exam_result/uExam_Result_btnQstnSaveClick_001.jsp");
	htBranch.put("uGen_Frst_Panj_ufFirYN_001", 		"/method/exam_result/uGen_Frst_Panj_ufFirYN_001.jsp");
	htBranch.put("uExam_Result_XML_COM_005", 		"/method/exam_result/uExam_Result_XML_COM_005.jsp");
	htBranch.put("uExam_Result_upSetFrstGenSort_001", 		"/method/exam_result/uExam_Result_upSetFrstGenSort_001.jsp");
	htBranch.put("uGen_Frst_Panj_upDelWorkPanj_001", 		"/method/exam_result/uGen_Frst_Panj_upDelWorkPanj_001.jsp");
	htBranch.put("uFind_Opin_upGetRslt_001", 		"/method/exam_result/uFind_Opin_upGetRslt_001.jsp");
	htBranch.put("uGen_Frst_Panj_upPanDateDoc_001", 		"/method/exam_result/uGen_Frst_Panj_upPanDateDoc_001.jsp");
	htBranch.put("uGen_Frst_Panj_ufpselrd_001", 		"/method/exam_result/uGen_Frst_Panj_ufpselrd_001.jsp");
	htBranch.put("uCancer_Rslt_ufGetEtcRslt_001", 		"/method/exam_result/uCancer_Rslt_ufGetEtcRslt_001.jsp");
	htBranch.put("uExam_Result_upGetRcpt_003", 		"/method/exam_result/uExam_Result_upGetRcpt_003.jsp");
	htBranch.put("upGetDietitian_001", 		"/method/exam_result/upGetDietitian_001.jsp");
	htBranch.put("QRCjkLife_DetailBand1BeforePrint_001", 		"/method/exam_result/QRCjkLife_DetailBand1BeforePrint_001.jsp");
	htBranch.put("QRCjkLife_DetailBand1BeforePrint_002", 		"/method/exam_result/QRCjkLife_DetailBand1BeforePrint_002.jsp");
	htBranch.put("uBld_Rslt_ufGetPanJung_001", 		"/method/exam_result/uBld_Rslt_ufGetPanJung_001.jsp");
	htBranch.put("uBld_Rslt_ufGetPanJung_002", 		"/method/exam_result/uBld_Rslt_ufGetPanJung_002.jsp");
	htBranch.put("uBld_Rslt_ufGetPanJung_003", 		"/method/exam_result/uBld_Rslt_ufGetPanJung_003.jsp");
	htBranch.put("uBld_Rslt_ufSaveBldRslt_002", 		"/method/exam_result/uBld_Rslt_ufSaveBldRslt_002.jsp");
	htBranch.put("uCancer_Rslt_2020_btnCncrCfrmClick_001", 		"/method/exam_result/uCancer_Rslt_2020_btnCncrCfrmClick_001.jsp");
	htBranch.put("uCancer_Rslt_2020_chkCncrCfrmMouseDown_001", 		"/method/exam_result/uCancer_Rslt_2020_chkCncrCfrmMouseDown_001.jsp");
	htBranch.put("uCancer_Rslt_2020_ufCancerLoadResult_003", 		"/method/exam_result/uCancer_Rslt_2020_ufCancerLoadResult_003.jsp");
	htBranch.put("uCancer_Rslt_2020_ufCancerSaveResult_002", 		"/method/exam_result/uCancer_Rslt_2020_ufCancerSaveResult_002.jsp");
	htBranch.put("uCancer_Rslt_2020_ufSaveBrstRslt_001", 		"/method/exam_result/uCancer_Rslt_2020_ufSaveBrstRslt_001.jsp");
	htBranch.put("uCancer_Rslt_2020_ufSaveColoRslt_001", 		"/method/exam_result/uCancer_Rslt_2020_ufSaveColoRslt_001.jsp");
	htBranch.put("uCancer_Rslt_2020_ufSaveCrvcRslt_001", 		"/method/exam_result/uCancer_Rslt_2020_ufSaveCrvcRslt_001.jsp");
	htBranch.put("uCancer_Rslt_2020_ufSaveLiverRslt_001", 		"/method/exam_result/uCancer_Rslt_2020_ufSaveLiverRslt_001.jsp");
	htBranch.put("uCancer_Rslt_2020_ufSaveLungRslt_001", 		"/method/exam_result/uCancer_Rslt_2020_ufSaveLungRslt_001.jsp");
	htBranch.put("uCancer_Rslt_2020_ufSaveStmcRslt_001", 		"/method/exam_result/uCancer_Rslt_2020_ufSaveStmcRslt_001.jsp");
	htBranch.put("uCancer_Rslt_2020_upGetBrstRslt_001", 		"/method/exam_result/uCancer_Rslt_2020_upGetBrstRslt_001.jsp");
	htBranch.put("uCancer_Rslt_2020_upGetColoRslt_001", 		"/method/exam_result/uCancer_Rslt_2020_upGetColoRslt_001.jsp");
	htBranch.put("uCancer_Rslt_2020_upGetCrvcRslt_001", 		"/method/exam_result/uCancer_Rslt_2020_upGetCrvcRslt_001.jsp");
	htBranch.put("uCancer_Rslt_2020_upGetIT_HOSPITAL_001", 		"/method/exam_result/uCancer_Rslt_2020_upGetIT_HOSPITAL_001.jsp");
	htBranch.put("uCancer_Rslt_2020_upGetLiverRslt_001", 		"/method/exam_result/uCancer_Rslt_2020_upGetLiverRslt_001.jsp");
	htBranch.put("uCancer_Rslt_2020_upGetLungRslt_001", 		"/method/exam_result/uCancer_Rslt_2020_upGetLungRslt_001.jsp");
	htBranch.put("uCancer_Rslt_2020_upGetStmcRslt_001", 		"/method/exam_result/uCancer_Rslt_2020_upGetStmcRslt_001.jsp");
	htBranch.put("uCancer_Rslt_2020_upSetskin_001", 		"/method/exam_result/uCancer_Rslt_2020_upSetskin_001.jsp");
	htBranch.put("uDevc_Rslt_ufSaveDevResult_001", 		"/method/exam_result/uDevc_Rslt_ufSaveDevResult_001.jsp");
	htBranch.put("uExam_Result_btnBldCfrmClick_001", 		"/method/exam_result/uExam_Result_btnBldCfrmClick_001.jsp");
	htBranch.put("uExam_Result_btnBldCfrmClick_002", 		"/method/exam_result/uExam_Result_btnBldCfrmClick_002.jsp");
	htBranch.put("uExam_Result_btnDssHstrClick_001", 		"/method/exam_result/uExam_Result_btnDssHstrClick_001.jsp");
	htBranch.put("uExam_Result_btnTotalCfrmClick_001", 		"/method/exam_result/uExam_Result_btnTotalCfrmClick_001.jsp");
	htBranch.put("uExam_Result_chkBld_CfrmMouseDown_001", 		"/method/exam_result/uExam_Result_chkBld_CfrmMouseDown_001.jsp");
	htBranch.put("uExam_Result_chkDev_CfrmMouseDown_001", 		"/method/exam_result/uExam_Result_chkDev_CfrmMouseDown_001.jsp");
	htBranch.put("uExam_Result_chkScndCfrmMouseDown_001", 		"/method/exam_result/uExam_Result_chkScndCfrmMouseDown_001.jsp");
	htBranch.put("uExam_Result_chkTotalCfrmMouseDown_001", 		"/method/exam_result/uExam_Result_chkTotalCfrmMouseDown_001.jsp");
	htBranch.put("uExam_Result_mniFirConfirmNOClick_001", 		"/method/exam_result/uExam_Result_mniFirConfirmNOClick_001.jsp");
	htBranch.put("uExam_Result_upGetHotKey_001", 		"/method/exam_result/uExam_Result_upGetHotKey_001.jsp");
	htBranch.put("uExam_Result_upSetComboBox_001", 		"/method/exam_result/uExam_Result_upSetComboBox_001.jsp");
	htBranch.put("uExam_Result_upSetComboBox_0021", 		"/method/exam_result/uExam_Result_upSetComboBox_0021.jsp");
	htBranch.put("uExam_Result_upSetComboBox_003", 		"/method/exam_result/uExam_Result_upSetComboBox_003.jsp");
	htBranch.put("uExam_Result_upSetComboBox_005", 		"/method/exam_result/uExam_Result_upSetComboBox_005.jsp");
	htBranch.put("uExam_Result_upSetComboBox_006", 		"/method/exam_result/uExam_Result_upSetComboBox_006.jsp");
	htBranch.put("uExam_Result_upSetHospital_001", 		"/method/exam_result/uExam_Result_upSetHospital_001.jsp");
	htBranch.put("uGen_Frst_Panj_upAutoPanExec_2019_002", 		"/method/exam_result/uGen_Frst_Panj_upAutoPanExec_2019_002.jsp");
	htBranch.put("uGen_Frst_Panj_upAutoPanExec_2019_004", 		"/method/exam_result/uGen_Frst_Panj_upAutoPanExec_2019_004.jsp");
	htBranch.put("uGen_Frst_Panj_upAutoPanExec_2019_009", 		"/method/exam_result/uGen_Frst_Panj_upAutoPanExec_2019_009.jsp");
	htBranch.put("uGen_Frst_Panj_upInsertJilPanSugi_001", 		"/method/exam_result/uGen_Frst_Panj_upInsertJilPanSugi_001.jsp");
	htBranch.put("uGen_Frst_Panj_upInsertJilPanSugi_002", 		"/method/exam_result/uGen_Frst_Panj_upInsertJilPanSugi_002.jsp");
	htBranch.put("uGen_Frst_Panj_upPanInsertSu_001", 		"/method/exam_result/uGen_Frst_Panj_upPanInsertSu_001.jsp");
	htBranch.put("uGen_Frst_Panj_upPanInsert_001", 		"/method/exam_result/uGen_Frst_Panj_upPanInsert_001.jsp");
	htBranch.put("uGen_Frst_Panj_upPanMoInsert_001", 		"/method/exam_result/uGen_Frst_Panj_upPanMoInsert_001.jsp");
	htBranch.put("uGen_Frst_Panj_upPanSaveSu_001", 		"/method/exam_result/uGen_Frst_Panj_upPanSaveSu_001.jsp");
	htBranch.put("uGen_Frst_Panj_upPanUpdateSu_001", 		"/method/exam_result/uGen_Frst_Panj_upPanUpdateSu_001.jsp");
	htBranch.put("uGen_Frst_Panj_upPanUpdate_001", 		"/method/exam_result/uGen_Frst_Panj_upPanUpdate_001.jsp");
	htBranch.put("uItem_BatchYN", 		"/method/exam_result/uItem_BatchYN.jsp");
	htBranch.put("uLife_Panj_upGetLifeRslt_001", 		"/method/exam_result/uLife_Panj_upGetLifeRslt_001.jsp");
	htBranch.put("upAutoPanExe", 		"/method/exam_result/upAutoPanExe.jsp");
	htBranch.put("upAutoPanExec_2018", 		"/method/exam_result/upAutoPanExec_2018.jsp");
	htBranch.put("UP_QuestionSave_2018", 		"/method/exam_result/UP_QuestionSave_2018.jsp");
	htBranch.put("uQuestion_UP_QuestionSave_2019_003", 		"/method/exam_result/uQuestion_UP_QuestionSave_2019_003.jsp");
	htBranch.put("uView_Rslt_upGetDev_Rslt_001", 		"/method/exam_result/uView_Rslt_upGetDev_Rslt_001.jsp");
	htBranch.put("uCancer_Rslt_2020_ufSaveLiverRslt_002", 		"/method/exam_result/uCancer_Rslt_2020_ufSaveLiverRslt_002.jsp");
	htBranch.put("uQuestion_UP_QuestionSave_007", 		"/method/exam_result/uQuestion_UP_QuestionSave_007.jsp");
	htBranch.put("uQuestion_UP_QuestionSave_008", 		"/method/exam_result/uQuestion_UP_QuestionSave_008.jsp");
	htBranch.put("uFind_Rslt_upGetDev_Rslt_001", 		"/method/exam_result/uFind_Rslt_upGetDev_Rslt_001.jsp");
	htBranch.put("uExam_Result_grdDevRsltDblClickCell_001", 		"/method/exam_result/uExam_Result_grdDevRsltDblClickCell_001.jsp");
	htBranch.put("uExam_Result_grdBldRsltKeyPress_001", 		"/method/exam_result/uExam_Result_grdBldRsltKeyPress_001.jsp");
	htBranch.put("uExam_Result_grdBldRsltKeyPress_002", 		"/method/exam_result/uExam_Result_grdBldRsltKeyPress_002.jsp");
	htBranch.put("uDevc_Rslt_ufSaveDevDoctEmp_001", 		"/method/exam_result/uDevc_Rslt_ufSaveDevDoctEmp_001.jsp");
	htBranch.put("uRslt_Past_upGetRslt_001", 		"/method/exam_result/uRslt_Past_upGetRslt_001.jsp");
	htBranch.put("uExam_Result_upSetFrstGenSort_002", 		"/method/exam_result/uExam_Result_upSetFrstGenSort_002.jsp");
	htBranch.put("uTotal_Finding_ufCompareValueToRef_002", 		"/method/exam_result/uTotal_Finding_ufCompareValueToRef_002.jsp");
	htBranch.put("uExam_Result_ufCvtOCSRslt_001", 		"/method/exam_result/uExam_Result_ufCvtOCSRslt_001.jsp");
	htBranch.put("uGen_Frst_Panj_upGetFrstRslt_001", 		"/method/exam_result/uGen_Frst_Panj_upGetFrstRslt_001.jsp");
	htBranch.put("uQuestion_UP_Score_Set_001", 		"/method/exam_result/uQuestion_UP_Score_Set_001.jsp");
	htBranch.put("uQuestion_upGetQuestion_002", 		"/method/exam_result/uQuestion_upGetQuestion_002.jsp");
	htBranch.put("uLife_Panj_upSelLive_001", 		"/method/exam_result/uLife_Panj_upSelLive_001.jsp");
	htBranch.put("uQuestion_UF_ITEM_VLDT_Set_001", 		"/method/exam_result/uQuestion_UF_ITEM_VLDT_Set_001.jsp");
	htBranch.put("uBld_Rslt_ufAutoCalc_001", 		"/method/exam_result/uBld_Rslt_ufAutoCalc_001.jsp");
	htBranch.put("uExam_Result_upGetRcpt_001", 		"/method/exam_result/uExam_Result_upGetRcpt_001.jsp");
	htBranch.put("uBld_Rslt_ufGetVldtAplyDt_001", 		"/method/exam_result/uBld_Rslt_ufGetVldtAplyDt_001.jsp");
	htBranch.put("uBld_Rslt_ufCheckRsltCd_001", 		"/method/exam_result/uBld_Rslt_ufCheckRsltCd_001.jsp");
	htBranch.put("uBld_Rslt_ufGetPanJungSP_001", 		"/method/exam_result/uBld_Rslt_ufGetPanJungSP_001.jsp");
	htBranch.put("uView_Cancer_Rslt_upGetRslt_001", 		"/method/exam_result/uView_Cancer_Rslt_upGetRslt_001.jsp");
	htBranch.put("uLife_Panj_rgpPspPrscrPyc_YnClick_001", 		"/method/exam_result/uLife_Panj_rgpPspPrscrPyc_YnClick_001.jsp");
	htBranch.put("QRCjkLife5_DetailBand1BeforePrint_003", 		"/method/exam_result/QRCjkLife5_DetailBand1BeforePrint_003.jsp");
	htBranch.put("uBld_Rslt_ufSaveBldRslt_001", 		"/method/exam_result/uBld_Rslt_ufSaveBldRslt_001.jsp");
	htBranch.put("uTotal_Finding_upGetRslt_001", 		"/method/exam_result/uTotal_Finding_upGetRslt_001.jsp");
	htBranch.put("uExam_Result_ChkBoxICR_INFO_YNClick_001", 		"/method/exam_result/uExam_Result_ChkBoxICR_INFO_YNClick_001.jsp");
	htBranch.put("uLife_Panj_rgpPspPrscDrn_YnClick_001", 		"/method/exam_result/uLife_Panj_rgpPspPrscDrn_YnClick_001.jsp");
	htBranch.put("uLife_Panj_rgpPspPrscrSpt_YnClick_001", 		"/method/exam_result/uLife_Panj_rgpPspPrscrSpt_YnClick_001.jsp");
	htBranch.put("uLife_Panj_rgpPspPrscDrn_YnClick_002", 		"/method/exam_result/uLife_Panj_rgpPspPrscDrn_YnClick_002.jsp");
	htBranch.put("uLife_Panj_rgpPspPrscrSm_YnClick_002", 		"/method/exam_result/uLife_Panj_rgpPspPrscrSm_YnClick_002.jsp");
	htBranch.put("uLife_Panj_rgpPspPrscrSm_YnClick_001", 		"/method/exam_result/uLife_Panj_rgpPspPrscrSm_YnClick_001.jsp");
	htBranch.put("uExam_Result_upSetComboBox_002", 		"/method/exam_result/uExam_Result_upSetComboBox_002.jsp");
	htBranch.put("uQuestion_UP_QuestionGridDisplay_002", 		"/method/exam_result/uQuestion_UP_QuestionGridDisplay_002.jsp");
	htBranch.put("uQuestion_UP_QuestionGridDisplay_001", 		"/method/exam_result/uQuestion_UP_QuestionGridDisplay_001.jsp");
	htBranch.put("uQT_QUESTION_PAST_FormShow_001", 		"/method/exam_result/uQT_QUESTION_PAST_FormShow_001.jsp");
	htBranch.put("uQT_QUESTION_PAST_GridExam_ListSel_001", 		"/method/exam_result/uQT_QUESTION_PAST_GridExam_ListSel_001.jsp");
	htBranch.put("uDental_Panj_ufDntlQstSave_003", 		"/method/exam_result/uDental_Panj_ufDntlQstSave_003.jsp");
	htBranch.put("uExam_Result_btnEdpMj04Kd_ModClick_001", 		"/method/exam_result/uExam_Result_btnEdpMj04Kd_ModClick_001.jsp");
	htBranch.put("uDental_Panj_Find_btnFindClick_001", 		"/method/exam_result/uDental_Panj_Find_btnFindClick_001.jsp");
	htBranch.put("uDental_Panj_upGridDisplay_001", 		"/method/exam_result/uDental_Panj_upGridDisplay_001.jsp");
	htBranch.put("uDental_Panj_upGridDisplay_002", 		"/method/exam_result/uDental_Panj_upGridDisplay_002.jsp");
	htBranch.put("uDental_Panj_upGetDentalData_001", 		"/method/exam_result/uDental_Panj_upGetDentalData_001.jsp");
	htBranch.put("uDental_Panj_upQstTestPanjungDsiplay_001", 		"/method/exam_result/uDental_Panj_upQstTestPanjungDsiplay_001.jsp");
	htBranch.put("uDental_Panj_ufDntlSave_001", 		"/method/exam_result/uDental_Panj_ufDntlSave_001.jsp");
	htBranch.put("uDental_Panj_ufDntlQstSave_001", 		"/method/exam_result/uDental_Panj_ufDntlQstSave_001.jsp");
	htBranch.put("uDental_Panj_ufGetDntlFinding_001", 		"/method/exam_result/uDental_Panj_ufGetDntlFinding_001.jsp");
	htBranch.put("uDental_Panj_ufDntlQstSave_002", 		"/method/exam_result/uDental_Panj_ufDntlQstSave_002.jsp");
	htBranch.put("uDental_Panj_upGridDisplay_003", 		"/method/exam_result/uDental_Panj_upGridDisplay_003.jsp");
	htBranch.put("uDental_Panj_ufDntlSave_002", 		"/method/exam_result/uDental_Panj_ufDntlSave_002.jsp");
	htBranch.put("uGen_Frst_Panj_ufSelAge_001", 		"/method/exam_result/uGen_Frst_Panj_ufSelAge_001.jsp");
	htBranch.put("uGen_Frst_Panj_upAutoPanNoExec_001", 		"/method/exam_result/uGen_Frst_Panj_upAutoPanNoExec_001.jsp");
	htBranch.put("uGen_Frst_Panj_upAutoPanNoExec_002", 		"/method/exam_result/uGen_Frst_Panj_upAutoPanNoExec_002.jsp");
	htBranch.put("uGen_Frst_Panj_upSelLabor_001", 		"/method/exam_result/uGen_Frst_Panj_upSelLabor_001.jsp");
	htBranch.put("uGen_Frst_Panj_upUpdateJilPan_001", 		"/method/exam_result/uGen_Frst_Panj_upUpdateJilPan_001.jsp");
	htBranch.put("uGen_Frst_Panj_udfselfirview_001", 		"/method/exam_result/uGen_Frst_Panj_udfselfirview_001.jsp");
	htBranch.put("uGen_Frst_Panj_ufSelFirview_001", 		"/method/exam_result/uGen_Frst_Panj_ufSelFirview_001.jsp");
	htBranch.put("uGen_Frst_Panj_ufSelOpin_001", 		"/method/exam_result/uGen_Frst_Panj_ufSelOpin_001.jsp");
	htBranch.put("uGen_Frst_Panj_ufSelPanNm_002", 		"/method/exam_result/uGen_Frst_Panj_ufSelPanNm_002.jsp");
	htBranch.put("uGen_Frst_Panj_ufSelPanNm_001", 		"/method/exam_result/uGen_Frst_Panj_ufSelPanNm_001.jsp");
	htBranch.put("uFind_Frst_Work_upGetDev_Rslt_001", 		"/method/exam_result/uFind_Frst_Work_upGetDev_Rslt_001.jsp");
	htBranch.put("uGen_Frst_Panj_upInsertJilPan_002", 		"/method/exam_result/uGen_Frst_Panj_upInsertJilPan_002.jsp");
	htBranch.put("uGen_Frst_Panj_upInsertJilPan_001", 		"/method/exam_result/uGen_Frst_Panj_upInsertJilPan_001.jsp");
	htBranch.put("uGen_Frst_Panj_DangerAge_001", 		"/method/exam_result/uGen_Frst_Panj_DangerAge_001.jsp");
	htBranch.put("uGen_Frst_Panj_uAutoPanBrain_002", 		"/method/exam_result/uGen_Frst_Panj_uAutoPanBrain_002.jsp");
	htBranch.put("uGen_Frst_Panj_uAutoPanBrain_010", 		"/method/exam_result/uGen_Frst_Panj_uAutoPanBrain_010.jsp");
	htBranch.put("uGen_Frst_Panj_uAutoPanBrain_012", 		"/method/exam_result/uGen_Frst_Panj_uAutoPanBrain_012.jsp");
	htBranch.put("uGen_Frst_Panj_uAutoPanBrain_011", 		"/method/exam_result/uGen_Frst_Panj_uAutoPanBrain_011.jsp");
	htBranch.put("uGen_Frst_Panj_uAutoPanBrain_008", 		"/method/exam_result/uGen_Frst_Panj_uAutoPanBrain_008.jsp");
	htBranch.put("uGen_Frst_Panj_uAutoPanBrain_009", 		"/method/exam_result/uGen_Frst_Panj_uAutoPanBrain_009.jsp");
	htBranch.put("uGen_Frst_Panj_uAutoPanBrain_004", 		"/method/exam_result/uGen_Frst_Panj_uAutoPanBrain_004.jsp");
	htBranch.put("uGen_Frst_Panj_uAutoPanBrain_005", 		"/method/exam_result/uGen_Frst_Panj_uAutoPanBrain_005.jsp");
	htBranch.put("uGen_Frst_Panj_uAutoPanBrain_006", 		"/method/exam_result/uGen_Frst_Panj_uAutoPanBrain_006.jsp");
	htBranch.put("uGen_Frst_Panj_uAutoPanBrain_007", 		"/method/exam_result/uGen_Frst_Panj_uAutoPanBrain_007.jsp");
	htBranch.put("uGen_Frst_Panj_uAutoPanBrain_001", 		"/method/exam_result/uGen_Frst_Panj_uAutoPanBrain_001.jsp");
	htBranch.put("uGen_Frst_Panj_uAutoPanBrain_003", 		"/method/exam_result/uGen_Frst_Panj_uAutoPanBrain_003.jsp");
	htBranch.put("uCancer_Rslt_2020_ufSaveColoRslt_002", 		"/method/exam_result/uCancer_Rslt_2020_ufSaveColoRslt_002.jsp");
	htBranch.put("uCancer_Rslt_2020_upGetColoRslt_002", 		"/method/exam_result/uCancer_Rslt_2020_upGetColoRslt_002.jsp");
	htBranch.put("uPsnl_Memo_btnSaveClick_002", 		"/method/exam_result/uPsnl_Memo_btnSaveClick_002.jsp");
	htBranch.put("uExam_Result_XML_COM_009", 		"/method/exam_result/uExam_Result_XML_COM_009.jsp");
	htBranch.put("uExam_Result_btnQstnSaveClick_002", 		"/method/exam_result/uExam_Result_btnQstnSaveClick_002.jsp");
	htBranch.put("uQuestion_UP_QuestionSave_001", 		"/method/exam_result/uQuestion_UP_QuestionSave_001.jsp");
	htBranch.put("uQuestion_UP_QuestionSave_003", 		"/method/exam_result/uQuestion_UP_QuestionSave_003.jsp");
	htBranch.put("uGen_Scnd_Panj_ufGetLiveSQL_001", 		"/method/exam_result/uGen_Scnd_Panj_ufGetLiveSQL_001.jsp");
	htBranch.put("uGen_Frst_Panj_upSelMunjinRD_001", 		"/method/exam_result/uGen_Frst_Panj_upSelMunjinRD_001.jsp");
	htBranch.put("uExam_Result_edtWidthChange_001", 		"/method/exam_result/uExam_Result_edtWidthChange_001.jsp");
	htBranch.put("uExam_Result_FormShow_002", 		"/method/exam_result/uExam_Result_FormShow_002.jsp");
	htBranch.put("uExam_Result_FormShow_001", 		"/method/exam_result/uExam_Result_FormShow_001.jsp");
	htBranch.put("frameSetCustomExamResult_lstItemLoad_001", 		"/method/exam_result/frameSetCustomExamResult_lstItemLoad_001.jsp");
	htBranch.put("frameSetCustomExamResult_lstItemLoad_002", 		"/method/exam_result/frameSetCustomExamResult_lstItemLoad_002.jsp");
	htBranch.put("frameSetCustomExamResult_targetItemSave_002", 		"/method/exam_result/frameSetCustomExamResult_targetItemSave_002.jsp");
	htBranch.put("frameSetCustomExamResult_targetItemSave_001", 		"/method/exam_result/frameSetCustomExamResult_targetItemSave_001.jsp");
	htBranch.put("uQuestion_upGetQuestion_001", 		"/method/exam_result/uQuestion_upGetQuestion_001.jsp");
	htBranch.put("uLife_Panj_upGetLifePrescr_001", 		"/method/exam_result/uLife_Panj_upGetLifePrescr_001.jsp");
	htBranch.put("uLife_Panj_upGetSedPan_001", 		"/method/exam_result/uLife_Panj_upGetSedPan_001.jsp");
	htBranch.put("uLife_Panj_upSavePtLifePrescr_001", 		"/method/exam_result/uLife_Panj_upSavePtLifePrescr_001.jsp");
	htBranch.put("uLife_Panj_upSavePtLifePrescr_002", 		"/method/exam_result/uLife_Panj_upSavePtLifePrescr_002.jsp");
	htBranch.put("uLife_Panj_upSavePtSedPanjung_001", 		"/method/exam_result/uLife_Panj_upSavePtSedPanjung_001.jsp");
	htBranch.put("uLife_Panj_upSavePtSedPanjung_002", 		"/method/exam_result/uLife_Panj_upSavePtSedPanjung_002.jsp");
	htBranch.put("uTotal_Finding_upGetFinding_001", 		"/method/exam_result/uTotal_Finding_upGetFinding_001.jsp");
	htBranch.put("uTotal_Finding_ufTotalSaveResult_001", 		"/method/exam_result/uTotal_Finding_ufTotalSaveResult_001.jsp");
	htBranch.put("uTotal_Finding_ufTotalSaveResult_002", 		"/method/exam_result/uTotal_Finding_ufTotalSaveResult_002.jsp");
	htBranch.put("uTotal_Finding_ufTotalSaveResult_003", 		"/method/exam_result/uTotal_Finding_ufTotalSaveResult_003.jsp");
	htBranch.put("uTotal_Finding_upGetFindingCode_001", 		"/method/exam_result/uTotal_Finding_upGetFindingCode_001.jsp");
	htBranch.put("uManage_Finding_Apply_ufSave_001", 		"/method/exam_result/uManage_Finding_Apply_ufSave_001.jsp");
	htBranch.put("uManage_Finding_Apply_btnChkDupClick_001", 		"/method/exam_result/uManage_Finding_Apply_btnChkDupClick_001.jsp");
	htBranch.put("uExam_Result_chkHeightClick_001", 		"/method/exam_result/uExam_Result_chkHeightClick_001.jsp");
	htBranch.put("uExam_Result_XML_COM_008", 		"/method/exam_result/uExam_Result_XML_COM_008.jsp");
	htBranch.put("uExam_Result_XML_COM_008___1", 		"/method/exam_result/uExam_Result_XML_COM_008___1.jsp");
	htBranch.put("uExam_Result_XML_COM_008___2", 		"/method/exam_result/uExam_Result_XML_COM_008___2.jsp");
	htBranch.put("uExam_Result_XML_COM_008___3", 		"/method/exam_result/uExam_Result_XML_COM_008___3.jsp");
	htBranch.put("uExam_Result_XML_COM_008___4", 		"/method/exam_result/uExam_Result_XML_COM_008___4.jsp");
	htBranch.put("uExam_Result_XML_COM_008___5", 		"/method/exam_result/uExam_Result_XML_COM_008___5.jsp");
	htBranch.put("uExam_Result_XML_COM_008___6", 		"/method/exam_result/uExam_Result_XML_COM_008___6.jsp");
	htBranch.put("uExam_Result_XML_COM_007", 		"/method/exam_result/uExam_Result_XML_COM_007.jsp");
	htBranch.put("uExam_Result_XML_COM_007___1", 		"/method/exam_result/uExam_Result_XML_COM_007___1.jsp");
	htBranch.put("uExam_Result_XML_COM_007___2", 		"/method/exam_result/uExam_Result_XML_COM_007___2.jsp");
	htBranch.put("uExam_Result_XML_COM_007___3", 		"/method/exam_result/uExam_Result_XML_COM_007___3.jsp");
	htBranch.put("uExam_Result_XML_COM_007___4", 		"/method/exam_result/uExam_Result_XML_COM_007___4.jsp");
	htBranch.put("uExam_Result_XML_COM_007___5", 		"/method/exam_result/uExam_Result_XML_COM_007___5.jsp");
	htBranch.put("uExam_Result_XML_COM_007___6", 		"/method/exam_result/uExam_Result_XML_COM_007___6.jsp");
	htBranch.put("uCancer_Rslt_2020_ufCancerLoadResult_001", 		"/method/exam_result/uCancer_Rslt_2020_ufCancerLoadResult_001.jsp");
	htBranch.put("uCancer_Rslt_2020_ufCancerLoadResult_004", 		"/method/exam_result/uCancer_Rslt_2020_ufCancerLoadResult_004.jsp");
	htBranch.put("uCancer_Rslt_2020_ufCancerLoadResult_005", 		"/method/exam_result/uCancer_Rslt_2020_ufCancerLoadResult_005.jsp");
	htBranch.put("uCancer_Rslt_2020_ufCancerLoadResult_002", 		"/method/exam_result/uCancer_Rslt_2020_ufCancerLoadResult_002.jsp");
	htBranch.put("uCancer_Rslt_2020_ufCancerLoadResult_002___1", 		"/method/exam_result/uCancer_Rslt_2020_ufCancerLoadResult_002___1.jsp");
	htBranch.put("uCancer_Rslt_2020_ufCancerLoadResult_002___2", 		"/method/exam_result/uCancer_Rslt_2020_ufCancerLoadResult_002___2.jsp");
	htBranch.put("uCancer_Rslt_2020_ufCancerLoadResult_002___3", 		"/method/exam_result/uCancer_Rslt_2020_ufCancerLoadResult_002___3.jsp");
	htBranch.put("uCancer_Rslt_2020_ufCancerLoadResult_002___4", 		"/method/exam_result/uCancer_Rslt_2020_ufCancerLoadResult_002___4.jsp");
	htBranch.put("uCancer_Rslt_2020_ufCancerLoadResult_002___5", 		"/method/exam_result/uCancer_Rslt_2020_ufCancerLoadResult_002___5.jsp");
	htBranch.put("uCancer_Rslt_2020_ufCancerLoadResult_002___6", 		"/method/exam_result/uCancer_Rslt_2020_ufCancerLoadResult_002___6.jsp");
	htBranch.put("uCancer_Rslt_2020_ufCancerSaveResult_001", 		"/method/exam_result/uCancer_Rslt_2020_ufCancerSaveResult_001.jsp");
	htBranch.put("uExam_Result_XML_COM_006", 		"/method/exam_result/uExam_Result_XML_COM_006.jsp");
	htBranch.put("uQuestion_UP_QuestionSave_006", 		"/method/exam_result/uQuestion_UP_QuestionSave_006.jsp");
	htBranch.put("uQuestion_UP_QuestionSave_005", 		"/method/exam_result/uQuestion_UP_QuestionSave_005.jsp");
	htBranch.put("uQuestion_UP_QuestionSave_004", 		"/method/exam_result/uQuestion_UP_QuestionSave_004.jsp");
	htBranch.put("upGetDietitian_002", 		"/method/exam_result/upGetDietitian_002.jsp");
	htBranch.put("uExam_Result_grdRcptListSelectionChanged_001", 		"/method/exam_result/uExam_Result_grdRcptListSelectionChanged_001.jsp");
	htBranch.put("upGetDietitian_003", 		"/method/exam_result/upGetDietitian_003.jsp");
	htBranch.put("uLife_Panj_upSelLive_002", 		"/method/exam_result/uLife_Panj_upSelLive_002.jsp");
	htBranch.put("uCancer_Rslt_2020_ufSaveStmcRslt_002", 		"/method/exam_result/uCancer_Rslt_2020_ufSaveStmcRslt_002.jsp");
	htBranch.put("uCancer_Rslt_2020_upGetStmcRslt_002", 		"/method/exam_result/uCancer_Rslt_2020_upGetStmcRslt_002.jsp");
	htBranch.put("uCancer_Rslt_2020_ufSaveBrstRslt_002", 		"/method/exam_result/uCancer_Rslt_2020_ufSaveBrstRslt_002.jsp");
	htBranch.put("uCancer_Rslt_2020_btnDctFind_001", 		"/method/exam_result/uCancer_Rslt_2020_btnDctFind_001.jsp");
	htBranch.put("uGen_Frst_Panj_upPanSave_001", 		"/method/exam_result/uGen_Frst_Panj_upPanSave_001.jsp");
	htBranch.put("uGen_View_Dise_Sg_asg1Sel_001", 		"/method/exam_result/uGen_View_Dise_Sg_asg1Sel_001.jsp");
	htBranch.put("uTotal_Finding_ufTotalSaveResult_005", 		"/method/exam_result/uTotal_Finding_ufTotalSaveResult_005.jsp");
	htBranch.put("uGen_Frst_Panj_ufMunjinYN_001", 		"/method/exam_result/uGen_Frst_Panj_ufMunjinYN_001.jsp");
	htBranch.put("uQuestion_UP_QuestionSave_2019_001", 		"/method/exam_result/uQuestion_UP_QuestionSave_2019_001.jsp");
	htBranch.put("uQuestion_UP_QuestionSave_2019_002", 		"/method/exam_result/uQuestion_UP_QuestionSave_2019_002.jsp");
	htBranch.put("uGen_Frst_Panj_upAutoPanExec_2019_007", 		"/method/exam_result/uGen_Frst_Panj_upAutoPanExec_2019_007.jsp");
	htBranch.put("uGen_Frst_Panj_upAutoPanExec_2019_005", 		"/method/exam_result/uGen_Frst_Panj_upAutoPanExec_2019_005.jsp");
	htBranch.put("uGen_Frst_Panj_upAutoPanExec_2019_006", 		"/method/exam_result/uGen_Frst_Panj_upAutoPanExec_2019_006.jsp");
	htBranch.put("uGen_Frst_Panj_upAutoPanExec_2019_011", 		"/method/exam_result/uGen_Frst_Panj_upAutoPanExec_2019_011.jsp");
	htBranch.put("uGen_Frst_Panj_upAutoPanExec_2019_010", 		"/method/exam_result/uGen_Frst_Panj_upAutoPanExec_2019_010.jsp");
	htBranch.put("uGen_Frst_Panj_upAutoPanExec_2019_008", 		"/method/exam_result/uGen_Frst_Panj_upAutoPanExec_2019_008.jsp");
	htBranch.put("uGen_Frst_Panj_upAutoPanExec_2019_003", 		"/method/exam_result/uGen_Frst_Panj_upAutoPanExec_2019_003.jsp");
	htBranch.put("uGen_Frst_Panj_upAutoPanExec_2019_001", 		"/method/exam_result/uGen_Frst_Panj_upAutoPanExec_2019_001.jsp");
	htBranch.put("uCancer_Rslt_2020_ufSaveCrvcRslt_002", 		"/method/exam_result/uCancer_Rslt_2020_ufSaveCrvcRslt_002.jsp");
	htBranch.put("uCancer_Rslt_ufCallRslt_001", 		"/method/exam_result/uCancer_Rslt_ufCallRslt_001.jsp");
	htBranch.put("uTotal_Finding_ufCompareValueToRef_001", 		"/method/exam_result/uTotal_Finding_ufCompareValueToRef_001.jsp");
	htBranch.put("uExam_Result_ufCheckRsltEx_001", 		"/method/exam_result/uExam_Result_ufCheckRsltEx_001.jsp");
	htBranch.put("uFind_Finding_upGetRslt_001", 		"/method/exam_result/uFind_Finding_upGetRslt_001.jsp");
	htBranch.put("uFind_Finding_btnPacsRslt_DeleteClick_001", 		"/method/exam_result/uFind_Finding_btnPacsRslt_DeleteClick_001.jsp");
	htBranch.put("uFind_Finding_btnPacsRslt_DeleteClick_002", 		"/method/exam_result/uFind_Finding_btnPacsRslt_DeleteClick_002.jsp");
	htBranch.put("uInterface_Rslt_btnSaveClick_001", 		"/method/exam_result/uInterface_Rslt_btnSaveClick_001.jsp");
	htBranch.put("uExam_Result_XML_COM_003", 		"/method/exam_result/uExam_Result_XML_COM_003.jsp");
	htBranch.put("uDevc_Rslt_ufSaveDevResultEx_003", 		"/method/exam_result/uDevc_Rslt_ufSaveDevResultEx_003.jsp");
	htBranch.put("uDevc_Rslt_ufSaveDevResultEx_001", 		"/method/exam_result/uDevc_Rslt_ufSaveDevResultEx_001.jsp");
	htBranch.put("uDevc_Rslt_ufSaveDevResultEx_002", 		"/method/exam_result/uDevc_Rslt_ufSaveDevResultEx_002.jsp");
	htBranch.put("uDevc_Rslt_upGetDevRslt_001", 		"/method/exam_result/uDevc_Rslt_upGetDevRslt_001.jsp");
	htBranch.put("uDevc_Rslt_upGetDevRslt_002", 		"/method/exam_result/uDevc_Rslt_upGetDevRslt_002.jsp");
	htBranch.put("uDevc_Rslt_ufGetRsltEx_001", 		"/method/exam_result/uDevc_Rslt_ufGetRsltEx_001.jsp");
	htBranch.put("uExam_Result_grdRcptListSelectionChanged_002", 		"/method/exam_result/uExam_Result_grdRcptListSelectionChanged_002.jsp");
	htBranch.put("uExam_Memo_UP_btnSaveClick_001", 		"/method/exam_result/uExam_Memo_UP_btnSaveClick_001.jsp");
	htBranch.put("uExam_Memo_UP_ExamSearching_001", 		"/method/exam_result/uExam_Memo_UP_ExamSearching_001.jsp");
	htBranch.put("uExam_Memo_UP_btnSaveClick_002", 		"/method/exam_result/uExam_Memo_UP_btnSaveClick_002.jsp");
	htBranch.put("uExam_Memo_FormShow_001", 		"/method/exam_result/uExam_Memo_FormShow_001.jsp");
	htBranch.put("uQuestion_UP_QuestionSave_002", 		"/method/exam_result/uQuestion_UP_QuestionSave_002.jsp");
	htBranch.put("uExam_Result_upGetRcpt_002", 		"/method/exam_result/uExam_Result_upGetRcpt_002.jsp");
	htBranch.put("uExam_Result_spFindingMoved_001", 		"/method/exam_result/uExam_Result_spFindingMoved_001.jsp");
	htBranch.put("uExam_Result_chkSsv_Rslt_InputMouseUp_001", 		"/method/exam_result/uExam_Result_chkSsv_Rslt_InputMouseUp_001.jsp");
	htBranch.put("uExam_Result_XML_COM_004", 		"/method/exam_result/uExam_Result_XML_COM_004.jsp");
	htBranch.put("uTotal_Finding_ufTotalSaveResult_004", 		"/method/exam_result/uTotal_Finding_ufTotalSaveResult_004.jsp");
	htBranch.put("uExam_Result_XML_COM_001", 		"/method/exam_result/uExam_Result_XML_COM_001.jsp");
	htBranch.put("uExam_Result_upGetClaimNo_001", 		"/method/exam_result/uExam_Result_upGetClaimNo_001.jsp");
	htBranch.put("uCancer_Rslt_2020_upSetComboBox_001", 		"/method/exam_result/uCancer_Rslt_2020_upSetComboBox_001.jsp");
	htBranch.put("uExam_Result_upSetComboBox_004", 		"/method/exam_result/uExam_Result_upSetComboBox_004.jsp");
	htBranch.put("uCancer_Rslt_2020_ufSaveLungRslt_002", 		"/method/exam_result/uCancer_Rslt_2020_ufSaveLungRslt_002.jsp");
	htBranch.put("uQuestion_UP_QuestionGridDisplay_003", 		"/method/exam_result/uQuestion_UP_QuestionGridDisplay_003.jsp");
	htBranch.put("uQuestion_UP_QuestionGridDisplay_004", 		"/method/exam_result/uQuestion_UP_QuestionGridDisplay_004.jsp");
	htBranch.put("uQT_QUESTION_PAST_UP_GridDisplay_001", 		"/method/exam_result/uQT_QUESTION_PAST_UP_GridDisplay_001.jsp");
	htBranch.put("uExam_Result_chkEea_Rslt_InputMouseUp_001", 		"/method/exam_result/uExam_Result_chkEea_Rslt_InputMouseUp_001.jsp");
	htBranch.put("uExam_Result_chkEea_Rslt_InputMouseUp_002", 		"/method/exam_result/uExam_Result_chkEea_Rslt_InputMouseUp_002.jsp");
	htBranch.put("uExam_Result_XML_COM_002", 		"/method/exam_result/uExam_Result_XML_COM_002.jsp");
	htBranch.put("uBld_Rslt_upGetBldRslt_001", 		"/method/exam_result/uBld_Rslt_upGetBldRslt_001.jsp");
	htBranch.put("uBld_Rslt_upGetBldRsltRow_001", 		"/method/exam_result/uBld_Rslt_upGetBldRsltRow_001.jsp");
	htBranch.put("uExam_Result_XML_COM_010", 		"/method/exam_result/uExam_Result_XML_COM_010.jsp");
	htBranch.put("uExam_Result_RzButton_WEQSClick_001", 		"/method/exam_result/uExam_Result_RzButton_WEQSClick_001.jsp");
	htBranch.put("uGen_Frst_Panj_ufSelOpin_002", 		"/method/exam_result/uGen_Frst_Panj_ufSelOpin_002.jsp");
	htBranch.put("uGen_Frst_Panj_uAutoPanBrain_013", 		"/method/exam_result/uGen_Frst_Panj_uAutoPanBrain_013.jsp");
	htBranch.put("uGen_Frst_Panj_uAutoPanBrain_014", 		"/method/exam_result/uGen_Frst_Panj_uAutoPanBrain_014.jsp");
	htBranch.put("uGen_Frst_Panj_uAutoPanBrain_015", 		"/method/exam_result/uGen_Frst_Panj_uAutoPanBrain_015.jsp");
	htBranch.put("uCancer_Rslt_2020_ufCancerLoadResult_006", 		"/method/exam_result/uCancer_Rslt_2020_ufCancerLoadResult_006.jsp");
	htBranch.put("uCancer_Rslt_2020_ufCancerLoadResult_007", 		"/method/exam_result/uCancer_Rslt_2020_ufCancerLoadResult_007.jsp");
	htBranch.put("uCancer_Rslt_2020_ufCancerLoadResult_008", 		"/method/exam_result/uCancer_Rslt_2020_ufCancerLoadResult_008.jsp");
	htBranch.put("uCancer_Rslt_2020_ufCancerLoadResult_009", 		"/method/exam_result/uCancer_Rslt_2020_ufCancerLoadResult_009.jsp");
	htBranch.put("uCancer_Rslt_2020_ufCancerLoadResult_010", 		"/method/exam_result/uCancer_Rslt_2020_ufCancerLoadResult_010.jsp");
	htBranch.put("uCancer_Rslt_2020_ufCancerLoadResult_011", 		"/method/exam_result/uCancer_Rslt_2020_ufCancerLoadResult_011.jsp");
	htBranch.put("uExam_Result_btnPanReqClick_001", 		"/method/exam_result/uExam_Result_btnPanReqClick_001.jsp");
	htBranch.put("uExam_Result_btnPanReqClick_002", 		"/method/exam_result/uExam_Result_btnPanReqClick_002.jsp");
	htBranch.put("uCancer_Rslt_2020_ufSaveStmcRslt_002_Log", 		"/method/exam_result/uCancer_Rslt_2020_ufSaveStmcRslt_002_Log.jsp");
	htBranch.put("uCancer_Rslt_2020_ufSaveColoRslt_002_Log", 		"/method/exam_result/uCancer_Rslt_2020_ufSaveColoRslt_002_Log.jsp");
	htBranch.put("uCancer_Rslt_2020_ufSaveLiverRslt_002_Log", 		"/method/exam_result/uCancer_Rslt_2020_ufSaveLiverRslt_002_Log.jsp");
	htBranch.put("uCancer_Rslt_2020_ufSaveBrstRslt_002_Log", 		"/method/exam_result/uCancer_Rslt_2020_ufSaveBrstRslt_002_Log.jsp");
	htBranch.put("uCancer_Rslt_2020_ufSaveCrvcRslt_002_Log", 		"/method/exam_result/uCancer_Rslt_2020_ufSaveCrvcRslt_002_Log.jsp");
	htBranch.put("uCancer_Rslt_2020_ufSaveLungRslt_002_Log", 		"/method/exam_result/uCancer_Rslt_2020_ufSaveLungRslt_002_Log.jsp");
	htBranch.put("uExam_Result_btnTotalCfrmClick_002", 		"/method/exam_result/uExam_Result_btnTotalCfrmClick_002.jsp");
	htBranch.put("uGen_Frst_Panj_upPanSaveLog_001", 		"/method/exam_result/uGen_Frst_Panj_upPanSaveLog_001.jsp");
	htBranch.put("uExam_Result_btnDevcSIClick_001", 		"/method/exam_result/uExam_Result_btnDevcSIClick_001.jsp");
	htBranch.put("uExam_Result_btnDevcSIClick_002", 		"/method/exam_result/uExam_Result_btnDevcSIClick_002.jsp");
	htBranch.put("uExam_Result_ufCheckQuestionEditYn_001", 		"/method/exam_result/uExam_Result_ufCheckQuestionEditYn_001.jsp");
	htBranch.put("uDevc_Rslt_upGetDevRsltKUMC_002", 		"/method/exam_result/uDevc_Rslt_upGetDevRsltKUMC_002.jsp");
	htBranch.put("uFind_Finding_btnConfirmClick_001", 		"/method/exam_result/uFind_Finding_btnConfirmClick_001.jsp");
	htBranch.put("frameSetCustomExamResult_targetItemSave_003", 		"/method/exam_result/frameSetCustomExamResult_targetItemSave_003.jsp");
	htBranch.put("frameSetCustomExamResult_lstItemLoad_003", 		"/method/exam_result/frameSetCustomExamResult_lstItemLoad_003.jsp");
	htBranch.put("uExam_Result_btnTotalCfrmClick_003", 		"/method/exam_result/uExam_Result_btnTotalCfrmClick_003.jsp");
	htBranch.put("uItem_BatchYN_UP_Find_Cncl_001", 		"/method/exam_result/uItem_BatchYN_UP_Find_Cncl_001.jsp");
	htBranch.put("uItem_BatchYN_btnSaveClick_001", 		"/method/exam_result/uItem_BatchYN_btnSaveClick_001.jsp");
	htBranch.put("uItem_BatchYN_btnSaveClick_002", 		"/method/exam_result/uItem_BatchYN_btnSaveClick_002.jsp");
	htBranch.put("uItem_BatchYN_btnSaveClick_003", 		"/method/exam_result/uItem_BatchYN_btnSaveClick_003.jsp");
	htBranch.put("uItem_BatchYN_btnSaveClick_004", 		"/method/exam_result/uItem_BatchYN_btnSaveClick_004.jsp");
	htBranch.put("uItem_BatchYN_btnSaveClick_005", 		"/method/exam_result/uItem_BatchYN_btnSaveClick_005.jsp");
	htBranch.put("uItem_BatchYN_btnSaveClick_006", 		"/method/exam_result/uItem_BatchYN_btnSaveClick_006.jsp");
	htBranch.put("uItem_BatchYN_btnSaveClick_007", 		"/method/exam_result/uItem_BatchYN_btnSaveClick_007.jsp");
	htBranch.put("uItem_BatchYN_btnSaveClick_008", 		"/method/exam_result/uItem_BatchYN_btnSaveClick_008.jsp");
	htBranch.put("uItem_BatchYN_btnSaveClick_009", 		"/method/exam_result/uItem_BatchYN_btnSaveClick_009.jsp");
	htBranch.put("uItem_BatchYN_btnSaveClick_010", 		"/method/exam_result/uItem_BatchYN_btnSaveClick_010.jsp");
	htBranch.put("uItem_BatchYN_btnSaveClick_011", 		"/method/exam_result/uItem_BatchYN_btnSaveClick_011.jsp");
	htBranch.put("uItem_BatchYN_btnSaveClick_012", 		"/method/exam_result/uItem_BatchYN_btnSaveClick_012.jsp");
	htBranch.put("uItem_BatchYN_btnSaveClick_013", 		"/method/exam_result/uItem_BatchYN_btnSaveClick_013.jsp");
	htBranch.put("uTotal_Finding_upGetFixedMent_001", 		"/method/exam_result/uTotal_Finding_upGetFixedMent_001.jsp");
	htBranch.put("uTotal_Finding_upGetFinding_002", 		"/method/exam_result/uTotal_Finding_upGetFinding_002.jsp");
	htBranch.put("uTotal_Finding_ufTotalSaveResult_006", 		"/method/exam_result/uTotal_Finding_ufTotalSaveResult_006.jsp");
	htBranch.put("uGen_Frst_Panj_upAutoPanNoExec_003", 		"/method/exam_result/uGen_Frst_Panj_upAutoPanNoExec_003.jsp");
	htBranch.put("uGen_Frst_Panj_ufSelPanNm_003", 		"/method/exam_result/uGen_Frst_Panj_ufSelPanNm_003.jsp");
	htBranch.put("uGen_Frst_Panj_udfselfirview_002", 		"/method/exam_result/uGen_Frst_Panj_udfselfirview_002.jsp");
	htBranch.put("uExam_Result_btnQuestCfrmClick_001", 		"/method/exam_result/uExam_Result_btnQuestCfrmClick_001.jsp");
	htBranch.put("QRDietitianRecord_DetailBand1_001", 		"/method/exam_result/QRDietitianRecord_DetailBand1_001.jsp");
	htBranch.put("QRDietitianReport_upQuerySet_001", 		"/method/exam_result/QRDietitianReport_upQuerySet_001.jsp");
	htBranch.put("QRDietitianReport_DetailBand1_001", 		"/method/exam_result/QRDietitianReport_DetailBand1_001.jsp");
	htBranch.put("uBld_Rslt_ufGetPanJungItemSP_001", 		"/method/exam_result/uBld_Rslt_ufGetPanJungItemSP_001.jsp");
	htBranch.put("uQuestion_UP_Score_Sum_EQuestionnaire_001", 		"/method/exam_result/uQuestion_UP_Score_Sum_EQuestionnaire_001.jsp");
	htBranch.put("uExam_Result_miDevRsltClick_001", 		"/method/exam_result/uExam_Result_miDevRsltClick_001.jsp");
%>