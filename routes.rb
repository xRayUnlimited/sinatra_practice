class Menus < Sinatra::Base
  get "/" do
    erb :home
  end

  get "/menu/new" do
    erb :new
  end

  get "/menu/:id/edit" do
    @app = App.find(params[:id])
    erb :edit
  end

  delete "/menu/:id" do
    App.find(params[:id]).destroy
    redirect "/menu"
  end

  #get "/apps/:id" do
  #  @app = App.find(params[:id])
  #  erb :app
  #end

  put "/menu/:id" do
    app = App.find(params[:id])
    app.update(
      title: params[:title], 
      description: params[:description]
    )
    redirect "/menu"
  end

  get "/menu" do
    @menu = App.all
    erb :menu
  end

  post "/menu" do
    App.create(
      title: params[:title], 
      description: params[:description]
    )
    redirect "/menu"
  end

  delete "/menu/:id" do
  end
end
