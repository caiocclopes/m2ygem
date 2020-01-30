module CdtBaas

	class CdtClient < CdtModule

		def initialize(token, env, custom_url, custom_user, custom_pass)
			startModule(token, env, custom_url, custom_user, custom_pass)
		end

		def registerPFAccount(body)
			response = @request.post(@url + REGISTER_PF_ACCOUNT, body, true)
			person = CdtModel.new(response)
			person
		end

		def registerPJAccount(body)
			response = @request.post(@url + REGISTER_PJ_ACCOUNT, body, true)
			person = CdtModel.new(response)
			person
		end

	end
end
