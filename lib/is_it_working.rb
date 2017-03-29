require "is_it_working/version"
require 'benchmark'

module IsItWorking

	##
	# This class provides a wrapper for checking in with https://IsItWorking.info
	class Checkin
		attr_accessor :uri
		attr_accessor :params
		attr_accessor :response


		#checkin with IsItWorking
		def self.ping(key:nil,message:nil,status:nil,time:nil, boundary:nil)
			if key.nil?
				raise 'You must specify a key' 
			end

			checkin=Checkin.new
			checkin.uri = URI("https://api.isitworking.info/c/#{key}")

			if checkin.nil?
				raise 'Unable to generate uri - please check your key' 
			end

			checkin.params = {
			t: time,
			b: boundary,
			m: message,
			s: status
			}

			if IsItWorking.configuration.testing
				puts "IsItWorking testing. Would call: #{checkin.uri.to_s}"
			else
				checkin.result = Net::HTTP.post_form(checkin.uri,checkin.params)
			end

			checkin
		end

		#times the block, in milliseconds and sends the result to IsItWorking
		def self.time(key:nil,message:nil,status:nil,boundary:nil, &block)
			time = Benchmark.realtime do
				block.call
			end
			milliseconds = time * 1000

			self.ping(key: key, message: message, status: status, time: milliseconds, boundary: boundary)
		end

	end

	#config described by
	#https://robots.thoughtbot.com/mygem-configure-block
	class << self
		attr_accessor :configuration
	end

	def self.configure
		self.configuration ||= Configuration.new
		yield(configuration)
	end

	class Configuration
		attr_accessor :testing

		def initialize
			@testing = false
		end
	end

end
