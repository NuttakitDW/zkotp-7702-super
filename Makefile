# Root Makefile for zkotp-7702-super

ELF_PATH=target/riscv32im-risc0-zkvm-elf/release/your_method
CIRCUIT_DIR=circuit
API_DIR=apps/api
ELF_DEST=$(API_DIR)/bin/your_method

.PHONY: init update build-circuit copy-elf run-api test

init:
	git submodule update --init --recursive

update:
	git submodule update --remote --merge

build-circuit:
	cd $(CIRCUIT_DIR) && cargo build --release

copy-elf:
	cp $(CIRCUIT_DIR)/$(ELF_PATH) $(ELF_DEST)

run-api:
	cd $(API_DIR) && cargo run

test:
	cd $(CIRCUIT_DIR) && cargo test
