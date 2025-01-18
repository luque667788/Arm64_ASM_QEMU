### Project Overview
# ARM64 Application Debugging Environment

This project sets up a development environment for debugging an ARM64 application using QEMU and GDB within a Docker container. The setup uses tmux to manage multiple terminal panes for running QEMU and GDB simultaneously. 

**Note:** This project focuses on running just the binaries on the emulator and not whole operating systems. This means that all the compilation is cross-compilation, and the debugging is remote debugging using GDB. The GDB and the compiler are not emulated inside QEMU; they just are run inside Docker due to portability reasons.

**Note 2:** Keep in mind that the program is running inside a Docker container. If you try to edit the original files, you will need to rebuild the entire container for the changes to take effect. To simplify this process, I recommend using the VS Code "Reopen in Container" feature. This allows you to edit files directly within the container using VS Code, eliminating the need for rebuilding.

**Note 3:** If you have different filenames for the C or assembly source files, you don't need to edit the Makefile. Simply update the env.mk file instead.


## Prerequisites

- Docker installed on your system.

## Setup and Usage

### Step 0: Clone the Repository

First, clone this repository to your desired working directory:

```sh
git clone https://github.com/luque667788/Arm64_ASM_QEMU
cd Arm64_ASM_QEMU
```
Run the subsequent commands from within the cloned project directory.

### Step 1: Build the Docker Image

Build the Docker image using the provided Dockerfile.

```sh
docker build -t my-debug-image .
```

### Step 2: Run the Docker Container

Run the Docker container with the necessary privileges and volume mounts.

```sh
docker run --rm -it my-debug-image
```

### Step 3: Build the Project

Inside the Docker container, build the project using `make`.

```sh
make
```

### Step 4: Debug the Project

Start the debugging session using `make debug`.

```sh
make debug
```

This command will:

- Start a tmux session with two panes.
- Run QEMU in the left pane.
- Run GDB in the right pane.
- After setting the break point instead of typing `run` to run the program just type `continue` !
- HINT: if you want you can already change the script run_debug.sh, so that is already sets the break point and continues for you so you don't need to type that every time if you want to.

### Step 5: Interact with the Terminals

To interact with both QEMU and GDB, you need to switch between the tmux panes.

- Switch to the next pane: `Ctrl-b` followed by `o`
- Switch to the previous pane: `Ctrl-b` followed by `;`
- Switch to a specific pane: `Ctrl-b` followed by the arrow keys (←, →, ↑, ↓)

### Step 6: Provide Input to QEMU

- Switch to the QEMU pane using `Ctrl-b` followed by `o`.
- Type the required input for your application.

### Step 7: Continue Debugging in GDB

- Switch back to the GDB pane using `Ctrl-b` followed by `o`.
- Continue your debugging session in GDB.

### Step 8: Quit GDB

- In the GDB pane, type `quit` to exit GDB.
- You will need to exit the 2 tmux session manually on the next step.

### Step 9: Exit the tmux Session

- Exit the first terminal pane by typing `exit`.
- Exit the second terminal pane by typing `exit`.

After exiting both panes, you should return to the base Docker terminal.

### Step 10: Clean the Project

To clean the project, use `make clean`.

```sh
make clean
```

This command will remove the compiled files and binaries.

## License

You are free to use, modify, and distribute this project for any purpose, as long as you:

    Credit me, Luiz Mendonça, as the original creator.
    Clearly mention that this project was used in your work (a link to this repository would be appreciated).

No warranties or liability are provided. Use at your own risk!
