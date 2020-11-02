package com.ruoyi.test;

import com.rabbitmq.client.Channel;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.amqp.core.Message;
import org.springframework.amqp.rabbit.listener.api.ChannelAwareMessageListener;
import org.springframework.stereotype.Component;

/**
 * 消息手动确认模式
 */
@Component
public class MyAckReceiver implements ChannelAwareMessageListener {

    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @Override
    public void onMessage(Message message, Channel channel) throws Exception {
        long deliveryTag = message.getMessageProperties().getDeliveryTag();

        try {


            byte[] bytes = message.getBody();
            String content = new String(bytes);
            logger.info("消费者接收处理队列C当中的消息： " + content);


            if (false) {

                channel.basicAck(deliveryTag, true);

//                throw new RuntimeException("处理消息异常");
            }else {

                channel.basicReject(deliveryTag, false);
            }


        } catch (Exception e) {

//            channel.basicAck(deliveryTag, true);//消息消费成功
//            channel.basicAck(deliveryTag, false);//消息消费失败 都不会重新投递

//            channel.basicRecover(true);//重新放入队列,尽量投递给别人,也有可能投递给自己
//            channel.basicRecover(false);//重新放入队列,投递给自己


//            basicReject一次只能拒绝接收一个消息，而basicNack方法可以支持一次0个或多个消息的拒收，并且也可以设置是否requeue。
//              （“死信”消息会被RabbitMQ进行特殊处理，如果配置了死信队列信息，那么该消息将会被丢进死信队列中，如果没有配置，则该消息将会被丢弃。）

//            channel.basicNack(deliveryTag, false, true);//拒绝此消息，重新放入队列
//            channel.basicNack(deliveryTag, false, false);//拒绝此消息，抛弃此条消息，放入指定死信队列

//            channel.basicReject(deliveryTag, true);//拒绝此消息，重新放入队列
//            channel.basicReject(deliveryTag, false);//拒绝此消息，抛弃此条消息，放入指定死信队列

            e.printStackTrace();
        }
    }
}