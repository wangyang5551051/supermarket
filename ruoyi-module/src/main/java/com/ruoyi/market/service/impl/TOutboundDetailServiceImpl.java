package com.ruoyi.market.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.ShiroCommonUtils;
import com.ruoyi.market.domain.TInbound;
import com.ruoyi.market.domain.TInboundDetail;
import com.ruoyi.market.domain.TOutbound;
import com.ruoyi.market.mapper.TInboundMapper;
import com.ruoyi.market.mapper.TOutboundMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.market.mapper.TOutboundDetailMapper;
import com.ruoyi.market.domain.TOutboundDetail;
import com.ruoyi.market.service.ITOutboundDetailService;
import com.ruoyi.common.core.text.Convert;
import org.springframework.transaction.annotation.Transactional;

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
    @Autowired
    private TOutboundMapper tOutboundMapper;

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
    @Transactional
    public int insertTOutboundDetail(TOutboundDetail tOutboundDetail)
    {
        TOutbound outbound = tOutboundMapper.selectTOutboundByCode(tOutboundDetail.getOutboundCode());
        if(outbound == null){
            throw new RuntimeException("新增失败，出库单未找到！");
        }
        if("2".equals(outbound.getStatus())){
            throw new RuntimeException("新增失败，出库单已经完成！");
        }
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
    @Transactional
    public int updateTOutboundDetail(TOutboundDetail tOutboundDetail)
    {
        TOutbound outbound = tOutboundMapper.selectTOutboundByCode(tOutboundDetail.getOutboundCode());
        if(outbound == null){
            throw new RuntimeException("修改失败，出库单未找到！");
        }
        if("2".equals(outbound.getStatus())){
            throw new RuntimeException("修改失败，出库单已经完成！");
        }
        return tOutboundDetailMapper.updateTOutboundDetail(tOutboundDetail);
    }

    /**
     * 删除出库单明细对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    @Transactional
    public int deleteTOutboundDetailByIds(String ids)
    {
        String[] strings = Convert.toStrArray(ids);
        for (String id : strings) {
            TOutboundDetail tOutboundDetail = tOutboundDetailMapper.selectTOutboundDetailById(Long.valueOf(id));
            TOutbound tOutbound = tOutboundMapper.selectTOutboundByCode(tOutboundDetail.getOutboundCode());
            if(tOutbound == null){
                throw new RuntimeException("删除失败，出库单未找到！");
            }
            if("2".equals(tOutbound.getStatus())){
                throw new RuntimeException("删除失败，出库单已经完成！");
            }
        }
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
