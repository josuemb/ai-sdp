#!/bin/bash

# AI-SDP Agent Installer
# Installs the AI-SDP agent for Kiro CLI

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
AGENT_NAME="ai-sdp"

# Default installation paths
GLOBAL_AGENTS_DIR="$HOME/.kiro/agents"
LOCAL_AGENTS_DIR=".kiro/agents"

# Function to show usage
show_usage() {
    echo "Usage: $0 [OPTIONS] [CUSTOM_PATH]"
    echo ""
    echo "Install AI-SDP agent for Kiro CLI"
    echo ""
    echo "OPTIONS:"
    echo "  -g, --global    Install globally (default)"
    echo "  -l, --local     Install in current directory"
    echo "  -h, --help      Show this help message"
    echo ""
    echo "CUSTOM_PATH:"
    echo "  Optional custom installation path"
    echo ""
    echo "Examples:"
    echo "  $0                          # Install globally"
    echo "  $0 --global                 # Install globally"
    echo "  $0 --local                  # Install locally"
    echo "  $0 /path/to/custom/agents   # Install to custom path"
}

# Parse arguments
INSTALL_TYPE="global"
CUSTOM_PATH=""

while [[ $# -gt 0 ]]; do
    case $1 in
        -g|--global)
            INSTALL_TYPE="global"
            shift
            ;;
        -l|--local)
            INSTALL_TYPE="local"
            shift
            ;;
        -h|--help)
            show_usage
            exit 0
            ;;
        -*)
            echo "Error: Unknown option $1"
            show_usage
            exit 1
            ;;
        *)
            CUSTOM_PATH="$1"
            shift
            ;;
    esac
done

# Determine installation directory
if [[ -n "$CUSTOM_PATH" ]]; then
    INSTALL_DIR="$CUSTOM_PATH"
    echo "Installing to custom path: $INSTALL_DIR"
elif [[ "$INSTALL_TYPE" == "local" ]]; then
    INSTALL_DIR="$LOCAL_AGENTS_DIR"
    echo "Installing locally to: $INSTALL_DIR"
else
    INSTALL_DIR="$GLOBAL_AGENTS_DIR"
    echo "Installing globally to: $INSTALL_DIR"
fi

# Create installation directory
echo "Creating directory: $INSTALL_DIR"
mkdir -p "$INSTALL_DIR"

# Copy agent JSON file directly to agents directory
echo "Copying agent configuration..."
cp "$SCRIPT_DIR/ai-sdp.json" "$INSTALL_DIR/"

# Copy supporting files to subdirectory
AGENT_SUPPORT_DIR="$INSTALL_DIR/$AGENT_NAME"
echo "Creating support directory: $AGENT_SUPPORT_DIR"
mkdir -p "$AGENT_SUPPORT_DIR"
cp -r "$SCRIPT_DIR/ai-sdp"/* "$AGENT_SUPPORT_DIR/"

# Verify installation
if [[ -f "$INSTALL_DIR/ai-sdp.json" ]]; then
    echo ""
    echo "✅ AI-SDP agent installed successfully!"
    echo ""
    echo "Installation details:"
    echo "  Agent JSON: $INSTALL_DIR/ai-sdp.json"
    echo "  Support files: $AGENT_SUPPORT_DIR"
    echo "  Type: $INSTALL_TYPE"
    echo ""
    echo "Usage:"
    echo "  kiro-cli chat --agent ai-sdp"
    echo ""
else
    echo "❌ Installation failed: ai-sdp.json not found"
    exit 1
fi
