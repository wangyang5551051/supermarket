package com.ruoyi.market.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.ShiroCommonUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.market.domain.*;
import com.ruoyi.market.mapper.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.market.service.ITOutboundService;
import com.ruoyi.common.core.text.Convert;
import org.springframework.transaction.annotation.Transactional;

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
    @Autowired
    private TOutboundDetailMapper tOutboundDetailMapper;
    @Autowired
    private TGoodsMapper tGoodsMapper;

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
    @Transactional
    public int insertTOutbound(TOutbound tOutbound)
    {
        tOutbound.setOutboundCode(getCode());
        tOutbound.setStatus("1");
        tOutbound.setCreateBy(ShiroCommonUtils.getSysUser().getUserName());
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
    @Transactional
    public int updateTOutbound(TOutbound tOutbound)
    {
        TOutbound outbound = tOutboundMapper.selectTOutboundById(tOutbound.getId());
        if("2".equals(outbound.getStatus())){
            throw new RuntimeException("出库失败，出库单已经完成！");
        }
        List<TOutboundDetail> tOutboundDetails = tOutboundDetailMapper.selectTOutboundDetailByCode(outbound.getOutboundCode());
        tOutboundDetails.forEach(x ->{
            TGoods tGoods = tGoodsMapper.selectTGoodsById(x.getGoodsId());
            if(tGoods.getNum() != null && x.getNum() != null){
                tGoods.setNum(tGoods.getNum().subtract(x.getNum()));
            }
            tGoodsMapper.updateTGoods(tGoods);
        });
        tOutbound.setStatus("2");
        return tOutboundMapper.updateTOutbound(tOutbound);
    }

    /**
     * 删除出库单对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    @Transactional
    public int deleteTOutboundByIds(String ids)
    {
        String[] strings = Convert.toStrArray(ids);
        int i = tOutboundMapper.deleteTOutboundByIds(Convert.toStrArray(ids));
        if(i < strings.length){
            throw new RuntimeException("删除失败，出库单已经完成！");
        }
        return i;
    }

    /**
     * 删除出库单信息
     * 
     * @param id 出库单ID
     * @return 结果
     */
    @Override
    @Transactional
    public int deleteTOutboundById(Long id)
    {
        return tOutboundMapper.deleteTOutboundById(id);
    }

    private synchronized String getCode(){
        String time = "O"+DateUtils.getDateYMD();
        String code =  tOutboundMapper.getCodeMax(time);
        if(!StringUtils.isEmpty(code)){
            return time+String.format("%02d", Integer.valueOf(code)+1);
        }
        return time+"01";
    }

    @Override
    public TOutbound selectTInboundByCode(String outboundCode) {
        return tOutboundMapper.selectTOutboundByCode(outboundCode);
    }
}
