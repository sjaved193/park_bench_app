ParkBenchApp::Application.routes.draw do
  devise_for :users
  root to: "reviews#index"
end
