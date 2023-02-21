class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    # Add a logic to check if the user is a client or an expert and redirect to the right
    # Add a delay and show a loader here
    redirect_to client_path unless current_user.nil?
  end

  def dashboardclient
    redirect_to new_company_path if current_user.company.nil?

    @rfpprojects = Project.where(client_id: current_user.id, project_status: ['rfp_stage', 'pending_validation', 'pending_payment'])
    @activeprojects = Project.where(client_id: current_user.id, project_status: ['active', 'pending_resolution'])

  end
end
