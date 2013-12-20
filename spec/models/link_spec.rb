require 'spec_helper'

describe Link do

  it { should allow_mass_assignment_of(:title)}
  it { should allow_mass_assignment_of(:user_id)}
  it { should allow_mass_assignment_of(:url)}

  it { should belong_to(:user) }
  it { should have_many(:comments) }
  it { should have_many(:subs) }
  it { should have_many(:link_subs) }

end
