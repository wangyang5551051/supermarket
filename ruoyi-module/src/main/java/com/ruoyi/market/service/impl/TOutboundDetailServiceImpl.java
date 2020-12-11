package com.ruoyi.market.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.ShiroCommonUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.market.mapper.TOutboundDetailMapper;
import com.ruoyi.market.domain.TOutboundDetail;
import com.ruoyi.market.service.ITOutboundDetailService;
import com.ruoyi.common.core.text.Convert;

/**
 * 出库单明细Service业务层处理
 * 
 * @author ruoyi
 * @date 2020-12-09
 */
@Service
public class TOutboundDetailServiceImpl implements ITOutboundDetailService 
{
    @Autowired
    private TOutboundDetailMapper tOutboundDetailMapper;

    /**
     * 查询出库单明细
     * 
     * @param id 出库单明细ID
     * @return 出库单明细
     */
    @Override
    public TOutboundDetail selectTOutboundDetailById(Long id)
    {
        return tOutboundDetailMapper.selectTOutboundDetailById(id);
    }

    /**
     * 查询出库单明细列表
     * 
     * @param tOutboundDetail 出库单明细
     * @return 出库单明细
     */
    @Override
    public List<TOutboundDetail> selectTOutboundDetailList(TOutboundDetail tOutboundDetail)
    {
        return tOutboundDetailMapper.selectTOutboundDetailList(tOutboundDetail);
    }

    /**
     * 新增出库单明细
     * 
     * @param tOutboundDetail 出库单明细
     * @return 结果
     */
    @Override
    public int insertTOutboundDetail(TOutboundDetail tOutboundDetail)
    {
        tOutboundDetail.setCreateBy(ShiroCommonUtils.getSysUser().getUserName());
        tOutboundDetail.setCreateTime(DateUtils.getNowDate());
        return tOutboundDetailMapper.insertTOutboundDetail(tOutboundDetail);
    }

    /**
     * 修改出库单明细
     * 
     * @param tOutboundDetail 出库单明细
     * @return 结果
     */
    @Override
    public int updateTOutboundDetail(TOutboundDetail tOutboundDetail)
    {
        return tOutboundDetailMapper.updateTOutboundDetail(tOutboundDetail);
    }

    /**
     * 删除出库单明细对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteTOutboundDetailByIds(String ids)
    {
        return tOutboundDetailMapper.deleteTOutboundDetailByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除出库单明细信息
     * 
     * @param id 出库单明细ID
     * @return 结果
     */
    @Override
    public int deleteTOutboundDetailById(Long id)
    {
        return tOutboundDetailMapper.deleteTOutboundDetailById(id);
    }
}
