module CdtBaas

	class CdtBillet < CdtModule

		def initialize(token, env, custom_url, custom_user, custom_pass)
			startModule(token, env, custom_url, custom_user, custom_pass)
		end

		def generateTicket(body)
			response = @request.get(@url + BILLET + CdtHelper.conductorBodyToString(body))
			response
		end

	end
end
