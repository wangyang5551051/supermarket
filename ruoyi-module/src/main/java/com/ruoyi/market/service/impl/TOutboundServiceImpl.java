package com.ruoyi.market.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.market.mapper.TOutboundMapper;
import com.ruoyi.market.domain.TOutbound;
import com.ruoyi.market.service.ITOutboundService;
import com.ruoyi.common.core.text.Convert;

/**
 * 出库单Service业务层处理
 * 
 * @author ruoyi
 * @date 2020-12-09
 */
@Service
public class TOutboundServiceImpl implements ITOutboundService 
{
    @Autowired
    private TOutboundMapper tOutboundMapper;

    /**
     * 查询出库单
     * 
     * @param id 出库单ID
     * @return 出库单
     */
    @Override
    public TOutbound selectTOutboundById(Long id)
    {
        return tOutboundMapper.selectTOutboundById(id);
    }

    /**
     * 查询出库单列表
     * 
     * @param tOutbound 出库单
     * @return 出库单
     */
    @Override
    public List<TOutbound> selectTOutboundList(TOutbound tOutbound)
    {
        return tOutboundMapper.selectTOutboundList(tOutbound);
    }

    /**
     * 新增出库单
     * 
     * @param tOutbound 出库单
     * @return 结果
     */
    @Override
    public int insertTOutbound(TOutbound tOutbound)
    {
        tOutbound.setCreateTime(DateUtils.getNowDate());
        return tOutboundMapper.insertTOutbound(tOutbound);
    }

    /**
     * 修改出库单
     * 
     * @param tOutbound 出库单
     * @return 结果
     */
    @Override
    public int updateTOutbound(TOutbound tOutbound)
    {
        return tOutboundMapper.updateTOutbound(tOutbound);
    }

    /**
     * 删除出库单对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteTOutboundByIds(String ids)
    {
        return tOutboundMapper.deleteTOutboundByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除出库单信息
     * 
     * @param id 出库单ID
     * @return 结果
     */
    @Override
    public int deleteTOutboundById(Long id)
    {
        return tOutboundMapper.deleteTOutboundById(id);
    }
}
