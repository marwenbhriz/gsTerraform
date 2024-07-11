#!/bin/bash

# AUTOMATE SCRIPT FOR MONITORING PROGRAMS
set -e

PROJECT_ID=${PROJECT_ID:-grasys-study}
CLUSTER_NAME=${CLUSTER_NAME:-benhriz-monitor-gke}
REGION=${REGION:-asia-northeast1}

gcloud config set project $PROJECT_ID
gcloud container clusters get-credentials $CLUSTER_NAME --region=$REGION

uninstall_package() {
    PACKAGE=${PACKAGE:-$1}

    if [[ -z ${PACKAGE} ]]; then
        echo "$(tput setaf 1)Missing Package name to install$(tput sgr0)"
        exit 1
    fi
    
    read -n1 -p "$(tput setaf 4)Do you want to uninstall in a $(tput bold && tput setaf 3)stress environment? (y/N): $(tput sgr0)" yn
    echo
    if [[ $yn != [yY] ]]; then
        echo "$(tput setaf 1)abort$(tput sgr0)"
        exit 1
    fi

    helm uninstall prometheus-operator --namespace monitoring
    kubectl delete -f ../namespace.yaml
    popd || exit

}

install_package() {
    PACKAGE=${PACKAGE:-$1}

    if [[ -z ${PACKAGE} ]]; then
        echo "$(tput setaf 1)Missing Package name to install$(tput sgr0)"
        exit 1
    fi

    read -n1 -p "$(tput setaf 4)Do you want to install in a $(tput bold && tput setaf 3)development environment? (y/N): $(tput sgr0)" yn
    echo
    if [[ $yn != [yY] ]]; then
        echo "$(tput setaf 1)abort$(tput sgr0)"
        exit 1
    fi

    kubectl apply -f ./namespace.yaml
    helm install -f ./values.yaml prometheus-operator ../../charts/kube-prometheus-stack-35.0.3 --namespace monitoring
    popd || exit

}

$*