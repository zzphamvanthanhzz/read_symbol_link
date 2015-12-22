/* 
 * File:   readlink.cpp
 * Author: thanhpv
 *
 * Created on December 22, 2015, 4:54 PM
 */
#include <fstream>
#include <sys/types.h>
#include <sys/stat.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <errno.h>
#include "xstring/xstring.h"

using namespace std;

#define BUFFSIZE 1024

/*
 * 
 */
bool readSymLink(std::string& _return, const std::string symlink) {
	//check if /proc/pid/exe
	char prefix[6], exe[5], pid[8];
	int numMatched = sscanf(symlink.c_str(), "/%[^/]/%[^/]/%s", prefix, pid, exe);
	if (numMatched == EOF) {
		printf("Error parsing symlink with error: %s\n", strerror(errno));
		return false;
	}
	//can be /proc/pid/exe
	if (numMatched == 3) {
		if (strcmp(prefix, "proc") == 0 && strcmp(exe, "exe") == 0) {
			char* exe_path = NULL;
			ssize_t exe_used = 0;
			ssize_t exe_size = BUFFSIZE;
			while (1) {
				exe_path = (char*) malloc(BUFFSIZE);
				if (!exe_path) {
					printf("Error cannot alloc more\n");
					free(exe_path);
					return false;
				}
				exe_used = readlink(symlink.c_str(), exe_path, exe_size - 1);
				if (exe_used < (ssize_t) 1) {
					printf("Error readlink\n");
					free(exe_path);
					return false;
				}
				if (exe_used < (ssize_t) (exe_size - 1)) {//read complete
					break;
				}
				free(exe_path);
				exe_size += BUFFSIZE;
			}
			char * tmp;
			tmp = (char*) realloc(exe_path, exe_used + 1);
			if (tmp) {
				exe_path = tmp;
				exe_size = exe_used + 1;
			}
			exe_path[exe_used] = '\0';
			_return = exe_path;
			return true;
		}
	}

	struct stat sb;
	char *linkname;
	ssize_t r;
	//	The st_size field gives the size of the file (if it is a regular file or a symbolic link) 
	//	in bytes.The size of a symbolic link is the length of the pathname it contains,
	//	without a terminating null byte
	if (lstat(symlink.c_str(), &sb) == -1) {
		perror("lstat");
		return false;
	}
	linkname = (char*) malloc(sb.st_size + 1);
	if (linkname == NULL) {
		fprintf(stderr, "insufficient memory\n");
		return false;
	}
	r = readlink(symlink.c_str(), linkname, sb.st_size + 1);
	if (r == -1) {
		perror("readlink");
		return false;
	}

	if (r > sb.st_size) {
		fprintf(stderr, "symlink increased in size "
				"between lstat() and readlink()\n");
		return false;
	}
	linkname[r] = '\0';
	printf("'%s' points to '%s'\n", symlink.c_str(), linkname);
	_return = linkname;
	free(linkname);
	return true;
}

int
main(int argc, char *argv[]) {
	std::string symlink = "/proc/12968/exe";
	std::string _return;
	readSymLink(_return, symlink.c_str());
	printf("Result is: %s\n", _return.c_str());
}

