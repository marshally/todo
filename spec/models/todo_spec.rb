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

require 'spec_helper'

describe Todo do
  it { should validate_presence_of(:description) }
  it { should validate_numericality_of(:priority) }
end
