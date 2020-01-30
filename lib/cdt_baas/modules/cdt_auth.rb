module CdtBaas

	class CdtAuth 

      def initialize(token, env)
        @request = CdtRequest.new("Basic #{token}", token)
        @basic = token
        @url = ENV["CUSTOM_AUTH_URL"]
      end


      def generateToken
        puts @url
        response = @request.postWithHeader(@url, {:username => ENV["CUSTOM_AUTH_USER"], :password => ENV["CUSTOM_AUTH_PASS"]}, [{:key => 'Content-Type', :value => "application/json"}])
        puts response.to_s
        puts response.to_s
        token = CdtModel.new(response)
        CdtBaas::CdtRequest.setToken(token)
        CdtHelper.saveToken(@basic, token.access_token)
        CdtHelper.generate_general_response(token)
	   end

	end
end


