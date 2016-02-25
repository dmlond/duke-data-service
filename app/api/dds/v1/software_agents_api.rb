module DDS
  module V1
    class SoftwareAgentsAPI < Grape::API
      desc 'List software agents' do
        detail 'Lists all software agents'
        named 'list software agents'
        failure [
          [200, 'Success'],
          [401, 'Unauthorized']
        ]
      end
      get '/software_agents', root: 'results' do
        authenticate!
        SoftwareAgent.where(is_deleted: false)
      end

      desc 'Create a software agent' do
        detail 'Creates a software agent for the given payload.'
        named 'create software agent'
        failure [
          [200, 'This will never actually happen'],
          [201, 'Created Successfully'],
          [400, 'Software agent requires a name'],
          [401, 'Unauthorized']
        ]
      end
      params do
        requires :name, type: String, desc: 'The Name of the software agent'
        optional :description, type: String, desc: 'The Description of the software agent'
        optional :repo_url, type: String, desc: 'The url of the repository (e.g. Git, Bitbucket, etc.) that contains the agent source code.'
      end
      post '/software_agents', root: false do
        authenticate!
        software_agent_params = declared(params, include_missing: false)
        software_agent = SoftwareAgent.new({
          name: software_agent_params[:name],
          description: software_agent_params[:description],
          repo_url: software_agent_params[:repo_url],
          creator: current_user
        })
        software_agent.build_api_key(key: SecureRandom.hex)
        Audited.audit_class.as_user(current_user) do
          if software_agent.save
            annotate_audits [software_agent.audits.last, software_agent.api_key.audits.last]
            software_agent
          else
            validation_error!(software_agent)
          end
        end
      end

      desc 'View software agent details' do
        detail 'Returns the software agent details for a given UUID.'
        named 'view software agent'
        failure [
          [200, 'Success'],
          [401, 'Unauthorized'],
          [403, 'Forbidden'],
          [404, 'Software Agent Does not Exist']
        ]
      end
      params do
        requires :id, type: String, desc: 'Software agent UUID'
      end
      get '/software_agents/:id', root: false do
        authenticate!
        SoftwareAgent.find(params[:id])
      end

      desc 'Update Software Agent' do
        detail 'Updates the software agent details for a given UUID.'
        named 'update software agent'
        failure [
          [200, 'Success'],
          [401, 'Unauthorized'],
          [403, 'Forbidden'],
          [400, 'Validation Error'],
          [404, 'Software Agent Does not Exist']
        ]
      end
      params do
        requires :id, type: String, desc: 'Software Agent UUID'
        optional :name, type: String, desc: 'The Name of the Software Agent'
        optional :description, type: String, desc: 'The Description of the Software Agent'
        optional :repo_url, type: String, desc: 'The Repo url of the Software Agent'
      end
      put '/software_agents/:id', root: false do
        authenticate!
        software_agent_params = declared(params, include_missing: false)
        software_agent = hide_logically_deleted SoftwareAgent.find(params[:id])
        authorize software_agent, :update?
        Audited.audit_class.as_user(current_user) do
          if software_agent.update(software_agent_params)
            annotate_audits [software_agent.audits.last]
            software_agent
          else
            validation_error!(software_agent)
          end
        end
      end

      desc 'Delete a Software Agent' do
        detail 'Marks a software agent as being deleted.'
        named 'delete software agent'
        failure [
          [204, 'Successfully Deleted'],
          [401, 'Unauthorized'],
          [403, 'Forbidden'],
          [404, 'Software Agent Does not Exist']
        ]
      end
      params do
        requires :id, type: String, desc: 'Software Agent UUID'
      end
      delete '/software_agents/:id', root: false do
        authenticate!
        software_agent = hide_logically_deleted SoftwareAgent.find(params[:id])
        authorize software_agent, :destroy?
        Audited.audit_class.as_user(current_user) do
          software_agent.update(is_deleted: true)
          annotate_audits [software_agent.audits.last]
        end
        body false
      end

      desc 'Re-generate software agent API key' do
        detail 'regenerates software_agent api_key'
        named 'regenerate software_agent api_key'
        failure [
          [200, 'Success'],
          [401, 'Unauthorized'],
          [403, 'Forbidden'],
          [404, 'Software Agent Does not Exist']
        ]
      end
      params do
        requires :id, type: String, desc: 'Software agent UUID'
      end
      put '/software_agents/:id/api_key', serializer: ApiKeySerializer do
        authenticate!
        software_agent = SoftwareAgent.find(params[:id])
        Audited.audit_class.as_user(current_user) do
          ApiKey.transaction do
            software_agent.api_key.destroy!
            software_agent.build_api_key(key: SecureRandom.hex)
            software_agent.save
            annotate_audits [software_agent.api_key.audits.last]
          end
        end
        software_agent.api_key
      end
      desc 'View software agent API key' do
        detail 'View software_agent api_key'
        named 'view software_agent api_key'
        failure [
          [200, 'Success'],
          [401, 'Unauthorized'],
          [403, 'Forbidden'],
          [404, 'Software Agent Does not Exist']
        ]
      end
      params do
        requires :id, type: String, desc: 'Software agent UUID'
      end
      get '/software_agents/:id/api_key', serializer: ApiKeySerializer do
        authenticate!
        SoftwareAgent.find(params[:id]).api_key
      end
    end
  end
end
