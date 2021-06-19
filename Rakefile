# frozen_string_literal: true

task default: %w[acceptance]

task :init do
  ruby 'db/init.rb'
end

task :udf do
  ruby 'db/udf.rb'
end

task :acceptance do
  ruby 'tests/acceptance.rb'
end

task :unit do
  ruby 'tests/unit.rb'
end
