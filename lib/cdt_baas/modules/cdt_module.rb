module CdtBaas

  class CdtModule

      def startModule(token, env, custom_url, custom_user, custom_pass)
        @auth = CdtAuth.new(token, env, custom_url, custom_user, custom_pass)
        @basic = token
        refreshToken
        @request = CdtRequest.new(nil, @basic)
        @url = URL_PRD
      end

      def refreshToken
        if CdtHelper.shouldRefreshToken?(@basic)
      		@auth.generateToken
          @request = CdtRequest.new(nil, @basic)
      	end
      end

      def generateResponse(input)
        CdtHelper.generate_general_response(input)
      end
  end

end
