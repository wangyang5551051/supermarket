package com.ruoyi.market.service.impl;

import com.ruoyi.common.core.text.Convert;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.market.domain.TGoodsType;
import com.ruoyi.market.mapper.TGoodsTypeMapper;
import com.ruoyi.market.service.ITGoodsTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * 商品类型Service业务层处理
 * 
 * @author ruoyi
 * @date 2020-12-09
 */
@Service
public class TGoodsTypeServiceImpl implements ITGoodsTypeService 
{
    @Autowired
    private TGoodsTypeMapper tGoodsTypeMapper;

    /**
     * 查询商品类型
     * 
     * @param id 商品类型ID
     * @return 商品类型
     */
    @Override
    public TGoodsType selectTGoodsTypeById(Long id)
    {
        return tGoodsTypeMapper.selectTGoodsTypeById(id);
    }

    /**
     * 查询商品类型列表
     * 
     * @param tGoodsType 商品类型
     * @return 商品类型
     */
    @Override
    public List<TGoodsType> selectTGoodsTypeList(TGoodsType tGoodsType)
    {
        return tGoodsTypeMapper.selectTGoodsTypeList(tGoodsType);
    }

    /**
     * 新增商品类型
     * 
     * @param tGoodsType 商品类型
     * @return 结果
     */
    @Override
    public int insertTGoodsType(TGoodsType tGoodsType)
    {
//        tGoodsType.setCreateBy(ShiroUtils.getSysUser().lo);
        tGoodsType.setCreateTime(DateUtils.getNowDate());
        return tGoodsTypeMapper.insertTGoodsType(tGoodsType);
    }

    /**
     * 修改商品类型
     * 
     * @param tGoodsType 商品类型
     * @return 结果
     */
    @Override
    public int updateTGoodsType(TGoodsType tGoodsType)
    {
        return tGoodsTypeMapper.updateTGoodsType(tGoodsType);
    }

    /**
     * 删除商品类型对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteTGoodsTypeByIds(String ids)
    {
        return tGoodsTypeMapper.deleteTGoodsTypeByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除商品类型信息
     * 
     * @param id 商品类型ID
     * @return 结果
     */
    @Override
    public int deleteTGoodsTypeById(Long id)
    {
        return tGoodsTypeMapper.deleteTGoodsTypeById(id);
    }

    @Override
    public List<Map<String,Long>> selectTGoodsTypeMap() {
        return tGoodsTypeMapper.selectTGoodsTypeMap();
    }
}
