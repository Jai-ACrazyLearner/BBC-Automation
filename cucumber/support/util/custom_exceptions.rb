require 'colorize'

module CucumberConfig

  class AppDomainNotSpecified < StandardError
    def initialize(msg="Please specify the domian to navigate & perform UI validations".yellow)
      super
    end
  end

  class BrowserNotSpecified < StandardError
    def initialize(msg="Driver must be configured before use".yellow)
      super
    end
  end

end


