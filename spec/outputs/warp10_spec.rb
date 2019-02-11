#
#   Copyright 2018  SenX S.A.S.
#   Copyright 2019  Nabil BENDAFI <nabil@bendafi.fr>
#
#   Licensed under the Apache License, Version 2.0 (the "License");
#   you may not use this file except in compliance with the License.
#   You may obtain a copy of the License at
#
#     http:#www.apache.org/licenses/LICENSE-2.0
#
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#   See the License for the specific language governing permissions and
#   limitations under the License.
#


require "logstash/devutils/rspec/spec_helper"
require "logstash/outputs/warp10"

describe LogStash::Outputs::Warp do

  let(:base_config) do
  {
    "warpUri" => "localhost",
    "token" => "a_token"
  }
  end

  context "validates default configuration" do

    it "should register without errors" do
      output = LogStash::Outputs::Warp.new(base_config)
      expect { output.register }.to_not raise_error
    end

    it "should hold default parameters" do
      output = LogStash::Outputs::Warp.new(base_config)
      output.register
      expect(output.instance_variable_get(:@warpUri)).to eq "localhost"
      expect(output.instance_variable_get(:@warpUri)).to eq "localhost"
      expect(output.instance_variable_get(:@token)).to eq "a_token"
      expect(output.instance_variable_get(:@gtsName)).to eq "logstash"
      expect(output.instance_variable_get(:@labels)).to eq []
      expect(output.instance_variable_get(:@onlyOneValue)).to eq 'false'
      expect(output.instance_variable_get(:@valueKey)).to eq "message"
      expect(output.instance_variable_get(:@flush_size)).to eq 100
      expect(output.instance_variable_get(:@idle_flush_time)).to eq 1
    end
  end
end
