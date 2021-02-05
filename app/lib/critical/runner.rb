module Critical

  class Runner

    include SuckerPunch::Job

    def perform(host, path)
      Critical.fetcher.generate(host, path)
    end


  end


end