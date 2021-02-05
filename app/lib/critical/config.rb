module Critical

  class Config

    def initialize(config)
      @config = config
    end

    def manifest
      @config['manifest']
    end

    def penthouse_options
      @config['penthouse_options'] || {}
    end

  end

end