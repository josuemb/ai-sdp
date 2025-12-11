#!/usr/bin/env bash

# AI-SDP Agent Installer
# Installs the AI-SDP agent for Kiro CLI

set -euo pipefail

readonly AGENT_NAME="ai-sdp"
readonly AGENT_JSON="ai-sdp.json"
readonly REPO_URL="https://github.com/josuemb/ai-sdp"
readonly REPO_OWNER="josuemb"
readonly REPO_NAME="ai-sdp"
readonly MAIN_BRANCH="main"
readonly CLI_COMMAND="kiro-cli chat --agent ai-sdp"

# Default installation paths
readonly GLOBAL_AGENTS_DIR="$HOME/.kiro/agents"
readonly LOCAL_AGENTS_DIR=".kiro/agents"

# Display usage information
show_usage() {
    cat << 'EOF'
Usage: $0 [OPTIONS] [CUSTOM_PATH]

Install AI-SDP agent for Kiro CLI

OPTIONS:
  -g, --global    Install globally (default)
  -l, --local     Install in current directory
  -h, --help      Show this help message

CUSTOM_PATH:
  Optional custom installation path

Examples:
  $0                          # Install globally
  $0 --global                 # Install globally
  $0 --local                  # Install locally
  $0 /path/to/custom/agents   # Install to custom path
EOF
}

# Clean up any existing agent installation
# Arguments:
#   $1 - Installation directory path
cleanup_existing_agent() {
    local -r install_dir="$1"
    
    # Remove existing agent JSON file
    if [[ -f "$install_dir/$AGENT_JSON" ]]; then
        echo "🧹 Removing existing $install_dir/$AGENT_JSON"
        rm -f "$install_dir/$AGENT_JSON"
    fi
    
    # Remove existing agent support directory
    if [[ -d "$install_dir/$AGENT_NAME" ]]; then
        echo "🧹 Removing existing $install_dir/$AGENT_NAME/"
        rm -rf "$install_dir/$AGENT_NAME"
    fi
}

# Recursively download directory contents from GitHub
# Arguments:
#   $1 - GitHub API path (e.g., "ai-sdp" or "ai-sdp/core")
#   $2 - Local directory path
download_directory() {
    local -r api_path="$1"
    local -r local_path="$2"
    
    local -r api_url="https://api.github.com/repos/$REPO_OWNER/$REPO_NAME/contents/$api_path"
    local response
    
    if ! response=$(curl -fsSL "$api_url" 2>/dev/null); then
        echo "⚠️  Warning: Failed to fetch $api_path" >&2
        return 1
    fi
    
    # Parse JSON response to get files and directories
    echo "$response" | grep -E '"(name|type)"[[:space:]]*:' | paste - - | while IFS=$'\t' read -r name_line type_line; do
        local name=$(echo "$name_line" | sed 's/.*"name"[[:space:]]*:[[:space:]]*"//g' | sed 's/".*//g')
        local type=$(echo "$type_line" | sed 's/.*"type"[[:space:]]*:[[:space:]]*"//g' | sed 's/".*//g')
        
        [[ -n "$name" ]] || continue
        
        if [[ "$type" == "file" ]]; then
            echo "    📄 $api_path/$name"
            mkdir -p "$local_path"
            if ! curl -fsSL "$REPO_URL/raw/$MAIN_BRANCH/$api_path/$name" -o "$local_path/$name" 2>/dev/null; then
                echo "⚠️  Warning: Failed to download $api_path/$name" >&2
            fi
        elif [[ "$type" == "dir" ]]; then
            echo "  📁 $api_path/$name/"
            mkdir -p "$local_path/$name"
            download_directory "$api_path/$name" "$local_path/$name"
        fi
    done
}

# Download and install agent files from GitHub
# Arguments:
#   $1 - Installation directory path
remote_install() {
    local -r install_dir="$1"
    
    echo "🚀 Remote installation from GitHub"
    echo "Downloading from: $REPO_URL"
    
    # Check if curl is available
    if ! command -v curl &> /dev/null; then
        echo "❌ Error: curl is required for remote installation" >&2
        echo "Please install curl and try again" >&2
        exit 1
    fi
    
    local -r temp_dir=$(mktemp -d)
    # Ensure cleanup on exit
    trap "rm -rf '$temp_dir'" EXIT
    
    # Download main agent JSON file
    echo "⬇️  Downloading $AGENT_JSON..."
    if ! curl -fsSL "$REPO_URL/raw/$MAIN_BRANCH/$AGENT_JSON" -o "$temp_dir/$AGENT_JSON"; then
        echo "❌ Error: Failed to download $AGENT_JSON" >&2
        exit 1
    fi
    
    # Create support directory structure
    local -r agent_support_dir="$install_dir/$AGENT_NAME"
    mkdir -p "$agent_support_dir"
    
    echo "🔍 Downloading all $AGENT_NAME content recursively..."
    
    # Download all content from ai-sdp directory recursively
    download_directory "$AGENT_NAME" "$agent_support_dir"
    
    # Copy agent JSON to final location
    cp "$temp_dir/$AGENT_JSON" "$install_dir/"
}

# Parse arguments
install_type="global"
custom_path=""

while (( $# > 0 )); do
    case $1 in
        -g|--global)
            install_type="global"
            shift
            ;;
        -l|--local)
            install_type="local"
            shift
            ;;
        -h|--help)
            show_usage
            exit 0
            ;;
        -*)
            echo "Error: Unknown option $1" >&2
            show_usage >&2
            exit 1
            ;;
        *)
            custom_path="$1"
            shift
            ;;
    esac
done

# Determine installation directory
if [[ -n "$custom_path" ]]; then
    install_dir="$custom_path"
    echo "Installing to custom path: $install_dir"
elif [[ "$install_type" == "local" ]]; then
    install_dir="$LOCAL_AGENTS_DIR"
    echo "Installing locally to: $install_dir"
else
    install_dir="$GLOBAL_AGENTS_DIR"
    echo "Installing globally to: $install_dir"
fi

# Create installation directory
echo "Creating directory: $install_dir"
mkdir -p "$install_dir"

# Clean up any existing installation
cleanup_existing_agent "$install_dir"

# Perform remote installation
remote_install "$install_dir"

# Verify installation
if [[ -f "$install_dir/$AGENT_JSON" ]]; then
    cat << EOF

✅ AI-SDP agent installed successfully!

Installation details:
  Agent JSON: $install_dir/$AGENT_JSON
  Support files: $install_dir/$AGENT_NAME
  Type: $install_type
  Mode: Remote installation

Usage:
  $CLI_COMMAND

EOF
else
    echo "❌ Installation failed: $AGENT_JSON not found" >&2
    exit 1
fi
