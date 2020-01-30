module CdtBaas

	class CdtKyc < CdtModule

	     def initialize(token, env, custom_url, custom_user, custom_pass)
	        startModule(token, env, custom_url, custom_user, custom_pass)
	     end

	 	 def getPeople(body)
	         response = @request.post(@url + KYC, body, true)
	         person = CdtModel.new(response)
	         person
	     end

	end

end