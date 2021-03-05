class RedirectsController < ApplicationController

    def index
  	    @redirects = Redirect.all
    end

	def new
		@redirect = Redirect.new
	end

	def create
		puts redirects_params
		@redirect = Redirect.new(redirects_params)
		if @redirect.save
			redirect_to root_path
		else
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
