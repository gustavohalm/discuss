defmodule DiscussWeb.TopicController do
    use DiscussWeb, :controller
    alias DiscussWeb.Topic
    alias Discuss.Repo
    def index(conn, _params) do
        topics = Repo.all(Topic)
        |> IO.inspect
        render conn, "index.html", topics: topics 
    end

    def show(conn, %{"id" => id}) do
        topic = Repo.get(Topic, id)
        render conn, "show.html", topic: topic
    end
    
    def new(conn, params) do
        changeset = DiscussWeb.Topic.changeset(%Topic{}, %{})
        render conn, "new.html", changeset: changeset
    end
    
    def store(conn, params) do
        %{"topic" => topic} = params
        changeset = DiscussWeb.Topic.changeset(%Topic{}, topic)
        case Repo.insert(changeset)  do
            {:ok, post} -> post
                redirect(conn, to: "/topics" )
            {:error, changeset} -> changeset
                redirect(conn, to: "/topics" )
        end

         
    end

end