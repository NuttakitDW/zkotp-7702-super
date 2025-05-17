# zkotp-7702-super Monorepo

This is the **monorepo** for the zkOTP Wallet (EIP-7702) project, containing the following components:

- `contracts/` – zkOTP EIP-7702 smart contracts
- `circuit/` – RISC Zero circuits to verify OTPs
- `apps/api/` – Backend API to generate proofs and interact with the chain
- `apps/frontend/` – Frontend app for wallet interface
- `sdk/` – Client-side SDK for interacting with the wallet

---

## 🛠 Setup Instructions

### 1. Clone the Monorepo

```bash
git clone https://github.com/NuttakitDW/zkotp-7702-super.git
cd zkotp-7702-super
```

### 2. Initialize Submodules

```bash
make init
```

This will initialize and checkout all required submodules.

---

## 🔄 Pull Updates

To fetch the latest commits from all submodules:

```bash
make update
```

---

## ⚙️ Build the Circuit

This will build the RISC Zero guest binary (ELF):

```bash
make build-circuit
```

---

## 📦 Copy ELF to API

After building the circuit, copy the compiled ELF binary to the API:

```bash
make copy-elf
```

This makes the ELF available for proof generation inside the API service.

---

## 🚀 Run the API

Run the backend server:

```bash
make run-api
```

> Ensure you’ve already copied the ELF binary using `make copy-elf`.

---

## 🧪 Run Guest Circuit Unit Tests

To run unit tests inside the guest logic:

```bash
make test-guest
```

---

## 📁 File Layout

```
zkotp-7702-super/
├── Makefile
├── contracts/           # zkOTP contracts
├── circuit/             # RISC Zero circuit
│   └── methods/
│       └── otp/         # otp logic
│       └── guest/       # guest test logic
├── apps/
│   ├── api/             # API server
│   └── frontend/        # Wallet frontend
└── sdk/                 # JS SDK
```

---

## 📝 Notes

- ELF binary is expected at:
  ```
  circuit/target/riscv-guest/methods/otp/riscv32im-risc0-zkvm-elf/release/otp.bin
  ```

- It will be copied to:
  ```
  apps/api/bin/zkotp_verify_otp
  ```

Make sure to rebuild and re-copy any time the circuit is changed.


