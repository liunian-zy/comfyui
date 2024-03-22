#!/bin/bash

# Use this layer to add nodes and models

# Packages are installed after nodes so we can fix them...
PYTHON_PACKAGES=(
    "opencv-python==4.7.0.72"
)

NODES=(
    #"https://github.com/ltdrdata/ComfyUI-Manager"
    "https://github.com/Gourieff/comfyui-reactor-node"
    "https://github.com/WASasquatch/was-node-suite-comfyui"
    "https://github.com/ltdrdata/ComfyUI-Impact-Pack"
    "https://github.com/Stability-AI/stability-ComfyUI-nodes"
    "https://github.com/TripleHeadedMonkey/ComfyUI_MileHighStyler"
    "https://github.com/Fannovel16/comfyui_controlnet_aux"
    "https://github.com/chrisgoringe/cg-use-everywhere"
    "https://github.com/liunian-zy/ComfyUI-CLIPSeg"
    "https://github.com/Suzie1/ComfyUI_Comfyroll_CustomNodes"
    "https://github.com/cubiq/ComfyUI_InstantID"
    "https://github.com/Derfuu/Derfuu_ComfyUI_ModdedNodes"
    "https://github.com/sipherxyz/comfyui-art-venture"
)


LORA_MODELS=(
    #"https://civitai.com/api/download/models/16576"
    "https://static.cjgt.me/comfyui/models/beauty face_v1.safetensors"
    "https://static.cjgt.me/comfyui/models/leosamsFilmgirlUltra_velvia30Lora.safetensors"

)

VAE_MODELS=(
    #"https://huggingface.co/stabilityai/sd-vae-ft-ema-original/resolve/main/vae-ft-ema-560000-ema-pruned.safetensors"
    #"https://huggingface.co/stabilityai/sd-vae-ft-mse-original/resolve/main/vae-ft-mse-840000-ema-pruned.safetensors"
    #"https://huggingface.co/stabilityai/sdxl-vae/resolve/main/sdxl_vae.safetensors"
)

ESRGAN_MODELS=(
    #"https://huggingface.co/ai-forever/Real-ESRGAN/resolve/main/RealESRGAN_x4.pth"
    #"https://huggingface.co/FacehugmanIII/4x_foolhardy_Remacri/resolve/main/4x_foolhardy_Remacri.pth"
    #"https://huggingface.co/Akumetsu971/SD_Anime_Futuristic_Armor/resolve/main/4x_NMKD-Siax_200k.pth"
)

CONTROLNET_MODELS=(
   "https://static.cjgt.me/comfyui/models/diffusion_pytorch_model.safetensors"

    #"https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/control_canny-fp16.safetensors"
    #"https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/control_depth-fp16.safetensors"
    #"https://huggingface.co/kohya-ss/ControlNet-diff-modules/resolve/main/diff_control_sd15_depth_fp16.safetensors"
    #"https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/control_hed-fp16.safetensors"
    #"https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/control_mlsd-fp16.safetensors"
    #"https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/control_normal-fp16.safetensors"
    #"https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/control_openpose-fp16.safetensors"
    #"https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/control_scribble-fp16.safetensors"
    #"https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/control_seg-fp16.safetensors"
    #"https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/t2iadapter_canny-fp16.safetensors"
    #"https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/t2iadapter_color-fp16.safetensors"
    #"https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/t2iadapter_depth-fp16.safetensors"
    #"https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/t2iadapter_keypose-fp16.safetensors"
    #"https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/t2iadapter_openpose-fp16.safetensors"
    #"https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/t2iadapter_seg-fp16.safetensors"
    #"https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/t2iadapter_sketch-fp16.safetensors"
    #"https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/t2iadapter_style-fp16.safetensors"
)

UPSCALE_MODELS=(
    "https://static.cjgt.me/comfyui/models/RealESRGAN_x4plus.pth"
)

FACE_RESTORE_MODELS=(
    "https://static.cjgt.me/comfyui/models/GFPGANv1.3.pth"
    "https://static.cjgt.me/comfyui/models/GFPGANv1.4.pth"
    "https://static.cjgt.me/comfyui/models/codeformer-v0.1.0.pth"
)
FACEDETECTION_MODELS=(
    "https://static.cjgt.me/comfyui/models/yolov5l-face.pth"
    "https://static.cjgt.me/comfyui/models/yolov5n-face.pth"
    "https://static.cjgt.me/comfyui/models/detection_Resnet50_Final.pth"
    "https://static.cjgt.me/comfyui/models/detection_mobilenet0.25_Final.pth"
    "https://static.cjgt.me/comfyui/models/parsing_parsenet.pth"
)


VAE_MODELS=(
#  "https://civitai.com/api/download/models/333245?type=Model&format=SafeTensor"
    "https://static.cjgt.me/comfyui/models/sdxlVAE_sdxlVAE.safetensors"
)
CHECKPOINT_MODELS=(
#  "https://civitai.com/api/download/models/273102"
   "https://static.cjgt.me/comfyui/models/turbovisionxlSuperFastXLBasedOnNew_tvxlV431Bakedvae.safetensors"
)
INSTANTID_MODELS=(
   "https://static.cjgt.me/comfyui/models/ip-adapter.bin"
)
INSIGHTFACE_MODELS=(
    "https://static.cjgt.me/comfyui/models/antelopev2.zip"
    "https://static.cjgt.me/comfyui/models/buffalo_l.zip"
)
INSIGHTFACE_MODELS_NOZIP=(
    "https://static.cjgt.me/comfyui/models/inswapper_128.onnx"
)
SAM_MODELS=(
    "https://static.cjgt.me/comfyui/models/sam_vit_b_01ec64.pth"
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