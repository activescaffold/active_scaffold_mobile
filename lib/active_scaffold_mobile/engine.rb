module ActiveScaffoldMobile
  class Engine < ::Rails::Engine
    initializer("initialize_active_scaffold_mobile", :after => "initialize_active_scaffold") do
      ActiveScaffold.set_defaults do |config|
        config.actions << :mobile
      end
    end
  end
end
