class RedirectsController < ApplicationController

    skip_before_action :verify_authenticity_token

    def index
  	    # @redirects = Redirect.all
  	    @redirects = Redirect.paginate :page => params[:page], per_page:10
    end

	def new
		@redirect = Redirect.new
	end

	def show
		@redirect = Redirect.find(params[:id])
	end

	def create
		puts redirects_params
		@redirect = Redirect.new(redirects_params)
		if @redirect.valid?
			@redirect.save
			redirect_to root_path
		else
			flash.now[:messages] = @redirect.errors.full_messages[0]
			render :new
		end
	end

	def destroy
	    @redirect = Redirect.find(params[:id])
	    @redirect.destroy

	    redirect_to root_path
	end

	private
	    def redirects_params
	    	params[:redirect][:path] = Redirect.formated_config_file_name(params[:redirect][:domain])
	        params.require(:redirect).permit(:domain, :url, :path)
	    end
end
