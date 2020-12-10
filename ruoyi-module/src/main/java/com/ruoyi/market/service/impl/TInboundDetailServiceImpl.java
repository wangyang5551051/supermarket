package com.ruoyi.market.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.market.mapper.TInboundDetailMapper;
import com.ruoyi.market.domain.TInboundDetail;
import com.ruoyi.market.service.ITInboundDetailService;
import com.ruoyi.common.core.text.Convert;

/**
 * 入库单明细Service业务层处理
 * 
 * @author ruoyi
 * @date 2020-12-09
 */
@Service
public class TInboundDetailServiceImpl implements ITInboundDetailService 
{
    @Autowired
    private TInboundDetailMapper tInboundDetailMapper;

    /**
     * 查询入库单明细
     * 
     * @param id 入库单明细ID
     * @return 入库单明细
     */
    @Override
    public TInboundDetail selectTInboundDetailById(Long id)
    {
        return tInboundDetailMapper.selectTInboundDetailById(id);
    }

    /**
     * 查询入库单明细列表
     * 
     * @param tInboundDetail 入库单明细
     * @return 入库单明细
     */
    @Override
    public List<TInboundDetail> selectTInboundDetailList(TInboundDetail tInboundDetail)
    {
        return tInboundDetailMapper.selectTInboundDetailList(tInboundDetail);
    }

    /**
     * 新增入库单明细
     * 
     * @param tInboundDetail 入库单明细
     * @return 结果
     */
    @Override
    public int insertTInboundDetail(TInboundDetail tInboundDetail)
    {
        tInboundDetail.setCreateTime(DateUtils.getNowDate());
        return tInboundDetailMapper.insertTInboundDetail(tInboundDetail);
    }

    /**
     * 修改入库单明细
     * 
     * @param tInboundDetail 入库单明细
     * @return 结果
     */
    @Override
    public int updateTInboundDetail(TInboundDetail tInboundDetail)
    {
        return tInboundDetailMapper.updateTInboundDetail(tInboundDetail);
    }

    /**
     * 删除入库单明细对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteTInboundDetailByIds(String ids)
    {
        return tInboundDetailMapper.deleteTInboundDetailByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除入库单明细信息
     * 
     * @param id 入库单明细ID
     * @return 结果
     */
    @Override
    public int deleteTInboundDetailById(Long id)
    {
        return tInboundDetailMapper.deleteTInboundDetailById(id);
    }
}
