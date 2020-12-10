package com.ruoyi.market.mapper;

import com.ruoyi.market.domain.TSupplier;

import java.util.List;

/**
 * 供货商Mapper接口
 * 
 * @author ruoyi
 * @date 2020-12-09
 */
public interface TSupplierMapper 
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
     * 删除供货商
     * 
     * @param id 供货商ID
     * @return 结果
     */
    public int deleteTSupplierById(Long id);

    /**
     * 批量删除供货商
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteTSupplierByIds(String[] ids);
}
