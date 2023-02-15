Rails.application.routes.draw do

  get("/users", { :controller => "users", :action=> "index"})
  get("/users/:path_username", {:controller => "users", :action => "show"})
  get("/photos", {:controller => "photos", :action => "index"})
  get("/photos/:path_photos", {:controller => "photos", :action => "show"})
  get("/delete_photo/:path_deletephotos", {:controller => "photos", :action => "delete"})
  get("/insert_photo", {:controller => "photos", :action => "create"})
  get("/update_photo/:modify_id", {:controller => "photos", :action => "update"})
  #get("/insert_user_record", {:controller => "photos"}
  get("/insert_user_record", {:controller => "users", :action => "add"})
  get("/update_user", {:controller=> "users", :action => "update_user"})

end
