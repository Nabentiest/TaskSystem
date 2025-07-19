class Task < ApplicationRecord
  has_many :parent_subtasks, class_name: 'Subtask', foreign_key: 'parent_id', dependent: :destroy
  has_many :child_tasks, through: :parent_subtasks, source: :child

  has_many :child_subtasks, class_name: 'Subtask', foreign_key: 'child_id', dependent: :destroy
  has_many :parent_tasks, through: :child_subtasks, source: :parent
end
