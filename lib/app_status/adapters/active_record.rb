module AppStatus
  module Adapters
    class ActiveRecord
      def self.status
        if defined?(::ActiveRecord)
          ::ActiveRecord::Base.connection.execute("SELECT 1=1").first.present? ? 'OK' : 'o_O'
        else
          'N/A'
        end
      rescue
        'Down'
      end

      def self.adapter_name
        if defined?(::ActiveRecord)
          ::ActiveRecord::Base.connection.adapter_name
        end
      end
    end
  end
end
