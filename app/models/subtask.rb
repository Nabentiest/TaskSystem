class Subtask < ApplicationRecord
  belongs_to :parent, class_name: "Task"
  belongs_to :child, class_name: "Task"
end
