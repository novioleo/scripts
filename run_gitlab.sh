docker run --detach \
    --hostname gitlab.novio.top \
    --publish 11443:443 --publish 1180:80 --publish 1122:22 \
    --name gitlab \
    --restart always \
    --volume /home/novio/projects/Docker/gitlab/config:/etc/gitlab \
    --volume /home/novio/projects/Docker/gitlab/logs:/var/log/gitlab \
    --volume /home/novio/projects/Docker/gitlab/data:/var/opt/gitlab \
    gitlab/gitlab-ce:latest
