Rails.application.routes.draw do

  get("/", { :controller => "users", :action => "index"})
  get("/users", { :controller => "users", :action => "index"})
  get("/users/:path_username", { :controller => "users", :action => "show" })
  get("/add_user",{ :controller => "users", :action => "add_user" })
  get("/update_user/:path_id", { :controller => "users", :action => "update_user" })

  get("/photos", { :controller => "photos", :action => "index"})
  get("/photos/:path_id", { :controller => "photos", :action => "show" })
  get("/add_photo",{ :controller => "photos", :action => "add_photo" })
  get("/update_photo/:path_id", { :controller => "photos", :action => "update_photo" })
  get("/delete_photo/:path_id", { :controller => "photos", :action => "delete_photo" })
  get("/add_comment/:path_id", { :controller => "photos", :action => "add_comment" })
end
