gcloud compute instances create shopping_instance \
    --image=ubuntu-1404 \
    --machine-type=g1-micro \
    --metadata-from-file startup-script=./startup_script.sh \
    --zone us-central1-a
