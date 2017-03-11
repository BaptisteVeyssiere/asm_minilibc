#include <string.h>
#include <stdio.h>

struct {
  char name[40];
  int age;
} person, person_copy;

int	main(void)
{
  char	str[] = "This is a sample string";
  char	str2[] = "almost every programmer should know memset!";
  char	myname[] = "Pierre de Fermat";
  char	key[] = "apple";
  char	buffer[80];
  char	*pch;
  char	str3[] = "memmove can be very useful......";
  char	str4[][5] = { "R2D2" , "C3PO" , "R2A6" };
  int	n;
  char  s1[] = "STRING";
  char	s2[] = "strint";
  int	result;
  char	str5[] = "This is a simple string";
  char	key2[] = "aeiou";
  char	str6[] = "fcba73";
  char	keys[] = "1234567890";
  int	i;

  /* strlen test */

  printf("%d\n", strlen("test"));

  /* strchr test */

  pch = strchr(str, 's');
  while (pch != NULL)
    {
      printf("found at %d\n", pch - str + 1);
      pch = strchr(pch + 1, 's');
    }

  /* memset test */

  memset(str2, '-', 6);
  printf("%s\n", str2);

  /* memcpy test */

  memcpy(person.name, myname, strlen(myname) + 1);
  person.age = 46;
  memcpy(&person_copy, &person, sizeof(person));
  printf("person_copy: %s %d \n", person_copy.name, person_copy.age);

  /* strcmp test */

  do {
    printf("Guess my favorite fruit? ");
    fflush(stdout);
    scanf("%79s", buffer);
  } while (strcmp(key, buffer) != 0);
  printf("Correct answer!\n");

  /* memmove test */

  memmove(str3 + 20, str3 + 15, 11);
  printf("%s\n", str3);

  /* strncmp test */

  printf("Looking for R2 astromech droids...\n");
  for (n = 0; n < 3; n++)
    if (strncmp(str4[n], "R2xx", 2) == 0)
      {
	printf("found %s\n", str4[n]);
      }

  /* strcasecmp test */

  result = strcasecmp(s1, s2);
  if (result == 0)
    printf("Strings compared equal.\n");
  else if (result < 0)
    printf("\"%s\" is less than \"%s\".\n", s1, s2);
  else if (result > 0)
    printf("\"%s\" is greater than \"%s\".\n", s1, s2);

  /* rindex test */

  pch = rindex(str, 's');
  printf("Last occurence of 's' found at %d \n", pch - str + 1);

  /* strstr test */

  pch = strstr(str5, "simple");
  strncpy(pch, "sample", 6);
  printf("%s\n", str5);

  /* strpbrk test */

  printf("Vowels in '%s': ", str);
  pch = strpbrk(str, key2);
  while (pch != NULL)
    {
      printf("%c ", *pch);
      pch = strpbrk(pch + 1, key2);
    }
  printf("\n");

  /* strcspn test */

  i = strcspn(str6, keys);
  printf("The first number in str is at position %d.\n", i + 1);

  return (0);
}
