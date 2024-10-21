---

# **Beginner's Guide to Shell Scripting**

This is a **full beginner's course** on **shell scripting** that will take you from the very basics to writing simple scripts and connecting them in Unix-based systems.

---

## **Table of Contents**

1. [Introduction to the Shell](#1-introduction-to-the-shell)
   - [What is a Shell?](#what-is-a-shell)
   - [Types of Shells](#types-of-shells)
   - [Navigating the Terminal](#navigating-the-terminal)
   - [Basic Commands](#basic-commands)
2. [Writing Your First Shell Script](#2-writing-your-first-shell-script)
   - [What is a Shell Script?](#what-is-a-shell-script)
   - [How to Create and Run a Script](#how-to-create-and-run-a-script)
   - [Making Scripts Executable](#making-scripts-executable)
   - [Comments and Documentation](#comments-and-documentation)
3. [Variables in Shell](#3-variables-in-shell)
   - [Defining Variables](#defining-variables)
   - [Using Variables](#using-variables)
   - [Special Variables](#special-variables)
   - [Quoting](#quoting)
4. [Conditionals and Control Flow](#4-conditionals-and-control-flow)
   - [`if` Statements](#if-statements)
   - [Using Conditions (`test`, `[ ]`, `[[ ]]`)](#using-conditions-test)
   - [`case` Statements](#case-statements)
5. [Loops](#5-loops)
   - [`for` Loops](#for-loops)
   - [`while` Loops](#while-loops)
   - [`until` Loops](#until-loops)
   - [Breaking Out of Loops](#breaking-out-of-loops)
6. [Functions in Shell Scripts](#6-functions-in-shell-scripts)
   - [Defining Functions](#defining-functions)
   - [Calling Functions](#calling-functions)
   - [Passing Arguments to Functions](#passing-arguments-to-functions)
7. [Input and Output](#7-input-and-output)
   - [Echoing Text](#echoing-text)
   - [Reading User Input](#reading-user-input)
   - [Redirecting Input and Output](#redirecting-input-and-output)
   - [Using `cat`, `head`, `tail`](#using-cat-head-tail)
8. [Working with Files](#8-working-with-files)
   - [Creating, Moving, and Deleting Files](#creating-moving-and-deleting-files)
   - [File Permissions and Ownership](#file-permissions-and-ownership)
   - [Using Wildcards (`*`, `?`)](#using-wildcards)
   - [File Tests (`-f`, `-d`, etc.)](#file-tests)
9. [Working with Strings and Numbers](#9-working-with-strings-and-numbers)
   - [String Manipulation](#string-manipulation)
   - [Arithmetic in Shell](#arithmetic-in-shell)
10. [Advanced Scripting Techniques](#10-advanced-scripting-techniques)
    - [`sed` and `awk` for Text Manipulation](#sed-and-awk-for-text-manipulation)
    - [Using Regular Expressions in Shell Scripts](#using-regular-expressions-in-shell-scripts)
    - [Scheduling Tasks with `cron`](#scheduling-tasks-with-cron)
    - [Debugging Shell Scripts](#debugging-shell-scripts)
11. [Additional Topics](#11-additional-topics)
    - [Error Handling and Exit Status](#error-handling-and-exit-status)
    - [Shell Script Arguments Parsing](#shell-script-arguments-parsing)
    - [Environment Variables](#environment-variables)
    - [Trap and Signal Handling](#trap-and-signal-handling)

---

## **1. Introduction to the Shell**

### **What is a Shell?**

A **shell** is a command-line interpreter that allows users to interact with the operating system. It processes user commands and requests the operating system to perform the specified tasks.

### **Types of Shells**

| Shell | Description |
|-------|-------------|
| **Bash** | Bourne Again Shell - Default on many Unix-based systems. |
| **Zsh**  | Z Shell - Offers improvements over Bash. |
| **Fish** | Friendly Interactive Shell - User-friendly features. |
| **Ksh**  | Korn Shell - Combines features of Bourne and C Shells. |

To check which shell you're using, type:

```bash
echo $SHELL
```

### **Navigating the Terminal**

Basic navigation commands:

| Command | Description |
|---------|-------------|
| `pwd`   | Show current directory. |
| `cd`    | Change directory. |
| `ls`    | List files in a directory. |

### **Basic Commands**

#### **Example Script: Basic Commands**

```bash
#!/bin/bash

# Display current directory
echo "Current Directory: $(pwd)"

# List files
echo "Files in Directory:"
ls
```

---

## **2. Writing Your First Shell Script**

### **What is a Shell Script?**

A **shell script** is a text file containing a sequence of commands for the shell to execute.

### **How to Create and Run a Script**

#### **Example Script: Hello World**

```bash
#!/bin/bash
echo "Hello, World!"
```

**Steps:**

1. **Create the script file:**

   ```bash
   nano hello_world.sh
   ```

2. **Add the content above and save the file.**

3. **Make the script executable:**

   ```bash
   chmod +x hello_world.sh
   ```

4. **Run the script:**

   ```bash
   ./hello_world.sh
   ```

### **Comments and Documentation**

Use `#` for comments.

```bash
#!/bin/bash

# This script prints Hello, World!
echo "Hello, World!"
```

---

## **3. Variables in Shell**

### **Defining Variables**

#### **Example Script: Defining Variables**

```bash
#!/bin/bash

NAME="Adamo"
AGE=21
```

### **Using Variables**

```bash
echo "My name is $NAME and I am $AGE years old."
```

#### **Complete Script: Using Variables**

```bash
#!/bin/bash

NAME="Adamo"
AGE=21

echo "My name is $NAME and I am $AGE years old."
```

### **Special Variables**

| Variable | Description |
|----------|-------------|
| `$0`     | The name of the script. |
| `$1` - `$9` | The first to ninth arguments to the script. |
| `$@`     | All the arguments. |
| `$#`     | Number of arguments. |
| `$$`     | Process ID of the script. |
| `$?`     | Exit status of the last command. |

#### **Example Script: Special Variables**

```bash
#!/bin/bash

echo "Script name: $0"
echo "First argument: $1"
echo "All arguments: $@"
echo "Number of arguments: $#"
```

### **Quoting**

| Quote Type | Description |
|------------|-------------|
| `' '` (Single Quotes) | Prevents variable expansion. |
| `" "` (Double Quotes) | Allows variable expansion. |
| `` ` ` `` (Backticks) | Executes commands inside. |

#### **Example Script: Quoting**

```bash
#!/bin/bash

NAME="Adamo"

echo 'Hello $NAME'    # Outputs: Hello $NAME
echo "Hello $NAME"    # Outputs: Hello Adamo

DATE=`date`
echo "Today is $DATE"
```

---

## **4. Conditionals and Control Flow**

### **`if` Statements**

#### **Syntax:**

```bash
if [ condition ]; then
  # commands
fi
```

#### **Example Script: Simple `if` Statement**

```bash
#!/bin/bash

NAME="Adamo"

if [ "$NAME" == "Adamo" ]; then
  echo "Hello Adamo!"
fi
```

### **`else` and `elif` Statements**

#### **Syntax:**

```bash
if [ condition ]; then
  # commands
elif [ condition ]; then
  # commands
else
  # commands
fi
```

#### **Example Script: `if-elif-else`**

```bash
#!/bin/bash

NAME=$1  # Get the first argument

if [ "$NAME" == "Adamo" ]; then
  echo "Hello Adamo!"
elif [ "$NAME" == "Sofia" ]; then
  echo "Hello Sofia!"
else
  echo "Hello Stranger!"
fi
```

### **Using Conditions (`test`, `[ ]`, `[[ ]]`)**


`test`, `[ ]`, and `[[ ]]` are used to evaluate conditions in shell scripts, but they have some differences:

#### **1. `test` and `[ ]`**

- `test` is a command that evaluates conditions. It can also be written using the `[ ]` shorthand.
- Both `test` and `[ ]` support basic comparisons and are POSIX-compliant, meaning they work on all Unix-like systems.
- Example:

```bash
if test "$NUM1" -eq "$

NUM2"; then
  echo "Numbers are equal"
fi

# Equivalent to
if [ "$NUM1" -eq "$NUM2" ]; then
  echo "Numbers are equal"
fi
```

#### **2. `[[ ]]`**

- `[[ ]]` is an enhanced version of `[ ]` with additional functionality, such as pattern matching and better support for complex expressions.
- It is **bash-specific** (not POSIX), meaning it won't work on all shells, but it is more powerful.
- Example:

```bash
if [[ "$STRING" =~ ^[a-z]+$ ]]; then
  echo "String is lowercase"
fi
```

#### **3. Key Differences:**

- `[[ ]]` allows for more complex conditionals and doesn’t require escaping certain characters, while `[ ]` is more limited and requires careful quoting and escaping.
- `[[ ]]` is considered safer when using string comparisons because it prevents many unexpected issues caused by shell expansions.

#### **Example Script: Comparing Numbers and Strings**

```bash
#!/bin/bash

NUM1=10
NUM2=20

if [ "$NUM1" -lt "$NUM2" ]; then
  echo "$NUM1 is less than $NUM2"
fi

STR="hello"

if [[ "$STR" =~ ^[a-z]+$ ]]; then
  echo "$STR contains only lowercase letters"
fi
```


#### **Comparison Operators:**

| Operator | Description | For Numbers | For Strings |
|----------|-------------|-------------|-------------|
| `-eq`    | Equal            | ✔️ |  |
| `-ne`    | Not equal        | ✔️ |  |
| `-gt`    | Greater than     | ✔️ |  |
| `-lt`    | Less than        | ✔️ |  |
| `-ge`    | Greater or equal | ✔️ |  |
| `-le`    | Less or equal    | ✔️ |  |
| `=`      | Equal            |  | ✔️ |
| `!=`     | Not equal        |  | ✔️ |
| `-z`     | String is empty  |  | ✔️ |
| `-n`     | String is not empty |  | ✔️ |

#### **Example Script: Using Conditions**

```bash
#!/bin/bash

NUM1=10
NUM2=20

if [ $NUM1 -lt $NUM2 ]; then
  echo "$NUM1 is less than $NUM2"
fi

STR="Hello"

if [ -n "$STR" ]; then
  echo "String is not empty"
fi
```

### **`case` Statements**

#### **Syntax:**

```bash
case variable in
  pattern1)
    # commands
    ;;
  pattern2)
    # commands
    ;;
  *)
    # default commands
    ;;
esac
```

#### **Example Script: `case` Statement**

```bash
#!/bin/bash

COLOR=$1  # Get the color from the first argument

case $COLOR in
  "red")
    echo "The color is red."
    ;;
  "blue")
    echo "The color is blue."
    ;;
  "green")
    echo "The color is green."
    ;;
  *)
    echo "Unknown color."
    ;;
esac
```

---

## **5. Loops**

### **`for` Loops**

#### **Syntax:**

```bash
for variable in list; do
  # commands
done
```

#### **Example Script: `for` Loop**

```bash
#!/bin/bash

for i in {1..5}; do
  echo "Number: $i"
done
```

### **`while` Loops**

#### **Syntax:**

```bash
while [ condition ]; do
  # commands
done
```

#### **Example Script: `while` Loop**

```bash
#!/bin/bash

i=1
while [ $i -le 5 ]; do
  echo "Number: $i"
  i=$((i + 1))
done
```

### **`until` Loops**

#### **Syntax:**

```bash
until [ condition ]; do
  # commands
done
```

#### **Example Script: `until` Loop**

```bash
#!/bin/bash

i=1
until [ $i -gt 5 ]; do
  echo "Number: $i"
  i=$((i + 1))
done
```

### **Breaking Out of Loops**

Use `break` and `continue` to control loop execution.

#### **Example Script: Break and Continue**

```bash
#!/bin/bash

for i in {1..10}; do
  if [ $i -eq 5 ]; then
    echo "Skipping number 5"
    continue
  fi
  if [ $i -gt 8 ]; then
    echo "Breaking at number $i"
    break
  fi
  echo "Number: $i"
done
```

---

## **6. Functions in Shell Scripts**

### **Defining Functions**

#### **Syntax:**

```bash
function_name() {
  # commands
}
```

#### **Example Script: Defining a Function**

```bash
#!/bin/bash

greet() {
  echo "Hello, $1!"
}
```

### **Calling Functions**

```bash
greet "Adamo"
```

### **Passing Arguments to Functions**

#### **Complete Script: Functions with Arguments**

```bash
#!/bin/bash

greet() {
  echo "Hello, $1!"
}

greet "Adamo"
greet "Sofia"
```

---

## **7. Input and Output**

### **Echoing Text**

```bash
#!/bin/bash

echo "This is a message."
```

### **Reading User Input**

#### **Example Script: Reading Input**

```bash
#!/bin/bash

read -p "Enter your name: " NAME
echo "Hello, $NAME!"
```

### **Redirecting Input and Output**

| Symbol | Description |
|--------|-------------|
| `>`    | Redirect output to a file (overwrite). |
| `>>`   | Redirect output to a file (append). |
| `<`    | Redirect input from a file. |
| `2>`   | Redirect stderr to a file. |
| `&>`   | Redirect both stdout and stderr to a file. |

#### **Example Script: Redirecting Output**

```bash
#!/bin/bash

ls -l > files_list.txt
echo "Directory listing saved to files_list.txt"
```

---

## **8. Working with Files**

### **Creating, Moving, and Deleting Files**

#### **Example Script: File Operations**

```bash
#!/bin/bash

# Create a file
touch myfile.txt

# Move the file
mv myfile.txt mynewfile.txt

# Copy the file
cp mynewfile.txt copy_of_mynewfile.txt

# Delete the files
rm mynewfile.txt copy_of_mynewfile.txt
```

### **File Permissions and Ownership**

Change file permissions using `chmod`.

#### **Example Script: Changing Permissions**

```bash
#!/bin/bash

# Give read, write, and execute permissions to the user
chmod u+rwx script.sh

# Remove write permission from group and others
chmod go-w script.sh
```

### **Using Wildcards (`*`, `?`)**

- `*` matches any number of characters.
- `?` matches a single character.

#### **Example Script: Using Wildcards**

```bash
#!/bin/bash

# List all .txt files
ls *.txt

# List files starting with 'file' and any single character
ls file?.txt
```

### **File Tests**

| Test Expression | Description |
|-----------------|-------------|
| `-e FILE`       | File exists. |
| `-f FILE`       | File exists and is a regular file. |
| `-d DIRECTORY`  | Directory exists. |
| `-s FILE`       | File is not empty. |
| `-r FILE`       | File is readable. |
| `-w FILE`       | File is writable. |
| `-x FILE`       | File is executable. |

#### **Example Script: File Tests**

```bash
#!/bin/bash

FILE="testfile.txt"

if [ -e "$FILE" ]; then
  echo "$FILE exists."
else
  echo "$FILE does not exist."
fi

if [ -f "$FILE" ]; then
  echo "$FILE is a regular file."
fi

if [ -s "$FILE" ]; then
  echo "$FILE is not empty."
fi
```

---

## **9. Working with Strings and Numbers**

### **String Manipulation**

#### **Extract Substring**

```bash
#!/bin/bash

STR="Hello World"
SUBSTR=${STR:0:5}
echo "Substring: $SUBSTR"  # Outputs: Hello
```

#### **String Length**

```bash
#!/bin/bash

STR="Hello"
LENGTH=${#STR}
echo "Length: $LENGTH"  # Outputs: 5
```

### **Arithmetic in Shell**

Use `$(( expression ))` for arithmetic operations.

#### **Example Script: Arithmetic Operations**

```bash
#!/bin/bash

NUM1=10
NUM2=5

SUM=$((NUM1 + NUM2))
DIFF=$((NUM1 - NUM2))
PROD=$((NUM1 * NUM2))
QUOT=$((NUM1 / NUM2))
MOD=$((NUM1 % NUM2))

echo "Sum: $SUM"
echo "Difference: $DIFF"
echo "Product: $PROD"
echo "Quotient: $QUOT"
echo "Remainder: $MOD"
```

---

## **10. Advanced Scripting Techniques**

### **`sed` and `awk` for Text Manipulation**

#### **Using `sed` for Search and Replace**

```bash
#!/bin/bash

# Replace 'old' with 'new' in file.txt
sed 's/old/new/g' file.txt > newfile.txt
```

#### **Using `awk` for Field Extraction**

```bash
#!/bin/bash

# Print the first column of a file
awk '{print $1}' file.txt
```

### **Using Regular Expressions in Shell Scripts**

#### **Example Script: Validating Email with Regex**

```bash
#!/bin/bash

read -p "Enter your email: " EMAIL

if [[ $EMAIL =~ ^[a-zA-Z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$ ]]; then
  echo "Valid email."
else
  echo "Invalid email."
fi
```

### **Scheduling Tasks with `cron`**

To schedule tasks, edit the crontab file.

#### **Example: Running a Script Every Day at 2 AM**

1. Open the crontab editor:

   ```bash
   crontab -e
   ```

2. Add the following line:

   ```bash
   0 2 * * * /path/to/script.sh
   ```

### **Debugging Shell Scripts**

Use `-x` option to trace script execution.

#### **Example: Debugging a Script**

```bash
bash -x script.sh
```

---

## **11. Additional Topics**

### **Error Handling and Exit Status**

Every command returns an exit status (0 for success, non-zero for failure).

#### **Example Script: Checking Exit Status**

```bash
#!/bin/bash

mkdir new_directory

if [ $? -eq 0 ]; then
  echo "Directory created successfully."
else
  echo "Failed to create directory."
fi
```

Alternatively, use `set -e` to exit the script if any command fails.

### **Shell Script Arguments Parsing**

Use `getopts` for parsing options.

#### **Example Script: Using `getopts`**

```bash
#!/bin/bash

while getopts ":u:p:" opt; do
  case $opt in
    u) USERNAME="$OPTARG"
    ;;
    p) PASSWORD="$OPTARG"
    ;;
    \?) echo "Invalid option -$OPTARG" >&2
    ;;
  esac
done

echo "Username: $USERNAME"
echo "Password: $PASSWORD"
```

Run the script:

```bash
./script.sh -u "adamo" -p "password123"
```

### **Environment Variables**

Environment variables are available to all child processes.

#### **Example Script: Accessing Environment Variables**

```bash
#!/bin/bash

echo "Home Directory: $HOME"
echo "Current User: $USER"
echo "Path Variable: $PATH"
```

### **Trap and Signal Handling**

Handle signals using `trap`.

#### **Example Script: Handling SIGINT**

```bash
#!/bin/bash

trap "echo 'Script interrupted! Exiting...'; exit 1" SIGINT

echo "Press Ctrl+C to interrupt."

while true; do
  sleep 1
done
```

---

## **Conclusion**

This guide covers the fundamentals of shell scripting, providing examples for each topic to help you practice and understand how shell scripts work. By working through these examples, you'll gain a solid foundation in shell scripting and be prepared to tackle more complex scripting tasks.

---

**Happy Scripting!**

# **Additional Resources**

- **Bash Reference Manual**: https://www.gnu.org/software/bash/manual/bash.html
- **Advanced Bash-Scripting Guide**: http://tldp.org/LDP/abs/html/

---