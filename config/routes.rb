Rails.application.routes.draw do

  get("/", {:controller=>"users", :action=>"index"})
  get("/users", {:controller=>"users", :action=>"index"})
  get("/users/:path_username", {:controller => "users", :action => "show"})
  post("/create_user", {:controller=>"users", :action=>"create"})
  post("/update_user/:path_username", {:controller=>"users", :action=>"update"})

  get("/photos", {:controller=>"photos", :action=>"index"})
  get("/photos/:path_id", {:controller=>"photos", :action=>"show"})
  post("/create_photo", {:controller=>"photos", :action=>"create"})
  get("/delete_photo/:path_id", {:controller=>"photos", :action=>"delete"})
  post("/update_photo/:path_id", {:controller=>"photos", :action=>"update"})

  post("/add_comment", {:controller=>"photos", :action=>"comment"})
end
