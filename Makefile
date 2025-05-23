# Root Makefile for zkotp-7702-super

ELF_PATH=target/riscv-guest/methods/otp/riscv32im-risc0-zkvm-elf/release/otp.bin
CIRCUIT_DIR=circuit
API_DIR=apps/api
ELF_DEST=$(API_DIR)/bin/zkotp_verify_otp

.PHONY: init update build-circuit copy-elf run-api test

init:
	git submodule update --init --recursive

update:
	git submodule update --remote --merge

build-circuit:
	cd $(CIRCUIT_DIR) && cargo build --release

build-api:
	cd $(API_DIR) && cargo build

copy-elf:
	mkdir -p $(dir $(ELF_DEST))
	cp $(CIRCUIT_DIR)/$(ELF_PATH) $(ELF_DEST)

test-guest:
	cd $(CIRCUIT_DIR)/methods/guest && cargo test

run-circuit:
	cd $(CIRCUIT_DIR) && cargo run --release

run-api:
	cd $(API_DIR) && cargo run

test-api:
	cd $(API_DIR) && cargo test
