module MetaTaggable
  extend ActiveSupport::Concern

  include ActionView::Helpers::AssetUrlHelper

  included do
    before_action :prepare_meta_tags
  end

  private

  def prepare_meta_tags(options = {})
    base = t('meta_tags.base')

    site = base[:site]
    description = base[:description]
    title = t("meta_tags.titles.#{controller_name}.#{action_name}", default: 'MatchingCat')
    image = image_url('/images/cat_img_sample1.jpg')

    defaults = {
      site: site,
      title: title,
      description: description,
      keywords: base[:keywords],
      og: {
        url: request.url,
        title: :title,
        description: description,
        site_name: site,
        type: 'website',
        image: image
      },
      fb: {
        app_id: '*****'
      },
      twitter: {
        card: 'summary',
        site: '@twitter_account',
        title: :title,
        description: description
        # image: image
      }
    }

    options.reverse_merge!(defaults)

    set_meta_tags(options)
  end
end