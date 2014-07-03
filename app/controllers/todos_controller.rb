class TodosController < ApplicationController
  before_action :set_todo, only: [:show, :edit, :update, :destroy]

  # GET /todos
  # GET /todos.json
  def index
    @todos = current_user.todos
  end

  # POST /todos.json
  def create
    @todo = Todo.new(todo_params)
    respond_to do |format|
      if @todo.save
        format.json { render action: 'show', status: :created, location: @todo }
      else
        format.json { render json: @todo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /todos/1.json
  def update
    respond_to do |format|
      if @todo.update(todo_params)
        format.json { head :no_content }
      else
        format.json { render json: @todo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /todos/1.json
  def destroy
    @todo.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_todo
      @todo = current_user.todos.where(id: params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def todo_params
      params.
        require(:todo).
        permit(:description, :priority, :due_at, :completed).
        merge(user_id: current_user.id)
    end
end
