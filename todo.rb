require "sinatra"
require "data_mapper"
require "./Task.rb"


before '/*' do
  @tasks_un = Task.all(:complete => false)
  @tasks_comp = Task.all(:complete => true)
end

get "/" do
  erb :index
end




###
# POST
###

post "/" do
  Task.create(:id => params[:id], :task => params[:task])
  erb :index
end

put "/:id" do
  task = Task.get(params[:id])
  #toggle the complete or incomplete
  task.complete ^= true #toggle the boolean of being complete with XOR
  task.save
  erb :index
end
