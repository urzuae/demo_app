class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  @tags = Micropost.tag_counts_on(:tags)

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
end
