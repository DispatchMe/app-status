module AppStatus
  module Adapters
    class Redis
      def self.status
        if defined?(::Redis)
          ::Redis.current.ping == 'PONG' ? 'OK' : 'o_O'
        else
          'N/A'
        end
      rescue => e
        AppStatus.logger.error "STATUS ERROR: #{adapter_name}"
        AppStatus.logger.error e
        'Down'
      end
    end
  end
end
