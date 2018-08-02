require "crystal_executer/version"
require "active_support/core_ext/hash"
require "benchmark"

module CrystalExecuter
  class Runner
    def self.exec path, params = {}
      m1 = Benchmark.bm do |x|  
        x.report("Ruby") do
          a = []
          100_000.times { |i| a << "a"*i }
          puts "\n"
          puts "a.size = #{a.size}"
        end
        x.report("Crystal") { puts `crystal run #{path} -- #{params.to_query.split("&").join(" ")}` }
      end
    end
  end
end