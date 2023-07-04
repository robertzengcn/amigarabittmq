FROM rabbitmq:3.7
RUN apt-get update && \
apt-get install -y curl unzip wget
RUN rabbitmq-plugins enable rabbitmq_management
RUN rabbitmq-plugins enable rabbitmq_shovel rabbitmq_shovel_management
# RUN rabbitmq-plugins enable rabbitmq_delayed_message_exchange


# https://github.com/rabbitmq/rabbitmq-delayed-message-exchange/archive/v3.8.0.zip

# RUN curl https://github.com/rabbitmq/rabbitmq-delayed-message-exchange/archive/refs/tags/3.10.2.zip > rabbitmq_delayed_message_exchange-v3.10.2.zip && \
# unzip rabbitmq_delayed_message_exchange-v3.10.2.zip && \
# rm -f rabbitmq_delayed_message_exchange-v3.8.0.zip && \
# mv rabbitmq_delayed_message_exchange-20171201-3.7.x.ez plugins/
RUN wget https://github.com/rabbitmq/rabbitmq-delayed-message-exchange/releases/download/v3.8.0/rabbitmq_delayed_message_exchange-3.8.0.ez
RUN cp rabbitmq_delayed_message_exchange-3.8.0.ez /opt/rabbitmq/plugins

RUN rabbitmq-plugins enable rabbitmq_delayed_message_exchange
