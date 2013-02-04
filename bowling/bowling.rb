# coding: utf-8
class Bowling
  def get_total_score(frames)
    frames.push([0,0])
    scores = []
    frames.each_with_index { |frame, i|
      scores.push(frame.inject(:+))
      if i < 9 && is_strike?(frame)
          scores[i] += frames[i+1][0] + frames[i+1][1]
          scores[i] += frames[i+2][0] if is_strike?(frames[i+1])
      end
      scores[i] += frames[i+1][0] if is_spare?(frame)
    }
    scores.inject(:+)
  end
 
  def is_strike?(frame)
    frame[0] == 10
  end
 
  def is_spare?(frame)
    !is_strike?(frame) && frame[0]+frame[1] == 10
  end
end
