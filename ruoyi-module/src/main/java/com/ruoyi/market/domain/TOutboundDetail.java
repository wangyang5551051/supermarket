package com.ruoyi.market.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 出库单明细对象 t_outbound_detail
 * 
 * @author ruoyi
 * @date 2020-12-09
 */
public class TOutboundDetail extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** ID */
    private Long id;

    /** 出库单号 */
    @Excel(name = "出库单号")
    private String outboundCode;

    /** 商品ID */
    @Excel(name = "商品ID")
    private Long goodsId;

    /** 数量 */
    @Excel(name = "数量")
    private Long num;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setOutboundCode(String outboundCode) 
    {
        this.outboundCode = outboundCode;
    }

    public String getOutboundCode() 
    {
        return outboundCode;
    }
    public void setGoodsId(Long goodsId) 
    {
        this.goodsId = goodsId;
    }

    public Long getGoodsId() 
    {
        return goodsId;
    }
    public void setNum(Long num) 
    {
        this.num = num;
    }

    public Long getNum() 
    {
        return num;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("outboundCode", getOutboundCode())
            .append("goodsId", getGoodsId())
            .append("num", getNum())
            .toString();
    }
}
