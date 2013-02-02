# coding: utf-8
class Bowling
  def get_score(total_score)
    total_score.push([0,0])
    score = []
    total_score.each_with_index { |frame, i|
      score.push(sum_frame_score(frame))
      if i < 9 && isStrike(frame)
          score[i] += total_score[i+1][0] + total_score[i+1][1]
          score[i] += total_score[i+2][0] if isStrike(total_score[i+1])
      end
      score[i] += total_score[i+1][0] if isSpare(frame)
    }
    score.inject(:+)
  end

  def sum_frame_score(frame)
    frame.inject(0) {|sum,n| sum + n }
  end

  def isStrike(frame)
    frame[0] == 10
  end

  def isSpare(frame)
    !isStrike(frame) && frame[0]+frame[1] == 10
  end
end
