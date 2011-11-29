require 'sinatra'
require 'powder'

module Powser  
  class Server < Sinatra::Base
    POW_PATH = `powder config | grep hostRoot | sed s/hostRoot//`.strip
  
    before do
      @default_app = `cat app`.strip
    end
    
    # Routes ------------------------------------------------------------------
    get '/' do
      @apps = pow_apps
      erb :index
    end
    
    get '/restart' do
      app = params[:app] || @default_app
      
      to_url = redirect_url(params[:redirect])
      pow_dir(app) do
        `powder restart`
        to_url ||= pow_url(app)
      end
      redirect to_url
    end
    
    private
    
    # Class Methods -------------------------------------------------------------------
    def pow_dir(app_name, &block)
      path = POW_PATH + '/' + app_name
      Dir.chdir(path) do
        yield
      end
    end
    
    def redirect_url(to)
      "http://" + to if to
    end
    
    include Powder::Helpers
    
    # Helpers
    helpers do
      def pow_url(app_name)
        'http://' + app_name + '.' + domain
      end
      
      def restart_link(app_name)
        "<a href='/restart?app=#{app_name}'>restart</a>"
      end
      
    end
  end
end
