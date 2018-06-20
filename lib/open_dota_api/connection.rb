require 'httparty'

module OpenDotaApi
  class Connection
    include HTTParty
    base_uri 'api.opendota.com'

    def get(pathname, options = {})
      query = { api_key: OpenDotaApi.configuration.api_key }
      options[:query].present? ? options[:query].merge!(query) : options[:query] = query
      self.class.get(pathname, options)
    end
  end
end
