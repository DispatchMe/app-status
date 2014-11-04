require "app_status"

module AppStatus
  class App
    def call(env)
      require 'json'

      [200, {'Content-Type' => 'application/json'}, [AppStatus.status.to_json]]
    end
  end
end
