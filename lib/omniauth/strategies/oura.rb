require "oauth2"
require "omniauth"
require "omniauth-oauth2"

module OmniAuth
  module Strategies
    class Oura < OmniAuth::Strategies::OAuth2
      option :client_options, {
        site: 'https://cloud.ouraring.com',
        authorize_url: 'https://cloud.ouraring.com/oauth/authorize',
        token_url: 'https://api.ouraring.com/oauth/token',
        auth_scheme: :basic_auth
      }
      option :authorize_params, {
        response_type: 'code'
      }

      # Ref) https://qiita.com/MasamotoMiyata/items/ccc932e96a4f5dd6c2e1
      def callback_url
        options[:redirect_uri] || (full_host + script_name + callback_path)
      end
    end
  end
end

