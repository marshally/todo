json.array!(@todos) do |todo|
  json.extract! todo, :id, :description, :priority, :due_at, :completed
  json.url todo_url(todo, format: :json)
end
