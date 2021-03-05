class Redirect < ApplicationRecord

	CONFIGS_PATH = "nginx/configs/"
	TEMPLATE_PATH = "nginx/template.conf"

	before_create :create_nginx_config_file

	def create_nginx_config_file

		template_file = File.open(TEMPLATE_PATH).read
		config_file = File.new(formated_config_file_name,"w")
		template_file.each_line do |line|
  			line.gsub!(/\%SERVER_NAME\%/, self.domain)
  			line.gsub!(/\%URL\%/, self.url)
  			config_file.puts(line)
		end
		config_file.close
	end

	def formated_config_file_name
		CONFIGS_PATH + self.domain.downcase.gsub(/\./,'_') + '.conf'
	end


end
