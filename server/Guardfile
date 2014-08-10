# A sample Guardfile
# More info at https://github.com/guard/guard#readme
notification :tmux,
             display_message: true,
             timeout: 3,
             default_message_format: '%s >> %s',
             line_separator: ' > ',
             color_location: 'status-left-bg'

guard :minitest, all_on_start: false do
  # with Minitest::Spec
  watch(%r{^spec/(.*)_spec\.rb$})
  watch(%r{^lib/(.+)\.rb$})         { |m| "spec/lib/#{m[1]}_spec.rb" }
  watch(%r{^spec/spec_helper\.rb$}) { 'spec' }
end
