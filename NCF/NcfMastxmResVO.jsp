<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
    //결과 Return VO
    public static class NcfMastxmResVO {
        String EMPL_NUMB;
        String EMPL_NAME;
        String CPOS_CODE;
        String CPOS_NAME;
        String OPOS_CODE;
        String OPOS_NAME;
        String ORIG_DTNM;
        String RERN_NUMB;
        String EMPL_POINT;
        String ENCO_DATE;
        String RETR_DATE;
        String WODN_CODE;
        String WODN_NAME;
        String LOCA_ENCD;
        String LOCA_NAME;
        String WAGE_ENCD;
        String WAGE_NAME;
        String rescode;
        String resmsg;

        public String getWAGE_ENCD() {
            return WAGE_ENCD;
        }
        public void setWAGE_ENCD(String WAGE_ENCD) {
            this.WAGE_ENCD = WAGE_ENCD;
        }
        public String getWAGE_NAME() {
            return WAGE_NAME;
        }
        public void setWAGE_NAME(String WAGE_NAME) {
            this.WAGE_NAME = WAGE_NAME;
        }

        public String getLOCA_ENCD() {
            return LOCA_ENCD;
        }
        public void setLOCA_ENCD(String LOCA_ENCD) {
            this.LOCA_ENCD = LOCA_ENCD;
        }
        public String getLOCA_NAME() {
            return LOCA_NAME;
        }
        public void setLOCA_NAME(String LOCA_NAME) {
            this.LOCA_NAME = LOCA_NAME;
        }

        public String getENCO_DATE() {
            return ENCO_DATE;
        }
        public void setENCO_DATE(String eNCO_DATE) {
            ENCO_DATE = eNCO_DATE;
        }
        public String getRETR_DATE() {
            return RETR_DATE;
        }
        public void setRETR_DATE(String rETR_DATE) {
            RETR_DATE = rETR_DATE;
        }
        public String getWODN_CODE() {
            return WODN_CODE;
        }
        public void setWODN_CODE(String wODN_CODE) {
            WODN_CODE = wODN_CODE;
        }
        public String getWODN_NAME() {
            return WODN_NAME;
        }
        public void setWODN_NAME(String wODN_NAME) {
            WODN_NAME = wODN_NAME;
        }

        public String getEMPL_POINT() {
            return EMPL_POINT;
        }
        public void setEMPL_POINT(String eMPL_POINT) {
            EMPL_POINT = eMPL_POINT;
        }

        public String getEMPL_NUMB() {
            return EMPL_NUMB;
        }
        public void setEMPL_NUMB(String EMPL_NUMB) {
            this.EMPL_NUMB = EMPL_NUMB;
        }

        public String getEMPL_NAME() {
            return EMPL_NAME;
        }
        public void setEMPL_NAME(String EMPL_NAME) {
            this.EMPL_NAME = EMPL_NAME;
        }

        public String getCPOS_CODE() {
            return CPOS_CODE;
        }
        public void setCPOS_CODE(String CPOS_CODE) {
            this.CPOS_CODE = CPOS_CODE;
        }

        public String getCPOS_NAME() {
            return CPOS_NAME;
        }
        public void setCPOS_NAME(String CPOS_NAME) {
            this.CPOS_NAME = CPOS_NAME;
        }

        public String getOPOS_CODE() {
            return OPOS_CODE;
        }
        public void setOPOS_CODE(String OPOS_CODE) {
            this.OPOS_CODE = OPOS_CODE;
        }

        public String getOPOS_NAME() {
            return OPOS_NAME;
        }
        public void setOPOS_NAME(String OPOS_NAME) {
            this.OPOS_NAME = OPOS_NAME;
        }

        public String getORIG_DTNM() {
            return ORIG_DTNM;
        }
        public void setORIG_DTNM(String ORIG_DTNM) {
            this.ORIG_DTNM = ORIG_DTNM;
        }

        public String getRERN_NUMB() {
            return RERN_NUMB;
        }
        public void setRERN_NUMB(String RERN_NUMB) {
            this.RERN_NUMB = RERN_NUMB;
        }
        public String getRescode() {
            return rescode;
        }
        public void setRescode(String rescode) {
            this.rescode = rescode;
        }
        public String getResmsg() {
            return resmsg;
        }
        public void setResmsg(String resmsg) {
            this.resmsg = resmsg;
        }

    }
%>
