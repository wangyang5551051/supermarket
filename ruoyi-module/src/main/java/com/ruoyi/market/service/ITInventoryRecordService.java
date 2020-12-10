package com.ruoyi.market.service;

import java.util.List;
import com.ruoyi.market.domain.TInventoryRecord;

/**
 * 盘点记录Service接口
 * 
 * @author ruoyi
 * @date 2020-12-09
 */
public interface ITInventoryRecordService 
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
     * 批量删除盘点记录
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteTInventoryRecordByIds(String ids);

    /**
     * 删除盘点记录信息
     * 
     * @param id 盘点记录ID
     * @return 结果
     */
    public int deleteTInventoryRecordById(Long id);
}
