class profile::prometheus {
  include prometheus

  scrape_configs [
    {
      'job_name'        => 'node',
      'scrape_interval' => '15s',
      'scrape_timeout'  => '5s',
      'static_configs'  => [
        {
          'targets' => ['nodexporter.domain.com:9100'],
          'labels'  => {'alias' => 'Node'}
        },
      ],
    },
  ]
}
