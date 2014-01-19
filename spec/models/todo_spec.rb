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

require 'spec_helper'

describe Todo do
  it { should validate_presence_of(:description) }
  it { should validate_numericality_of(:priority) }

  let(:valid_attributes) { {description: "abc", priority: 1} }

  context "#ensure_completed" do
    it "should allow a user to be saved with no completed set" do
      t = Todo.create!(valid_attributes)
      expect(t.completed).to eq(false)
    end
  end
end
