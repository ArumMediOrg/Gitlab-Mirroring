<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%! 
    public static class NcfSelRedinfVO extends NcfMedpntVO{
        
        private String FMLY_NAME;
        private String FMLY_RRNF;
        private String FMLY_RRNS;
        
        public String getFMLY_NAME() {
            return FMLY_NAME;
        }
        public void setFMLY_NAME(String FMLY_NAME) {
            this.FMLY_NAME = FMLY_NAME;
        }

        public String getFMLY_RRNF() {
            return FMLY_RRNF;
        }
        public void setFMLY_RRNF(String FMLY_RRNF) {
            this.FMLY_RRNF = FMLY_RRNF;
        }

        public String getFMLY_RRNS() {
            return FMLY_RRNS;
        }
        public void setFMLY_RRNS(String FMLY_RRNS) {
            this.FMLY_RRNS = FMLY_RRNS;
        }
        
    }

    
%>