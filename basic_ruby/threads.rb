# Ensure debugger works correctly with Threads
class Threads
  def func(thread_id)
    a = 1
    loop do
      a += 1
      p "hi from #{thread_id}" # bp here
      a == 100 ? break : next
    end
  end

  def test_threads
    threads = []
    2.times do |it|
      threads << Thread.new { func(it) }
    end
    threads.each do |a|
      a.join
    end
  end
end

threads = Threads.new
threads.test_threads