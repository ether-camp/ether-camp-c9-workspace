FROM cloud9/workspace
MAINTAINER Alexander Sinyagin <alex@ethergit.com>

RUN env GIT_SSL_NO_VERIFY=true git clone https://github.com/ether-camp/sandbox-demo.git /home/ubuntu/sandbox-demo

RUN chown -R ubuntu:ubuntu /home/ubuntu/sandbox-demo && \
    sudo -u ubuntu -i bash -l -c "npm install forever -g" && \
    sudo -u ubuntu -i bash -l -c "cd /home/ubuntu/sandbox-demo && npm install"

RUN rm -rf /home/ubuntu/workspace && \
    env GIT_SSL_NO_VERIFY=true git clone https://github.com/ether-camp/default-ws.git /home/ubuntu/workspace
	    
RUN chown -R ubuntu:ubuntu /home/ubuntu/workspace && \
    rm -rf /home/ubuntu/workspace/.git*

CMD sudo -u ubuntu -i bash -l -c "cd /home/ubuntu/sandbox-demo && forever start app.js" && \
    /bin/bash -l
