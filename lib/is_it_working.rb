require "is_it_working/version"

module IsItWorking

	##
	# This class provides a wrapper for checking in with https://IsItWorking.info
	class Checkin

		def self.uri(key:)
			uri = URI("http://api.isitworking.info/c/#{key}")
		end

		#checkin with IsItWorking
		def self.ping(key:nil,message:nil,status:nil,time:nil, boundary:nil)
			if key.nil?
				raise 'You must specify a key' 
			end

			uri = self.uri(key:key)
			if uri.nil?
				raise 'Unable to generate uri - please check your key' 
			end

			params = {
			t: time,
			b: boundary,
			m: message,
			s: status
			}
			res = Net::HTTP.post_form(uri,params)
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

end
