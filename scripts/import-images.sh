#!/usr/bin/env bash

set -e

# shellcheck source=scripts/lib/image_defs
. "${DAPPER_SOURCE}/scripts/lib/image_defs"
# shellcheck source=scripts/lib/utils
. "${DAPPER_SOURCE}/scripts/lib/utils"
# shellcheck disable=SC1091
. "${SCRIPTS_DIR}/lib/debug_functions"
# shellcheck disable=SC1091
. "${SCRIPTS_DIR}/lib/deploy_funcs"

for project in ${PROJECTS[*]}; do
    for image in ${project_images[${project}]}; do
        [[ "$image" != "shipyard-dapper-base" ]] || continue
        import_image "${REPO}/${image}"
    done
done


