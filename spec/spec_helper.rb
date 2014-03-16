#$:.unshift File.join(File.dirname(__FILE__),'..','lib')

ENV["RACK_ENV"] = "test"

require 'minitest/autorun'
require "minitest/reporters"
require 'webmock/minitest'
require 'debugger'
require 'utils/bwt_hash'
require 'utils/laredo_hash'

Dir["#{Dir.pwd}/lib/**/*rb"].each { |file| require file }

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new color: true
