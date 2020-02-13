class profile::prometheus {
  scrape_configs           => [
    {
      'job_name'        => 'prometheus',
      'scrape_interval' => '10s',
      'scrape_timeout'  => '10s',
      'static_configs'  => [
        {
          'targets' => ['localhost:9090'],
          'labels'  => {'alias' => 'Prometheus'}
        }
      ],
    },
    {
      'job_name'        => 'node',
      'scrape_interval' => '5s',
      'scrape_timeout'  => '5s',
      'static_configs'  => [
        {
          'targets' => ['nodexporter.domain.com:9100'],
          'labels'  => {'alias' => 'Node'}
        },
      ],
    },
  ],
}
