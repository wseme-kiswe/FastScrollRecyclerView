defmodule DeltaNu.EventsTest do
  use DeltaNu.DataCase

  alias DeltaNu.Events

  describe "events" do
    alias DeltaNu.Events.Event

    @valid_attrs %{amount_registered_users: 42, description: "some description", end_time: ~D[2010-04-17], max_registered_users: 42, picture: "some picture", place: "some place", start_time: ~D[2010-04-17], title: "some title"}
    @update_attrs %{amount_registered_users: 43, description: "some updated description", end_time: ~D[2011-05-18], max_registered_users: 43, picture: "some updated picture", place: "some updated place", start_time: ~D[2011-05-18], title: "some updated title"}
    @invalid_attrs %{amount_registered_users: nil, description: nil, end_time: nil, max_registered_users: nil, picture: nil, place: nil, start_time: nil, title: nil}

    def event_fixture(attrs \\ %{}) do
      {:ok, event} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Events.create_event()

      event
    end

    test "list_events/0 returns all events" do
      event = event_fixture()
      assert Events.list_events() == [event]
    end

    test "get_event!/1 returns the event with given id" do
      event = event_fixture()
      assert Events.get_event!(event.id) == event
    end

    test "create_event/1 with valid data creates a event" do
      assert {:ok, %Event{} = event} = Events.create_event(@valid_attrs)
      assert event.amount_registered_users == 42
      assert event.description == "some description"
      assert event.end_time == ~D[2010-04-17]
      assert event.max_registered_users == 42
      assert event.picture == "some picture"
      assert event.place == "some place"
      assert event.start_time == ~D[2010-04-17]
      assert event.title == "some title"
    end

    test "create_event/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Events.create_event(@invalid_attrs)
    end

    test "update_event/2 with valid data updates the event" do
      event = event_fixture()
      assert {:ok, %Event{} = event} = Events.update_event(event, @update_attrs)
      assert event.amount_registered_users == 43
      assert event.description == "some updated description"
      assert event.end_time == ~D[2011-05-18]
      assert event.max_registered_users == 43
      assert event.picture == "some updated picture"
      assert event.place == "some updated place"
      assert event.start_time == ~D[2011-05-18]
      assert event.title == "some updated title"
    end

    test "update_event/2 with invalid data returns error changeset" do
      event = event_fixture()
      assert {:error, %Ecto.Changeset{}} = Events.update_event(event, @invalid_attrs)
      assert event == Events.get_event!(event.id)
    end

    test "delete_event/1 deletes the event" do
      event = event_fixture()
      assert {:ok, %Event{}} = Events.delete_event(event)
      assert_raise Ecto.NoResultsError, fn -> Events.get_event!(event.id) end
    end

    test "change_event/1 returns a event changeset" do
      event = event_fixture()
      assert %Ecto.Changeset{} = Events.change_event(event)
    end
  end
end
