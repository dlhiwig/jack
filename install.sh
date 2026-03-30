#!/usr/bin/env bash
set -euo pipefail

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

WORKSPACE_DIR="$HOME/.openclaw/workspace"
MEMORY_DIR="$WORKSPACE_DIR/memory"
CONFIG_FILE="$HOME/.openclaw/openclaw.json"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo -e "${BLUE}🦅 Jack — OpenClaw Agent Installer${NC}"
echo ""

# --- Step 1: Check Node.js ---
echo -e "${BLUE}[1/7]${NC} Checking Node.js..."
if ! command -v node &> /dev/null; then
    echo -e "${RED}✗ Node.js is not installed.${NC}"
    echo "  Install Node.js 18+ from https://nodejs.org/"
    exit 1
fi

NODE_VERSION=$(node -v | sed 's/v//' | cut -d. -f1)
if [ "$NODE_VERSION" -lt 18 ]; then
    echo -e "${RED}✗ Node.js version is $(node -v). Need 18+.${NC}"
    echo "  Update Node.js from https://nodejs.org/"
    exit 1
fi
echo -e "${GREEN}✓ Node.js $(node -v)${NC}"

# --- Step 2: Check/Install OpenClaw ---
echo -e "${BLUE}[2/7]${NC} Checking OpenClaw..."
if npm list -g openclaw &> /dev/null; then
    echo -e "${GREEN}✓ OpenClaw is installed${NC}"
else
    echo -e "${YELLOW}→ Installing OpenClaw globally...${NC}"
    npm install -g openclaw
    if [ $? -eq 0 ]; then
        echo -e "${GREEN}✓ OpenClaw installed${NC}"
    else
        echo -e "${RED}✗ Failed to install OpenClaw. Try: sudo npm install -g openclaw${NC}"
        exit 1
    fi
fi

# --- Step 3: Create workspace directory ---
echo -e "${BLUE}[3/7]${NC} Setting up workspace..."
mkdir -p "$WORKSPACE_DIR"
mkdir -p "$MEMORY_DIR"
echo -e "${GREEN}✓ Workspace directory ready: $WORKSPACE_DIR${NC}"

# --- Step 4: Copy workspace files ---
echo -e "${BLUE}[4/7]${NC} Copying workspace files..."

WORKSPACE_FILES=(
    "SOUL.md"
    "IDENTITY.md"
    "USER.md"
    "AGENTS.md"
    "HEARTBEAT.md"
    "TOOLS.md"
    "MEMORY.md"
)

for file in "${WORKSPACE_FILES[@]}"; do
    if [ -f "$SCRIPT_DIR/$file" ]; then
        if [ -f "$WORKSPACE_DIR/$file" ]; then
            echo -e "${YELLOW}  ⊘ $file already exists — skipping (won't overwrite your changes)${NC}"
        else
            cp "$SCRIPT_DIR/$file" "$WORKSPACE_DIR/$file"
            echo -e "${GREEN}  ✓ $file${NC}"
        fi
    else
        echo -e "${YELLOW}  ⚠ $file not found in repo — skipping${NC}"
    fi
done

# --- Step 5: Create blank memory file if needed ---
echo -e "${BLUE}[5/7]${NC} Checking memory directory..."
if [ ! -f "$MEMORY_DIR/.gitkeep" ]; then
    touch "$MEMORY_DIR/.gitkeep"
fi
echo -e "${GREEN}✓ Memory directory ready${NC}"

# --- Step 6: Configure API key ---
echo -e "${BLUE}[6/7]${NC} Configuring OpenClaw..."

if [ -f "$CONFIG_FILE" ]; then
    echo -e "${YELLOW}→ Config file already exists at $CONFIG_FILE — skipping${NC}"
    echo -e "${YELLOW}  Edit it manually if you need to update your API key.${NC}"
else
    mkdir -p "$(dirname "$CONFIG_FILE")"
    echo ""
    read -rp "Enter your Anthropic API key (or press Enter to skip): " API_KEY

    if [ -z "$API_KEY" ]; then
        API_KEY="YOUR_ANTHROPIC_API_KEY_HERE"
        echo -e "${YELLOW}→ Skipped — edit $CONFIG_FILE later to add your key${NC}"
    fi

    cat > "$CONFIG_FILE" <<EOF
{
  "agent": {
    "name": "Jack",
    "emoji": "🦅",
    "description": "Personal AI agent for Sean Howen"
  },
  "model": {
    "provider": "anthropic",
    "default": "anthropic/claude-sonnet-4-5",
    "api_key": "$API_KEY"
  },
  "workspace": {
    "path": "$WORKSPACE_DIR",
    "memory_dir": "memory"
  },
  "plugins": {
    "telegram": {
      "enabled": false,
      "bot_token": "",
      "allowed_users": []
    }
  },
  "heartbeat": {
    "enabled": true,
    "config": "HEARTBEAT.md"
  },
  "safety": {
    "confirm_before_send": true,
    "confirm_before_delete": true,
    "confirm_before_spend": true,
    "max_retries": 3
  }
}
EOF
    echo -e "${GREEN}✓ Config saved to $CONFIG_FILE${NC}"
fi

# --- Step 7: Done ---
echo ""
echo -e "${GREEN}════════════════════════════════════════${NC}"
echo -e "${GREEN}  🦅 Jack is ready.${NC}"
echo -e "${GREEN}════════════════════════════════════════${NC}"
echo ""
echo -e "  ${BLUE}Next steps:${NC}"
echo -e "  1. Edit ${YELLOW}~/.openclaw/workspace/USER.md${NC} — fill in your details"
echo -e "  2. Edit ${YELLOW}~/.openclaw/workspace/TOOLS.md${NC} — add your accounts"
echo -e "  3. Run ${GREEN}openclaw start${NC} to activate Jack"
echo -e "  4. Run ${GREEN}openclaw chat${NC} to talk to him"
echo ""
echo -e "  ${BLUE}Workspace:${NC} $WORKSPACE_DIR"
echo -e "  ${BLUE}Config:${NC}    $CONFIG_FILE"
echo ""
