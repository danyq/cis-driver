
#include <ctype.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <signal.h>
#include <ftdi.h>

#define VENDOR_ID 0x0403  // FTDI
#define DEVICE_ID 0x6014  // FT232H

static FILE *fp;

static int exit_req = 0;
static void sighandler(int signum) {
   exit_req = 1;
}

static int recv_data(uint8_t *buffer, int length,
                     FTDIProgressInfo *progress,
                     void *userdata) {
  if (progress) {
    fprintf(stderr, "%10.02fs totalBytes: %9.3f MiB currentRate: %7.1f kB/s totalRate: %7.1f kB/s\n",
            progress->totalTime,
            progress->current.totalBytes / (1024.0 * 1024.0),
            progress->currentRate / 1024.0,
            progress->totalRate / 1024.0);
  }
  if (length && fp) {
    if (fwrite(buffer, length, 1, fp) != 1) {
      fprintf(stderr, "write error");
      return 1;
    }
  }
  return exit_req;
}

int main(int argc, char **argv) {
  struct ftdi_context *ftdi;
  int result;
  int c;
  char *fname = NULL;

  signal(SIGINT, sighandler);

  while ((c = getopt(argc, argv, "f:")) != -1) {
    switch (c) {
    case 'f':
      fname = optarg;
      break;
    case '?':
      if (optopt == 'c')
        fprintf(stderr, "Option -%c requires an argument.\n", optopt);
      else if (isprint(optopt))
        fprintf(stderr, "Unknown option `-%c'.\n", optopt);
      else
        fprintf(stderr, "Unknown option character `\\x%x'.\n", optopt);
    default:
      abort();
    }
  }

  ftdi = ftdi_new();
  if (ftdi == 0) {
    fprintf(stderr, "ftdi_new failed\n");
    return EXIT_FAILURE;
  }

  if (ftdi_set_interface(ftdi, INTERFACE_A) < 0) {
    fprintf(stderr, "ftdi_set_interface failed\n");
    ftdi_free(ftdi);
    return EXIT_FAILURE;
  }

  if (ftdi_usb_open_desc(ftdi, VENDOR_ID, DEVICE_ID, NULL, NULL) < 0) {
    fprintf(stderr,"ftdi_usb_open_desc failed: %s\n",ftdi_get_error_string(ftdi));
    ftdi_free(ftdi);
    return EXIT_FAILURE;
  }

  if(ftdi_set_latency_timer(ftdi, 2)) {
    fprintf(stderr,"ftdi_set_latency_timer failed: %s\n",ftdi_get_error_string(ftdi));
    ftdi_usb_close(ftdi);
    ftdi_free(ftdi);
    return EXIT_FAILURE;
  }

  if (fname) {
    fp = fopen(fname, "w");
    if (fp == 0) {
      fprintf(stderr, "fopen failed\n");
      ftdi_usb_close(ftdi);
      ftdi_free(ftdi);
      return EXIT_FAILURE;
    }
  }

  result = ftdi_readstream(ftdi, recv_data, NULL, 8, 256);
  if (result < 0 && !exit_req)
    exit(1);

  if (fp) {
    fclose(fp);
    fp = NULL;
  }

  ftdi_usb_close(ftdi);
  ftdi_free(ftdi);
  return 0;
}
