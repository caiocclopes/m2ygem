module CdtBaas

	class CdtRegister < CdtModule

		def initialize(token, env, custom_url, custom_user, custom_pass)
			startModule(token, env, custom_url, custom_user, custom_pass)
		end

		def sendSelfie(id)
			response = @request.get(@url + RECHARGES + id.to_s)
			if !response.length > 0
				rechargeResponse = CdtModel.new(response)
			else
				rechargeResponse = response
			end
			generateResponse(rechargeResponse)
		end

		def sendDocument(id, body)
			response = @request.post(@url + RECHARGES + id.to_s, body, true)
			rechargeResponse = CdtModel.new(response)
			generateResponse(rechargeResponse)
		end

	end
end
