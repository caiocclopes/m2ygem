module CdtBaas

	class CdtAuth 

      def initialize(token, env, custom_url, custom_user, custom_pass)
        @request = CdtRequest.new("Basic #{token}", token)
        @basic = token
        @url = custom_url
        @username = custom_user
        @password = custom_pass
      end


      def generateToken
        puts @url
        response = @request.postWithHeader(@url, {:username => @username, :password => @password}, [{:key => 'Content-Type', :value => "application/json"}])
        puts response.to_s
        puts response.to_s
        token = CdtModel.new(response)
        CdtBaas::CdtRequest.setToken(token)
        CdtHelper.saveToken(@basic, token.access_token)
        CdtHelper.generate_general_response(token)
	   end

	end
end


