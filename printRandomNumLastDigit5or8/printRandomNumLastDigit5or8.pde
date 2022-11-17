int n;
int lastDigit;
do {
n = int(random(1,101));
lastDigit = n % 10;
} while(lastDigit != 5 && lastDigit !=8);
println(n + " ends with " + lastDigit);
