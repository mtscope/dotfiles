#!/bin/bash

usage() { echo "Usage: $0 [-t target branch name ] [-m title for merge request] [-d description for merge request]" 1>&2; exit 1; }

while getopts "t:m:d::" o; do
    case "${o}" in
        t)
            t=${OPTARG}
            ;;
        m)
            m=${OPTARG}
            ;;
        d)
            d=${OPTARG}
            ;;
        *)
            usage
            ;;
    esac
done
shift $((OPTIND-1))

if [ -z "${t}" ]; then
    echo "t is empty"
    usage
fi

if [ -z "${m}" ]; then
    echo "m is empty"
    usage
fi

if [ -z "${d}" ]; then
    echo "d is empty"
    usage
fi

echo "s = $1"
echo "t = ${t}"
echo "m = ${m}"
echo "d = ${d}"

# git stash
# git checkout -b mtscope/${s} origin/${merge_to_branch}

# git push -u \
#     -o ci.skip \
#         origin mtscope/${s}

# git push \
#     -o merge_request.create \
#     -o merge_request.remove_source_branch \
#     -o merge_request.title="${merge_request_title}" \
#     -o merge_request.description="${merge_request_description}" \
#     -o merge_request.target="issue/${issue_number}" \
#         origin "${merge_to_branch}"