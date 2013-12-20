require 'spec_helper'

describe LinkSub do
  it { should allow_mass_assignment_of(:link_id) }
  it { should allow_mass_assignment_of(:sub_id) }
  it { should belong_to(:link) }
  it { should belong_to(:sub) }
end
