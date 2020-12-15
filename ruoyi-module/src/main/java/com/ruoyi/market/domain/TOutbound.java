package com.ruoyi.market.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 出库单对象 t_outbound
 * 
 * @author ruoyi
 * @date 2020-12-09
 */
public class TOutbound extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** ID */
    private Long id;

    /** 出库单号 */
    @Excel(name = "出库单号")
    private String outboundCode;

    /** 单据状态 */
    @Excel(name = "单据状态")
    private String status;
    private String day;
    private String month;

    public String getDay() {
        return day;
    }

    public void setDay(String day) {
        this.day = day;
    }

    public String getMonth() {
        return month;
    }

    public void setMonth(String month) {
        this.month = month;
    }

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
    public void setStatus(String status)
    {
        this.status = status;
    }

    public String getStatus()
    {
        return status;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
                .append("id", getId())
                .append("createBy", getCreateBy())
                .append("createTime", getCreateTime())
                .append("outboundCode", getOutboundCode())
                .append("status", getStatus())
                .toString();
    }
}
