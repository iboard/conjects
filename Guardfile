# A sample Guardfile
# More info at https://github.com/guard/guard#readme

guard :rspec do
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^lib/(.+)\.rb$})     { |m| "spec/lib/#{m[1]}_spec.rb" }
  watch('spec/spec_helper.rb')  { "spec" }

  # Conjects
  watch(%r{^spec/examples/(.+)\.rb$})       { |m| "spec/integration/" }
  watch(%r{^spec/support/(.+)\.rb$})        { "spec" }
  watch(%r{^lib/conjects/(.+)/(.+)\.rb$})   { |m| "spec/integration/" }

end

