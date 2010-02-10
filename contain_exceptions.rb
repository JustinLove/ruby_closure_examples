class Proc
  def raise?
    begin
      call
      return false
    rescue
      return true
    end
  end
end

lambda {:foo}.raise?
lambda {raise :hell}.raise?
