#!/usr/bin/env bash
# Build the plugin ZIP that a Claude organization owner uploads by hand
# (Organization settings → plugins → Upload plugin). This is the interim path
# until the org syncs the marketplace from GitHub.
#
# The ZIP holds only committed files, at the ZIP root, so
# .claude-plugin/plugin.json is at the top. Files marked export-ignore in
# .gitattributes (CI, this script) are left out.
#
# Usage: scripts/build-zip.sh [ref]   (default: HEAD)
# Output: dist/corridor-cookbook-<version>.zip
set -euo pipefail
cd "$(dirname "$0")/.."

ref="${1:-HEAD}"

read_json() { # file, key path (python dict lookup)
    git show "$ref:$1" | python3 -c "import json,sys; d=json.load(sys.stdin); print($2)"
}

name="$(read_json .claude-plugin/plugin.json 'd["name"]')"
version="$(read_json .claude-plugin/plugin.json 'd["version"]')"
mkt_plugin_version="$(read_json .claude-plugin/marketplace.json '[p for p in d["plugins"] if p["name"]=="'"$name"'"][0]["version"]')"
mkt_version="$(read_json .claude-plugin/marketplace.json 'd["metadata"]["version"]')"

if [ "$version" != "$mkt_plugin_version" ] || [ "$version" != "$mkt_version" ]; then
    echo "ERROR: version mismatch: plugin.json=$version, marketplace plugin entry=$mkt_plugin_version, marketplace metadata=$mkt_version" >&2
    echo "       Bump all three together so an upload and a marketplace sync show the same version." >&2
    exit 1
fi

for dir in skills agents; do
    if [ -z "$(git ls-tree --name-only "$ref" "$dir/")" ]; then
        echo "ERROR: $dir/ is empty at $ref" >&2
        exit 1
    fi
done

mkdir -p dist
out="dist/${name}-${version}.zip"
rm -f "$out"
git archive --format=zip --output="$out" "$ref"

skills=$(git ls-tree --name-only "$ref" skills/ | wc -l | tr -d ' ')
agents=$(git ls-tree --name-only "$ref" agents/ | wc -l | tr -d ' ')
echo "Built $out ($name $version, $skills skills, $agents agents, from $(git rev-parse --short "$ref"))"
