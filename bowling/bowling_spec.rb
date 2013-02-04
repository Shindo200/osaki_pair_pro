# coding: utf-8
$LOAD_PATH << File.dirname(__FILE__)
require "bowling"

describe Bowling do
  let(:bowling) { Bowling.new }

  describe "#get_total_score" do
    it "全部ガーターだった場合、スコア0を返すこと" do
      ary = [[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0]]
      bowling.get_total_score(ary).should eq 0
    end

    it "全部1だった場合、スコア20を返すこと" do
      ary = [[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1]]
      bowling.get_total_score(ary).should eq 20
    end

    it "1フレーム目がストライクで後が1だった場合、スコア30を返すこと" do
      ary = [[10,0],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1]]
      bowling.get_total_score(ary).should eq 30
    end

    it "1,2フレーム目がストライクで後が1だった場合、スコア49を返すこと" do
      ary = [[10,0],[10,0],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1]]
      bowling.get_total_score(ary).should eq 49
    end

    it "1フレーム目がスペアで後が1だった場合、スコア29を返すこと" do
      ary = [[9,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1]]
      bowling.get_total_score(ary).should eq 29
    end

    it "スペアの後にストライクで後が1だった場合、スコア48を返すこと" do
      ary = [[9,1],[10,0],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1]]
      bowling.get_total_score(ary).should eq 48
    end

    it "10フレーム目以外パーフェクトの場合、スコア245を返すこと" do
      ary = Array.new(9, [10,0]).push([1,1])
      bowling.get_total_score(ary).should eq 245
    end

    it "パーフェクトゲームの場合、スコア300を返すこと" do
      ary = Array.new(9, [10,0]).push([10,10,10])
      bowling.get_total_score(ary).should eq 300
    end
  end

  describe "#is_strike?" do
    it "1投目が10だった場合、trueとなる" do
      bowling.is_strike?([10,0]).should be_true
    end
    it "1投目が0だった場合、falseとなる" do
      bowling.is_strike?([0,0]).should be_false
    end
  end

  describe "#is_spare?" do
    it "1投目が10だった場合、falseとなる" do
      bowling.is_spare?([10,0]).should be_false
    end

    it "1投目が10でなく、フレームの合計が10だった場合、trueとなる" do
      bowling.is_spare?([3,7]).should be_true
    end

    it "フレームの合計が10ではない場合、falseとなる" do
      bowling.is_spare?([3,6]).should be_false
    end
  end
end
