package cn.easyproject.easyee.sm.cmsmoudle.dao;

import java.io.Serializable;
import java.util.List;

import cn.easyproject.easyee.sm.base.pagination.PageBean;
import cn.easyproject.easyee.sm.cmsmoudle.entity.Slider;
/**
 * Slider DAO, generated by EasyAuto
 * @author easyproject.cn
 * @version 1.0
 *
 */
@SuppressWarnings("rawtypes")
public interface SliderDAO {
	
	/**
	 * Save
	 * @param emp Object
	 */
	public void save(Slider o);
	
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
	public void update(Slider o);
	
	/**
	 * Get
	 * @param oid oid
	 * @return Object
	 */
	public Slider get(Serializable oid);
	
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
