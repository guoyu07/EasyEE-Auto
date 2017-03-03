package ${pkgName}.action;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;

import ${baseControllerImport};
import ${pageBeanImport};
import ${statusCodeImport};
import ${pkgName}.criteria.${ClassName}Criteria;
import ${pkgName}.entity.${ClassName};
import ${pkgName}.service.${ClassName}Service;


 /**
 * ${ClassName} Controller, generated by EasyAuto
 *
 * 所有Action处理类统一继承BaseAction.
 * 
 * BaseAction中定义了一下内容：
 * - request, application Servlet API
 * - 请求响应相关的JSON参数（EasyUI框架请求都是通过JSON响应）
 * - 初始化JSON响应数据的方法（setJsonMap，setJsonMsgMap，setJsonPaginationMap(PageBean, Object...)）
 * - EasyUI分页信息相关的属性
 * - result="json" 的 JSON 常量
 * 
 * 
 * @author easyproject.cn
 * @version 1.0
 *
 */
@ParentPackage("easyssh-default")
@Namespace("/${ClassName}")
public class ${ClassName}Action extends BaseAction {
	
	private static final long serialVersionUID = 1L;

	public static Logger logger = LoggerFactory.getLogger(${ClassName}Action.class);
	
	private ${ClassName}Service ${ClassName?uncap_first}Service;
	
	private ${ClassName} ${ClassName?uncap_first};
	private ${ClassName}Criteria ${ClassName?uncap_first}Criteria;
	private String[] ${Oid}; // 多行批量删除
	
	
	
	/**
	 * Forward to page
	 * 
	 * @return
	 */
	@Action(value="page",results={
			@Result(location="/WEB-INF/content/main/${Module}/${ClassName}.jsp")
	})
	public String page(){
		return SUCCESS;
	}
	
	
	/*
	* CRUD
	*/

	/**
	 * List
	 * 
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	@Action("list")
	public String list(){
		PageBean pb = super.getPageBean(); // 获得分页对
		${ClassName?uncap_first}Service.findByPage(pb,${ClassName?uncap_first}Criteria);
		// EasyUI框架响应结果都是JSON
		// JSON数据初始化，包含EasySSH Ajax响应信息和分页信息
		super.setJsonPaginationMap(pb);
		return JSON;
	}
	
	
	/**
	 * Get
	 * 
	 * @return
	 */
	@Action("get")
	public String get() {
		${ClassName} ${ClassName?uncap_first}=null;
		try {
			${ClassName?uncap_first}=${ClassName?uncap_first}Service.get(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		super.setJsonMap("data", ${ClassName?uncap_first});
		return JSON;
	}

	/**
	 * Save
	 * @return
	 */
	@Action("save")
	public String save() {
		// 保存
		try {
			${ClassName?uncap_first}Service.save(${ClassName?uncap_first});
			// 处理成功 消息
			super.msg=getText("msg.saveSuccess");
			// 如果需要刷新跳转到最后一页
//			super.page = ${ClassName?uncap_first}Service.findMaxPage(rows);
		} catch (Exception e) {
			e.printStackTrace();
			super.msg=getText("msg.saveFail");
			statusCode=StatusCode.ERROR; // 默认为OK
		}

		/*
		 * Ajax响应信息 statusCode: 响应状态码; msg: 响应消息; callback: 执行回调函数, locationUrl:
		 * 跳转页面
		 */
		// EasyUI框架响应结果都是JSON
		// JSON数据初始化，包含EasySSH Ajax响应信息
		// super.setJsonMsgMap();

		// Add数据后，使用rowData信息更新行的内容
		// 返回JSON
		super.setJsonMsgMap("rowData", ${ClassName?uncap_first});
		return JSON;

		// 如果需要刷新，跳转到最后一页
		// int page = ${ClassName?uncap_first}Service.findMaxPage(rows);
		// super.setJsonMsgMap("rowData", ${ClassName?uncap_first}, "page", page);
		// return JSON;
	}



	/**
	 * Update
	 * 
	 * @return
	 */
	@Action("update")
	public String update() {
		try {
			${ClassName?uncap_first}Service.update(${ClassName?uncap_first});
			super.msg=getText("msg.updateSuccess");
		} catch (Exception e) {
			e.printStackTrace();
			super.msg=getText("msg.updateFail");
			statusCode=StatusCode.ERROR; // 默认为OK
		}

		super.setJsonMsgMap();
		return JSON;
	}
	


<#if Oid??>	
	/**
	 * Delete
	 * 
	 * @return
	 */
	@Action("delete")
	public String delete() {
		try {
			${ClassName?uncap_first}Service.delete(${Oid});
		} catch (Exception e) {
			e.printStackTrace();
			statusCode=StatusCode.ERROR; // 默认为OK
		}
		super.setJsonMsgMap();
		return JSON;
	}
	
	/**
	 * DeleteBatchCascade
	 * 
	 * @return
	 */
	@Action("deleteCascade")
	public String DeleteBatchCascade() {
		try {
			${ClassName?uncap_first}Service.deleteCascade(${Oid});
		} catch (Exception e) {
			e.printStackTrace();
			statusCode=StatusCode.ERROR;
		}
		super.setJsonMsgMap();
		return JSON;
	}
</#if>		


		public ${ClassName} get${ClassName}() {
		return ${ClassName?uncap_first};
	}

	public void set${ClassName}(${ClassName} ${ClassName?uncap_first}) {
		this.${ClassName?uncap_first} = ${ClassName?uncap_first};
	}

	public void set${ClassName}Service(${ClassName}Service ${ClassName?uncap_first}Service) {
		this.${ClassName?uncap_first}Service = ${ClassName?uncap_first}Service;
	}

	public ${ClassName}Criteria get${ClassName}Criteria() {
		return ${ClassName?uncap_first}Criteria;
	}

	public void set${ClassName}Criteria(${ClassName}Criteria ${ClassName?uncap_first}Criteria) {
		this.${ClassName?uncap_first}Criteria = ${ClassName?uncap_first}Criteria;
	}

	public void set${Oid?cap_first}(String[] ${Oid}) {
		this.${Oid} = ${Oid};
	}
}
