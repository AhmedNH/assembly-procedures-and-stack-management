# Assembly Programming with I/O, Stack, Procedures, and Recursion

Three RISC-V style assembly programs covering console I/O, recursive procedures with stack management, and string manipulation using character-level memory operations.

---

## Programs

### `dex1.asm` — Name Greeter

Prompts the user for their name and prints a personalised greeting.

**What it does:**
1. Prints `"What is your name?"`
2. Reads a string from input into `x28`
3. Prints `"Hello "`, then the entered name, then `"!"`

**Concepts:** `ecall` for string print (`4`) and string input (`9`), string constants with `DC`.

---

### `dex2.asm` — Recursive GCD

Computes the Greatest Common Divisor of two integers using recursive Euclidean algorithm with proper stack discipline.

**What it does:**
1. Prompts for two integers `a` and `b`
2. Calls `gcd(a, b)` recursively using `jal` and `jalr`
3. Prints `"GCD of a and b:"` followed by the result

**Recursive logic:**
```
gcd(a, b):
    if a == 0: return b
    return gcd(b % a, a)
```

**Stack frame per call** — three values pushed and popped around each recursive call:

| Slot | Value | Offset |
|---|---|---|
| `x1` | Return address | `-8(sp)` |
| `a1` | Argument b | `-16(sp)` |
| `a0` | Argument a | `-24(sp)` |

**Concepts:** recursive procedure calls, manual stack management with `sd`/`ld`, `rem` instruction, `jal`/`jalr` for call and return.

---

### `dex3.asm` — String Delete / Insert

Asks the user to choose between deleting or inserting a character in a string, then performs the operation in-place at the byte level.

**Input:** type `0` to delete, `1` to insert.

#### Delete (`delch`)
Removes characters starting at a given address by shifting all following characters left one position until the null terminator. Calls `delch1` once per character to be deleted.

```
Before: "sampled text"
delete 6 chars from index 6 --> "text"
```

#### Insert (`insch`)
Inserts a source string (`str2 = "new"`) into a target string (`str1`) at a given position by copying the source characters into the target byte-by-byte using `insch1`.

```
Before: "sampled text"
insert "new" at position 7 --> "sampleднew text"
```

**Callee-saved registers** — both `delch` and `insch` save and restore `x1`, `s0`, and `s1` to static memory (`c`) rather than using the stack:

```asm
sd  x1,   c(x0)      # save return address
sd  s0,   c+8(x0)    # save s0
sd  s1,   c+16(x0)   # save s1
...
ld  x1,   c(x0)      # restore before return
```

**Concepts:** byte-level memory access with `lb`/`sb`, procedure calls with callee-saved register conventions, in-place string mutation, branch-based loops.

---

## Key Instructions Used

| Instruction | Description |
|---|---|
| `ecall x, y, 4` | Print string at address `y` |
| `ecall x, y, 5` | Read integer into `x` |
| `ecall x, y, 9` | Read string into `x` |
| `ebreak` | Breakpoint / halt |
| `jal x1, label` | Jump and link (call procedure) |
| `jalr x0, 0(x1)` | Jump and link register (return) |
| `sd` / `ld` | Store / load double-word (64-bit) |
| `sb` / `lb` | Store / load byte |
| `rem` | Remainder (modulo) |
| `DC` | Define characters (string constant) |
| `DM` | Define memory (reserve double-words) |

---

## Project Structure

```
Assembly Programming with IO, Stack, Procedures, and Recursion/
├── dex1.asm    # Console I/O: name greeter
├── dex2.asm    # Recursive GCD with stack management
└── dex3.asm    # String delete and insert procedures
```
