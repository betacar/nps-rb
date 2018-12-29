# frozen_string_literal: true

# A sample Guardfile
# More info at https://github.com/guard/guard#readme

# guard :rspec, all_on_start: true, cmd: 'bundle exec rspec' do
#   watch(%r{^spec/.+_spec\.rb$})
#   watch(%r{^spec/factories/(.*)\.rb$}) { 'spec' }
#   watch(%r{^spec/support/(.+)\.rb$})   { 'spec' }
#   watch('spec/spec_helper.rb')         { 'spec' }
#   watch(%r{^app/(.*)\.rb$})            { |m| "spec/#{m[1]}#{m[2]}_spec.rb" }
# end

guard :rack, cmd: 'bundle exec rackup -s puma' do
  watch(%r{^(config|lib)/.*})
end
