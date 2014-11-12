require 'fog'

desc 'Deploy Ember and Rails'
task :deploy do
end

namespace :build do
  desc 'Build Ember'
  task :ember do
    sh 'cd ember; ember build --environment production --output-path production/'
  end

  desc 'Build Rails image'
  task :rails do
    sh 'cd rails; docker build -t tyrbo/tunefish . && docker push tyrbo/tunefish'
  end
end

namespace :deploy do
  desc 'Deploy Ember'
  task :ember do
    service = Fog::Storage.new(provider: 'Rackspace',
                               rackspace_username: 'tyrbo', 
                               rackspace_api_key: ENV['RACKSPACE_API'], 
                               rackspace_region: :dfw)

    directory = service.directories.new key: 'tunefish'
    Dir.glob('ember/production/assets/*').each do |f|
      name = Pathname.new(f).basename
      puts "Uploading... #{name}"
      directory.files.create key: "assets/#{name}", body: File.open(f)
    end

    sh 'cd ember/production; scp index.html root@balancer.tunefi.sh:/var/www'
  end

  namespace :rails do
    desc 'Rolling deployment'
    task :rolling do
      prep_servers
      run_migrations

      units = fetch_rails_units

      units.each do |unit|
        sh "fleetctl --tunnel=104.131.171.238 stop #{unit}"
        sh "fleetctl --tunnel=104.131.171.238 start #{unit}"
        sleep 5
      end
    end

    desc 'Hard deployment'
    task :hard do
      prep_servers
      run_migrations

      units = fetch_rails_units.join(' ')

      sh "fleetctl --tunnel=104.131.171.238 stop #{units}"
      sh "fleetctl --tunnel=104.131.171.238 start #{units}"
    end
  end
end

def prep_servers 
  machines = `fleetctl --tunnel=104.131.171.238 list-machines --no-legend --full --fields=machine`.split("\n")
  machines.each do |machine|
    sh "fleetctl --tunnel=104.131.171.238 ssh #{machine} \"/bin/bash -c 'docker pull tyrbo/tunefish'\""
  end
end

def run_migrations
  sh "ssh core@104.131.171.238 /usr/bin/docker run tyrbo/tunefish /bin/bash -c 'bin/update'"
end

def fetch_rails_units
  fetch_units.select { |x| x =~ /[rails|sidekiq]@[0-9]+.service/ }
             .map { |x| x.split("\t").reject { |x| x.empty? }[0] }
end

def fetch_units
  `fleetctl --tunnel=104.131.171.238 list-units --no-legend --fields=unit,sub`.split("\n")
end

