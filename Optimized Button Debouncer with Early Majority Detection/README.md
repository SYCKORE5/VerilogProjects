# 🚀 Optimized Verilog Debouncer with Early Majority Detection

This project implements a **hardware debouncer** in Verilog using an **early-exit majority vote algorithm**. Instead of waiting a fixed time (like classic debounce circuits), this design dynamically detects when the input signal is stable and confidently high, enabling **faster and smarter button response**.

---

## 📌 Features

- ✅ Filters noisy mechanical button inputs
- ⏱ Faster than traditional debounce (no fixed delay)
- 🎯 Uses threshold-based statistical filtering
- 🧠 Intelligent early-exit logic
- 🔧 Parameterized: configurable sample window and threshold

---

## 🧠 How It Works

Instead of simply delaying for 1ms, this module:
1. Samples the input every clock cycle.
2. Counts the number of cycles the input was high (`1`).
3. As soon as the number of `1`s reaches a **threshold**, the signal is accepted.
4. If the window expires without enough `1`s, the signal is rejected.

This avoids unnecessary delays when the button is already clean.

---

## 🔧 Parameters

| Parameter   | Default     | Description                                   |
|-------------|-------------|-----------------------------------------------|
| `THRESHOLD` | `40000`     | Number of `1`s required to confirm a press    |
| `WINDOW`    | `50000`     | Max number of cycles to sample before fallback |

At 50 MHz, `50000` cycles = 1ms.

---

## 📦 Files

| File                     | Description                                  |
|--------------------------|----------------------------------------------|
| `debounce_fast_majority.v` | Main Verilog module                         |
| `tb_debounce_fast.v`       | Testbench for simulation                    |
| `debounce.vcd` *(generated)* | Waveform dump from testbench              |

---

## 🛠 Simulation Instructions

### Requirements:
- [Icarus Verilog](http://iverilog.icarus.com)
- [GTKWave](http://gtkwave.sourceforge.net)

### Steps:
```bash
# Compile the testbench and module
iverilog -o debounce_tb tb_debounce_fast.v debounce_fast_majority.v

# Run the simulation
vvp debounce_tb

# View waveform
gtkwave debounce.vcd
Built by Ahmed BOUHLAL, inspired by exploring smarter debounce algorithms for real-time systems
