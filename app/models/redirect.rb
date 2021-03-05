class Redirect < ApplicationRecord
	
	CONFIGS_PATH = "#{Rails.root}/nginx/configs/"
	TEMPLATE_PATH = "#{Rails.root}/nginx/template.conf"

	after_create :create_nginx_config_file
	after_destroy :delete_nginx_config_file

	def delete_nginx_config_file
		File.delete(self.path) if File.exist?(self.path)
	end
	def create_nginx_config_file
		template_file = File.open(TEMPLATE_PATH).read
		config_file = File.new(self.path,"w")
		template_file.each_line do |line|
  			line.gsub!(/\%SERVER_NAME\%/, self.domain)
  			line.gsub!(/\%URL\%/, self.url)
  			config_file.puts(line)
		end
		config_file.close
	end

	def self.formated_config_file_name(domain)
		CONFIGS_PATH + domain.downcase.gsub(/\./,'_') + '.conf'
	end

end
