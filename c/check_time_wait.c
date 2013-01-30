#include "global.h"

int main(int argc, char **argv)
{
	int listenfd, connfd;
	int pfd[2];
	int n;
	socklen_t len;
	char buff[128];
	char pbuf[4];
	struct sockaddr_in servaddr, cliaddr;
	time_t ticks;
	bzero(&servaddr, sizeof servaddr);
	bzero(&cliaddr, sizeof cliaddr);

	listenfd = socket(AF_INET, SOCK_STREAM, 0);
	if (-1 == listenfd) {
		perror("Error socket");
		return -1;
	}

	servaddr.sin_family = AF_INET;
	servaddr.sin_addr.s_addr = htonl(INADDR_ANY);
	servaddr.sin_port = htons(8888);

	if (-1 == pipe(pfd)) {
		perror("Error pipe");
		return -1;
	}
	if (fork() == 0) {
		close(pfd[1]);
		connfd = socket(AF_INET, SOCK_STREAM, 0);
		if (-1 == connfd) {
			perror("Error socket");
			return -1;
		}
		read(pfd[0], pbuf, 3);
		printf("pipe read:%s\n", pbuf);
		if (-1 == connect(connfd, (struct sockaddr*)&servaddr, sizeof servaddr)) {
			perror("Error connect");
			return -1;
		}
		int n = read(connfd, buff, sizeof buff);
		if (n == -1) {
			perror("Error read");
			return -1;
		}
		buff[n] = 0;
		printf("Rcv %d bytes: %s\n", n, buff);
		read(pfd[0], pbuf, 3);
		printf("pipe read:%s\n", pbuf);
		ticks = time(NULL);
		printf("TIME_WAIT start time:%.24s\n", ctime(&ticks));
		close(connfd);
		close(pfd[0]);
		exit(0);
	}
	close(pfd[0]);

	if (-1 == bind(listenfd, (struct sockaddr*)&servaddr, sizeof servaddr)) {
		perror("Error bind");
		return -1;
	}
	ticks = time(NULL);
	printf("bind ok, time: %.24s\n", ctime(&ticks));
	if (-1 == listen(listenfd, 5)) {
		perror("Error listen");
		return -1;
	}
	write(pfd[1], "CO", 3);
	for (;;) {
		len = sizeof cliaddr;
		connfd = accept(listenfd, (struct sockaddr*)&cliaddr, &len);
		if (-1 == connfd) {
			perror("Error accept");
			sleep(1);
			continue;
		}
		printf("connection from %s:%d\n", 
			inet_ntop(AF_INET, &cliaddr.sin_addr, buff, sizeof buff), 
			ntohs(cliaddr.sin_port));
		ticks = time(NULL);
		snprintf(buff, sizeof buff, "%.24s", ctime(&ticks));
		n = write(connfd, buff, strlen(buff));
		printf("Write %d bytes\n", n);
		close(connfd);
		write(pfd[1], "CL", 3);
		close(pfd[1]);
		break;
	}
	close(listenfd);

	listenfd = socket(AF_INET, SOCK_STREAM, 0);
	if (-1 == listenfd) {
		perror("Error socket");
		return -1;
	}
	int sn = 0;
	while (-1 == bind(listenfd, (struct sockaddr*)&servaddr, sizeof servaddr)) {
		printf("Error bind: %02d\r", ++sn);
		fflush(stdout);
		sleep(1);
		continue;
	}
	printf("\n");
	ticks = time(NULL);
	printf("bind ok, time: %.24s\n", ctime(&ticks));
	close(listenfd);

	return 0;
}
