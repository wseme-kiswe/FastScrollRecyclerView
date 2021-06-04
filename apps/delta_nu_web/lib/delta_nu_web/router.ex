defmodule DeltaNuWeb.Router do
  use DeltaNuWeb, :router
  use Pow.Phoenix.Router
  use Pow.Extension.Phoenix.Router,
    extensions: [PowResetPassword, PowPersistentSession]

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :admin do
    plug DeltaNuWeb.EnsureRolePlug, :admin
  end

  pipeline :protected do
    plug Pow.Plug.RequireAuthenticated,
      error_handler: Pow.Phoenix.PlugErrorHandler
  end

  scope "/" do
    pipe_through :browser

    pow_routes()
    pow_extension_routes()
  end

  #Signed in auth required routes
  scope "/", DeltaNuWeb do
    pipe_through [:browser, :protected]

    get "/events_listing", EventController, :events_listing
    get "/events/:id", EventController, :events_listing_show
  end


  scope "/admin", DeltaNuWeb do
    pipe_through [:browser, :admin]

    resources "/events", EventController
  end

  # Public auth required routes
  scope "/", DeltaNuWeb do
    pipe_through :browser
    get "/", PageController, :index
    get "/about_us", PageController, :about_us

    get "/admin/signup", AdminController, :new, as: :signup
    post "/admin/signup", AdminController, :create, as: :signup
  end

  # Other scopes may use custom stacks.
  # scope "/api", DeltaNuWeb do
  #   pipe_through :api
  # end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser
      live_dashboard "/dashboard", metrics: DeltaNuWeb.Telemetry
    end
  end
end
