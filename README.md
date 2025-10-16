# some Custom Zsh Features that I use.

## 1. Autosuggestions
- **Purpose:** Suggest commands from your history while typing.
- **Usage:** Start typing a command; suggested completion appears in lighter text. Press `→` to accept it.
- **Example:**
```zsh
git sta  # autosuggest completes to 'git status'
````

* **Tip:** Speeds up repetitive commands.

## 2. Syntax Highlighting

* **Purpose:** Highlights valid commands, errors, and important patterns in typed commands.
* **Usage:**

  * Correct commands appear green.
  * Mistyped or invalid commands are red.
* **Example:**

```zsh
la /projects   # highlighted to indicate invalid ls command
```

* **Tip:** Prevents mistakes before execution.

## 3. Prompt

* **Purpose:** Shows username and current directory.
* **Usage:** Visual context of your location in terminal, well i like it this way.
* **Example:**

```zsh
hamza ~/projects ❯
```

* **Tip:** Can be enhanced with Git branch info for development.

## 4. Aliases

* `ls` → clean single-column list.
* `lss` → shows sizes of files/folders sorted.
* **Example:**

```zsh
ls
lss
```

* **Tip:** Extend with `ll` or `la` for detailed listings.

## 5. Custom Functions

### mkcd

* **Purpose:** Create a directory and enter it immediately.
* **Example:**

```zsh
mkcd new_folder
```

* **Tip:** Saves time over `mkdir` + `cd`. :),  what, you dont have to use it, i like it.

### fvw

* **Purpose:** Fancy file view with syntax highlighting and gaps.
* **Example:**

```zsh
fvw README.md
```

* **Tip:** Uses `batcat` if installed for better display.

### findfile (`findf`)

* **Purpose:** Find a file by name, ignoring `node_modules`, hidden folders, and caches.
* **Example:**

```zsh
findf customedropdown.tsx
```

### finddir (`findd`)

* **Purpose:** Find directories by name under current project.
* **Example:**

```zsh
findd /components
```

### findenv

* **Purpose:** Locate all `.env` files, ignoring common skip directories.
* **Example:**
* **Tip:** Useful for auditing environment files or secrets.

```zsh
findenv
```
