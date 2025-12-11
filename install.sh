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

# Validate custom path for security
validate_custom_path() {
    local path="$1"
    
    # Check for command injection attempts
    case "$path" in
        *\;*|*\|*|*\&*|*\$*|*\`*|*\(*|*\)*|*\\*)
            echo "❌ Error: Invalid characters in path" >&2
            exit 1
            ;;
    esac
    
    # Check for path traversal
    if [[ "$path" =~ \.\. ]]; then
        echo "❌ Error: Path traversal not allowed" >&2
        exit 1
    fi
    
    # Ensure reasonable length
    if (( ${#path} > 200 )); then
        echo "❌ Error: Path too long" >&2
        exit 1
    fi
    
    # Block system directories
    case "$path" in
        /etc|/etc/*|/usr|/usr/*|/bin|/bin/*|/sbin|/sbin/*|/root|/root/*|/var/log|/var/log/*|/proc|/proc/*|/sys|/sys/*|/boot|/boot/*|/dev|/dev/*|/lib|/lib/*|/lib64|/lib64/*|/opt|/opt/*)
            echo "❌ Error: System directory not allowed" >&2
            exit 1
            ;;
    esac
}

# Sanitize filename for security
sanitize_filename() {
    local filename="$1"
    
    # Remove path components
    filename=$(basename "$filename")
    
    # Check for path traversal
    if [[ "$filename" =~ \.\. ]]; then
        return 1
    fi
    
    # Allow only safe characters
    if [[ ! "$filename" =~ ^[a-zA-Z0-9._-]+$ ]]; then
        return 1
    fi
    
    # Check length
    if (( ${#filename} > 100 )); then
        return 1
    fi
    
    echo "$filename"
}

# Validate API response
validate_api_response() {
    local response="$1"
    
    # Check size (1MB limit)
    if (( ${#response} > 1048576 )); then
        echo "❌ Error: API response too large" >&2
        return 1
    fi
    
    # Check if looks like JSON (flexible validation without jq)
    if [[ ! "$response" =~ ^\[.*\]$ ]] && [[ ! "$response" =~ ^\{.*\}$ ]]; then
        echo "❌ Error: Invalid API response format" >&2
        return 1
    fi
    
    # Additional check for GitHub API structure (multiline aware)
    if ! echo "$response" | grep -q '"name"' || ! echo "$response" | grep -q '"type"'; then
        echo "❌ Error: Response missing required fields" >&2
        return 1
    fi
    
    return 0
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
download_directory() {
    local -r api_path="$1"
    local -r local_path="$2"
    
    local -r api_url="https://api.github.com/repos/$REPO_OWNER/$REPO_NAME/contents/$api_path"
    local response
    
    if ! response=$(curl -fsSL --max-time 30 --max-filesize 1048576 "$api_url" 2>/dev/null); then
        echo "⚠️  Warning: Failed to fetch $api_path" >&2
        return 1
    fi
    
    if ! validate_api_response "$response"; then
        echo "⚠️  Warning: Invalid API response for $api_path" >&2
        return 1
    fi
    
    # Parse JSON response to get files and directories (robust jq-free approach)
    # Process each JSON object separately to handle GitHub API format
    echo "$response" | \
    grep -A 20 -B 5 '"name"[[:space:]]*:' | \
    awk '
    /"name"[[:space:]]*:/ { 
        gsub(/.*"name"[[:space:]]*:[[:space:]]*"/, ""); 
        gsub(/".*/, ""); 
        name = $0; 
    }
    /"type"[[:space:]]*:/ { 
        gsub(/.*"type"[[:space:]]*:[[:space:]]*"/, ""); 
        gsub(/".*/, ""); 
        type = $0; 
        if (name && type) {
            print name "\t" type; 
            name = ""; 
            type = "";
        }
    }' | \
    while IFS=$'\t' read -r name type; do
        [[ -n "$name" && -n "$type" ]] || continue
        
        # Sanitize filename
        if ! safe_name=$(sanitize_filename "$name"); then
            echo "⚠️  Skipping unsafe filename: $name" >&2
            continue
        fi
        
        if [[ "$type" == "file" ]]; then
            echo "    📄 $api_path/$safe_name"
            mkdir -p "$local_path"
            chmod 750 "$local_path"
            if curl -fsSL --max-time 60 --max-filesize 10485760 "$REPO_URL/raw/$MAIN_BRANCH/$api_path/$safe_name" -o "$local_path/$safe_name"; then
                chmod 644 "$local_path/$safe_name"
            else
                echo "⚠️  Warning: Failed to download $api_path/$name" >&2
            fi
        elif [[ "$type" == "dir" ]]; then
            echo "  📁 $api_path/$safe_name/"
            mkdir -p "$local_path/$safe_name"
            chmod 750 "$local_path/$safe_name"
            download_directory "$api_path/$safe_name" "$local_path/$safe_name"
        fi
    done
}

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
#   $2 - Temporary directory path
remote_install() {
    local -r install_dir="$1"
    local -r temp_dir="$2"
    
    echo "🚀 Remote installation from GitHub"
    echo "Downloading from: $REPO_URL"
    
    # Check if curl is available
    if ! command -v curl &> /dev/null; then
        echo "❌ Error: curl is required for remote installation" >&2
        echo "Please install curl and try again" >&2
        exit 1
    fi
    
    # Download main files
    echo "⬇️  Downloading agent files..."
    if ! curl -fsSL --max-time 30 --max-filesize 1048576 "$REPO_URL/raw/$MAIN_BRANCH/$AGENT_JSON" -o "$temp_dir/$AGENT_JSON"; then
        echo "❌ Error: Download operation failed" >&2
        exit 1
    fi
    
    # Create support directory structure
    local -r agent_support_dir="$install_dir/$AGENT_NAME"
    mkdir -p "$agent_support_dir"
    chmod 750 "$agent_support_dir"
    
    echo "🔍 Downloading all $AGENT_NAME content recursively..."
    
    # Download all content from ai-sdp directory recursively
    download_directory "$AGENT_NAME" "$agent_support_dir"
    
    # Copy agent JSON to final location
    if ! cp "$temp_dir/$AGENT_JSON" "$install_dir/"; then
        echo "❌ Error: Failed to install agent file" >&2
        exit 1
    fi
    chmod 644 "$install_dir/$AGENT_JSON"
}

# Parse arguments
install_type="global"
custom_path=""

while [[ $# -gt 0 ]]; do
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
            validate_custom_path "$1"
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
chmod 750 "$install_dir"

# Create temporary directory for downloads
temp_dir=$(mktemp -d)
chmod 700 "$temp_dir"
# Ensure cleanup on exit
trap 'rm -rf "$temp_dir"' EXIT

# Clean up any existing installation
cleanup_existing_agent "$install_dir"

# Perform remote installation
remote_install "$install_dir" "$temp_dir"

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
    echo "❌ Installation failed" >&2
    exit 1
fi
