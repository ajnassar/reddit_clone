require 'spec_helper'

describe Comment do
  it { should allow_mass_assignment_of(:body) }
  it { should allow_mass_assignment_of(:link_id) }
  it { should allow_mass_assignment_of(:parent_comment_id) }
  it { should allow_mass_assignment_of(:user_id) }

  it { should belong_to(:link) }
  it { should belong_to(:user) }
  it { should belong_to(:parent_comment) }
  it { should have_many(:child_comments) }

end
