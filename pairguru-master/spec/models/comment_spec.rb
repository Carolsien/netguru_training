require 'rails_helper'

describe Comment do
  it { is_expected.to allow_value("aaaaa").for(:body) }
  it { is_expected.not_to allow_value("a").for(:body) }
  it { is_expected.not_to allow_value(" ").for(:body) }
end
