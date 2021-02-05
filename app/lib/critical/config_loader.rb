module Critical

  class ConfigLoader

    CONFIG = 'critical.yml'.freeze

    def initialize
      config['manifest'] = ActionController::Base.helpers.stylesheet_path(config['manifest']) 
    end

    def config
      @config ||= YAML.safe_load(ERB.new(File.read(config_file)).result, [], [], true)
    end

    private

    def config_file
      @config_file ||= Rails.root.join('config', CONFIG)
    end

  end


end
