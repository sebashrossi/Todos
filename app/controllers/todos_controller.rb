class TodosController < ApplicationController
  before_action :set_todo, only: %i[edit update destroy]
  before_action :set_user

  def new
    @todo = Todo.new
  end

  def edit; end

  def create
    @todo = Todo.new(todo_params)
    @todo.user = @user
    if @todo.save
      redirect_to user_path(@user), notice: 'Todo was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @todo.update(todo_params)
      redirect_to user_path(@user), notice: 'Todo was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @todo.destroy
    redirect_to user_path(@user), notice: 'Todo was successfully destroyed.'
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end
  
  def set_todo
    @todo = Todo.find(params[:id])
  end

  def todo_params
    params.require(:todo).permit(:name, :status, :user_id)
  end
end
