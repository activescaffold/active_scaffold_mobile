module ActiveScaffold::Config
  class Mobile < Base
    self.crud_type = :read
    def initialize(*args)
      super
      @tablet_views = self.class.tablet_views
    end

    # if tablet_views should be enabled
    # * true: use tablet views, fallback to desktop views if not available
    # * :phone_fallback: use tablet views, fallback to phone views if not available
    # * :phone: use phone views
    # * false: use desktop views
    attr_accessor :tablet_views
    cattr_accessor :tablet_views
    self.tablet_views = true

    # columns to display on list for phones
    columns_accessor :phone_columns, :copy => :list

    # columns to display on list for tablets
    columns_accessor :tablet_columns, :copy => :list

    # columns to display when row clicked
    columns_accessor :extended_columns, :copy => :list
  end
end
