package com.ruoyi.test;

import com.rabbitmq.client.Channel;
import com.ruoyi.common.config.RabbitConfig;
import com.ruoyi.common.constant.Constants;
import com.ruoyi.system.domain.SysLogininfor;
import com.ruoyi.system.service.ISysLogininforService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.amqp.core.Message;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import redis.clients.jedis.JedisPool;

import java.io.IOException;

@Component
public class DeadLetterMessageReceiver {
    @Autowired
    private JedisPool jedisPool;

    @Autowired
    private ISysLogininforService iSysLogininforService;

    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    private final Logger log = LoggerFactory.getLogger(this.getClass());

    @RabbitListener(queues = RabbitConfig.QUEUE_C)
    public void receiveADead(Message message, Channel channel) throws IOException {
        String msg = new String(message.getBody());
//        channel.basicAck(message.getMessageProperties().getDeliveryTag(), false);
        log.info("队列C收到消息：" + msg);
        SysLogininfor logininfor = new SysLogininfor();
        logininfor.setLoginName("admin");
        logininfor.setIpaddr("127.0.0.1");
        logininfor.setLoginLocation("127.0.0.1");
        logininfor.setBrowser("google");
        logininfor.setOs("查询天气参数：");
        logininfor.setMsg("消费者C处理队列C消息");
        logininfor.setStatus(Constants.SUCCESS);
        // 插入数据
        iSysLogininforService.insertLogininfor(logininfor);
//        //将次消息存入redis 值为null
//        String key = "Weather::" + msg;
//        Jedis jedis = jedisPool.getResource();
//        jedis.set(key, null);
//        jedis.close();
        //消费确认
    }

}