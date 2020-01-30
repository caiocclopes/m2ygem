module CdtBaas

	class CdtAlias < CdtModule

	     def initialize(token, env, custom_url, custom_user, custom_pass)
	        startModule(token, env, custom_url, custom_user, custom_pass)
	     end

	 	 def createAlias(body)
	 	 	 @url = @url.gsub("api.", "aliasbank.")
             response = @request.postWithHeader(@url + ALIAS_BANK, body, [{:key => 'Content-Type', :value => "application/json"}])
	         person = CdtModel.new(response)
	         person
	     end

	 	 def getAliases(body)
	 	 	 @url = @url.gsub("api.", "aliasbank.")
	         response = @request.get(@url + ALIAS_BANK + CdtHelper.conductorBodyToString(body))
	         person = CdtModel.new(response)
	         person
	     end

	end

end