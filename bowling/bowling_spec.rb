# coding: utf-8
$LOAD_PATH << File.dirname(__FILE__)
require "bowling"

describe Bowling do
  describe "#get_score" do
    it "全部ガーターだった場合、スコア0を返すこと" do
      bowling = Bowling.new
      ary = [[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0]]
      bowling.get_score(ary).should eq 0
    end

    it "全部1だった場合、スコア20を返すこと" do
      bowling = Bowling.new
      ary = [[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1]]
      bowling.get_score(ary).should eq 20
    end

    it "1フレーム目がストライクで後が1だった場合、スコア30を返すこと" do
      bowling = Bowling.new
      ary = [[10,0],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1]]
      bowling.get_score(ary).should eq 30
    end

    it "1,2フレーム目がストライクで後が1だった場合、スコア49を返すこと" do
      bowling = Bowling.new
      ary = [[10,0],[10,0],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1]]
      bowling.get_score(ary).should eq 49
    end

    it "1フレーム目がスペアで後が1だった場合、スコア29を返すこと" do
      bowling = Bowling.new
      ary = [[9,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1]]
      bowling.get_score(ary).should eq 29
    end

    it "スペアの後にストライクで後が1だった場合、スコア48を返すこと" do
      bowling = Bowling.new
      ary = [[9,1],[10,0],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1]]
      bowling.get_score(ary).should eq 48
    end

    it "10フレーム目以外パーフェクトの場合、スコア245を返すこと" do
      bowling = Bowling.new
      ary = Array.new(9, [10,0]).push([1,1])
      bowling.get_score(ary).should eq 245
    end

    it "パーフェクトゲームの場合、スコア300を返すこと" do
      bowling = Bowling.new
      ary = Array.new(9, [10,0]).push([10,10,10])
      bowling.get_score(ary).should eq 300
    end
  end
  describe "#isStrike" do
    it "1投目が10だった場合、trueとなる" do
      bowling = Bowling.new
      bowling.isStrike([10,0]).should be_true
    end
    it "1投目が0だった場合、falseとなる" do
      bowling = Bowling.new
      bowling.isStrike([0,0]).should be_false
    end
  end
  describe "#isSpare" do
    it "1投目が10だった場合、falseとなる" do
      bowling = Bowling.new
      bowling.isSpare([10,0]).should be_false
    end
    it "1投目が10でなく、フレームの合計が10だった場合、trueとなる" do
      bowling = Bowling.new
      bowling.isSpare([3,7]).should be_true
    end
    it "フレームの合計が10未満だった場合、falseとなる" do
      bowling = Bowling.new
      bowling.isSpare([3,6]).should be_false
    end
  end
end
