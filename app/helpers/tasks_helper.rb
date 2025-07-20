module TasksHelper
    def task_options_for_select(tasks, parent = nil, level = 0)
    result = []

    tasks.select { |t| t.parent_tasks.empty? || t.parent_tasks.include?(parent) }.each do |task|
      indent = "　" * level + (level > 0 ? "┣ " : "")
      result << [indent + task.name, task.id]

      # 子タスクを再帰的に処理
      result += task_options_for_select(task.child_tasks, task, level + 1)
    end

    result
  end

def render_task_tree(tasks, level = 0)
  safe_join(
    tasks.map do |task|
      content_tag(:div, data: { controller: "task-toggle" }) do
        button = content_tag(
          :div,
          raw(("&nbsp;" * level * 2) + task.name),
          data: { action: "click->task-toggle#toggle" },
          style: "cursor: pointer; font-weight: bold;"
        )

        children = content_tag(
          :div,
          render_task_tree(task.child_tasks, level + 1),
          data: { task_toggle_target: "children" },
          class: "hidden",
          style: "margin-left: 1em;"
        )

        button + children
      end
    end
  )
end
end
