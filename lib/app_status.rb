require 'app_status/version'
require 'app_status/adapters/active_record'
require 'app_status/adapters/redis'
require 'app_status/adapters/sidekiq'

module AppStatus
  extend self

  def status
    result = Adapters.constants.map do |klass|
      obj = ::Object.const_get("AppStatus::Adapters::#{klass}")
      [obj.respond_to?(:adapter_name) ? obj.adapter_name : klass, obj.status]
    end.to_h
    result.merge!(env: environment)
  end

  def environment
    if defined?(Rails)
      Rails.env.to_s
    elsif defined?(Sinatra)
      Sinatra::Base.settings.environment.to_s
    end || ENV['RACK_ENV']
  end
end
