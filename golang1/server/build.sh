#!/bin/bash

docker build --no-cache . -t server:v1
nitro-cli build-enclave --docker-uri server:v1 --output-file server.eif
nitro-cli run-enclave --cpu-count 2 --memory 2048 --eif-path server.eif --debug-mode
nitro-cli describe-enclaves
nitro-cli console --enclave-id $(nitro-cli describe-enclaves | jq -r ".[0].EnclaveID")

