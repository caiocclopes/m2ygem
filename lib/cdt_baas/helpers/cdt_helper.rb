require 'json'
   
module CdtBaas
	class CdtHelper
		
		def self.homologation?(env)
			env == HOMOLOGATION
		end
		
		def self.customAuth?(env)
			env == CUSTOM_AUTH && !CUSTOM_AUTH.blank?
		end

		def self.saveToken(basic,token)
			if !token.nil?
				ENV["CDT_TOKEN_ONLY"] = token.to_s
				ENV["CDT_TOKEN_EXPIRY"] = (Time.now + 1500).to_s
			end
		end

		def self.getToken
			ENV["CDT_TOKEN_ONLY"]
		end

		def self.shouldRefreshToken?(basic)
			finish_date = ENV["CDT_TOKEN_EXPIRY"]
			finish_date.nil? || (Time.parse(finish_date.to_s) - 500) < Time.now
		end


		def self.conductorBodyToString(json)
			string = "?"
			arr = []
			json.keys.each do |key|
				if !json[key].nil?
					arr << key.to_s + "=" + json[key].to_s
				end
			end
			string + arr.join("&")
		end

		def self.generate_general_response(input)
			cdtErrorHandler = CdtErrorHandler.new
			response = {}
			if cdtErrorHandler.mapErrorType(input)
				response = {
						success: false,
						error: cdtErrorHandler
				}
			else
				response = {
						success: true,
						content: input
				}
			end
			response
		end
	end
end


