<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
    //결과 Return VO
    public static class NcfMedpntResListVO {
        String empl_numb;
        String mepn_uscd;
        String sral_numb;
        String mepn_date;
        String wage_encd;
        String medi_pntx;
        String untl_date;
        String frel_code;
        String fmly_name;
        String used_wecd;
        String expt_ysno_yn;
        String expt_ysno;
        String mepn_excd;
        String cnfm_ysno_yn;
        String cnfm_ysno;
        String remk_200x;
        String inst_usid;
        String inst_date;
        String updt_usid;
        String updt_date;
        String mepn_remk;
        String usex_pntx;
        String rescode;
        String resmsg;


        public String getMepn_uscd() {
            return mepn_uscd;
        }

        public void setMepn_uscd(String mepn_uscd) {
            this.mepn_uscd = mepn_uscd;
        }

        public String getSral_numb() {
            return sral_numb;
        }

        public void setSral_numb(String sral_numb) {
            this.sral_numb = sral_numb;
        }

        public String getMepn_date() {
            return mepn_date;
        }

        public void setMepn_date(String mepn_date) {
            this.mepn_date = mepn_date;
        }

        public String getWage_encd() {
            return wage_encd;
        }

        public void setWage_encd(String wage_encd) {
            this.wage_encd = wage_encd;
        }

        public String getMedi_pntx() {
            return medi_pntx;
        }

        public void setMedi_pntx(String medi_pntx) {
            this.medi_pntx = medi_pntx;
        }

        public String getUntl_date() {
            return untl_date;
        }

        public void setUntl_date(String untl_date) {
            this.untl_date = untl_date;
        }

        public String getFrel_code() {
            return frel_code;
        }

        public void setFrel_code(String frel_code) {
            this.frel_code = frel_code;
        }

        public String getFmly_name() {
            return fmly_name;
        }

        public void setFmly_name(String fmly_name) {
            this.fmly_name = fmly_name;
        }

        public String getUsed_wecd() {
            return used_wecd;
        }

        public void setUsed_wecd(String used_wecd) {
            this.used_wecd = used_wecd;
        }

        public String getExpt_ysno_yn() {
            return expt_ysno_yn;
        }

        public void setExpt_ysno_yn(String expt_ysno_yn) {
            this.expt_ysno_yn = expt_ysno_yn;
        }

        public String getExpt_ysno() {
            return expt_ysno;
        }

        public void setExpt_ysno(String expt_ysno) {
            this.expt_ysno = expt_ysno;
        }

        public String getMepn_excd() {
            return mepn_excd;
        }

        public void setMepn_excd(String mepn_excd) {
            this.mepn_excd = mepn_excd;
        }

        public String getCnfm_ysno_yn() {
            return cnfm_ysno_yn;
        }

        public void setCnfm_ysno_yn(String cnfm_ysno_yn) {
            this.cnfm_ysno_yn = cnfm_ysno_yn;
        }

        public String getCnfm_ysno() {
            return cnfm_ysno;
        }

        public void setCnfm_ysno(String cnfm_ysno) {
            this.cnfm_ysno = cnfm_ysno;
        }

        public String getRemk_200x() {
            return remk_200x;
        }

        public void setRemk_200x(String remk_200x) {
            this.remk_200x = remk_200x;
        }

        public String getInst_usid() {
            return inst_usid;
        }

        public void setInst_usid(String inst_usid) {
            this.inst_usid = inst_usid;
        }

        public String getInst_date() {
            return inst_date;
        }

        public void setInst_date(String inst_date) {
            this.inst_date = inst_date;
        }

        public String getUpdt_usid() {
            return updt_usid;
        }

        public void setUpdt_usid(String updt_usid) {
            this.updt_usid = updt_usid;
        }

        public String getUpdt_date() {
            return updt_date;
        }

        public void setUpdt_date(String updt_date) {
            this.updt_date = updt_date;
        }

        public String getMepn_remk() {
            return mepn_remk;
        }

        public void setMepn_remk(String mepn_remk) {
            this.mepn_remk = mepn_remk;
        }

        public String getEmpl_numb() {
            return empl_numb;
        }

        public void setEmpl_numb(String empl_numb) {
            this.empl_numb = empl_numb;
        }

        public String getUsex_pntx() {
            return usex_pntx;
        }

        public void setUsex_pntx(String usex_pntx) {
            this.usex_pntx = usex_pntx;
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
