# gaia-builder

Automation for building gaiad docker containers. The Automate build command allows users to build containers with the latest version of [`Gaia`](https://hub.cosmos.network/main/getting-started/what-is-gaia.html) or any version of their choice. Users will choose which [version of Gaia](https://github.com/cosmos/gaia/releases) they'll like to build with the `--build-arg` flag. Else, the latest version, which is currently `v7.0.2` will be built. To determine which `Gaia` version their containers are running on, users can run the `gaia-version` command.

All commands are written with the [Abscissa Framework](https://github.com/iqlusioninc/abscissa).

- [ ] Push image to Github container registry
- [ ] Automate build
    - [ ] Docker build <Repository URL>
    - [ ] Docker run image
- [ ] Gaia version
- [ ] x/auth support tests
- [ ] x/bank support tests
- [ ] x/staking support tests
- [ ] x/mint support tests
- [ ] x/distribution support tests
- [ ] x/slashing support tests
- [ ] x/gov support tests
- [ ] ibc-go/modules support tests
- [ ] x/params support tests