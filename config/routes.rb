Rails.application.routes.draw do

  root "trips#index"

  devise_for :users


  get "/users", :controller => "users", :action => "index"
  get "/users/:id", :controller => "users", :action => "show"

  # Routes for the Commit resource:
  # CREATE
  get "/commits/new", :controller => "commits", :action => "new"
  post "/create_commit", :controller => "commits", :action => "create"

  # READ
  get "/commits", :controller => "commits", :action => "index"
  get "/commits/:id", :controller => "commits", :action => "show"

  # UPDATE
  get "/commits/:id/edit", :controller => "commits", :action => "edit"
  post "/update_commit/:id", :controller => "commits", :action => "update"

  # DELETE
  get "/delete_commit/:id", :controller => "commits", :action => "destroy"
  #------------------------------

  # Routes for the Follow resource:
  # CREATE
  get "/follows/new", :controller => "follows", :action => "new"
  post "/create_follow", :controller => "follows", :action => "create"

  # READ
  get "/follows", :controller => "follows", :action => "index"
  get "/follows/:id", :controller => "follows", :action => "show"

  # UPDATE
  get "/follows/:id/edit", :controller => "follows", :action => "edit"
  post "/update_follow/:id", :controller => "follows", :action => "update"

  # DELETE
  get "/delete_follow/:id", :controller => "follows", :action => "destroy"
  #------------------------------

  # Routes for the Trip resource:
  # CREATE
  get "/trips/new", :controller => "trips", :action => "new"
  post "/create_trip", :controller => "trips", :action => "create"

  # READ
  get "/trips", :controller => "trips", :action => "index"
  get "/trips/:id", :controller => "trips", :action => "show"

  # UPDATE
  get "/trips/:id/edit", :controller => "trips", :action => "edit"
  post "/update_trip/:id", :controller => "trips", :action => "update"

  # DELETE
  get "/delete_trip/:id", :controller => "trips", :action => "destroy"
  #------------------------------



end
