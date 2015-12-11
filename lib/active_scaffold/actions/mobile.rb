module ActiveScaffold::Actions
  module Mobile

    def self.included(base)
      base.has_mobile_fu false
      base.before_action :prepare_for_mobile, :if => :mobile_view?
    end

    protected

    def objects_for_etag
      # only override when list_columns is called and mobile view displayed
      if @list_columns && mobile_view?
        objects = super
        if objects.is_a? Hash
          objects.merge(:etag => [objects[:etag], mobile_views])
        else
          [objects, mobile_views]
        end
      else
        super
      end
    end

    def list_columns
      @list_columns ||= begin
        if extended_columns?
          active_scaffold_config.mobile.extended_columns.collect_visible
        elsif phone_columns?
          active_scaffold_config.mobile.phone_columns.collect_visible
        elsif tablet_columns?
          active_scaffold_config.mobile.tablet_columns.collect_visible
        else
          super
        end
      end
    end

    def mobile_view?
      mobile_views.present?
    end

    def phone_columns?
      mobile_views == 'views_phone'
    end

    def tablet_columns?
      Array(mobile_views)[0] == 'views_tablet'
    end

    def mobile_views
      @mobile_views ||= 
        if is_mobile_device?
          'views_phone'
        elsif is_tablet_device? 
          case active_scaffold_config.mobile.tablet_views
          when true then 'views_tablet'
          when :phone_fallback then ['views_tablet', 'views_phone']
          when :phone then 'views_phone'
          else []
          end
        else
          []
        end
    end

    def prepare_for_mobile
      Array(mobile_views).reverse.each do |view|
        prepend_view_path Rails.root + 'app' + view
      end
    end

    def extended_columns?
      params[:extended] && params[:id] && mobile_view?
    end
  end
end
