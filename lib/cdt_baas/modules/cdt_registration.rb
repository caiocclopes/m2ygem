
module CdtBaas

	class CdtRegistration < CdtModule

        def initialize(token, env, custom_url, custom_user, custom_pass)
            startModule(token, env, custom_url, custom_user, custom_pass)
        end

        def createRegistration(body, version = 1)
            @url = @url.gsub("api", "companies") + 'v' + version.to_s + '/'
            response = @request.postWithHeader(@url + REGISTRATIONS, body, [{:key => 'Content-Type', :value => "application/json"}])
            person = CdtModel.new(response)
            person
        end

        def findRegistration(id, version = 1)
            @url = @url.gsub("api", "companies") + 'v' + version.to_s + '/'
            response = @request.get(@url + REGISTRATIONS + '/' + id.to_s)
            person = CdtModel.new(response)
            person
        end
        
        def findCompany(id, version = 1)
            @url = @url.gsub("api", "companies") + 'v' + version.to_s + '/'
            response = @request.get(@url + COMPANY_REGISTRATIONS + '/' + id.to_s)
            person = CdtModel.new(response)
            person
        end

        def updateRegistration(id, body, version = 1)
            @url = @url.gsub("api", "companies") + 'v' + version.to_s + '/'
            response = @request.put(@url + COMPANY_REGISTRATIONS + '/' + id.to_s, body, [{:key => 'Content-Type', :value => "application/json"}])
            person = CdtModel.new(response)
            person
        end


        def sendDocument(registration_id, params, options, version = 1)
            @url = @url.gsub("api", "companies") + 'v' + version.to_s + '/'
            options[:headers] = {
                'Content-Type' => 'image/jpeg',
            }

            response = @request.postBinary(@url + REGISTRATIONS + '/' + registration_id.to_s + "/" + DOCUMENTS + CdtHelper.conductorBodyToString(params), options)
            person = CdtModel.new(response)
            person
        end

	end

end
