# == Schema Information
#
# Table name: todos
#
#  id           :integer          not null, primary key
#  description  :string(255)
#  priority     :integer
#  due_at       :datetime
#  completed_at :datetime
#  created_at   :datetime
#  updated_at   :datetime
#

class Todo < ActiveRecord::Base
end
