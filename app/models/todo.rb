# == Schema Information
#
# Table name: todos
#
#  id          :integer          not null, primary key
#  description :string(255)      not null
#  priority    :integer
#  due_at      :datetime
#  created_at  :datetime
#  updated_at  :datetime
#  completed   :boolean          default(FALSE), not null
#

class Todo < ActiveRecord::Base
  belongs_to :user

  validates :description, presence: true
  validates :priority, numericality: true
  validates :user_id, presence: true, numericality: true
  before_save :ensure_completed

  def ensure_completed
    if completed.blank?
      self.completed = false
    end
    true
  end
end
