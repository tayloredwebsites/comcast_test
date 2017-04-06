name 'comcast_test'
maintainer 'Dave Taylor'
maintainer_email 'tayloredwebsites@me.com'
license 'all_rights'
description 'Installs/Configures comcast_test'
long_description 'Installs/Configures comcast_test'
version '0.1.1'

# The `issues_url` points to the location where issues for this cookbook are
# tracked.  A `View Issues` link will be displayed on this cookbook's page when
# uploaded to a Supermarket.
#
issues_url 'https://github.com/tayloredwebsites/comcast_test/issues' if respond_to?(:issues_url)

# The `source_url` points to the development reposiory for this cookbook.  A
# `View Source` link will be displayed on this cookbook's page when uploaded to
# a Supermarket.
#
source_url 'https://github.com/tayloredwebsites/comcast_test' if respond_to?(:source_url)

depends 'apache2', '~> 3.2.2'
depends 'ssl_certificate', '~> 2.1.0'
