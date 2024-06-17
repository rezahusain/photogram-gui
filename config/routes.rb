Rails.application.routes.draw do

  get("/", {:controller=>"users", :action=>"index"})
  get("/users", {:controller=>"users", :action=>"index"})
  get("/users/:path_username", {:controller => "users", :action => "show"})
  post("/create_user", {:controller=>"users", :action=>"create"})

  get("/photos", {:controller=>"photos", :action=>"index"})
  get("/photos/:path_id", {:controller=>"photos", :action=>"show"})
  post("/create_photo", {:controller=>"photos", :action=>"create"})
end
