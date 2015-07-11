module AppStatus
  module Adapters
    class Sidekiq
      def self.status
        if defined?(::Sidekiq)
          require 'sidekiq/api'
          ::Sidekiq::Queue.new.size < 100 ? 'OK' : 'Busy!'
        else
          'N/A'
        end
      rescue => e
        AppStatus.logger.error "STATUS ERROR: #{adapter_name}"
        AppStatus.logger.error e
        'Down'
      end

      def self.adapter_name
        'Sidekiq'
      end
    end
  end
end
