module CdtBaas

	class CdtPaymentSplip < CdtModule

		def initialize(token, env, custom_url, custom_user, custom_pass)
			startModule(token, env, custom_url, custom_user, custom_pass)
		end

	 	 def createRecharge(body)
	 	 	 @url = @url.gsub("api.", "paymentslip.")
             response = @request.postWithHeader(@url + PAYMENT_SLIP_RECHARGE, body, [{:key => 'Content-Type', :value => "application/json"}])
	         person = CdtModel.new(response)
	         person
	     end

	 	 def getRecharges(body)
	 	 	 @url = @url.gsub("api.", "paymentslip.")
	         response = @request.get(@url + PAYMENT_SLIP_RECHARGE + CdtHelper.conductorBodyToString(body))
	         person = CdtModel.new(response)
	         person
	     end

	 	 def createInvoice(body)
	 	 	 @url = @url.gsub("api.", "paymentslip.")
             response = @request.postWithHeader(@url + PAYMENT_SLIP_INVOICE, body, [{:key => 'Content-Type', :value => "application/json"}])
	         person = CdtModel.new(response)
	         person
	     end

	 	 def getInvoices(body)
	 	 	 @url = @url.gsub("api.", "paymentslip.")
	         response = @request.get(@url + PAYMENT_SLIP_INVOICE + CdtHelper.conductorBodyToString(body))
	         person = CdtModel.new(response)
	         person
	     end

	end
end