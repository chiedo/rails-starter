# Get the container ID
CONTAINER_ID="$(cat /proc/self/cgroup | grep "docker" | sed s/\\//\\n/g | tail -1)"
# Print out the command needed to enter the docker web container
printf "\nTo enter your Docker web container, run the below:\n------------\ndocker exec -it ${CONTAINER_ID} bash\n"
# The below is a hackish way to make the web container run indefinitely until stopped
tail -f /dev/null
