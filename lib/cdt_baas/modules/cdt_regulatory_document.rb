module CdtBaas

	class CdtRegulatoryDocument < CdtModule

		def initialize(token, env, custom_url, custom_user, custom_pass)
			startModule(token, env, custom_url, custom_user, custom_pass)
		end

	 	 def getRegistrations(version = 1)
	 	 	 @url = @url.gsub("api", "regdocs") + 'v' + version.to_s + '/' 
	         response = @request.get(@url + REGISTRATION)
	         person = CdtModel.new(response)
	         person
	     end

	 	 def getRegistrationsWithTypes(version = 1)
	 	 	 @url = @url.gsub("api", "regdocs") + 'v' + version.to_s + '/' 
	         response = @request.get(@url + REGISTRATION + REGISTRATION_WITH_TYPES)
	         person = CdtModel.new(response)
	         person
	     end

	 	 def sendAgreement(body, version = 1)
	 	 	 @url = @url.gsub("api", "regdocs") + 'v' + version.to_s + '/' 
             response = @request.postWithHeader(@url + AGREEMENT, body, [{:key => 'Content-Type', :value => "application/json"}])
	         person = CdtModel.new(response)
	         person
	     end


	end
end