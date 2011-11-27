require 'sinatra'

module Powser  
  class Server < Sinatra::Base
    POW_PATH = `powder config | grep hostRoot | sed s/hostRoot//`.strip
  
    before do
      @pow_app = `cat app`.strip
    end
    
    # Routes ------------------------------------------------------------------
    get '/restart' do
      @pow_app = params[:app] if params[:app]
      
      to_url = redirect_url(params[:redirect])
      pow_dir(@pow_app) do
        `powder restart`
        to_url ||= pow_url(@pow_app)
      end
      redirect to_url
    end
    
    private
    
    # Helpers -------------------------------------------------------------------
    def pow_dir(app_name, &block)
      path = POW_PATH + '/' + app_name
      Dir.chdir(path) do
        yield
      end
    end

    def pow_url(app_name)
      'http://' + app_name + '.' + domain
    end
    
    def redirect_url(to)
      "http://" + to if to
    end

    def domain
      if File.exists? File.expand_path('~/.powconfig')
        returned_domain = %x{source ~/.powconfig; echo $POW_DOMAINS}.gsub("\n", "").split(",").first
        returned_domain = %x{source ~/.powconfig; echo $POW_DOMAIN}.gsub("\n", "") if returned_domain.nil? || returned_domain.empty?
        returned_domain = 'dev' if returned_domain.nil? || returned_domain.empty?
        returned_domain
      else
        'dev'
      end
    end
  end
end
