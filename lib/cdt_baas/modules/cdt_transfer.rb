module CdtBaas

	class CdtTransfer < CdtModule

		def initialize(token, env, custom_url, custom_user, custom_pass)
			startModule(token, env, custom_url, custom_user, custom_pass)
		end

		def bankTransfers(body)
			response = @request.post(@url + BANK_TRANSFER, body, true)
			transferResponse = CdtModel.new(response)
			generateResponse(transferResponse)
		end

		def getBankTransfers(id)
			response = @request.get(@url + BANK_TRANSFER + ACCOUNT + id.to_s)
			transferResponse = response
			generateResponse(transferResponse)
		end

		def bankTransfersAdjustment(id)
			response = @request.get(@url + BANK_TRANSFER_ADJUST + id.to_s)
			transferResponse = CdtModel.new(response)
			generateResponse(transferResponse)
		end

	end
end
