package com.ruoyi.leida.domain;

import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import java.math.BigDecimal;

/**
 * 【请填写功能名称】对象 zstudent
 * 
 * @author ruoyi
 * @date 2020-08-10
 */
public class Zleidatu extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** $column.columnComment */
    private Long id;

    /** 姓名 */
    @Excel(name = "姓名")
    private String name;

    /** 年龄 */
    @Excel(name = "年龄")
    private Long age;

    /** 击杀 */
    @Excel(name = "击杀")
    private BigDecimal jisha;

    /** 助攻 */
    @Excel(name = "助攻")
    private BigDecimal zhugong;

    /** 生存 */
    @Excel(name = "生存")
    private BigDecimal shengcun;

    /** 物理 */
    @Excel(name = "物理")
    private BigDecimal wuli;

    /** 魔法 */
    @Excel(name = "魔法")
    private BigDecimal mofa;

    /** 防御 */
    @Excel(name = "防御")
    private BigDecimal fangyu;

    /** 金钱 */
    @Excel(name = "金钱")
    private BigDecimal jinqian;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setName(String name) 
    {
        this.name = name;
    }

    public String getName() 
    {
        return name;
    }
    public void setAge(Long age) 
    {
        this.age = age;
    }

    public Long getAge() 
    {
        return age;
    }
    public void setJisha(BigDecimal jisha) 
    {
        this.jisha = jisha;
    }

    public BigDecimal getJisha() 
    {
        return jisha;
    }
    public void setZhugong(BigDecimal zhugong) 
    {
        this.zhugong = zhugong;
    }

    public BigDecimal getZhugong() 
    {
        return zhugong;
    }
    public void setShengcun(BigDecimal shengcun) 
    {
        this.shengcun = shengcun;
    }

    public BigDecimal getShengcun() 
    {
        return shengcun;
    }
    public void setWuli(BigDecimal wuli) 
    {
        this.wuli = wuli;
    }

    public BigDecimal getWuli() 
    {
        return wuli;
    }
    public void setMofa(BigDecimal mofa) 
    {
        this.mofa = mofa;
    }

    public BigDecimal getMofa() 
    {
        return mofa;
    }
    public void setFangyu(BigDecimal fangyu) 
    {
        this.fangyu = fangyu;
    }

    public BigDecimal getFangyu() 
    {
        return fangyu;
    }
    public void setJinqian(BigDecimal jinqian) 
    {
        this.jinqian = jinqian;
    }

    public BigDecimal getJinqian() 
    {
        return jinqian;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("name", getName())
            .append("age", getAge())
            .append("jisha", getJisha())
            .append("zhugong", getZhugong())
            .append("shengcun", getShengcun())
            .append("wuli", getWuli())
            .append("mofa", getMofa())
            .append("fangyu", getFangyu())
            .append("jinqian", getJinqian())
            .toString();
    }
}
