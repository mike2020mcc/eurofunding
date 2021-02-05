require 'open3'

module Critical

  class Fetcher

    def initialize(config)
      @config = config
    end

    def generate(host, path)

      penthouse_options = {
        width: 1920,
        height: 900,
        strict: false,
        maxEmbeddedBase64Length: 1000,
        userAgent: 'AJK Critical Path Generator',
        renderWaitTime: 100,
        blockJSRequests: false
      }.merge(@config.penthouse_options)
    
      options = {
        host: host,
        path: path,
        manifest: @config.manifest,
        penthouseOptions: penthouse_options,
        protocol: Rails.env.production? ? 'https' : 'http'
      }

      script = Rails.root.join('app', 'lib', 'critical', 'critical.js').to_s
      Rails.logger.info "Critical started: #{host}#{path} for manifest #{@config.manifest}"
      styles, err, st = Open3.capture3('node', script, JSON.dump(options))
      if !st.exitstatus.zero? || styles.empty? && !err.empty?
        STDOUT.puts styles
        STDERR.puts err
        STDERR.puts "Failed to get styles for path #{path} with options=#{options.inspect}"
      end
      Rails.logger.info "Critical finished: #{host}#{path} for manifest #{@config.manifest} (#{styles.to_s.length})"
      Rails.cache.write(path, styles, namespace: NAMESPACE)
      styles

    end

  end

end