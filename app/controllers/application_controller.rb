class ApplicationController < ActionController::Base
  include Authentication

  # rescue_from ActiveRecord::RecordNotFound, :with => :rescue404
  # rescue_from ActionController::RoutingError, :with => :rescue404

  # def rescue404
  #   render file: Rails.public_path.join('404.html'), status: :not_found, layout: false
  # end
end
