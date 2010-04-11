def raise?
  begin
    yield
    return false
  rescue
    return true
  end
end

raise? {:foo}
raise? {raise :hell}
