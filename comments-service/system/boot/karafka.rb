# frozen_string_literal: true

require 'json'

App.boot(:kafka_producer) do |app|
  init do
    require 'waterdrop'

    class KafkaProducer
      PRODUCER_SETTINGS = {
        deliver: !(ENV['APP_ENV'] == :test),
        kafka: {
          'bootstrap.servers': 'localhost:9092',
          'request.required.acks': 1
        }.freeze
      }.freeze

      def call(event:, topic:)
        puts " CALLED HERE "
        producer = WaterDrop::Producer.new do |config|
          config.deliver = PRODUCER_SETTINGS[:deliver]
          config.kafka = PRODUCER_SETTINGS[:kafka]
        end

        producer.produce_sync(payload: event.serialize.to_json, topic: topic)
      end
    end

    register(:kafka_producer, KafkaProducer.new)
  end
end
