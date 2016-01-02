# jedcn.com

Static site. Middleman.

NPM is here for the `scripts`.

## Getting Started

### Preview and LiveReload

* `npm start`
* Visit http://localhost:4567

### Build

* `npm run build`

### Deploy

Deploy credentials must be placed in a file named `~/.jedcn.com.rc`:

```shell
DEPLOY_HOST=the-server-where-jedcn.com-is-hosted
DEPLOY_USER=the-user-that-can-rsync-into-DEPLOY_HOST
```

Once this is created, run `npm run build-and-deploy`.

## Setup

### Directory Structure

https://middlemanapp.com/basics/directory-structure/
