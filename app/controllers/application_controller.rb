class ApplicationController < ActionController::Base

  private

  def query(query)
    datocms_client.query(query).data
  end

  def datocms_client
    Rails.application.config.datocms_client
  end
end

