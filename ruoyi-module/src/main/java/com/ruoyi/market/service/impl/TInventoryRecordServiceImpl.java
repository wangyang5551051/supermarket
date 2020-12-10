package com.ruoyi.market.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.market.mapper.TInventoryRecordMapper;
import com.ruoyi.market.domain.TInventoryRecord;
import com.ruoyi.market.service.ITInventoryRecordService;
import com.ruoyi.common.core.text.Convert;

/**
 * 盘点记录Service业务层处理
 * 
 * @author ruoyi
 * @date 2020-12-09
 */
@Service
public class TInventoryRecordServiceImpl implements ITInventoryRecordService 
{
    @Autowired
    private TInventoryRecordMapper tInventoryRecordMapper;

    /**
     * 查询盘点记录
     * 
     * @param id 盘点记录ID
     * @return 盘点记录
     */
    @Override
    public TInventoryRecord selectTInventoryRecordById(Long id)
    {
        return tInventoryRecordMapper.selectTInventoryRecordById(id);
    }

    /**
     * 查询盘点记录列表
     * 
     * @param tInventoryRecord 盘点记录
     * @return 盘点记录
     */
    @Override
    public List<TInventoryRecord> selectTInventoryRecordList(TInventoryRecord tInventoryRecord)
    {
        return tInventoryRecordMapper.selectTInventoryRecordList(tInventoryRecord);
    }

    /**
     * 新增盘点记录
     * 
     * @param tInventoryRecord 盘点记录
     * @return 结果
     */
    @Override
    public int insertTInventoryRecord(TInventoryRecord tInventoryRecord)
    {
        tInventoryRecord.setCreateTime(DateUtils.getNowDate());
        return tInventoryRecordMapper.insertTInventoryRecord(tInventoryRecord);
    }

    /**
     * 修改盘点记录
     * 
     * @param tInventoryRecord 盘点记录
     * @return 结果
     */
    @Override
    public int updateTInventoryRecord(TInventoryRecord tInventoryRecord)
    {
        return tInventoryRecordMapper.updateTInventoryRecord(tInventoryRecord);
    }

    /**
     * 删除盘点记录对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteTInventoryRecordByIds(String ids)
    {
        return tInventoryRecordMapper.deleteTInventoryRecordByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除盘点记录信息
     * 
     * @param id 盘点记录ID
     * @return 结果
     */
    @Override
    public int deleteTInventoryRecordById(Long id)
    {
        return tInventoryRecordMapper.deleteTInventoryRecordById(id);
    }
}
