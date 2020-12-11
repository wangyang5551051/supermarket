package com.ruoyi.market.service.impl;

import com.ruoyi.common.core.text.Convert;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.ShiroCommonUtils;
import com.ruoyi.market.domain.TGoods;
import com.ruoyi.market.domain.TInventoryRecord;
import com.ruoyi.market.mapper.TGoodsMapper;
import com.ruoyi.market.mapper.TInventoryRecordMapper;
import com.ruoyi.market.service.ITGoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * 商品Service业务层处理
 * 
 * @author ruoyi
 * @date 2020-12-09
 */
@Service
public class TGoodsServiceImpl implements ITGoodsService 
{
    @Autowired
    private TGoodsMapper tGoodsMapper;
    @Autowired
    private TInventoryRecordMapper tInventoryRecordMapper;

    /**
     * 查询商品
     * 
     * @param id 商品ID
     * @return 商品
     */
    @Override
    public TGoods selectTGoodsById(Long id)
    {
        return tGoodsMapper.selectTGoodsById(id);
    }

    /**
     * 查询商品列表
     * 
     * @param tGoods 商品
     * @return 商品
     */
    @Override
    public List<TGoods> selectTGoodsList(TGoods tGoods)
    {
        return tGoodsMapper.selectTGoodsList(tGoods);
    }

    /**
     * 新增商品
     * 
     * @param tGoods 商品
     * @return 结果
     */
    @Override
    public int insertTGoods(TGoods tGoods)
    {
        tGoods.setCreateBy(ShiroCommonUtils.getSysUser().getUserName());
        tGoods.setCreateTime(DateUtils.getNowDate());
        return tGoodsMapper.insertTGoods(tGoods);
    }

    /**
     * 修改商品
     * 
     * @param tGoods 商品
     * @return 结果
     */
    @Override
    public int updateTGoods(TGoods tGoods)
    {
        return tGoodsMapper.updateTGoods(tGoods);
    }

    /**
     * 删除商品对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteTGoodsByIds(String ids)
    {
        return tGoodsMapper.deleteTGoodsByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除商品信息
     * 
     * @param id 商品ID
     * @return 结果
     */
    @Override
    public int deleteTGoodsById(Long id)
    {
        return tGoodsMapper.deleteTGoodsById(id);
    }

    @Override
    public int updateTGoodsNum(TGoods tGoods)
    {
        TGoods tGoods1 = tGoodsMapper.selectTGoodsById(tGoods.getId());
        TInventoryRecord inventoryRecord = new TInventoryRecord();
        inventoryRecord.setGoodsId(tGoods.getId());
        inventoryRecord.setOldNum(tGoods1.getNum());
        inventoryRecord.setNewNum(tGoods.getNum());
        inventoryRecord.setCreateTime(DateUtils.getNowDate());
        inventoryRecord.setCreateBy(ShiroCommonUtils.getSysUser().getUserName());
        tInventoryRecordMapper.insertTInventoryRecord(inventoryRecord);
        return tGoodsMapper.updateTGoods(tGoods);
    }
}
