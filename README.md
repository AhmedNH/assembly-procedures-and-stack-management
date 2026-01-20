# Assembly-Level Procedure & Stack Management

A **low-level systems project implemented in assembly** that demonstrates procedure calling conventions, stack-based execution, recursion, and register-level state management.

The project focuses on **explicit control of execution flow and memory**, mirroring how high-level language features are implemented at the machine level.

---

## 🔍 Overview

This repository implements a set of assembly programs that exercise core systems concepts:

* Procedure calls and returns
* Stack-based parameter passing and local storage
* Recursive execution
* Register allocation under constrained environments
* User input/output at the assembly level

All logic is implemented directly in assembly without reliance on compiler-managed abstractions.

---

## 🧠 Systems Design & Execution Model

### Procedure Calling Conventions

The project strictly follows standard calling conventions:

* Parameters passed via registers and/or stack
* Return values propagated through designated registers
* Caller–callee responsibilities explicitly enforced
* Stack frames created and torn down manually

This provides a clear understanding of how function calls are implemented below high-level languages.

---

### Stack Management

The stack is used explicitly to:

* Preserve register state across procedure calls
* Store return addresses
* Support nested and recursive calls
* Maintain execution correctness under control-flow changes

Stack discipline is enforced to ensure deterministic behavior and correct unwinding.

---

## 🔁 Recursive Computation

### Euclidean GCD Algorithm

A recursive implementation of the **Euclidean algorithm** computes the greatest common divisor of two positive integers:

* Base case and recursive case handled explicitly
* Stack frames used to preserve state across recursive calls
* Modulo operations performed at the instruction level

This demonstrates recursion without compiler support and highlights how high-level recursion maps to stack operations.

---

## 🧩 Register-Constrained Design

The project includes **non-stack-based procedure implementations**, requiring:

* Manual preservation of intermediate values
* Careful register allocation to avoid clobbering state
* Explicit tracking of additional registers used to replace stack storage

This models real-world constraints found in embedded systems and low-level performance-critical code.

---

## 🔄 Input / Output Handling

User interaction is handled entirely at the assembly level:

* Reading input values from standard input
* Parsing and validating numeric data
* Producing formatted output

This reinforces understanding of system calls and low-level I/O mechanisms.

---

## 🔬 Validation & Correctness

Correctness is ensured through:

* Strict adherence to calling conventions
* Controlled stack growth and cleanup
* Deterministic output for given inputs
* Explicit handling of edge cases (e.g., zero values in recursion)

These practices reflect defensive systems programming principles.

---

## 🛠️ Technologies & Concepts

* **Language:** Assembly
* **Execution Model:** Stack-based procedure calls
* **Core Concepts:**

  * Calling conventions
  * Stack frames
  * Recursion at the machine level
  * Register allocation
  * Low-level I/O
  * Control flow and state preservation

---

## 🚀 Why This Project Matters

This project demonstrates skills directly relevant to **FAANG-scale software engineering and systems roles**:

* Deep understanding of how high-level abstractions map to hardware
* Ability to reason about execution state and memory explicitly
* Comfort working under strict resource constraints
* Experience implementing recursion and procedures without compiler support
* Strong foundation for performance-critical and systems-level work

---

## 👤 Author

**Computer Science (Honors)**  
York University  
Third-Year Computer Science Honors Student
