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
  pending "add some examples to (or delete) #{__FILE__}"
end
