<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%! 
    // Insert 요청 VO
    public static class NcfInsMedpntVO extends NcfMedpntVO{
        private String empl_numb;
        private String mepn_date;
        private String medi_pntx;
        private String fmly_name;
        private String used_wecd;
        private String inst_usid;
        private String mepn_remk;
        private String wage_encd;
        private String frel_code;
        
        public String getFrel_code() {
            return frel_code;
        }

        public void setFrel_code(String frel_code){
            this.frel_code = frel_code;
        }

        public String getWage_encd() {
            return wage_encd;
        }

        public void setWage_encd(String wage_encd){
            this.wage_encd = wage_encd;
        }

        public String getMepn_remk() {
            return mepn_remk;
        }

        public void setMepn_remk(String mepn_remk){
            this.mepn_remk = mepn_remk;
        }

        public String getInst_usid() {
            return inst_usid;
        }

        public void setInst_usid(String inst_usid){
            this.inst_usid = inst_usid;
        }

        public String getUsed_wecd() {
            return used_wecd;
        }

        public void setUsed_wecd(String used_wecd){
            this.used_wecd = used_wecd;
        }

        public String getFmly_name() {
            return fmly_name;
        }

        public void setFmly_name(String fmly_name){
            this.fmly_name = fmly_name;
        }

        public String getMedi_pntx() {
            return medi_pntx;
        }

        public void setMedi_pntx(String medi_pntx){
            this.medi_pntx = medi_pntx;
        }

        public String getMepn_date() {
            return mepn_date;
        }

        public void setMepn_date(String mepn_date){
            this.mepn_date = mepn_date;
        }

        public String getEmpl_numb() {
            return empl_numb;
        }

        public void setEmpl_numb(String empl_numb){
            this.empl_numb = empl_numb;
        }
    }

    
%>