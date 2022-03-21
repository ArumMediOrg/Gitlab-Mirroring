<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
    //결과 Return VO
    public static class NcfRedinfEmpNumResVO {
        String EMPL_NUMB;
        String EMPL_NAME;
        String FREL_CODE;
        String FREL_NAME;
        String FMLY_SSEC;
        String FMLY_NAME;
        String rescode;
        String resmsg;

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
