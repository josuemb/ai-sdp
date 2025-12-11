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
    
    # Download main files
    echo "⬇️  Downloading agent files..."
    if ! curl -fsSL "$REPO_URL/raw/$MAIN_BRANCH/$AGENT_JSON" -o "$temp_dir/$AGENT_JSON"; then
        echo "❌ Error: Failed to download $AGENT_JSON" >&2
        exit 1
    fi
    
    # Create support directory structure
    local -r agent_support_dir="$install_dir/$AGENT_NAME"
    mkdir -p "$agent_support_dir"
    
    echo "🔍 Discovering files from GitHub..."
    
    # Get directory contents from GitHub API
    local -r api_url="https://api.github.com/repos/$REPO_OWNER/$REPO_NAME/contents/$AGENT_NAME"
    local response
    if ! response=$(curl -fsSL "$api_url"); then
        echo "❌ Error: Failed to fetch directory listing" >&2
        exit 1
    fi
    
    # Download prompt.md file
    echo "  📄 Downloading prompt.md"
    if ! curl -fsSL "$REPO_URL/raw/$MAIN_BRANCH/$AGENT_NAME/prompt.md" -o "$agent_support_dir/prompt.md"; then
        echo "❌ Error: Failed to download prompt.md" >&2
        exit 1
    fi
    
    # Download known directories
    local -r directories=(core cycles framework integrations details)
    for dir in "${directories[@]}"; do
        if echo "$response" | grep -q "\"name\"[[:space:]]*:[[:space:]]*\"$dir\""; then
            echo "  📁 Downloading $dir directory"
            mkdir -p "$agent_support_dir/$dir"
            
            # Get files in directory
            local dir_response
            if dir_response=$(curl -fsSL "https://api.github.com/repos/$REPO_OWNER/$REPO_NAME/contents/$AGENT_NAME/$dir"); then
                # Extract file names and download them
                local files
                files=$(echo "$dir_response" | grep -o '"name"[[:space:]]*:[[:space:]]*"[^"]*"' | sed 's/.*"name"[[:space:]]*:[[:space:]]*"//g' | sed 's/".*//g')
                
                while IFS= read -r file; do
                    [[ -n "$file" ]] || continue
                    echo "    📄 $dir/$file"
                    if ! curl -fsSL "$REPO_URL/raw/$MAIN_BRANCH/$AGENT_NAME/$dir/$file" -o "$agent_support_dir/$dir/$file"; then
                        echo "⚠️  Warning: Failed to download $dir/$file" >&2
                    fi
                done <<< "$files"
            fi
        fi
    done
    
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
