package com.ruoyi.market.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.market.mapper.TGoodsMapper;
import com.ruoyi.market.domain.TGoods;
import com.ruoyi.market.service.ITGoodsService;
import com.ruoyi.common.core.text.Convert;

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
}
