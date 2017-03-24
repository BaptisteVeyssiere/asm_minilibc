#include <stdlib.h>
#include <stdio.h>
#include <string.h>

int	main(int ac, char **av)
{
  printf("%s\n", strstr(av[1], av[2]));
  return (0);
}
