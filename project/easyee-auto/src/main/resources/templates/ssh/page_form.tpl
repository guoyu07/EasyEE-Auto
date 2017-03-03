<!--${ClassName} Form Page, generated by EasyAuto -->
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro"%>

<script type="text/javascript">
	var ${ClassName} = {};
	$(function() {
		${ClassName}.load=function(){
			$.post("${ClassName}/list", {page:1,rows:1}, function(data){
				 uiEx.loadForm('#${ClassName}DataForm', data.rows[0], "${ClassName?uncap_first}.");
			})
		}
		${ClassName}.load();
		
		<#if editMutilpart>
		${ClassName}.update = function() {
			$('#${ClassName}DataForm').form('submit', {
				 onSubmit:function(){
	                  return $(this).form('enableValidation').form('validate');
	            },
			    success: function(data){
			        var data = eval('(' + data + ')');  // change the JSON string to javascript object
			        if (data.statusCode==200) {
			        	uiEx.msg(data.msg);
					} else{
						uiEx.msg(data.msg);
					}
			    }
			});
		}
		<#else>
		${ClassName}.update=function(){
			uiEx.submitURLAjax("#${ClassName}DataForm", "${ClassName}/update", function(data) {
				if (data.statusCode==200) {
					uiEx.msg(data.msg);
				} else{
					uiEx.msg('<s:text name="msg.updateFail"></s:text>');
				}
			});
		} 
		</#if>
		
	});
</script>
<style>
.th{ font-weight: bold;padding-left: 35px}
</style>
<%-- 2. Form --%>
 <div class="easyui-panel" title="${ClsLabel}" >
        <form id="${ClassName}DataForm" style="width: 100%" method="post" <#if editMutilpart>enctype="multipart/form-data" action="${ClassName}/update"</#if>>
       		<input name="${ClassName?uncap_first}.${Oid}" type="hidden">
            <table cellpadding="5">
            	<#if Autos??>
				<#list Autos as item>
				<#assign info=item?split("#")>
				<#if info[5]=="true">
	    		 <tr>
                    <td class="th">${info[2]}:</td>
                    <td><input name="${ClassName?uncap_first}.${info[1]}" <#if info[6]=="false">readonly</#if> style="height: 30px;width: 350px" <#if info[3]=="true">required="true" class="easyui-validatebox"<#else>class="easyui-textbox"</#if> ></input><#if info[3]=="true"><span class="required">*</span></#if></td>
                </tr>
				</#if>
				</#list>
				</#if>
                <tr>
                    <td></td>
                    <td>
                    <a class="easyui-linkbutton" style="padding:3px 8px" id="${ClassName}UpdateBtn" iconCls="icon-ok" onclick="${ClassName}.update()"><s:text name="label.edit"></s:text></a> 
					<a class="easyui-linkbutton" style="padding:3px 8px" iconCls="icon-cancel" onclick="${ClassName}.load()"><s:text name="label.reset"></s:text></a>
                    </td>
                </tr>
            </table>
        </form>
    </div>

<%-- 
<%@ include file="/WEB-INF/content/dialog/${Module}/${ClassName}Add.jsp"%>  
<%@ include file="/WEB-INF/content/dialog/${Module}/${ClassName}Edit.jsp"%>  
--%>