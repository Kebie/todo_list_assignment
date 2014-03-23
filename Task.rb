require 'sinatra'
require 'data_mapper'

DataMapper::setup(:default, "sqlite3://#{Dir.pwd}/contact.db")


class Task
  include DataMapper::Resource
  property :id, Serial
  property :task, String
  property :complete, Boolean, :default => false
end

DataMapper.finalize

Task.auto_upgrade!