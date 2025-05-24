# Nilo C/C++ Project Template (nilo-cpp)

A flexible, cross-platform C/C++ project template that supports multiple build systems: **Autotools**, **CMake**, and **Meson**. This project provides a unified interface via a root `Makefile` that allows developers to build using their preferred build system with minimal configuration.

---

## ✨ Features

- 🔧 Supports **Autotools**, **CMake**, and **Meson**
- 🔥 Easily configurable project type:
  - Executable
  - Static Library
  - Shared Library
- 🏗️ Unified build interface with a simple `make` command
- 🗑️ Consistent clean operation across all build systems
- 📦 Out-of-source builds — artifacts go into the `/build` directory

---

## 📂 Project Structure

```

.
├── builders/
│   ├── autotools/
│   ├── cmake/
│   └── meson/
├── src/
│   └── ... (your C/C++ source files)
├── build/           # Build output goes here
├── Makefile         # Root Makefile (build system selector)
└── README.md

````

---

## 🚀 Getting Started

### 🔧 Requirements

- GNU Make
- Compiler: GCC, Clang, or MSVC (via CMake/Meson)
- Autotools (`autoconf`, `automake`, `libtool`)
- CMake (>= 3.10)
- Meson (>= 0.55) and Ninja

### 🔥 Quick Build Example

```bash
make           # Default uses Autotools
make cmake     # Build using CMake
make meson     # Build using Meson
````

Artifacts are installed into the `./build` directory.

---

## ⚙️ Configuration Options

You can override the following variables when invoking `make`:

| Variable          | Description                              | Default      |
| ----------------- | ---------------------------------------- | ------------ |
| `PROJECT_NAME`    | Project name                             | `myproject`  |
| `EXECUTABLE_NAME` | Name of the executable or library        | `myapp`      |
| `PROJECT_TYPE`    | `executable`, `static_lib`, `shared_lib` | `executable` |

### Example:

```bash
make cmake PROJECT_NAME=demo EXECUTABLE_NAME=demoapp PROJECT_TYPE=shared_lib
```

---

## 🏗️ Build System Usage Details

### ✅ Autotools

```bash
make autotools
```

* Generates `configure` script and Makefiles in `builders/autotools`
* Artifacts installed in `./build`

### ✅ CMake

```bash
make cmake
```

* Builds in `builders/cmake/build`
* Installs to `./build`

### ✅ Meson

```bash
make meson
```

* Builds in `builders/meson/builddir`
* Installs to `./build`

---

## 🧹 Clean Build Artifacts

```bash
make clean
```

This removes:

* `/build`
* All Autotools, CMake, and Meson intermediate files

---

## 🔍 Source Discovery

```bash
make sources
```

Lists all C/C++ source files detected under `src/`.

---

## 🤝 Contributing

Contributions are welcome! Feel free to fork the project, create a branch, and submit a pull request.

---

## 📜 License

[MIT License](LICENSE) — or specify your license here.

---

## ❤️ Acknowledgments

* Inspired by the need for cross-platform, builder-agnostic C/C++ development.

```

---
