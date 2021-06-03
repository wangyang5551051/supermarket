package com.ruoyi.uidgenerator.domain;

import java.util.Date;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * DB WorkerID Assigner for UID Generator对象 worker_node
 * 
 * @author ruoyi
 * @date 2021-06-01
 */
public class WorkerNode extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** auto increment id */
    private Long ID;

    /** host name */
    @Excel(name = "host name")
    private String hostName;

    /** port */
    @Excel(name = "port")
    private String PORT;

    /** node type: ACTUAL or CONTAINER */
    @Excel(name = "node type: ACTUAL or CONTAINER")
    private Long TYPE;

    /** launch date */
    @Excel(name = "launch date", width = 30, dateFormat = "yyyy-MM-dd")
    private Date launchDate;

    /** modified time */
    @Excel(name = "modified time", width = 30, dateFormat = "yyyy-MM-dd")
    private Date MODIFIED;

    /** created time */
    @Excel(name = "created time", width = 30, dateFormat = "yyyy-MM-dd")
    private Date CREATED;

    public void setID(Long ID) 
    {
        this.ID = ID;
    }

    public Long getID() 
    {
        return ID;
    }
    public void setHostName(String hostName) 
    {
        this.hostName = hostName;
    }

    public String getHostName() 
    {
        return hostName;
    }
    public void setPORT(String PORT) 
    {
        this.PORT = PORT;
    }

    public String getPORT() 
    {
        return PORT;
    }
    public void setTYPE(Long TYPE) 
    {
        this.TYPE = TYPE;
    }

    public Long getTYPE() 
    {
        return TYPE;
    }
    public void setLaunchDate(Date launchDate) 
    {
        this.launchDate = launchDate;
    }

    public Date getLaunchDate() 
    {
        return launchDate;
    }
    public void setMODIFIED(Date MODIFIED) 
    {
        this.MODIFIED = MODIFIED;
    }

    public Date getMODIFIED() 
    {
        return MODIFIED;
    }
    public void setCREATED(Date CREATED) 
    {
        this.CREATED = CREATED;
    }

    public Date getCREATED() 
    {
        return CREATED;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("ID", getID())
            .append("hostName", getHostName())
            .append("PORT", getPORT())
            .append("TYPE", getTYPE())
            .append("launchDate", getLaunchDate())
            .append("MODIFIED", getMODIFIED())
            .append("CREATED", getCREATED())
            .toString();
    }
}
