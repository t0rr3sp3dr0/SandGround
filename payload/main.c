#include <pthread.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

void *xorg(void *args) {
	system("script -c 'X :11 vt11' -f /dev/tty11");
	pthread_exit(NULL);
}

int main(int argc, char *argv[]) {
	setuid(0);

	char rm[4 + strlen(argv[0])];
	strcpy(rm, "rm ");
	strcat(rm, argv[0]);
	system(rm);

	pthread_t thread;
	if (pthread_create(&thread, NULL, xorg, NULL))
		exit(1);

	system("chvt 11");
	system("xhost +");
	system("docker run --cap-add SYS_ADMIN -e container=docker -e DISPLAY=:11 --privileged --rm --security-opt apparmor:unconfined --security-opt seccomp:unconfined -v /dev:/dev:ro -v /sys/fs/cgroup:/sys/fs/cgroup:ro -v /tmp/.X11-unix:/tmp/.X11-unix:ro -it sandground:xenial-unity");

	char chvt[8] = "chvt ";
	strcat(chvt, &getenv("DISPLAY")[1]);
	system(chvt);

	return 0;
}
