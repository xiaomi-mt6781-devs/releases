#!/usr/bin/env bash

set -euo pipefail

MARKETNAME=""
CODENAMES="${DEVICE}"
GH_REPO=""
SE_STATUS="Enforcing"

case "${DEVICE}" in
    "viva")
        MARKETNAME="Redmi Note 11 Pro (4G)"
        CODENAMES="viva,vida"
        GH_REPO="xiaomi-mt6781-devs/android_device_xiaomi_viva"
        ;;
esac

echo "LineageOS ${LINEAGE_VER} for ${MARKETNAME} (${CODENAMES}) ${BUILD_DATE}"

echo "## Changelog"
echo ""
if [ "$INIT" == "true" ]; then
    echo "* First build"
else
    # Todo: Implement changelog generation
    echo "*"
fi
echo ""
echo "## Bugs"
echo ""
if [ "${DEVICE}" == "viva" ]; then
    # Isn't going to be fixed anytime soon
    echo "* [BPF Issues](https://forum.xda-developers.com/t/gsi-13-lineageos-20-light.4509315/#post-87620773)"
else
    echo "No known bugs"
fi
echo ""

echo "## Notes"
echo ""
echo "* SELinux is **${SE_STATUS}**"
echo "* Only LineageOS Recovery is supported"
echo "* Custom kernels are **NOT** supported"
echo "* OTA Updates are suppored"
echo ""

echo "## Credits"
echo ""
echo "* [Contributors](https://github.com/${GH_REPO}/contributors)"
echo ""

echo "## Checksums (SHA256)"
pushd "upload" >/dev/null
cat << EOF
\`\`\`
$(sha256sum *)
\`\`\`
EOF
popd >/dev/null

