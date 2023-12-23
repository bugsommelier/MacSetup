#!/bin/bash

cat << "EOF"
┌───────────────────────────────────────────┐
│           ___      _                      │
│          / __| ___| |_ _  _ _ __          │
│          \__ \/ -_)  _| || | '_ \         │
│          |___/\___|\__|\_,_| .__/         │
│                            |_|            │
└───────────────────────────────────────────┘
EOF

echo "Starting setup of your Mac..."

# Check for Xcode Command Line Tools and install if not found
echo "Checking for Xcode Command Line Tools..."
if ! xcode-select -p &> /dev/null; then
    echo "Xcode Command Line Tools not found. Installing..."
    xcode-select --install
else
    echo "Xcode Command Line Tools already installed."
fi

echo "Proceeding with Homebrew installation and setup..."
cat << "EOF"
┌─────────────────────────────────────────┐
│  _  _               _                   │
│ | || |___ _ __  ___| |__ _ _ _____ __ __│
│ | __ / _ \ '  \/ -_) '_ \ '_/ -_) V  V /│
│ |_||_\___/_|_|_\___|_.__/_| \___|\_/\_/ │
│                                         │
└─────────────────────────────────────────┘
EOF
# Homebrew installation
if ! command -v brew &> /dev/null; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "Homebrew is already installed."
fi

# Brew formulae installation
BREW_FORMULAE=(
    curl ffmpeg flac gcc gdb git python node npm
    opencv openjdk openjpeg r ruby rust rustup-init
    tesseract wget
)

cat << "EOF"
┌─────────────────────────────────────────┐
│   ___                       _           │
│  | __|__ _ _ _  _ _ __ _  _| |__ _ ___  │
│  | _/ _ \ '_| || | '  \ || | / _` / -_) │
│  |_|\___/_|  \_,_|_|_|_\_,_|_\__,_\___| │
│                                         │
└─────────────────────────────────────────┘
EOF

echo "Installing Homebrew formulae..."
for formula in "${BREW_FORMULAE[@]}"; do
    if ! brew list "$formula" &> /dev/null; then
        brew install "$formula"
    else
        echo "$formula is already installed."
    fi
done

cat << "EOF"
┌───────────────────────────────────────────┐
│             ___         _                 │
│            / __|__ _ __| |__ ___          │
│           | (__/ _` (_-< / /(_-<          │
│            \___\__,_/__/_\_\/__/          │
│                                           │
└───────────────────────────────────────────┘
EOF

# Brew cask installation
BREW_CASKS=(
    github ghidra google-chrome mactex-no-gui
    monodraw obsidian the-unarchiver
    tradingview transmission typora visual-studio
    visual-studio-code warp
)

echo "Installing Homebrew casks..."
for cask in "${BREW_CASKS[@]}"; do
    if ! brew list --cask "$cask" &> /dev/null; then
        brew install --cask "$cask"
    else
        echo "$cask is already installed."
    fi
done

cat << "EOF"
┌──────────────────────────────────────────┐
│        ___      _   _                    │
│       | _ \_  _| |_| |_  ___ _ _         │
│       |  _/ || |  _| ' \/ _ \ ' \        │
│       |_|  \_, |\__|_||_\___/_||_|       │
│            |__/                          │
│     ___         _                        │
│    | _ \__ _ __| |____ _ __ _ ___ ___    │
│    |  _/ _` / _| / / _` / _` / -_|_-<    │
│    |_| \__,_\__|_\_\__,_\__, \___/__/    │
│                         |___/            │
└──────────────────────────────────────────┘
EOF

# Python packages installation
PYTHON_PACKAGES=(
    numpy pandas matplotlib seaborn scikit-learn
    tensorflow keras opencv-python opencv-contrib-python
    pytesseract tkinter pyperclip pyautogui pillow
    cairosvg xgboost yfinance
)

echo "Installing Python packages..."
for package in "${PYTHON_PACKAGES[@]}"; do
    if ! pip3 list --format=columns | grep "$package" &> /dev/null; then
        pip3 install "$package"
    else
        echo "$package is already installed."
    fi
done

cat << "EOF"
┌─────────────────────────────────────────┐
│     ___ _      _    _           _ _     │
│    | __(_)_ _ (_)__| |_  ___ __| | |    │
│    | _|| | ' \| (_-< ' \/ -_) _` |_|    │
│    |_| |_|_||_|_/__/_||_\___\__,_(_)    │
│                                         │
└─────────────────────────────────────────┘
EOF
