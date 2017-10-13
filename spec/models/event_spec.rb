# require 'rails_helper'
#
# RSpec.describe Event, type: :model do
#   describe "validations" do
#     it "is invalid without a name" do
#       event = Event.new(name: "")
#       event.valid?
#       expect(event.errors).to have_key(:name)
#     end
#
#     it "is invalid without a description" do
#       event = Event.new(description: nil)
#       event.valid?
#       expect(event.errors).to have_key(:description)
#     end
#
#     it "is invalid with a description longer than 1000 characters" do
#       event = Event.new(description: "shdskdj sdkjsksdk skdjskmsld ksdssl;dsd ldksldslks dkmsdlkslslks lsdkslslks skdsldlsdsd ldmlsdslmd lsdmslmds sldmsd ")
#       event.valid?
#       expect(event.errors).to have_key(:description)
#     end
#   end
# end

require 'rails_helper'

RSpec.describe Event, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_length_of(:description).is_at_most(1000) }
  end

  describe "#bargain?" do
    let(:bargain_event) { create :event, price: 20 }
    let(:non_bargain_event) { create :event, price: 200 }

    it "returns true if the price is smaller than 30 EUR" do
      expect(bargain_event.bargain?).to eq(true)
      expect(non_bargain_event.bargain?).to eq(false)
    end
  end

  describe ".order_by_price" do
    let!(:event1) { create :event, price: 100 }
    let!(:event2) { create :event, price: 200 }
    let!(:event3) { create :event, price: 50 }

    it "returns a sorted array of events by prices" do
      # note that they should not come out in the order that they were created
      expect(Event.order_by_price).to eq([event3, event1, event2])
    end
  end

  describe "association with user" do
  let(:user) { create :user }

  it "belongs to a user" do
    event = user.events.build(name: "Shared")

    expect(event.user).to eq(user)
  end

  # OR, go the shoulda way:

    it { is_expected.to belong_to :user}
end

describe "association with category" do
  let(:event) { create :event }

  let(:category1) { create :category, name: "Bright", events: [event] }
  let(:category2) { create :category, name: "Clean lines", events: [event] }
  let(:category3) { create :category, name: "A Man's Touch", events: [event] }

  it "has categories" do
    expect(event.categories).to include(category1)
    expect(event.categories).to include(category2)
    expect(event.categories).to include(category3)
  end

  # Or we do it the shoulda way:
  it { is_expected.to have_and_belong_to_many :categories }
end

describe "association with registration" do
let(:guest_user) { create :user, email: "guest@user.com" }
let(:host_user) { create :user, email: "host@user.com" }

let!(:event) { create :event, user: host_user }
let!(:registration) { create :registration, event: event, user: guest_user }

it "has registrations" do
  expect(event.guests).to include(guest_user)
end
end



end
