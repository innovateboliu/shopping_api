gcloud compute instances create shopping-api \
    --image=ubuntu-14-04 \
    --scopes userinfo-email,cloud-platform \
    --machine-type=f1-micro \
    --metadata-from-file startup-script=./startup-script.sh \
    --zone us-central1-a
