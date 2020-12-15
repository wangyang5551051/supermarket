package com.ruoyi.market.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 入库单对象 t_inbound
 * 
 * @author ruoyi
 * @date 2020-12-09
 */
public class TInbound extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** ID */
    private Long id;

    /** 入库单号 */
    @Excel(name = "入库单号")
    private String inboundCode;

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
    public void setInboundCode(String inboundCode)
    {
        this.inboundCode = inboundCode;
    }

    public String getInboundCode()
    {
        return inboundCode;
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
                .append("inboundCode", getInboundCode())
                .append("status", getStatus())
                .toString();
    }
}
