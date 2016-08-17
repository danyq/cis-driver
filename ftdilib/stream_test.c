/* stream_test.c
 *
 * from libftdi examples
 *
 * Test reading  from FT2232H in synchronous FIFO mode.
 *
 * The FT2232H must supply data due to an appropriate circuit
 *
 * To check for skipped block with appended code, 
 *     a structure as follows is assumed
 * 1* uint32_t num (incremented in 0x4000 steps)
 * 3* uint32_t dont_care
 *
 * After start, data will be read in streaming until the program is aborted
 * Progess information wil be printed out
 * If a filename is given on the command line, the data read will be
 * written to that file
 *
 */
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <unistd.h>
#include <getopt.h>
#include <signal.h>
#include <errno.h>
#include <ftdi.h>

static FILE *outputFile;

static int exitRequested = 0;
/*
 * sigintHandler --
 *
 *    SIGINT handler, so we can gracefully exit when the user hits ctrl-C.
 */

static void
sigintHandler(int signum)
{
   exitRequested = 1;
}

static void
usage(const char *argv0)
{
   fprintf(stderr,
           "Usage: %s [options...] \n"
           "Test streaming read from FT2232H\n"
           "[-P string] only look for product with given string\n"
           "\n"
           "If some filename is given, write data read to that file\n"
           "Progess information is printed each second\n"
           "Abort with ^C\n"
           "\n"
           "Options:\n"
           "\n"
           "Copyright (C) 2009 Micah Dowty <micah@navi.cx>\n"
           "Adapted for use with libftdi (C) 2010 Uwe Bonnes <bon@elektron.ikp.physik.tu-darmstadt.de>\n",
           argv0);
   exit(1);
}

static int read_dbg = 1;
static uint32_t n_err = 0;
static int
readCallback(uint8_t *buffer, int length, FTDIProgressInfo *progress, void *userdata)
{
  if (read_dbg) {
    fprintf(stderr, "read callback\n");
    read_dbg = 0;
  }
   if (length)
   {
       if (outputFile)
       {
           if (fwrite(buffer, length, 1, outputFile) != 1)
           {
               perror("Write error");
               return 1;
           }
       }
   }
   if (progress)
   {
       fprintf(stderr, "%10.02fs total time %9.3f MiB captured %7.1f kB/s curr rate %7.1f kB/s totalrate %d dropouts\n",
               progress->totalTime,
               progress->current.totalBytes / (1024.0 * 1024.0),
               progress->currentRate / 1024.0,
               progress->totalRate / 1024.0,
               n_err);
   }
   return exitRequested ? 1 : 0;
}

int main(int argc, char **argv)
{
   struct ftdi_context *ftdi;
   int err, c;
   FILE *of = NULL;
   char const *outfile  = 0;
   outputFile =0;
   exitRequested = 0;
   char *descstring = NULL;
   int option_index;
   static struct option long_options[] = {{NULL},};

   while ((c = getopt_long(argc, argv, "P:n", long_options, &option_index)) !=- 1)
       switch (c) 
       {
       case -1:
           break;
       case 'P':
           descstring = optarg;
           break;
       default:
           usage(argv[0]);
       }
   
   if (optind == argc - 1)
   {
       // Exactly one extra argument- a dump file
       outfile = argv[optind];
   }
   else if (optind < argc)
   {
       // Too many extra args
       usage(argv[0]);
   }
   
   if ((ftdi = ftdi_new()) == 0)
   {
       fprintf(stderr, "ftdi_new failed\n");
       return EXIT_FAILURE;
   }
   fprintf(stderr, "ftdi_new ok\n");
   
   if (ftdi_set_interface(ftdi, INTERFACE_A) < 0)
   {
       fprintf(stderr, "ftdi_set_interface failed\n");
       ftdi_free(ftdi);
       return EXIT_FAILURE;
   }
   fprintf(stderr, "ftdi_set_interface ok\n");
   
   if (ftdi_usb_open_desc(ftdi, 0x0403, 0x6014, descstring, NULL) < 0)
   {
       fprintf(stderr,"Can't open ftdi device: %s\n",ftdi_get_error_string(ftdi));
       ftdi_free(ftdi);
       return EXIT_FAILURE;
   }
   fprintf(stderr, "ftdi_usb_open ok\n");
   
   /* A timeout value of 1 results in may skipped blocks */
   if(ftdi_set_latency_timer(ftdi, 2))
   {
       fprintf(stderr,"Can't set latency, Error %s\n",ftdi_get_error_string(ftdi));
       ftdi_usb_close(ftdi);
       ftdi_free(ftdi);
       return EXIT_FAILURE;
   }
   fprintf(stderr, "ftdi_set_latency ok\n");
   
/*   if(ftdi_usb_purge_rx_buffer(ftdi) < 0)
   {
       fprintf(stderr,"Can't rx purge\n",ftdi_get_error_string(ftdi));
       return EXIT_FAILURE;
       }*/
   if (outfile)
       if ((of = fopen(outfile,"w+")) == 0)
           fprintf(stderr,"Can't open logfile %s, Error %s\n", outfile, strerror(errno));
   if (of)
       if (setvbuf(of, NULL, _IOFBF , 1<<16) == 0)
           outputFile = of;
   signal(SIGINT, sigintHandler);
   
   err = ftdi_readstream(ftdi, readCallback, NULL, 8, 256);
   if (err < 0 && !exitRequested)
       exit(1);
   
   if (outputFile) {
       fclose(outputFile);
       outputFile = NULL;
   }
   fprintf(stderr, "Capture ended.\n");
   
   if (ftdi_set_bitmode(ftdi,  0xff, BITMODE_RESET) < 0)
   {
       fprintf(stderr,"Can't set synchronous fifo mode, Error %s\n",ftdi_get_error_string(ftdi));
       ftdi_usb_close(ftdi);
       ftdi_free(ftdi);
       return EXIT_FAILURE;
   }
   ftdi_usb_close(ftdi);
   ftdi_free(ftdi);
   signal(SIGINT, SIG_DFL);
   exit (0);
}
