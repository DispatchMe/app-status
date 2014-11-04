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
      rescue
        'Down'
      end
    end
  end
end
