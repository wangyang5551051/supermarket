package com.ruoyi.market.service;

import java.util.List;
import com.ruoyi.market.domain.TSupplier;

/**
 * 供货商Service接口
 * 
 * @author ruoyi
 * @date 2020-12-09
 */
public interface ITSupplierService 
{
    /**
     * 查询供货商
     * 
     * @param id 供货商ID
     * @return 供货商
     */
    public TSupplier selectTSupplierById(Long id);

    /**
     * 查询供货商列表
     * 
     * @param tSupplier 供货商
     * @return 供货商集合
     */
    public List<TSupplier> selectTSupplierList(TSupplier tSupplier);

    /**
     * 新增供货商
     * 
     * @param tSupplier 供货商
     * @return 结果
     */
    public int insertTSupplier(TSupplier tSupplier);

    /**
     * 修改供货商
     * 
     * @param tSupplier 供货商
     * @return 结果
     */
    public int updateTSupplier(TSupplier tSupplier);

    /**
     * 批量删除供货商
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteTSupplierByIds(String ids);

    /**
     * 删除供货商信息
     * 
     * @param id 供货商ID
     * @return 结果
     */
    public int deleteTSupplierById(Long id);
}
