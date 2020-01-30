module CdtBaas

	class CdtDocument < CdtModule

		def initialize(token, env, custom_url, custom_user, custom_pass)
			startModule(token, env, custom_url, custom_user, custom_pass)
		end

		def registerDocument(body)
			response = @request.post(@url + GENERATE_DOCUMENT + CdtHelper.conductorBodyToString(body), {}, true)
			person = CdtModel.new(response)
			person
		end

	end
end
