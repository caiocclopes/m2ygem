module CdtBaas

	class CdtProduct < CdtModule
		def initialize(token, env, custom_url, custom_user, custom_pass)
			startModule(token, env, custom_url, custom_user, custom_pass)
		end

		def getProducts(body)
			response = @request.get(@url + PRODUCTS_PATH + CdtHelper.conductorBodyToString(body))
			phonesResponse = CdtModel.new(response)
			generateResponse(phonesResponse)
		end

 	end

end
