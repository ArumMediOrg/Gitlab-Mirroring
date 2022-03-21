<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
    //요청 공통 VO
    public static class NcfMedpntVO {
        public static final String op_mode = "prod_aa";
        public static final String inf_key = "hrm";
        public static final String conf_url = "aHR0cHM6Ly9jNHZldWNzYnl5LmFwaWd3Lm50cnVzcy5jb20vY29uZmlnL3YxL2RiaW5mbz9ibG9ja2luZz10cnVlJnJlc3VsdD10cnVl";
        public static final String conf_apikey = "TGdKeWwzWGVRSGFGUHNoV0REYmE4VzhuUWt2WUlCUUtvZ1dSR0tuTQ==";

        public String getOp_mode() {
            return op_mode;
        }

        public String getInf_key() {
            return inf_key;
        }

        public String getConf_url(){
            return conf_url;
        }

        public String getConf_apikey(){
            return conf_apikey;
        }
    }
%>