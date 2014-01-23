### ROUTES.rb
RouteApp::Application.routes.draw do
    # create our root route
    # get "/", :to  => "planes#index"
    
    root to: "planes#index"

    get "/planes", to: "planes#index"
    
    #define a route for making a new plane
    get "/planes/new", to: "planes#new"

    post "/planes", to: "planes#create"

    get "/planes/:id/edit", to: "planes#edit"

    get "/planes/:id", to: "planes#show"

    put "/planes/:id", to: "planes#update"

end



# PLAN FOR SUBMITTING  A NEW PLANE
## 1.) we want to submit a "POST" to "/planes"
#       b). Route the "POST" to "PlanesController" 
#          send it to the "#create" 
# 2.) In the create
#       a) read the params for the plane
#       b.) save the plane to our database 
# 3.) Sending redirect to the "#index" method

###### define particular routes before the general routes