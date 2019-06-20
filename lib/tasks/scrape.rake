namespace :scrape do
	desc 'Scrape Site'
	task :entries => :environment do
		5.times do
			# ScrapeSite.by(url: Settings.scraped_url)
			# sleep(10.seconds)
		end
	end

	task :stations => :environment do
		GetCarpStations.default
	end

	task :wind_logs => :environment do
		GetCarpLogs.default
	end

end
