<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
    //결과 Return VO
    public static class NcfRedinfResVO {
        String EMPL_NUMB;
        String EMPL_NAME;
        String FREL_CODE;
        String FREL_NAME;
        String CPOS_CODE;
        String CPOS_NAME;
        String OPOS_CODE;
        String OPOS_NAME;
        String ORIG_DTNM;
        String FMLY_SSEC;
        String FMLY_NAME;
        String WODN_CODE;
        String WODN_NAME;
        String rescode;
        String resmsg;

        public String getWODN_CODE() {
            return WODN_CODE;
        }
        public void setWODN_CODE(String WODN_CODE) {
            this.WODN_CODE = WODN_CODE;
        }
        public String getWODN_NAME() {
            return WODN_NAME;
        }
        public void setWODN_NAME(String WODN_NAME) {
            this.WODN_NAME = WODN_NAME;
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

        public String getFREL_CODE() {
            return FREL_CODE;
        }
        public void setFREL_CODE(String FREL_CODE) {
            this.FREL_CODE = FREL_CODE;
        }

        public String getFREL_NAME() {
            return FREL_NAME;
        }
        public void setFREL_NAME(String FREL_NAME) {
            this.FREL_NAME = FREL_NAME;
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

        public String getFMLY_SSEC() {
            return FMLY_SSEC;
        }
        public void setFMLY_SSEC(String FMLY_SSEC) {
            this.FMLY_SSEC = FMLY_SSEC;
        }

        public String getFMLY_NAME() {
            return FMLY_NAME;
        }
        public void setFMLY_NAME(String FMLY_NAME) {
            this.FMLY_NAME = FMLY_NAME;
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
