require 'spec_helper'

describe autoscaling_group('myproduct-dev-serviceOne') do
  it { should exist }
  its(:desired_capacity) { should eq 1 }
  its(:min_size) { should eq 1 }
  its(:max_size) { should eq 1 }
  its(:health_check_type) { should eq 'EC2' }
  it { should have_ec2('myproduct-dev-serviceOne') }
end

describe ec2('myproduct-dev-serviceOne') do
  it { should exist }
  it { should be_running }
  its(:image_id) { should eq 'ami-4fffc834' }
  it { should have_security_group('myproduct-dev-serviceOne-sg') }
  it { should belong_to_vpc('myproduct-dev-vpc') }
end