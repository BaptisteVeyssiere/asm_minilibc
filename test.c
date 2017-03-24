#include <string.h>
#include <stdio.h>

static void	strcmp_test(void)
{
  char	str[] = "Bonjour les amis";
  char	str2[] = "Bonjour les amies";

  printf("%d\n", strcmp(str, str2));
  printf("%d\n", strcmp("", str2));
  printf("%d\n", strcmp(str, ""));
  printf("%d\n", strcmp("", ""));
  printf("%d\n", strcmp("", str));
  strcmp(str, NULL);
  //printf("%d\n", strcmp("", NULL));
}

static void	strcasecmp_test(void)
{
  char	str[] = "Bonjour Les Amis";
  char	str2[] = "bonJour les amies";

  printf("%d\n", strcasecmp(str, str2));
  printf("%d\n", strcasecmp("", str2));
  printf("%d\n", strcasecmp(str, ""));
  printf("%d\n", strcasecmp("", ""));
  printf("%d\n", strcasecmp("", str));
  strcasecmp(str, NULL);
  //printf("%d\n", strcasecmp("", NULL));
}

static void	strncmp_test(void)
{
  char	str[] = "Bonjour les amis";
  char	str2[] = "Bonjour les amies";

  printf("%d\n", strncmp(str, str2, 16));
  printf("%d\n", strncmp("", str2, 16));
  printf("%d\n", strncmp(str, "", 16));
  printf("%d\n", strncmp("", "", 16));
  printf("%d\n", strncmp("", str, 16));
  strncmp(str, NULL, 16);
  //printf("%p\n", strncmp("", NULL, 16));
}

static void	memmove_test(void)
{
  char	str[] = "Bonjour les amis";
  char	str2[] = "aonjzefz  zre ramiesisfnspofnspfopfoenpef";

  printf("%s\n", memmove(str, str2, 10));
  printf("%s\n", memmove(str, str2, 30));
  //printf("%s\n", memmove(str, str2, -2));
  printf("%s\n", memmove(str, str2, 0));
  //memmove(str, NULL, 10);
  //memcpy(NULL, str, 10);
}

static void	memcpy_test(void)
{
  char	str[] = "Bonjour les amis";
  char	str2[] = "aonjzefz  zre ramiesisfnspofnspfopfoenpef";

  printf("%s\n", memcpy(str, str2, 10));
  printf("%s\n", memcpy(str, str2, 30));
  printf("%s\n", memcpy(str, str2, -2));
  printf("%s\n", memcpy(str, str2, 0));
  memcpy(str, NULL, 10);
  memcpy(NULL, str, 10);
}

static void	rindex_test(void)
{
  char	str[] = "aonjzefz  zre ramiesisfnspofnspfopfoenpef";

  printf("%s\n", rindex(str, 'r'));
  printf("%s\n", rindex(str, 't'));
  printf("%s\n", rindex(str, ' '));
  if (rindex(NULL, 'f') == NULL)
    printf("rindex OK");
}

int	main(void)
{
  strcmp_test();
  strncmp_test();
  memmove_test();
  memcpy_test();
  strcasecmp_test();
  rindex_test();
  return (0);
}
