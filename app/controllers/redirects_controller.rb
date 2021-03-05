class RedirectsController < ApplicationController

  def index
  	@redirects = Redirect.all
  end
end
