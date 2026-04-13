# 🔷 Verilog Practice Repository

## 📌 Overview

This repository contains my **Verilog RTL design and verification practice** as part of my **Maven Silicon learning journey**.

It includes multiple labs and assignments covering:

* Combinational circuits
* Sequential circuits
* RTL design
* Testbench development
* Simulation and verification

---

## 📂 Repository Structure

```
Verilog_labs/
│
├── lab1/        # Basic combinational circuits
├── lab2/        # Operators and ALU
├── lab3/        # Encoder, Decoder, MUX
├── lab4/        # Flip-Flops and Counters
├── lab5/        # Memory (RAM)
├── lab6/        # Sequence detector
│
└── assignment/  # Practice assignments
```

Each folder contains:

* `*.v` → RTL design
* `*_tb.v` → Testbench
* `ncsim.log` → Simulation output (verification)

---

## ⚙️ Tools Used

* Cadence Xcelium / Incisive (`ncsim`)
* ModelSim / QuestaSim
* Quartus (basic synthesis understanding)

---

## ▶️ How to Run (Cadence)

```
ncvlog design.v testbench.v
ncelab testbench
ncsim testbench > ncsim.log
```

---

## 📊 Verification Approach

* Functional verification using testbench
* Checking:

  * Reset behavior
  * Input-output correctness
  * Edge cases
  * Sequential transitions

---

## 📁 Included

✔ RTL design files
✔ Testbenches
✔ Important simulation log (`ncsim.log`)

---

## 🚫 Not Included

❌ Tool-generated files (`INCA_libs`, `.simvision`, `waves.shm`)
❌ Large synthesis data

---

## 🎯 Objective

To build strong fundamentals in:

* RTL Design
* Verilog Coding
* Simulation & Debugging
  and progress towards becoming a **VLSI Design & Verification Engineer**.

