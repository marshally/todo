json.array!(@todos) do |todo|
  json.extract! todo, :id, :description, :priority, :due_at, :completed_at
  json.url todo_url(todo, format: :json)
end
