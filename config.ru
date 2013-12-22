use Rack::Static,
  urls: %w{/images /js /css},
  root: "public"

run lambda { |env|
  [
    200,
    {
      'Content-Type' => 'text/html',
      'Cache-control' => 'public, max-age=86400'
    },
    File.open('public/index.html', File::RDONLY)
  ]
}
