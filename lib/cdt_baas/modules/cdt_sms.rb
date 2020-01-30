module CdtBaas

	class CdtSms < CdtModule
		def initialize(token, env, custom_url, custom_user, custom_pass)
			startModule(token, env, custom_url, custom_user, custom_pass)
		end


		def sendSms(body)
			response = @request.postWithHeader(@url + SMS_PATH, body, [{:key => 'Content-Type', :value => "application/json"}])
			phonesResponse = CdtModel.new(response)
			generateResponse(phonesResponse)
		end

 	end

end
