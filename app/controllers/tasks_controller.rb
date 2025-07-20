class TasksController < ApplicationController
  def index
    @tasks = Task.includes(:child_tasks)
  end

  def show
    @task = Task.find(params[:id])
    @subtasks = @task.child_tasks
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to tasks_path, notice: "タスクを追加しました"
    else
      @tasks = Task.where.missing(:parent_tasks)
      render :index, status: :unprocessable_entity
    end
  end

  def create_subtask
    @parent = Task.find(params[:id])
    @child = Task.new(task_params)

    if @child.save
      Subtask.create!(parent: @parent, child: @child)
      redirect_to @parent, notice: "子タスクを追加しました"
    else
      @task = @parent
      @subtasks = @parent.child_tasks
      render :show
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path, notice: "タスクを削除しました"
  end

  private

  def task_params
    params.require(:task).permit(:name)
  end
end
