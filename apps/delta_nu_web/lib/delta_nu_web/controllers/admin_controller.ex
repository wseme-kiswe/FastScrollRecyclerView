defmodule DeltaNuWeb.AdminController do
    use DeltaNuWeb, :controller
    import DeltaNu.Users
    def new(conn, _params) do
      # We'll leverage `Pow.Plug`, but you can also follow the classic Phoenix way:
      # changeset = MyApp.Users.User.changeset(%MyApp.Users.User{}, %{})
  
      changeset = Pow.Plug.change_user(conn)
  
      render(conn, "new.html", changeset: changeset)
    end
  
    def create(conn, %{"user" => user_params}) do
      # We'll leverage `Pow.Plug`, but you can also follow the classic Phoenix way:
      # user =
      #   %MyApp.Users.User{}
      #   |> MyApp.Users.User.changeset(user_params)
      #   |> MyApp.Repo.insert()
  
      user_params
      |> DeltaNu.Users.create_admin()
      |> case do
        {:ok, user} ->
          conn
          |> put_flash(:info, "Welcome!")
          |> redirect(to: Routes.page_path(conn, :index))
  
        {:error, changeset} ->
          render(conn, "new.html", changeset: changeset)
      end
    end
  end