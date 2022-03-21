<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%! 
    //select, exec 요청 공통 VO
    public static class NcfSelMedpntVO extends NcfMedpntVO{
        
        private String empNumber;

        public String getEmpNumber(){
            return empNumber;
        }

        public void setEmpNumber(String empNumber){
            this.empNumber = empNumber;
        }
    }

    
%>