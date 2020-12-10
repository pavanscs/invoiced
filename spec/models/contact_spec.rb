require 'rails_helper'

# Test suite for the Todo model
RSpec.describe Contact, type: :model do
  # Association test
  # Validation tests
  # ensure columns title and created_by are present before saving
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:phone) }
  it { should validate_presence_of(:email) }
end