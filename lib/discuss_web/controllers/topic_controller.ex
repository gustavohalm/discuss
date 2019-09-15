defmodule DiscussWeb.TopicController do
    use DiscussWeb :controller

    def index(conn, _params) do
        render(conn, "index.html")
    end

    def show(conn, %{"id" => id}) do
        
    end
    
    def new(conn, _params) do
        
    end
    
    def store(conn, _params) do
        
    end

end