# namespace :twitter do
#     desc "ツイートする"

#     task :tweet => :environment do
#       client = Twitter::REST::Client.new(
#         consumer_key:        "fF9LChLpHRLAFBLEE0x9QcLUv",
#         consumer_secret:     "EqJ4MhR1zvI8BIdNZulXuBjDkTKAMtj91p5vwogOR1F6OqsYbI",
#         access_token:        "248186799-1QoDTt4b7lMHWtI0M0Cf2ofOYMPP5bvuJLWCbN7z",
#         access_token_secret: "x6daJpHLtmViNf9Ti8d1syGIakMMYh5i7ywiCe6y3ydkM",
#       )      
#       timNow = Time.now
#       tweet = timNow.strftime("今は %Y年%m月%d日 %H時%M分%S秒です")      
#       client.update(tweet)
#     end

# end