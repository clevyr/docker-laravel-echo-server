# docker-laravel-echo-server

Node Docker container with [tlaverdure/laravel-echo-server](https://github.com/tlaverdure/laravel-echo-server) installed. All of the [laravel-echo-server environment variables](https://github.com/tlaverdure/laravel-echo-server#dotenv) are usable.


## Installation

1. Add this container to your `docker-compose.yml` with the following service definition.

```yaml
echo-server:
  image: ghcr.io/clevyr/laravel-echo-server
  restart: unless-stopped
```

2. If you are using [clevyr/docker-caddy](https://github.com/clevyr/docker-caddy), configure the `/socket.io` route
by adding the following env to the proxy service.

```yaml
proxy:
  image: ghcr.io/clevyr/caddy
  environment:
    SOCKETIO_ADDRESS: echo-server:6001
```

3. Install the client libraries

```shell
npm install laravel-echo socket.io-client
```

4. Add the following snippet to `resources/js/bootstrap.js`.

```javascript
import Echo from 'laravel-echo';

window.io = require('socket.io-client');

window.Echo = new Echo({
  broadcaster: 'socket.io',
  host: window.location.hostname,
});
```

5. Follow [the Laravel Broadcasting documentation](https://laravel.com/docs/9.x/broadcasting#concept-overview) to
set up and subscribe to a channel.


## Environment Variables

Refer to the [DotEnv section of tlaverdure/laravel-echo-server](https://github.com/tlaverdure/laravel-echo-server#dotenv) for an environment variable listing.
