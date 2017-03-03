package ${pkgName}.dao;

import java.io.Serializable;
import java.util.List;

import ${pageBeanImport};
import ${pkgName}.entity.${ClassName};
/**
 * ${ClassName} DAO, generated by EasyAuto
 * @author easyproject.cn
 * @version 1.0
 *
 */
@SuppressWarnings("rawtypes")
public interface ${ClassName}DAO {
	
	/**
	 * Save
	 * @param emp Object
	 */
	public void save(${ClassName} o);
	
	/**
	 * Delete Object
	 * @param oid oid
	 */
	public void delete(Serializable oid);
	
	/**
	 * Delete All
	 * @param oids oids
	 */
	public void deleteByIds(String[] oids);
	
	
	/**
	 * Update
	 * @param o
	 */
	public void update(${ClassName} o);
	
	/**
	 * Get
	 * @param oid oid
	 * @return Object
	 */
	public ${ClassName} get(Serializable oid);
	
	/**
	 * Pagination
	 * @param pageBean PageBean
	 */
	public List pagination(PageBean pageBean);
	
	/**
	 * Find all
	 */
	public List findAll();
	
	/**
	 * Find row count
	 */
	public int findMaxRow();
}
