package com.ruoyi.market.mapper;

import com.ruoyi.market.domain.TInventoryRecord;

import java.util.List;

/**
 * 盘点记录Mapper接口
 * 
 * @author ruoyi
 * @date 2020-12-09
 */
public interface TInventoryRecordMapper 
{
    /**
     * 查询盘点记录
     * 
     * @param id 盘点记录ID
     * @return 盘点记录
     */
    public TInventoryRecord selectTInventoryRecordById(Long id);

    /**
     * 查询盘点记录列表
     * 
     * @param tInventoryRecord 盘点记录
     * @return 盘点记录集合
     */
    public List<TInventoryRecord> selectTInventoryRecordList(TInventoryRecord tInventoryRecord);

    /**
     * 新增盘点记录
     * 
     * @param tInventoryRecord 盘点记录
     * @return 结果
     */
    public int insertTInventoryRecord(TInventoryRecord tInventoryRecord);

    /**
     * 修改盘点记录
     * 
     * @param tInventoryRecord 盘点记录
     * @return 结果
     */
    public int updateTInventoryRecord(TInventoryRecord tInventoryRecord);

    /**
     * 删除盘点记录
     * 
     * @param id 盘点记录ID
     * @return 结果
     */
    public int deleteTInventoryRecordById(Long id);

    /**
     * 批量删除盘点记录
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteTInventoryRecordByIds(String[] ids);
}
