Rails.application.routes.draw do

  get("/users", { :controller => "users", :action=> "index"})
  get("/users/:path_username", {:controller => "users", :action => "show"})
  get("/photos", {:controller => "photos", :action => "index"})
  get("/photos/:path_photos", {:controller => "photos", :action => "show"})
  get("/delete_photo/:path_deletephotos", {:controller => "photos", :action => "delete"})

end
