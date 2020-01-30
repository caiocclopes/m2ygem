module CdtBaas

	class CdtDocspy < CdtModule

		def initialize(token, env, custom_url, custom_user, custom_pass)
			startModule(token, env, custom_url, custom_user, custom_pass)
		end

		def sendDocuments(params, options)
			options[:headers] = {}
			options[:headers] = {
          		'Content-Type' => 'image/jpeg',
          		'Accept' => '*/*'
      		}

			response = @request.postBinary(@url + DOCSPY_SELFIES + CdtHelper.conductorBodyToString(params), options)
			person = CdtModel.new(response)
			person
		end

		def documentsRules
			response = @request.get(@url + DOCSPY_DOCUMENTS_RULES)
			person = CdtModel.new(response)
			person
		end

		def sendSelfies(params, options)
			options[:headers] = {}
			options[:headers] = {
          		'Content-Type' => 'image/jpeg',
          		'Accept' => '*/*'
      		}

			response = @request.postBinary(@url + DOCSPY_SELFIES + CdtHelper.conductorBodyToString(params), options)
			person = CdtModel.new(response)
			person
		end

		def selfiesRules
			response = @request.get(@url + DOCSPY_SELFIES_RULES)
			person = CdtModel.new(response)
			person
		end

	end
end
