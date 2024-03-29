#!/bin/sh

set -o errexit -o nounset

# Build genesis file incl account for passed address
coins="10000000000stake,100000000000samoleans"
CHAINID="cosmos"
GENACCT="cosmos1zyteclqhjm9vsf66svqxntq8g85vncr9689fm9"
gaiad init --chain-id $CHAINID $CHAINID
gaiad keys add validator --keyring-backend="test"
gaiad add-genesis-account $(gaiad keys show validator -a --keyring-backend="test") $coins
gaiad add-genesis-account $GENACCT $coins
gaiad gentx validator 5000000000stake --keyring-backend="test" --chain-id $CHAINID
gaiad collect-gentxs

# Set proper defaults and change ports
sed -i 's#"tcp://127.0.0.1:26657"#"tcp://0.0.0.0:26657"#g' ~/.gaia/config/config.toml
sed -i 's/timeout_commit = "5s"/timeout_commit = "1s"/g' ~/.gaia/config/config.toml
sed -i 's/timeout_propose = "3s"/timeout_propose = "1s"/g' ~/.gaia/config/config.toml
sed -i 's/index_all_keys = false/index_all_keys = true/g' ~/.gaia/config/config.toml

# Start the gaia
gaiad start --pruning=nothing --minimum-gas-prices 0.0uatom;0.0stake
