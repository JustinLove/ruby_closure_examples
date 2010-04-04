# Alternatively, you can exert more control over the asset host by setting
# +asset_host+ to a proc like this:
#
# Really config.action_controller.asset_host

asset_host = Proc.new { |source|
  "http://assets#{source.hash % 2 + 1}.example.com"
}

(1..5).map {|i| asset_host.call i.to_s}
