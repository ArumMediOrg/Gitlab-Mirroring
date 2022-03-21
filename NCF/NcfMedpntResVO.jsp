<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
    //결과 Return VO
    public static class NcfMedpntResVO {
        String empl_numb;
        String medi_pntx_sum;
        String wage_encd;
        String rescode;
        String resmsg;
        
        public String getWage_encd() {
            return wage_encd;
        }
        
        public void setWage_encd(String wage_encd) {
            this.wage_encd = wage_encd;
        }

        public String getEmpl_numb() {
            return empl_numb;
        }
        public void setEmpl_numb(String empl_numb) {
            this.empl_numb = empl_numb;
        }
        public String getMedi_pntx_sum() {
            return medi_pntx_sum;
        }
        public void setMedi_pntx_sum(String medi_pntx_sum) {
            this.medi_pntx_sum = medi_pntx_sum;
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
