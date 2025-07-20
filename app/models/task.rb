class Task < ApplicationRecord
  has_many :parent_subtasks, class_name: "Subtask", foreign_key: "child_id"
  has_many :parent_tasks, through: :parent_subtasks, source: :parent

  has_many :child_subtasks, class_name: "Subtask", foreign_key: "parent_id"
  has_many :child_tasks, through: :child_subtasks, source: :child
end
