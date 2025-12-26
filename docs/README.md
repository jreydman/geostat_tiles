## Config
```yaml
listen_addresses: '${HOST}:${PORT}'

web_ui: enableforall

postgres:
  connection_string: '${DATABASE_URL}'
  functions:
    fetch:
      schema: public
      function: function_zxy_query
      bounds:
        - 29.7985868
        - 49.7709432
        - 31.9186829
        - 51.4121286

styles:
  paths:
    - ./tilestyle.json
```

## Release targets
target/release/martin
target/release/martin-cp
target/release/mbtiles

requirements
tilestyle.json <-- for tiles interface like url, view example in docs

## Entrypoint
martin --config <path/to/config.yaml>
