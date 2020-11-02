package com.ruoyi.test;


import com.rabbitmq.client.Channel;
import com.ruoyi.common.config.RabbitConfig;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.amqp.core.Message;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import redis.clients.jedis.JedisPool;

import java.io.IOException;

@Component
public class BusinessMessageReceiver {
//    @Autowired
//    private Jedis jedis;

    @Autowired
    private JedisPool jedisPool;

    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @RabbitListener(queues = RabbitConfig.QUEUE_A)
    @Transactional
    public void receiveA(Message message, Channel channel) throws IOException {
        long deliveryTag = message.getMessageProperties().getDeliveryTag();
        String msg = new String(message.getBody());
        logger.info("消费者A接收处理队列当中的消息： " + msg);
        boolean ack = true;
        Exception exception = null;

        String key = "Weather::" + msg;
        //如果不存在就写入redis
//        Jedis jedis = jedisPool.getResource();
//        try {
//            if (!jedis.exists(key)) {
//                Object[] objects = new Object[4];
//                String host = "https://iweather.market.alicloudapi.com";
//                String path = "/address";
//                String method = "GET";
//                String appcode = "b3f02b20f86d4ee0a41167ca372b998c";
//                Map<String, String> headers = new HashMap<String, String>();
//                //最后在header中的格式(中间是英文空格)为Authorization:APPCODE 83359fd73fe94948385f570e3c139105
//                headers.put("Authorization", "APPCODE " + appcode);
//                /**
//                 * 重要提示如下:
//                 * HttpUtils请从
//                 * https://github.com/aliyun/api-gateway-demo-sign-java/blob/master/src/main/java/com/aliyun/api/gateway/demo/util/HttpUtils.java
//                 * 下载
//                 *
//                 * 相应的依赖请参照
//                 * https://github.com/aliyun/api-gateway-demo-sign-java/blob/master/pom.xml
//                 */
//
//                Map<String, String> map = JSON.parseObject(msg, Map.class);
//                String buildUrl = HttpUtils.buildUrl(host, path, map);
//                String response = HttpUtils.sendGet(buildUrl, headers);
//
//                HashMap hashMap1 = JSON.parseObject(response, HashMap.class);
//                Object data1 = hashMap1.get("data");
//                HashMap hashMap2 = JSON.parseObject(data1.toString(), HashMap.class);
//                Object data2 = hashMap2.get("day7");
//                List<HashMap> maps = JSON.parseArray(data2.toString(), HashMap.class);
//                List<Object> air = new ArrayList<>();
//                List<Object> nightAir = new ArrayList<>();
//                List<Object> date = new ArrayList<>();
//                maps.forEach(x -> {
//                    air.add(x.get("day_air_temperature"));
//                    nightAir.add(x.get("night_air_temperature"));
//                    date.add("周" + x.get("week").toString());
//                });
//
//                objects[0] = date;
//                objects[1] = air;
//                objects[2] = nightAir;
//                objects[3] = data2;
//                //2.将数据保存到redis中
//                String json = ObjectMapperUtil.toJson(objects);
//                //超时
//                jedis.setex(key, 3600, json);
//            }
//        } catch (Exception e) {
//            ack = false;
//            exception = e;
//        }finally {
//            jedis.close();
//        }

        if (!ack) {
            //拒绝消息，放入死信队列
            logger.error("消息消费发生异常，error msg:{}", exception.getMessage(), exception);
            channel.basicReject(deliveryTag, false);
        } else {
            //消费确认
            channel.basicAck(deliveryTag, false);
        }

    }

//    @RabbitListener(queues = RabbitConfig.QUEUE_C)
//    public void receiveC(Message message, Channel channel) throws IOException {
//        long deliveryTag = message.getMessageProperties().getDeliveryTag();
//        String msg = new String(message.getBody());
//        logger.info("收到业务消息A：{}", msg);
//        boolean ack = true;
//        Exception exception = null;
//        try {
//            if (msg.contains("河南")){
//                throw new RuntimeException("dead letter exception");
//            }
//        } catch (Exception e){
//            ack = false;
//            exception = e;
//        }
//        if (!ack){
//            logger.error("消息消费发生异常，error msg:{}", exception.getMessage(), exception);
//            channel.basicReject(deliveryTag, false);
//        } else {
//            channel.basicAck(deliveryTag, true);
//        }
//    }

}