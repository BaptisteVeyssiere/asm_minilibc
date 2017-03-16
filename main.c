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
  strlen(NULL);

  /* strchr test */

  pch = strchr(str, 's');
  while (pch != NULL)
    {
      printf("found at %d\n", pch - str + 1);
      pch = strchr(pch + 1, 's');
    }
  pch = strchr(NULL, 's');
  if (strchr(str, 0) != NULL)
    printf("strchr OK\n");

  /* memset test */

  memset(str2, '-', 6);
  printf("%s\n", str2);
  memset(NULL, '-', 6);

  /* memcpy test */

  memcpy(person.name, myname, strlen(myname) + 1);
  person.age = 46;
  memcpy(&person_copy, &person, sizeof(person));
  printf("person_copy: %s %d \n", person_copy.name, person_copy.age);
  memcpy(NULL, myname, strlen(myname) + 1);
  memcpy(person.name, NULL, strlen(myname) + 1);

  /* strcmp test */

  do {
    printf("Guess my favorite fruit? ");
    fflush(stdout);
    scanf("%79s", buffer);
  } while (strcmp(key, buffer) != 0);
  printf("Correct answer!\n");
  strcmp(NULL, buffer);
  strcmp(key, NULL);

  /* memmove test */

  memmove(str3 + 20, str3 + 15, 11);
  printf("%s\n", str3);
  memmove(NULL, str3 + 15, 11);
  memmove(str3 + 20, NULL, 11);

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
  if (rindex(NULL, 's') == NULL)
    printf("rindex OK\n");
  if (rindex(NULL, 'z') == NULL)
    printf("rindex 2 OK\n");

  /* strstr test */

  pch = strstr(str5, "simple");
  strncpy(pch, "sample", 6);
  printf("%s\n", str5);
  if (strstr(NULL, "simple") == NULL)
    printf("strstr OK\n");
  if (strstr(str5, NULL) == NULL)
    printf("strstr 2 OK\n");

  /* strpbrk test */

  printf("Vowels in '%s': ", str);
  pch = strpbrk(str, key2);
  while (pch != NULL)
    {
      printf("%c ", *pch);
      pch = strpbrk(pch + 1, key2);
    }
  if (strpbrk(NULL, key2) == NULL)
    printf("strpbrk OK\n");
  if (strpbrk(str, NULL) == NULL)
    printf("strpbrk 2 OK\n");
  if (strpbrk(str, "w") == NULL)
    printf("strpbrk 3 OK\n");
  printf("\n");

  /* strcspn test */

  i = strcspn(str6, keys);
  printf("The first number in str is at position %d.\n", i + 1);

  return (0);
}
