<!--${ClassName} Add Page, generated by EasyAuto -->
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags"  prefix="s"%>

<%--  JavaScript  --%>

<script type="text/javascript">
$(function() {
	/*
	 * CRUD
	 */
	//Create or Update
	<#if addMutilpart>
		${ClassName}.add = function() {
			var dg=$("#${ClassName}DataGrid");
			$("${ClassName}AddDialogPageSize").val(dg.datagrid("options").pageSize);
			$('#${ClassName}AddForm').form('submit', {
				 onSubmit:function(){
	                  return $(this).form('enableValidation').form('validate');
	            },
			    success: function(data){
			        var data = eval('(' + data + ')');  // change the JSON string to javascript object
			        if (data.statusCode==200) {
			        	dg.datagrid({"pageNumber":data.page});//Refresh datagrid
			        	uiEx.msg(data.msg);
						uiEx.closeDialog("#${ClassName}AddDialog");
					} else{
						uiEx.msg(data.msg);
					}
			    }
			});
		}
	<#else>
	${ClassName}.add = function() {
		var dg=$("#${ClassName}DataGrid");
		var url = "${ClassName}/save";
		uiEx.submitURLAjax("#${ClassName}AddForm", url, function(data) {
			data = eval("(" + data + ")");
			// Refresh datagrid
			if (data.statusCode==200) {
				//uiEx.reloadSelTab("#tabs"); // Refresh Tab
				//dg.datagrid('reload'); //Refresh datagrid, Stay on the current page
				//dg.datagrid('load'); //Refresh datagrid
				dg.datagrid({"pageNumber":data.page});//Refresh datagrid
				uiEx.closeDialog("#${ClassName}AddDialog");
			} 
		},{"rows":dg.datagrid("options").pageSize});
	}
	</#if>
});


</script>

<%-- 2. Dialog --%>
<div id="${ClassName}AddDialog" class="easyui-dialog" style="width:480px;height:330px;padding:10px 20px;" resizable="true" closed="true" buttons="#${ClassName}Add-dlg-buttons">
	<div class="ftitle">${ClsLabel}<s:message code="label.info"></s:message></div>
	<form id="${ClassName}AddForm" method="post" data-options="novalidate:true" <#if addMutilpart>enctype="multipart/form-data" action="${ClassName}/save"</#if>>
			<input name="${Oid}" type="hidden"/>
			<#if addMutilpart><input name="rows" id="${ClassName}AddDialogPageSize" type="hidden"/></#if>
			 <table cellpadding="5">
			 	<#if Autos??>
				<#list Autos as item>
				<#assign info=item?split("#")>
				<#if info[5]=="true">
				<tr>
	    			<td>${info[2]}:</td>
	    			<td><input class="${info[7]} easyui-validatebox" name="${info[1]}" <#if info[3]=="true">required="true"</#if> data-options="prompt:'input ${info[2]}...'"><#if info[3]=="true"><span class="required">*</span></#if></td>
	    		</tr>
				</#if>
				</#list>
				</#if>
	    	</table>
	</form>
</div>
<div id="${ClassName}Add-dlg-buttons">
	<a class="easyui-linkbutton" id="${ClassName}AddSaveBtn" iconCls="icon-ok" onclick="${ClassName}.add()"><s:message code="label.add"></s:message></a>
	<a class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:uiEx.closeDialog('#${ClassName}AddDialog')"><s:message code="label.cancel"></s:message></a>
</div>