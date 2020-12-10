package com.ruoyi.market.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.market.mapper.TSupplierMapper;
import com.ruoyi.market.domain.TSupplier;
import com.ruoyi.market.service.ITSupplierService;
import com.ruoyi.common.core.text.Convert;

/**
 * 供货商Service业务层处理
 * 
 * @author ruoyi
 * @date 2020-12-09
 */
@Service
public class TSupplierServiceImpl implements ITSupplierService 
{
    @Autowired
    private TSupplierMapper tSupplierMapper;

    /**
     * 查询供货商
     * 
     * @param id 供货商ID
     * @return 供货商
     */
    @Override
    public TSupplier selectTSupplierById(Long id)
    {
        return tSupplierMapper.selectTSupplierById(id);
    }

    /**
     * 查询供货商列表
     * 
     * @param tSupplier 供货商
     * @return 供货商
     */
    @Override
    public List<TSupplier> selectTSupplierList(TSupplier tSupplier)
    {
        return tSupplierMapper.selectTSupplierList(tSupplier);
    }

    /**
     * 新增供货商
     * 
     * @param tSupplier 供货商
     * @return 结果
     */
    @Override
    public int insertTSupplier(TSupplier tSupplier)
    {
        tSupplier.setCreateTime(DateUtils.getNowDate());
        return tSupplierMapper.insertTSupplier(tSupplier);
    }

    /**
     * 修改供货商
     * 
     * @param tSupplier 供货商
     * @return 结果
     */
    @Override
    public int updateTSupplier(TSupplier tSupplier)
    {
        return tSupplierMapper.updateTSupplier(tSupplier);
    }

    /**
     * 删除供货商对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteTSupplierByIds(String ids)
    {
        return tSupplierMapper.deleteTSupplierByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除供货商信息
     * 
     * @param id 供货商ID
     * @return 结果
     */
    @Override
    public int deleteTSupplierById(Long id)
    {
        return tSupplierMapper.deleteTSupplierById(id);
    }
}
