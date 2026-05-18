#!/usr/bin/env sh
set -eu

root=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
dist="$root/dist"
mkdir -p "$dist"

package_tar() {
  target="$1"
  src="$root/zig-out/cross/$target/ztk"
  tmp=$(mktemp -d "${TMPDIR:-/tmp}/ztk-package.XXXXXX")
  cp "$src" "$tmp/ztk"
  chmod 755 "$tmp/ztk"
  (cd "$tmp" && tar -czf "$dist/ztk-$target.tar.gz" ztk)
  rm -rf "$tmp"
}

package_zip() {
  target="$1"
  src="$root/zig-out/cross/$target/ztk.exe"
  tmp=$(mktemp -d "${TMPDIR:-/tmp}/ztk-package.XXXXXX")
  cp "$src" "$tmp/ztk.exe"
  chmod 755 "$tmp/ztk.exe"
  (cd "$tmp" && zip -q "$dist/ztk-$target.zip" ztk.exe)
  rm -rf "$tmp"
}

package_tar aarch64-macos
package_tar x86_64-macos
package_tar aarch64-linux-musl
package_tar x86_64-linux-musl
package_zip x86_64-windows

(cd "$dist" && shasum -a 256 ztk-* > SHASUMS256.txt)
