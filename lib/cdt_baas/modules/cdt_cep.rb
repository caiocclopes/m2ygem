module CdtBaas

	class CdtCep < CdtModule

		def initialize(token, env, custom_url, custom_user, custom_pass)
			startModule(token, env, custom_url, custom_user, custom_pass)
		end

		def ceps(body)
			response = @request.get(@url + CEPS + CdtHelper.conductorBodyToString(body))
			person = CdtModel.new(response)
			person
		end

	end
end