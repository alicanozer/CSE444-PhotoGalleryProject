#makro tanımlamaları burada olsun
ENV['STORAGE_PATH'] = "uploads" if ENV['STORAGE_PATH'].nil?
ENV['LOGIN_REQUIRE'] = 'true'
ENV['TITLE'] = 'PHOTO GALLERY'
ENV['HEROKU']           = 'true'
#ENV['S3_KEY']           = ''
#ENV['S3_SECRET']        = ''
#ENV['S3_BUCKET']        = ''
ENV['LOGO'] =  'rails.png'

