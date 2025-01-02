#!/bin/bash

# Use this layer to add nodes and models

# Packages are installed after nodes so we can fix them...
PYTHON_PACKAGES=(
)

NODES=(



LORA_MODELS=(

)

VAE_MODELS=(
)

ESRGAN_MODELS=(
)

CONTROLNET_MODELS=(

)

UPSCALE_MODELS=(
)

FACE_RESTORE_MODELS=(
)
FACEDETECTION_MODELS=(

)


VAE_MODELS=(

)
CHECKPOINT_MODELS=(

)
INSTANTID_MODELS=(
)
INSIGHTFACE_MODELS=(

)
INSIGHTFACE_MODELS_NOZIP=(
)
SAM_MODELS=(
)
### DO NOT EDIT BELOW HERE UNLESS YOU KNOW WHAT YOU ARE DOING ###

function build_extra_start() {
    build_extra_install_python_packages
#    build_extra_get_models \
#        "/opt/storage/stable_diffusion/models/ckpt" \
#        "${CHECKPOINT_MODELS[@]}"
#    build_extra_get_models \
#        "/opt/storage/stable_diffusion/models/lora" \
#        "${LORA_MODELS[@]}"
    build_extra_get_models \
        "/opt/ComfyUI/models/controlnet" \
        "${CONTROLNET_MODELS[@]}"
#    build_extra_get_models \
#        "/opt/storage/stable_diffusion/models/vae" \
#        "${VAE_MODELS[@]}"
#    build_extra_get_models \
#        "/opt/storage/stable_diffusion/models/esrgan" \
#        "${ESRGAN_MODELS[@]}"
    build_extra_get_models \
        "/opt/ComfyUI/models/upscale_models" \
        "${UPSCALE_MODELS[@]}"
    build_extra_get_models \
        "/opt/ComfyUI/models/facedetection" \
        "${FACEDETECTION_MODELS[@]}"
    build_extra_get_models \
        "/opt/ComfyUI/models/facerestore_models" \
        "${FACE_RESTORE_MODELS[@]}"
    build_extra_get_models \
        "/opt/ComfyUI/models/vae" \
        "${VAE_MODELS[@]}"
    build_extra_get_models \
        "/opt/ComfyUI/models/checkpoints" \
        "${CHECKPOINT_MODELS[@]}"
    build_extra_get_models \
        "/opt/ComfyUI/models/instantid" \
        "${INSTANTID_MODELS[@]}"
    build_extra_get_models \
        "/opt/ComfyUI/models/loras" \
        "${LORA_MODELS[@]}"
    build_extra_get_models \
        "/opt/ComfyUI/models/sams" \
        "${SAM_MODELS[@]}"
    download_insightface_models \
        "/opt/ComfyUI/models/insightface/models" \
        "${INSIGHTFACE_MODELS[@]}"
    build_extra_get_models \
        "/opt/ComfyUI/models/insightface" \
        "${INSIGHTFACE_MODELS_NOZIP[@]}"
    build_extra_get_nodes

    cd /opt/ComfyUI && \
    micromamba run -n comfyui -e LD_PRELOAD=libtcmalloc.so python main.py \
        --cpu \
        --listen 127.0.0.1 \
        --port 11404 \
        --disable-auto-launch \
        --quick-test-for-ci
    
    # Ensure pytorch hasn't been clobbered
    $MAMBA_DEFAULT_RUN python /opt/ai-dock/tests/assert-torch-version.py
}

function build_extra_get_nodes() {
    for repo in "${NODES[@]}"; do
        dir="${repo##*/}"
        path="/opt/ComfyUI/custom_nodes/${dir}"
        requirements="${path}/requirements.txt"
        install="${path}/install.py"
        if [[ -d $path ]]; then
            if [[ ${AUTO_UPDATE,,} != "false" ]]; then
                printf "Updating node: %s...\n" "${repo}"
                ( cd "$path" && git pull )
                if [[ -e $requirements ]]; then
                    micromamba -n comfyui run ${PIP_INSTALL} -r "$requirements"
                fi
            fi
        else
            printf "Downloading node: %s...\n" "${repo}"
            git clone "${repo}" "${path}" --recursive
            if [[ -e $requirements ]]; then
                micromamba -n comfyui run ${PIP_INSTALL} -r "${requirements}"
            fi
            if [[ -e $install ]]; then
                printf "Installing node: %s...\n" "${repo}"
                micromamba -n comfyui run python "${install}"
            fi
        fi
    done
}

function build_extra_install_python_packages() {
    if [ ${#PYTHON_PACKAGES[@]} -gt 0 ]; then
        micromamba -n comfyui run ${PIP_INSTALL} ${PYTHON_PACKAGES[*]}
    fi
}

function build_extra_get_models() {
    if [[ -n $2 ]]; then
        dir="$1"
        mkdir -p "$dir"
        shift
        arr=("$@")
        
        printf "Downloading %s model(s) to %s...\n" "${#arr[@]}" "$dir"
        for url in "${arr[@]}"; do
            printf "Downloading: %s\n" "${url}"
            build_extra_download "${url}" "${dir}"
            printf "\n"
        done
    fi
}

# Download from $1 URL to $2 file path
function build_extra_download() {
    wget -qnc --content-disposition --show-progress -e dotbytes="${3:-4M}" -P "$2" "$1"
}

function download_insightface_models() {
    if [[ -n $2 ]]; then
        dir="$1"
        mkdir -p "$dir"
        shift
        arr=("$@")

        printf "Downloading %s model(s) to %s...\n" "${#arr[@]}" "$dir"
        for url in "${arr[@]}"; do
            printf "Downloading: %s\n" "${url}"
            build_extra_download "${url}" "${dir}"
            # unzip
            unzip -o "${dir}/$(basename ${url})" -d "${dir}"
            rm "${dir}/$(basename ${url})"
            printf "\n"
        done
    fi
}

umask 002

build_extra_start
fix-permissions.sh -o container